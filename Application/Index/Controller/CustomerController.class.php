<?php
namespace Index\Controller;

use Org\Util\WeChat;
class CustomerController extends MustLoginController
{
    public function _edit(&$where)
    {
        # todo 只能修改自己的信息
        unset($where['id']);
        $userInfo = session("wx_user");
        $where = array("openid" => $userInfo['openid']);
    }
    public function _lists(&$where)
    {
        $userInfo = session("wx_user");
        $where = array("openid" => $userInfo['openid']);
    }
    public function lists_(&$data)
    {
        $this->assign('userInfo', $data->data[0]);
    }
}