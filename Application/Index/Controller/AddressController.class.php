<?php
namespace Index\Controller;

class AddressController extends MustLoginController
{
    public function _add()
    {
        $wxUser = session('wx_user');
        $_POST['openid'] = $wxUser['openid'];
    }
    protected function goList($msg)
    {
        $this->success($msg, U('Address/lists'));
        exit;
    }
    public function add_()
    {
        $this->goList("新增成功");
    }
    public function edit_()
    {
        $this->goList("修改成功");
    }
    public function _enterDB()
    {
        # 数据进入数据库之前作处理
    }
    public function _lists(&$where)
    {
        header("content-type:text/html;charset=utf-8;");
        if (empty(session('wx_user'))) {
            # 如果没有授权登录，跳转到授权流程，授权完成后，微信用户信息会存放在session中
            redirect(U("WeChat/wxLogin", ['state' => myUrl()]));
        }
        $userInfo = session('wx_user');
        $where = ['openid' => $userInfo['openid']];
    }
    # list之后如果数据需要做关联处理在此处处理
    public function lists_(&$data)
    {
        foreach($data->data as &$val) {
            if ($val['sex'] == 1) {
                $val['sex'] = "女";
            } else if ( $val['sex'] == 2) {
                $val['sex'] = "男";
            } else {
                $val['sex'] = "未知";
            }
        }
    }
    public function del_($id)
    {
        $this->goList("删除成功");
    }
}