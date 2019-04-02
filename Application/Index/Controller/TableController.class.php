<?php
namespace Index\Controller;
use Think\Controller;
class TableController extends Controller
{
    public function check()
    {
        $shopId = I("shop_id");
        $number = I("number");
        $table = M("table");
        $tableInfo = $table->where(array("shop_id" => $shopId, "number" =>$number))->find();
        if (!empty($tableInfo)) {
            $backData = array('status' => 1, 'msg' => "请求成功");
        } else {
            $backData = array('status' => 0, 'msg' => "请求失败");
        }
        die(json_encode($backData));
    }
}