<?php
/*
 +----------------------------------------
 | Date:2018.03.03
 +----------------------------------------
 |Auth:九九一十八<761297884@qq.com>
 +----------------------------------------
 |main:店铺类型管理控制器
 +----------------------------------------
*/
namespace Home\Controller;

use Home\Controller\CommonController;

class ShopClassController extends CrudController
{
    # 增加之前准备关联的数据
    public function _add()
    {
        $merchant = M("shop");
        $this->assign('shop', $merchant->field("id,name")->select());
    }
    public function add_($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '新增店铺分类', $obj);
        }
    }
    # 编辑之前获取关联表信息
    public function _edit()
    {
        $this->_add();
    }
    # 编辑完成后写入操作日志
    public function edit_()
    {
        $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '编辑店铺分类', session('edit_object'));
    }
    public function _enterDB()
    {
        # 数据进入数据库之前做处理,add和edit通用
        $className = $this->exists(array('name' => I('name')));
        if ($className) {
            $this->error("分类名称已经存在");
        }
    }
    public function _lists(&$where)
    {
        $_GET['limit'] = 10;
        if (isset($_GET['name'])) {
            $where['name'] = array('like', "%{$_GET['name']}%");
            $this->assign("name", $_GET['name']);
        }
    }
    public function _del($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            $food = M('food');
            $foodWhere = array('class_id'=> $obj['id']);
            $hasFood = $food->field('id')->where($foodWhere)->find();
            if ($hasFood) {
                $this->error("分类下存在店铺，请先删除店铺");
            }
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除店铺分类', $obj);
        }
    }
}