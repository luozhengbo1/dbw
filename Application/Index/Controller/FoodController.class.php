<?php
namespace Index\Controller;

class FoodController extends CrudController
{
    public function _lists(&$where)
    {
        $shopId = I('shop_id');
        $classId = I('class_id');
        $where = array("class_id" => $classId, "shop_id" => $shopId);
    }
    # list之后如果数据需要做关联处理在此处处理
    public function lists_(&$data)
    {
        $shopClass = M("shop_class");
        $shopList = $shopClass->field("id,name")->select();
        $shopList = array_column($shopList, 'name', 'id');
        foreach ($data->data as &$val) {
            $val['class_id'] = $shopList[$val['class_id']];
        }
        $foodList = &$data->data;
        $shopId = I('shop_id');
        $uid = session("login_uid");
        $key = "buy_list_{$shopId}_{$uid}";
        if (!empty($foodList)) {
            # 购物车计算总价
            $cCar = new CarController();
            $cCar->dealBuyNum($shopId, $foodList);
            $value = $cCar->calculateOrderValue($key);
            $this->assign('value', $value);
        }
        # 获取店铺信息
        $cShop = new ShopController();
        $shop = $cShop->info($shopId);
        $this->assign("shop", $shop);
        # 食品列表
        $this->assign("lists", $data->data);
        die(json_encode($this->fetch("Food/lists")));
    }
}