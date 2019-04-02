<?php
/*
 +----------------------------------------
 | Date:2018.03.03
 +----------------------------------------
 |Auth:九九一十八<761297884@qq.com>
 +----------------------------------------
 |main:店铺管理控制器。
 +----------------------------------------
*/
namespace Home\Controller;

class OrderController extends CrudController
{
    # 编辑之前获取管理表信息
    public function _edit()
    {
        $this->_add();
    }
    # 编辑完成后写入操作日志
    public function edit_()
    {
        $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '编辑店铺', session('edit_object'));
    }
    public function _lists(&$where, &$order)
    {
        if (session('is_company') == 1) {
            $where['shop_id'] = session('shop_id');
        }
        $order = array('create_time'=> 'DESC');
        $_GET['limit'] = 10; # 每页显示几条
        # 列出列表之前如果有搜索条件则增加搜索条件
        if (isset($_GET['name'])) {
            $where['name'] = array('like', "%{$_GET['name']}%");
            $this->assign("name", $_GET['name']);
        }
        if ( isset($_GET['pay_status'])&& ($_GET['pay_status']!=99) ) {
            $where['pay_status'] = ( isset($_GET['pay_status']) )?$_GET['pay_status']:'' ;
            $this->assign("pay_status", $_GET['pay_status']);
        }
    }


    # list之后如果数据需要做关联处理在此处处理
    public function lists_(&$data)
    {
        foreach ($data->data as &$val) {
            $val['buy_list'] = json_decode($val['buy_list'], true);
            $val['price'] /= 100;
            # 处理付款状态
            switch ($val['pay_status']){
                case 0:
                    $val['pay_status_cn'] = "未付款";
                 break;
                case 1:
                    $val['pay_status_cn'] = "已付款";
                    break;
                case 2:
                    $val['pay_status_cn'] = "已退款";
                    break;
                case 3:
                    $val['pay_status_cn'] = "退款失败";
                    break;
                case 4:
                    $val['pay_status_cn'] = "正在退款处理中<br/>理由：".$val['customer_refund_reson'];
                    break;
            }

            # 处理订单状态
            switch($val["order_status"]) {
                case 0:
                    $val["order_status"] = "未取餐";
                    break;
                case 1:
                    $val["order_status"] = "已取餐";
                    break;
            }
            switch($val["eat_type"]) {
                case 1:
                    $val["eat_type"] = "堂食";
                    break;
                case 2:
                    $val["eat_type"] = "外卖";
                    break;
            }
            # 处理打印状态
            switch($val["is_print"]) {
                case 0:
                    $val["is_print"] = "未打印";
                    break;
                case 1:
                    $val["is_print"] = "已打印";
                    break;
            }
        }
    }
    # 删除之前进行检测
    public function _del($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            # 记录删除日志
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除订单', $obj);
        }
    }
    # 打印订单
    public function  printer()
    {
        $back = array("status" => 100, 'msg' => "订单获取成功", 'data' => "说的放假咯的说法");
        die(json_encode($back));
    }

    /**
     * 上架退款处理
     */
    public function shopRefund()
    {
        if(IS_AJAX){
            $data = $_POST;
            if(!$data['order_id']){
                die(json_encode(['status'=>404,'msg'=>'缺少订单id']));
            }
            if(!$data['shop_refund_reason']){
                die(json_encode(['status'=>403,'msg'=>'缺少退单理由']));
            }
            $res = M('order')
                ->where(['order_id'=>$data['order_id'],'pay_status'=>1])
                ->save(['pay_status'=>2,'shop_refund_reson'=>$data['shop_refund_reason']]);
            //并将此订单退款处理
            if( $res ){
                die(json_encode(['status'=>200,'msg'=>'成功']));
            }else{
                die(json_encode(['status'=>500,'msg'=>'处理失败']));
            }
        }
    }
    public function  shopRefuseRefund()
    {
        if(IS_AJAX){
            $data = $_POST;
            if(!$data['order_id']){
                die(json_encode(['status'=>404,'msg'=>'缺少订单id']));
            }
            if(!$data['shop_refuse_refund']){
                die(json_encode(['status'=>403,'msg'=>'缺少拒绝退款理由']));
            }
            $res = M('order')
                ->where(['order_id'=>$data['order_id'],'pay_status'=>4])
                ->save(['pay_status'=>3,'shop_refuse_refund'=>$data['shop_refuse_refund']]);
            //并将此订单退款处理
            if( $res ){
                die(json_encode(['status'=>200,'msg'=>'成功']));
            }else{
                die(json_encode(['status'=>500,'msg'=>'处理失败']));
            }
        }
    }
    /*
     *
     */
    public function orderFinishOrDoing()
    {
        $getData =$_GET;
        $where=' pay_status=1 ';
        if( $_SESSION['shop_id'] ){
            $where .=" and shop_id = ".$_SESSION['shop_id'];
        }
        $orderFinishCount = M('order')->field('id')->where($where.' and order_status=1')->select();
        $orderDoingCount = M('order')->field('id')->where($where.' and order_status=0')->select();

        if( isset($_GET['order_status']) ){
            $where .=" and order_status = ".$getData['order_status'];
        }else{
            $where .=" and order_status =0 ";
        }
        $orderData = M('order')->where($where)->order('pay_time ASC')->select();
        foreach ($orderData as $k=>$val ){
            $orderData[$k]['buy_list'] = json_decode($val['buy_list'], true);
            $orderData[$k]['price'] /= 100;
            # 处理付款状态
            switch ($val['pay_status']){
                case 0:
                    $orderData[$k]['pay_status_cn'] = "未付款";
                    break;
                case 1:
                    $orderData[$k]['pay_status_cn'] = "已付款";
                    break;
                case 2:
                    $orderData[$k]['pay_status_cn'] = "已退款";
                    break;
                case 3:
                    $orderData[$k]['pay_status_cn'] = "退款失败";
                    break;
                case 4:
                    $orderData[$k]['pay_status_cn'] = "正在退款处理中<br/>理由：".$val['customer_refund_reson'];
                    break;
            }
            # 处理订单状态
            switch($val["order_status"]) {
                case 0:
                    $orderData[$k]["order_status_cn"] = "未取餐";
                    break;
                case 1:
                    $orderData[$k]["order_status_cn"] = "已取餐";
                    break;
            }
        }
        $this->assign('orderFinishCount',count($orderFinishCount) );
        $this->assign('orderDoingCount',count($orderDoingCount) );
        $this->assign('orderData',$orderData);
        $this->display('orderFinish');

    }

    public function  order()
    {
        $getData =$_GET;
        $where=' pay_status=1 ';
        if( $_SESSION['shop_id'] ){
            $where .=" and shop_id = ".$_SESSION['shop_id'];
        }
        $orderFinishCount = M('order')->field('id')->where($where.' and order_status=1')->select();
        $orderDoingCount = M('order')->field('id')->where($where.' and order_status=0')->select();
        if( isset($getData['order_status']) ){
            $where .=" and order_status = ".$getData['order_status'];
        }else{
            $where .=" and order_status =0 ";
        }
        $orderData = M('order')->where($where)->order('create_time DESC')->limit(3)->select();
        foreach ($orderData as $k=>$val ){
            $orderData[$k]['buy_list'] = json_decode($val['buy_list'], true);
            $orderData[$k]['price'] /= 100;
            # 处理付款状态
            switch ($val['pay_status']){
                case 0:
                    $orderData[$k]['pay_status_cn'] = "未付款";
                    break;
                case 1:
                    $orderData[$k]['pay_status_cn'] = "已付款";
                    break;
                case 2:
                    $orderData[$k]['pay_status_cn'] = "已退款";
                    break;
                case 3:
                    $orderData[$k]['pay_status_cn'] = "退款失败";
                    break;
                case 4:
                    $orderData[$k]['pay_status_cn'] = "正在退款处理中<br/>理由：".$val['customer_refund_reson'];
                    break;
            }
            # 处理订单状态
            switch($val["order_status"]) {
                case 0:
                    $orderData[$k]["order_status_cn"] = "未取餐";
                    break;
                case 1:
                    $orderData[$k]["order_status_cn"] = "已取餐";
                    break;
            }
        }
        $this->assign('orderDoingCount',count($orderDoingCount) );
        $this->assign('orderFinishCount',count($orderFinishCount) );
        $this->assign('orderData',$orderData);
        $this->display();
    }

    #获取订单模板
    public function orderTheme()
    {
        if(IS_AJAX){
            $where =" 1= 1 ";
            if( $_SESSION['shop_id'] ){
                $where =" shop_id = ".$_SESSION['shop_id'];
            }
            $where .=" and  pay_status=1 AND order_status = 0 ";
            $orderData = M('order')->where($where)->order(' pay_time  ASC')->limit(3)->select();
            foreach ($orderData as $k=>$val ){
                $orderData[$k]['buy_list'] = json_decode($val['buy_list'], true);
                $orderData[$k]['price'] /= 100;
                # 处理付款状态
                switch ($val['pay_status']){
                    case 0:
                        $orderData[$k]['pay_status_cn'] = "未付款";
                        break;
                    case 1:
                        $orderData[$k]['pay_status_cn'] = "已付款";
                        break;
                    case 2:
                        $orderData[$k]['pay_status_cn'] = "已退款";
                        break;
                    case 3:
                        $orderData[$k]['pay_status_cn'] = "退款失败";
                        break;
                    case 4:
                        $orderData[$k]['pay_status_cn'] = "正在退款处理中<br/>理由：".$val['customer_refund_reson'];
                        break;
                }
                # 处理订单状态
                switch($val["order_status"]) {
                    case 0:
                        $orderData[$k]["order_status_cn"] = "未取餐";
                        break;
                    case 1:
                        $orderData[$k]["order_status_cn"] = "已取餐";
                        break;
                }
            }
            $this->assign('orderData',$orderData);
            die( json_encode($this->fetch('Order/orderDataAppend')) );
        }

    }


    #订单完成标记
    public function orderFinishFlag()
    {
        if(IS_AJAX){
            $order_id = intval($_POST['id']);
            $res = M('order')->where(['id'=>$order_id])->save(['order_status'=>1]);
            if( $res ){
                die(json_encode(['status'=>200,'msg'=>'操作成功']));
            }else{
                die(json_encode(['status'=>400,'msg'=>'操作失败']));
            }
        }
    }
}