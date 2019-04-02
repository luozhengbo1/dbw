<?php
namespace Home\Controller;

class EventLogController extends CrudController
{
    public function _lists(&$where, &$order, &$group)
    {
       $order = array('date_time'=>'desc');
       $_GET['limit'] = 15;
        if (isset($_GET['method_zh'])) {
            $where['method_zh'] = array('like', "%{$_GET['method_zh']}%");
            $this->assign("method_zh", $_GET['method_zh']);
        }
    }
    public function _del($id)
    {
        $this->error("不能删除系统操作日志");
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除操作日志', $obj);
        }
    }
}