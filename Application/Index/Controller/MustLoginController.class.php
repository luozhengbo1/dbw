<?php
namespace Index\Controller;

use Org\Util\WeChat;
class MustLoginController extends CrudController
{
    public function __construct()
    {
        parent::__construct();
        $userInfo = session('wx_user');
        if (empty($userInfo['openid'])){
            # 如果没有授权登录，跳转到授权流程，授权完成后，微信用户信息会存放在session中
            redirect(U("WeChat/wxLogin", ['state' => myUrl()]));
        }
    }
}