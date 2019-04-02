<?php
/**
 * 微信订单统一下单，成功统一回调
 */
namespace Index\Controller;

use Think\Controller;

class WxPaySDKController extends Controller
{
    public function __construct(){
        header("content-type:text/html;charset=utf-8");
        parent::__construct();
    }
    public function index()
    {
        $wxUser =session("wx_user");
        var_dump($wxUser);
        include_once "WxPaySDK/WxPay.Api.php";
        include_once "WxPaySDK/WxPay.JsApiPay.php";
        include_once 'WxPaySDK/log.php';

        //①、获取用户openid
        $tools = new \JsApiPay();
        //$openId = $tools->GetOpenid(); # 获取微信用户信息，因为不在安全域名内，所以获取不到，使用github的实现。
        //②、统一下单
        $input = new \WxPayUnifiedOrder();
        $input->SetBody("test");
        $input->SetAttach("test");
        $input->SetOut_trade_no(\WxPayConfig::MCHID.date("YmdHis"));
        $input->SetTotal_fee("1");
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag("test");
        $input->SetNotify_url("http://api.weixin.qq.com/example/notify.php");
        $input->SetTrade_type("JSAPI");
        $input->SetOpenid($wxUser['openid']);
        $order = \WxPayApi::unifiedOrder($input);
        echo '<font color="#f00"><b>统一下单支付单信息</b></font><br/>';
        var_dump($order);
        $data['jsApiParameters'] = $tools->GetJsApiParameters($order);
        var_dump($data);
    }
}