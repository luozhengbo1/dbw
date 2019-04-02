<?php
/*
 +----------------------------------------
 | Date:2018.05.02
 +----------------------------------------
 |Auth:九九一十八<761297884@qq.com>
 +----------------------------------------
 |main:打印机管理控制器
 +----------------------------------------
*/
namespace Home\Controller;

class PrinterController extends CrudController
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
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '新增打印机', $obj);
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
        $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '编辑打印机', session('edit_object'));
    }

    # 数据进入数据库之前做处理,add和edit通用
    public function _enterDB()
    {
        # 数据进入数据库之前做处理
        $updateInfo = $this->exists(array('id' => (int)I('id')));
        $className = $this->exists(array('device_no' => I('device_no'), 'shop_id' => I('shop_id')));
        $hasDevice = false;
        if ($updateInfo && $className) {
            if ($className && $className['id'] != $updateInfo['id']) {
                $hasDevice = true;
            }
        } else if ($className) {
            $hasDevice = true;
        }
        if ($hasDevice) {
            $this->error("打印机已存在");
        }
    }
    public function _lists(&$where,&$order)
    {
        $_GET['limit'] = 10;
        # 是否店铺管理员判断
        if (session('is_company') == 1) {
            $where['shop_id'] = session('shop_id');
        }
        # 桌台号码查询
        if (isset($_GET['name'])) {
            $where['name'] = array('like', "%{$_GET['name']}%");
            $this->assign("name", $_GET['name']);
        }
        # 排序
        $order = array('shop_id' => "ASC");
    }
    public function lists_(&$data)
    {
        $shop = M('shop');
        $shopList = $shop->select();
        $shopList = array_column($shopList, 'name', 'id');
        foreach ($data->data as &$val) {
            $val['shop_id'] = $shopList[$val['shop_id']];
            if($val['status'] == 1) {
                $val['status'] = "开启";
            } else {
                $val['status'] = "关闭";
            }
        }
    }
    public function _del($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除打印机', $obj);
        }
    }
}