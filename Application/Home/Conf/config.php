<?php
return array(
	//'配置项'=>'配置值'	
 'DB_TYPE'   => 'mysql', // 数据库类型
 'DB_HOST'   => '127.0.0.1', // 服务器地址
 'DB_NAME'   => 'dianbaiwei', // 数据库名
 'DB_USER'   => 'root', // 用户名
 'DB_PWD'    => 'root', // 密码
 'DB_PORT'   => 3306, // 端口
 'DB_PREFIX' => 'ccard_', // 数据库表前缀
 'WEB_TITLE' => '微信点餐',
 'WEB_VERSION' => 'v1.0',
 'AUTH_CONFIG'=>array(
        'AUTH_ON' => true, //认证开关
        'AUTH_TYPE' => 1, // 认证方式，1为时时认证；2为登录认证。
        'AUTH_GROUP' => 'auth_group', //用户组数据表名
        'AUTH_GROUP_ACCESS' => 'auth_access', //用户组明细表
        'AUTH_RULE' => 'auth_rule', //权限规则表
        'AUTH_USER' => 'auth_user'//用户信息表
    )
 );
