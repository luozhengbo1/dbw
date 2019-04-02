<?php
namespace Index\Controller;

use Org\Util\WeChat;
class OrderController extends CrudController
{
    public function _lists(&$where, &$order)
    {
        $userInfo = session('wx_user');
        if (empty($userInfo['openid'])){
            # 如果没有授权登录，跳转到授权流程，授权完成后，微信用户信息会存放在session中
            redirect(U("WeChat/wxLogin", ['state' => myUrl()]));
        }
        # 删除订单超过半小时未支付的订单
       // $delWhere = array("pay_status" => 0, "customer_id" => $userInfo['openid'], 'create_time' => array("gt", date("Y-m-d H:i:s", time()-1800)));
        //M('order')->where($delWhere)->delete();

        $order = array('create_time'=> 'DESC');
        $userInfo = session("wx_user");
        $this->assign("userInfo", $userInfo);
        $where['customer_id'] = $userInfo["openid"];
        $where['eat_type'] = (I("eat_type") == 2) ? I("eat_type") : 1;
    }

    public function lists_(&$data)
    {
        foreach ($data->data as $k=> &$val) {
            $buyList = json_decode($val['buy_list'], true);
            $val['buy_distinct_num'] = count($buyList);
            $val['price'] /= 100;
            $jsApiParameters = base64_encode($val['js_api_parameters']);
            if($val['pay_status']==0){
                $a ='未支付';

                $val['pay_url'] = U("WxPay/index")."?js_api_parameters=$jsApiParameters&shop_id={$val['shop_id']}&eat_type={$val['eat_type']}";
                if(time() - strtotime($val['create_time']) > 600){
                    $a ='已失效';
                    $val['pay_url'] = '';
                    $val['pay_status'] = 5 ;
                }
            }else if($val['pay_status']==1){
                $a ='已支付';
            }else if($val['pay_status']==2){
                $a ='已退款';
            }else if($val['pay_status']==3){
                $a ='退款失败';
            }else if($val['pay_status']==4){
                $a ='退款处理中';
            }
            $data->data[$k]['pay_status_font'] = $a;
            $totalNum = 0;
            foreach ($buyList as $val2) {
                if (isset($val2['num'])) {
                    $totalNum +=  $val2['num'];
                }
            }
            $val['buy_num'] = $totalNum;
            $val['buy_list_first'] = array_pop($buyList);
        }
    }

    # 计算买了多少个
    public function calculateOrderNum($key)
    {
        $buyList = S($key);
        if (empty($buyList['buy_list'])) {
            return 0;
        }
        $totalNum = 0;
        foreach ($buyList['buy_list'] as $val) {
            if (isset($val['num'])) {
                $totalNum +=  $val['num'];
            }
        }
        return $totalNum;
    }

    /**
     * 订单详情
     */
    public function  listsShow()
    {
        $order_id = (int)($_GET['id']);
        if(!$order_id){
            $this->error('订单数据不存在',U('Order/lists',array('eat_type'=>1)));
            exit;
        }
        $orderInfo = M('order')->where(['id'=>$order_id])->find();
        $orderInfo['price'] = $orderInfo['price']/100;

        $jsApiParameters = base64_encode($orderInfo['js_api_parameters']);
        if($orderInfo['pay_status']==0){
            $a ='未支付';
            $aInfo['pay_url'] = U("WxPay/index")."?js_api_parameters=$jsApiParameters&shop_id={$orderInfo['shop_id']}&eat_type={$orderInfo['eat_type']}";
            $aInfo['color'] = "#ff3240";
            if(time() - strtotime($orderInfo['create_time']) > 600){
                $a ='已失效';
                $aInfo['pay_url'] = '';
            }
        }else if($orderInfo['pay_status']==1){
            $a ='可申请退款';
            //$aInfo['url'] = U("Order/refund", array('order_id' => $orderInfo['order_id']));
            $aInfo['color'] = "#ff3240";
        }else if($orderInfo['pay_status']==2){
            $a ='已退款';
            $aInfo['color'] = "#ff3240";
        }else if($orderInfo['pay_status']==3){
            $a ='退款失败';
            $aInfo['color'] = "#ff3240";
        }else if($orderInfo['pay_status']==4){
            $a ='正在退款处理中';
            $aInfo['color'] = "#ec8b89";
        } else {
            $a ='已完成';
            $aInfo['color'] = "#1aad19";
        }
        # 出来就餐类型
        switch ($orderInfo['eat_type']){
            case "1":
                $orderInfo['eat_type_cn'] = "堂食";
                break;
            case "2":
                $orderInfo['eat_type_cn'] = "外带";
                break;
        }
        $mShop = M("shop");
        $shopInfo = $mShop->where(array('id' => $orderInfo['shop_id']))->find();
        $orderInfo['pay_status_font'] =$a;
        $this->assign('buygoodslist',json_decode($orderInfo['buy_list'],true));
        $this->assign('orderInfo',$orderInfo);
        $this->assign('shopInfo',$shopInfo);
        $this->assign('aInfo',$aInfo);
        $this->display();
    }

    /**
     * 微信退款处理
     */
    public  function  refund()
    {
        $orderId = I("order_id/s");
        if(empty($orderId)){
            die(json_encode(['status'=>500,'msg'=>'缺少订单id'])) ;
        }
        if( !$_REQUEST['customer_refund_reson'] ){
            die(json_encode(['status'=>500,'msg'=>'缺少退款理由'])) ;
        }
        //将订单状态改为正在处理中
        $res =  M('order')->where(['order_id'=>$orderId])->save(['pay_status'=>4, 'customer_refund_reson'=>$_REQUEST['customer_refund_reson']]);//4正在处理中
        if($res){
            die(json_encode(['status'=>200,'msg'=>'成功']));
        }else{
            die(json_encode(['status'=>400,'msg'=>'修改失败']));
        }
    }
}