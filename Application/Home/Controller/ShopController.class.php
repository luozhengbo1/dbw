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

use Home\Controller\CommonController;

class ShopController extends CrudController
{
    # 新增之前获取关联表信息
    public function _add()
    {
        $merchant = M("merchant");
        $shopClass = M("shop_class");

        $this->assign('shopClass', $shopClass->field('id,name')->select());
        $this->assign('merchant', $merchant->field('id,name')->select());
    }
    # 新增之后写入操作日志
    public function add_($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '新增店铺', $obj);
        }
    }
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
    public function _lists(&$where)
    {
        if (session('is_company') == 1) {
            $where['id'] = session('shop_id');
        }
        $_GET['limit'] = 6; # 每页显示5条
        # 列出列表之前如果有搜索条件则增加搜索条件
        if (isset($_GET['name'])) {
            $where['name'] = array('like', "%{$_GET['name']}%");
            $this->assign("name", $_GET['name']);
        }
    }

    # list之后如果数据需要做关联处理在此处处理
    public function lists_(&$data)
    {
        # 关联商家
        $merchant = M("merchant");
        $merchantList =  $merchant->field("id,name")->select();
        $merchantList = array_column($merchantList, 'name', 'id');
        foreach ($data->data as &$val) {
            $val['merchant_id'] = $merchantList[$val['merchant_id']];
            switch ($val['eat_type']){
                case 1:
                    $val['eat_type'] = "堂食";
                    break;
                case 2:
                    $val['eat_type'] = "外带";
                    break;
                case 12:
                    $val['eat_type'] = "堂食+外带";
                    break;
            }
        }
        # 关联店铺类型
        $shopClass = M("shop_class");
        $shopList =  $shopClass->field("id,name")->select();
        $shopList = array_column($shopList, 'name', 'id');
        foreach ($data->data as &$val) {
            $val['class_id'] = $shopList[$val['class_id']];
        }
        # 如果是店铺管理员，则直接跳转到店铺编辑页面
        if (session('is_company') == 1) {
            $this->redirect("Home/Shop/edit?id={$data->data[0]['id']}");
            exit;
        }
    }
    # 删除之前进行检测
    public function _del($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            # 删除关联检测，如果店铺下存在食品，则不允许删除
            $food = M('food');
            $foodWhere = array('shop_id'=> $obj['id']);
            $hasFood = $food->field('id')->where($foodWhere)->find();
            if ($hasFood) {
                $this->error("请先删除店铺下的食品");
            }
            # 记录删除日志
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除店铺', $obj);
        }
    }
}