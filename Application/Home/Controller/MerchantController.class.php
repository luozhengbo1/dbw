<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class MerchantController extends CrudController
{
    public function add_($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            # 记录操作日志
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '新增商家', $obj);
        }
    }
    # 编辑完成后写入操作日志
    public function edit_()
    {
        $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '编辑商家', session('edit_object'));
    }

    public function _lists(&$where)
    {
        if (isset($_GET['name'])) {
            $where['name'] = array('like', "%{$_GET['name']}%");
            $this->assign("name", $_GET['name']);
        }
    }
    public function _del($id)
    {
        $where = array("id" => $id);

        if ($obj = $this->exists($where)) {
            # 检查商家下是否有店铺
            $shop = M("shop");
            $shopWhere = array('merchant_id'=> $obj['id']);
            $hasShop = $shop->field('id')->where($shopWhere)->find();
            if ($hasShop) {
                $this->error("商家下存在店铺，不能删除");
            }
            # 记录操作日志
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除商户', $obj);
        }
    }



}