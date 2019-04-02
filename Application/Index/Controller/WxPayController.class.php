<?php
/*
 +----------------------------------------
 |Date:2018.3.7
 +----------------------------------------
 |Auth:九九一十八
 +----------------------------------------
 |main: 微信网页授权
 +----------------------------------------
*/
namespace Index\Controller;

use Think\Controller;

class WxPayController extends Controller
{
    public function __construct(){
        header("content-type:text/html;charset=utf-8");
        parent::__construct();

    }
    # 微信支付界面
    public function index()
    {
        $this->display();
    }
    # 微信支付回调
    public function notify()
    {
        # 支付成功后更新支付状态，支付时间
        $xml = isset($GLOBALS['HTTP_RAW_POST_DATA']) ? $GLOBALS['HTTP_RAW_POST_DATA'] : '';
        include_once 'WxPaySDK/Notify.php'; # 微信回调通知
        $notify = new \PayNotifyCallBack();
        $notify->Handle(false);

        $orderInfo = \WxPayResults::Init($xml);
        if (empty($orderInfo)) {
            file_put_contents("wx_pay_error.log",$xml."\r", 8);
        } else {
            # 订单id是微信统一下单接口生成的out_trade_no
            $mOrder = M("order");
            $orderWhere = ["order_id" => $orderInfo['out_trade_no']];
            $update = ['pay_status' => 1, 'pay_time' => date("Y-m-d H:i:s")];
            $mOrder->where($orderWhere)->save($update);
            $order =  $mOrder->where($orderWhere)->find($update);
            if (empty($order['table_num'])) {
                $order['table_num'] = "^H2 外卖订单\n\n";
            } else {
                $order['table_num']  =  "^H2 桌台号：{$order['table_num']}\n\n";
            }
            # 获取店铺打印机信息，打印信息广播到所有开启的打印机
            $mPrinter = M('printer');
            $printer = $mPrinter->where(array('shop_id' => $order['shop_id'], 'status' => 1))->select();
            $order['price'] /= 100;
            foreach ($printer as $print) {
                $DEVICE_NO = $print['device_no'];
                $key =  $print['device_key'];
                $content = "^N1^F1\n";
                $content .= "^H2 欢迎光临{$order['shop_name']}\n";
                $content .= "^H2 取餐码：{$order['eating_code']}\n";
                $content .= $order['table_num'];
                $content .= "名称　　　　　 单价  数量  金额\n";
                $content .= "--------------------------------\n";
                foreach (json_decode($order['buy_list'], true) as $val) {
                    $total = $val['price'] * $val['num'];
                    if (strlen($val['name']) > 21) {
                        $val['firstLine'] = mb_substr($val['name'],0,7*3);
                        $val['secondLine'] =  mb_substr($val['name'], 7*3);
                        $val['name'] =  $val['firstLine'] . "\n" .  $val['secondLine'];
                    }
                    if (isset( $val['secondLine'] )) {
                        $repeat = 16 - abs(strlen( $val['secondLine'] )/3*2 +1);
                    } else {
                        $repeat = 16 - abs(strlen($val['name'])/3*2 +1);
                    }
                    if ($val['num'] < 100 && $val['num'] > 9) {
                        $val['num'] = $val['num'] . " ";
                    } else {
                        $val['num'] = $val['num'] . "  ";
                    }
                    $space = str_repeat(" ", $repeat);
                    $content .= "{$val['name']}{$space}{$val['price']}   {$val['num']}  {$total}\n";
                }
                $content .= "--------------------------------\n";
                $content .= "备注：{$order['remark']}\n";
                $content .= "--------------------------------\n";
                $content .= "^H2支付金额：{$order['price']}元\n";
                $content .= "^H2订餐时间：{$order['create_time']}\n";
                $content .= "^H2就餐时间：{$order['eat_time']}\n";
                $content .= "送货地点：{$order['send_address']}\n";
                //$qrlength = chr(strlen('http://open.printcenter.cn'));
                //$content .= "^Q" . $qrlength . "http://open.printcenter.cn\n";
                $result = json_decode(printOrder($DEVICE_NO, $key, 1, $content), true);
                if ($result['responseCode'] < 4) {
                    $update = ['is_print' => 1];
                    $mOrder->where($orderWhere)->save($update);
                } else {
                    $update = ['is_print' => 0];
                    $mOrder->where($orderWhere)->save($update);
                }
            }
        }
        exit;
    }
    # 微信退款
    public function refund()
    {
        include_once 'WxPaySDK/WxPay.Api.php';
            $order_id = I('order_id/s');
            $result = ['code'=>400,'msg'=>''];
            if( $order_id ){
                $mOrder = M('order');
                $where = array('order_id' => $order_id, 'pay_status' => 4);
                $order = $mOrder
                    ->where(['order_id'=>$order_id])//支付状态
                    ->where('pay_status in (1,2,4)')//支付成功，和正在处理中的订单
                    ->find();
                $merchid = \WxPayConfig::MCHID;
                if( !$order ){
                    $result['code'] = 401;
                    $result['msg'] = '订单数据异常';
                    file_put_contents("wx_refund_error.log",print_r($result, true)."\r", 8);
                    die(json_encode($result));
                }
                $input = new \WxPayRefund();
                $input->SetOut_trade_no($order['order_id']);   //自己的订单号
                //$input->SetTransaction_id($order['transaction_id']);  //微信官方生成的订单流水号，在支付成功中有返回
                $input->SetOut_refund_no( uniqid().time() );   //退款单号
                $input->SetTotal_fee( $order['price'] );   //订单标价金额，单位为分
                $input->SetRefund_fee( $order['price'] );  //退款总金额，订单总金额，单位为分，只能为整数
                $input->SetOp_user_id($merchid);
                $res = \WxPayApi::refund($input);
                //退款操作
                if( $res['return_code'] == 'SUCCESS' ){
                    file_put_contents("wx_refund_success.log",print_r($res, true)."\r", 8);
                    //修改订单状态
                    $updateres = M('order')->where( [ 'order_id'=>$order_id ] )->save(['pay_status'=>2]); //2表示退款成功
                    $result['code'] = 200;
                    $result['msg'] = '退款成功';
                    die(json_encode($result)) ;
                }else{
                    file_put_contents("wx_refund_error.log",$res."\r", 8);
                    $result['code'] = 402;
                    $result['msg'] = '退款异常请联系客服人员';
                    die(json_encode($result));
                }
            }else{
                $result['code'] = 404;
                $result['msg'] = '订单号不存在';
                file_put_contents("wx_refund_error.log",json_encode($result."\r"), 8);
                die(json_encode($result));
            }
    }
}
