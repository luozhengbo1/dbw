<?php
namespace Index\Controller;

class FoodClassController extends CrudController
{
    public function _lists(&$where)
    {
        header("content-type:text/html;charset=utf-8;");
        $shopId = I("shop_id");

        # 获取店铺下的食品信息，默认取第一个分类下的食品
        $where = array("shop_id" => $shopId);
        $foodClass = M("food_class");
        $classId = $foodClass->where($where)->field('id')->find();
        $food= M("food");
        $foodList = $food->where(array('shop_id' => $shopId, 'class_id' => $classId['id']))->select();
        if (!empty($foodList)) {
            $uid = session("login_uid");
            $key = "buy_list_{$shopId}_{$uid}";
            # 购物车计算总价,总个数
            $cCar = new CarController();
            $cCar->dealBuyNum($shopId, $foodList); # 处理某件商品买了多少个
            $value = $cCar->calculateOrderValue($key);
            $num = $cCar->calculateOrderNum($key);
            $this->assign('value', $value);
            $this->assign('num', $num);
        }
        $this->assign("foodList", $foodList);
        # 获取店铺信息
        $cShop = new ShopController();
        $shop = $cShop->info($shopId);
        $this->assign('shop', $shop);
        $this->assign('eat_type', $_GET['eat_type']);
        $this->assign('sureUrl', U("Car/sure", array('shop_id'=>$shopId, 'eat_type' => $_GET['eat_type'], "table_number" => I('table_number'))));
    }


}