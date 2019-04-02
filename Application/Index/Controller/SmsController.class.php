<?php
namespace Index\Controller;

use Think\Controller;

class SmsController extends Controller
{
    # 发送短信并存储在缓存中
    public function send()
    {
        $code = mt_rand(100000, 999999);
    }
}