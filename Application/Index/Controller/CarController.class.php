<?php
/*
 * Auth 九九一十八@761297884
 * Date 2018.03.07
 * 购物车控制器
 */
namespace Index\Controller;

use Think\Controller;

class CarController extends Controller
{
    private $uid;
    public function __construct()
    {
        header("content-type:text/html;charset=utf-8;");
        parent::__construct();
        if (!session('login_uid')) {
            $this->uid =  uniqid(mt_rand(100,999));
            $this->uid =  uniqid(mt_rand(100,999));
            session('login_uid', $this->uid);
        } else {
            $this->uid = session('login_uid');
        }
    }
    # 购物车增加商品
    public function addFood()
    {
        $foodId = I("food_id");
        $food = M("food");
        $foodWhere = array('id' => $foodId);
        $buy = $food->where($foodWhere)->find();

        $shopId = I("shop_id");
        $shop = M("shop");
        $shopWhere = array('id' => $shopId);

        $shopInfo = $shop->where($shopWhere)->find();
        if (empty($buy) || empty($shopInfo)) {
            $this->error('想吃菜品不存在或预定的餐厅不存在');
        }
        $key = "buy_list_{$shopId}_{$this->uid}";
        $buyList =S($key);
        $buyList['shop_id'] = $shopId;
        if (!empty($buyList)) {
            if (isset($buyList['buy_list'][$foodId])) {
                $num = ++$buyList['buy_list'][$foodId]['num'];
                $buyList['buy_list'][$foodId] = $buy;
                $buyList['buy_list'][$foodId]['num'] = $num;
                S($key, $buyList, 24*3600);
            } else {
                $tmp = $buy;
                $tmp['num'] = 1;
                $buyList['buy_list'][$foodId] = $tmp;
                S($key, $buyList, 24*3600);
            }
        } else {
            $buyList['buy_list'][$foodId] = $buy;
            $buyList['buy_list'][$foodId]['num'] = 1;
            S($key, $buyList, 24*3600);
        }
        $value = $this->calculateOrderValue($key);
        $num = $this->calculateOrderNum($key);
        $back = array("status"=> 1, 'msg' => "成功", 'value' => $value, "num" => $num);
        die(json_encode($back));
    }

    # 移除购买的商品
    public function delFood()
    {
        $shopId = I("shop_id");
        $foodId = I("food_id");
        $key = "buy_list_{$shopId}_{$this->uid}";
        $buyList = S($key);
        if (isset($buyList['buy_list'][$foodId])) {
            --$buyList['buy_list'][$foodId]['num'];
            if ($buyList['buy_list'][$foodId]['num'] == 0) {
                unset($buyList['buy_list'][$foodId]); #如果减完了就删除
            }
            S($key, $buyList, 24*3600);
            $value = $this->calculateOrderValue($key);
            $num = $this->calculateOrderNum($key);
            $back = array("status"=> 1, 'msg' => "成功", 'value' => $value, "num" => $num);
            die(json_encode($back));
        } else {
            $this->ajaxReturn('要删除的菜品不存在');
        }
    }

    # 查看购物车商品
    public function car()
    {
        $shopId = I("shop_id");
        $key = "buy_list_{$shopId}_{$this->uid}";
        $pay = $this->calculateOrderValue($key);
        if ($pay == 0) {
            $backData = array('status' => 0, 'msg'=> '什么都没买');
        } else {
            $buyList =S($key);
            $buyList = $buyList["buy_list"];
            $this->assign("buyList",$buyList);
            $value = $this->calculateOrderValue($key);
            $num = $this->calculateOrderNum($key);
            $backData = array('status' => 1, 'msg'=> '获取成功', 'html' => $this->fetch("Car/car"), 'num' => $num, 'value' => $value);
        }
        die(json_encode($backData));
    }
    # 确定购买的商品
    public function sure()
    {
        if (empty(session('wx_user'))) {
            # 如果没有授权登录，跳转到授权流程，授权完成后，微信用户信息会存放在session中
            redirect(U("WeChat/wxLogin", ['state' => myUrl()]));
        }
        $userInfo = session('wx_user');
        $where = ['openid' => $userInfo['openid']];
        $shopId = I("shop_id");
        $eatType = I("eat_type");
        $shop = M('shop');
        $shopInfo = $shop->where(array('id' => $shopId))->field("id,name")->find();
        $key = "buy_list_{$shopId}_{$this->uid}";
        $pay = $this->calculateOrderValue($key);
        if ($pay == 0) {
            $this->error("什么都没买", U('FoodClass/lists', array('shop_id' => $shopId, 'eat_type' => $eatType)));
        } else {
            $buyList =S($key);
            $buyList = $buyList["buy_list"];
            $this->assign("buyList",$buyList);
            $value = $this->calculateOrderValue($key);
            $num = $this->calculateOrderNum($key);
        }
        $this->assign("value", $value);
        $this->assign("modifyOrderUrl",U("FoodClass/lists", array("shop_id"=>$shopId, "eat_type" =>$eatType)));
        $this->assign("ts",U("FoodClass/lists", array("shop_id"=>$shopId, "eat_type" =>2)));
        $this->assign("wm",U("FoodClass/lists", array("shop_id"=>$shopId, "eat_type" =>1, 'table_number' => I('table_number'))));
        $this->assign("num", $num);
        $this->assign("shop", $shopInfo);
        $this->assign('shop_id',  $shopId);
        $this->assign('eat_type',  $eatType);
        switch ($eatType){
            case "1":
                $eatType = "堂食";
                $display = "Car/sureT";
                break;
            case "2":
                $eatType = "外带";
                $display = "Car/sureW";
                break;
             default:
                 redirect(U("Shop/shop", array("shop_id"=>$shopId)));
                 break;
        }
        $mAddress = M("address");
        $address = $mAddress->where($where)->select();
        foreach($address as &$val) {
            if ($val['sex'] == 1) {
                $val['sex'] = "女";
            } else if ( $val['sex'] == 2) {
                $val['sex'] = "男";
            } else {
                $val['sex'] = "未知";
            }
        }
        $this->assign('address',  $address);
        $this->display($display);
    }
    # 确认后付钱
    public function pay()
    {
        if( I('type1')=='w' ){
            if(empty(I('address')) ){
                $this->ajaxReturn(['status'=>401,'msg'=>'缺少地址']);
            }
//            if(empty(I('time')) ){
//                $this->ajaxReturn(['status'=>402,'msg'=>'缺少用餐时间']);
//            }
        }

        if( I('type1')=='t' ){
            if(empty(I('table_number')) ){
                $this->ajaxReturn(['status'=>403,'msg'=>'缺少桌号']);
            }
//            if(empty(I('time')) ){
//                $this->ajaxReturn(['status'=>404,'msg'=>'缺少用餐时间']);
//            }
        }
         // dump($_POST);die;
        if (empty(session('wx_user'))) {
            # 如果没有授权登录，跳转到授权流程，授权完成后，微信用户信息会存放在session中
            redirect(U("WeChat/wxLogin", ['state' => myUrl()]));
        }
        $wxUser = session('wx_user');
        include_once "WxPaySDK/WxPay.Api.php";
        include_once "WxPaySDK/WxPay.JsApiPay.php";
        include_once 'WxPaySDK/log.php';
        # 店铺信息
        $shopId = I("shop_id");
        $shopInfo = M("shop")->where( array("id" => $shopId))->field("id, name, logo")->find();

        $key = "buy_list_{$shopId}_{$this->uid}";
        $buyList = S($key);
        if (empty($buyList['buy_list'])) {
            $backData = array("msg" => "什么都没买", 'status'=>0, 'redirect' => U("Shop/index"));
            die(json_encode($backData));
        }
        $price = $this->calculateOrderValue($key);
        if ($price == 0) {
            $price = 0.01; #至少支付一分钱
        }
        # 获取自增的取餐码
        $mOrder = M('order');
        $date = date("Y-m-d");
        $orderWhere = array('create_time' => array('like', "%{$date}%"));
        $last = $mOrder->where($orderWhere)->field('eating_code')->order('create_time desc')->find();
        if (empty($last)) {
            $last['eating_code'] = 0;
        }
        # 准备插入订单数据
        $eatType = I("eat_type");
        $now = date("Y-m-d H:i:s");
        $orderId = \WxPayConfig::MCHID.date("YmdHis");
        $orderRow = array(
            "order_id" => $orderId,
            "eating_code" => $last['eating_code'] + 1, # 取餐码==上一个订单的取餐码+1
            "shop_id" => $shopId,
            "shop_name" => $shopInfo['name'],
            "shop_logo" => $shopInfo['logo'],
            "customer_id" => $wxUser['openid'],
            "customer_name" => $wxUser['nickname'],
            "price" => $price * 100,
            "buy_list" => json_encode($buyList['buy_list']),
            "eat_type" => $eatType,
            "eat_time" => I('time'),
            "create_time" => $now,
            "pay_status" => 0,
            "order_status" => 0,
            "is_print" => 0,
            "table_num" => I('table_number'),
            "remark" => I("note"),
        );
        # 如果是外卖，获取地址信息
        if ($eatType == 2) {
            $mAddress = M("address");
            $addressId = I("address");
            $addressInfo = $mAddress->where(array("id" => $addressId, 'openid' => $wxUser['openid']))->find();
            $orderRow['send_address'] = $addressInfo['address'].str_repeat(" ", 6).$addressInfo['street'] . "\n\n^H2联系电话:" . $addressInfo['mobile'];
        }
        $tools = new \JsApiPay();
        //$openId = $tools->GetOpenid(); # 获取微信用户信息，因为不在安全域名内，所以获取不到，使用github的实现。
        //②、统一下单
        $input = new \WxPayUnifiedOrder();
        $input->SetBody($shopInfo['name']."的订单");
        $input->SetAttach("附加参数");
        $input->SetOut_trade_no($orderId);
        $input->SetTotal_fee($orderRow['price']);
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag("");
        $input->SetNotify_url("http://".$_SERVER['HTTP_HOST']."/index.php/WxPay/notify");
        $input->SetTrade_type("JSAPI");
        $input->SetOpenid($wxUser['openid']);
        $unifiedOrder = \WxPayApi::unifiedOrder($input);
        $jsApiParameters= $tools->GetJsApiParameters($unifiedOrder);
        $orderRow['prepay_id'] = $unifiedOrder['prepay_id'];
        $orderRow['js_api_parameters'] = $jsApiParameters;
        # 插入订单数据
        $order = M("order");
        $addId = $order->add($orderRow);
        if ($addId > 0) {
            # 清空购物车
            S($key, null);
            # 成功就跳转到支付。
            $jsApiParameters = base64_encode($jsApiParameters);
            $backData = array("msg" => "呼起支付", 'status' => 1, 'redirect' => U("WxPay/index")."?js_api_parameters={$jsApiParameters}&shop_id={$shopId}&eat_type={$eatType}&id={$addId}");
            die(json_encode($backData));
        }
    }
    # 计算订单总价值
    public function calculateOrderValue($key)
    {
        $buyList = S($key);
        if (empty($buyList['buy_list'])) {
            return 0;
        }
        $pay = 0;
        foreach ($buyList['buy_list'] as $val) {
            if (isset($val['num'])) {
                $pay += $val['price'] * $val['num'];
            }
        }
        return $pay;
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

    # 清空购物车
    public function truncate()
    {
        $shopId = I("shop_id");
        $key = "buy_list_{$shopId}_{$this->uid}";
        S($key, null);
        $backData = array("status" => 1, "msg" => "清空成功");
        die(json_encode($backData));
    }
    # 处理某件东西买了几个
    public function dealBuyNum($shopId, &$foodList)
    {
        $uid = session("login_uid");
        $key = "buy_list_{$shopId}_{$uid}";
        $buyList = S($key);
        # 计算某个食品买了几个
        foreach ($foodList as &$val) {
            if (isset($buyList['buy_list'][$val['id']]['num'])) {
                $val['num'] = $buyList['buy_list'][$val['id']]['num'];
            } else {
                $val['num'] = 0;
            }
        }
    }
}