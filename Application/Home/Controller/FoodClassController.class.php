<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class FoodClassController extends CrudController
{
    # 新增之前获取关联表信息
    public function _add()
    {
        $merchant = M("shop");
        $this->assign('shop', $merchant->field("id,name")->select());
    }
    # 新增之后写入操作日志
    public function add_($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '新增食品分类', $obj);
        }
        $this->success('新增成功',U("FoodClass/lists"),2);
        exit;
    }
    # 编辑之前获取关联表信息
    public function _edit()
    {
        $this->_add();
    }
    # 编辑完成后写入操作日志
    public function edit_()
    {
        $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '编辑食品分类', session('edit_object'));
    }
    public function _enterDB()
    {
        # 数据进入数据库之前做处理
        $shopId = I("shop_id");
        $name  = I("name");
        $className = $this->exists(array('name' => $name, 'shop_id' => $shopId));
        if ($className) {
            $this->error("分类名称已经存在");
        }
    }
    public function _lists(&$where, &$order)
    {
        # 分页条数设置
        $_GET['limit'] = 15;

        # 列出数据前做判断，如果是店铺管理员，则只显示当前店铺下的分类
        if (session('is_company') == 1) {
            $where['shop_id'] = session('shop_id');
        }

        # 分类搜索
        if (isset($_GET['name'])) {
            $where['name'] = array('like', "%{$_GET['name']}%");
            $this->assign("name", $_GET['name']);
        }

        # order实现根据shop_id分组，让同一个shop靠在一起。
        $order = array('shop_id'=>"desc");
    }
    public function lists_(&$data)
    {
        # 分类所属商店管理  id2name
        $shop = M("shop");
        $shopList =  $shop->field("id,name")->select();
        $shopList = array_column($shopList, 'name', 'id');
        foreach ($data->data as &$val) {
            $val['shop_id'] = $shopList[$val['shop_id']];
        }
    }
    # 删除之前进行检测
    public function _del($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            $food = M('food');
            $foodWhere = array('class_id'=> $obj['id']);
            $hasFood = $food->field('id')->where($foodWhere)->find();
            if ($hasFood) {
                $this->error("分类下存在菜品，请先删除菜品");
            }
            # 记录系统操作日志
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除食品分类', $obj);
        }
    }

    # 获取店铺下的分类
    public function get()
    {
        $shopId = I("shop_id");
        $mFoodClass = M("food_class");
        $foodWhere = array("id" => $shopId);
        $foodClassList = $mFoodClass->where($foodWhere)->select();
        $this->assign("foodClassList", $foodClassList);
        //var_dump($foodClassList);
        $html = $this->fetch("FoodClass/get");
        $backData = array('status' => 1, 'msg' => '获取成功', 'html' => $html);
        //die(json_encode($backData));
    }
}