<?php
/*
 +----------------------------------------
 | Date:2018.03.02
 +----------------------------------------
 |Auth:九九一十八<761297884@qq.com>
 +----------------------------------------
 |main:桌台管理控制器
 +----------------------------------------
*/
namespace Home\Controller;

use Org\Util\QrCode;

class TableController extends CrudController
{
    private function qrCode($saveName, $content)
    {
        $savePath = 'Uploads/images/thumb/'; # 二维码保存目录
        $saveName = "{$savePath}qrcode_{$saveName}.png";
        $url = urldecode($content);
        QRcode::png($url, $saveName);
        return "/".$saveName;
    }
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
            $url = "http://blog.istiny.cc".U("/Index/FoodClass/lists", array("shop_id"=>$obj['shop_id'], "table_number" => $obj['number'], 'eat_type' => 1));
            $qrCode  = $this->qrCode($obj['shop_id']."_".$obj['number'], $url);
            $table = M("table");
            $table->where(array("id"=> $obj['id']))->save((array('qrcode'=> $qrCode)));
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '新增桌台', $obj);
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
        $id = I('id');
        # 重新生成二维码，并更新数据库二维码地址
        $obj = M('table')->where(array('id' => $id))->find();
        # 删除旧的二维码
        var_dump(unlink(substr($obj['qrcode'],1)));
        $url = "http://blog.istiny.cc".U("/Index/FoodClass/lists", array("shop_id"=>$obj['shop_id'], "table_number" => $obj['number'], 'eat_type' => 1));
        # 生成新的二维码
        $qrCode  = $this->qrCode($obj['shop_id']."_".$obj['number'], $url);
        $table = M("table");
        # 更新原有的二维码地址
        $table->where(array("id"=> $obj['id']))->save((array('qrcode'=> $qrCode)));

        $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '编辑桌台', session('edit_object'));
    }

    # 数据进入数据库之前做处理,add和edit通用
    public function _enterDB()
    {
        $updateInfo = $this->exists(array('id' => (int)I('id')));
        $className = $this->exists(array('number' => I('number'), 'shop_id' => I('shop_id')));
        $hasNumber = false;
        if ($updateInfo && $className) {
            if ($className && $className['id'] != $updateInfo['id']) {
                $hasNumber = true;
            }
        } else if ($className) {
            $hasNumber = true;
        }
        if ($hasNumber) {
            $this->error("桌台号码已经存在");
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
        if (isset($_GET['number'])) {
            $where['number'] = array('like', "%{$_GET['number']}%");
            $this->assign("number", $_GET['number']);
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
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除桌台', $obj);
        }
    }
}