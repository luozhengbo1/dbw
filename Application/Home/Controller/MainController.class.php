<?php
namespace Home\Controller;
use Think\Controller;
class MainController extends Controller {
	public function _initialize(){
		
		!session('?username') && $this->redirect('Index/login');
		
	}
	public function index()
    {
            if(session('gp_id') == 1 || session('gp_title') == '超级管理员') {
                $children[] = array("title" => "商家列表", "icon" => "fa fa-cogs", "href" => U('Merchant/lists'));
                $navs [] = array("title" => "商家管理", "icon" => "fa fa-cogs", "children" => $children);
                unset($children);
                $navs [] = array("title" => "消费者管理", "icon" => "fa fa-users",  "href" => U('Customer/lists'));
                $children [] = array("title" => "店铺类型", "icon" => "fa fa-cubes", "href" => U('ShopClass/lists'));
                $children [] = array("title" => "店铺列表", "icon" => "fa fa-list", "href" => U('Shop/lists'));
            } else {
                $children [] = array("title" => "店铺信息", "icon" => "fa fa-list-ul", "href" => U('Shop/lists'));
            }
			$children [] = array("title" => "桌台管理", "icon" => "fa fa-barcode", "href" => U('Table/lists'));
			$children [] = array("title" => "打印机管理", "icon" => "fa fa-print", "href" => U('Printer/lists'));
			$navs [] = array("title" => "店铺管理", "icon" => "fa fa-home", "children" => $children,"spread" => false);
            unset($children);

            $children [] = array("title" => "食品分类", "icon" => "fa fa-cubes", "href" => U('FoodClass/lists'));
            $children [] = array("title" => "食品列表", "icon" => "fa fa-cutlery", "href" => U('Food/lists'));
            $navs [] = array("title" => "食品管理", "icon" => "fa fa-cutlery", "children" => $children,"spread" => false);
			unset($children);

			$children [] = array("title" => "订单管理", "icon" => "fa fa-file-text-o", "href" => U('Order/lists'));
			# $children [] = array("title" => "薪资结算", "icon" => "fa fa-cny", "href" => U('Pay/payList'));
            #$children [] = array("title" => "交易金额构成", "icon" => "fa fa-pie-chart", "href" => U('Chart/transAmount'));
            #$children [] = array("title" => "7日就餐人数/人次趋势", "icon" => "fa fa-line-chart", "href" => U('Chart/foodTrend'));
            #$children [] = array("title" => "就餐类别构成", "icon" => "fa fa-pie-chart", "href" => U('Chart/foodType'));
            $navs [] = array("title" => "交易管理", "icon" => "fa fa-exchange", "children" => $children);
			unset($children);

			if(session('gp_id') == 1 || session('gp_title') == '超级管理员'){
			/*	$children [] = array("title" => "设备设置", "icon" => "fa fa-tablet", "href" => U('Device/deviceList'));
				$children [] = array("title" => "apk 设置", "icon" => "fa fa-android", "href" => U('APK/apkList'));
				$navs [] = array("title" => "其他管理", "icon" => "fa fa-cogs", "children" => $children);
				unset($children);
				$children [] = array("title" => "同步菜品", "icon" => "fa fa-cutlery", "href" => U('Log/foodList'));
				$children [] = array("title" => "同步白名单", "icon" => "fa fa-user", "href" => U('Log/ClientList'));
				$children [] = array("title" => "取订餐", "icon" => "fa fa-hand-paper-o", "href" => U('Log/takeFoodList'));
				$children [] = array("title" => "apk  版本", "icon" => "fa fa-android", "href" => U('Log/apkList'),
				
				);					
				$navs [] = array(
				
					"title" => "日志管理",
					"icon" => "fa fa-cogs",
					"children" => $children,
				);	
				unset($children);*/
				
				$children [] = array(
				
					"title" => "用户设置",
					"icon" => "fa fa-user",
					"href" => U('AuthUser/userList'),
				
				);
				$children [] = array(
				
					"title" => "用户组设置",
					"icon" => "fa fa-users",
					"href" => U('AuthGroup/groupList'),
				
				);
				$children [] = array(
				
					"title" => "规则设置",
					"icon" => "fa fa-sliders",
					"href" => U('AuthRule/ruleList'),
				
				);
				$navs [] = array(
				
					"title" => "权限管理",
					"icon" => "fa fa-lock",
					"children" => $children,
				);
                $navs [] = array("title" => "系统操作日志", "icon" => "fa fa-file", "href" => U('EventLog/lists'),
                );
            }
			
			$this->assign('navs',json_encode($navs));
			$this->display();	
	}
	public function main(){
	
		$this->display();
	}
	
}