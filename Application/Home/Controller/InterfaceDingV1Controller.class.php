<?php
namespace Home\Controller;
use Think\Controller\RestController;
class InterfaceDingV1Controller extends RestController {
	public function L_initialize(){
							
		$devid = I('get.devid','');
		$appkey = I('get.appkey','');
		$skey = I('get.skey','');
		
		if(!empty($devid)){
			
			$Device = M('Device');	
			$condition['devid'] = $devid;
			$deviceList = $Device->where($condition)->find();
			if(empty($deviceList)){
				
				$result['code'] = 2;
				$result['msg'] = 'vaild device';
				$this->ajaxReturn($result,"JSON");						
			}
		}else{
			
			$result['code'] = 2;
			$result['msg'] = 'devid is null';
			$this->ajaxReturn($result,"JSON");			
		
		}

		if(!empty($appkey) && !empty($skey)){
			
			$APP = M('app');
			$mySkey = $APP-> where("appkey = '$appkey'")->getField('skey');
  			if($skey != sha1($mySkey.date('Y-m-d',time()))){		
				
				$result['code'] = 2;
				$result['msg'] = 'you don\'t have permission';
				$this->ajaxReturn($result,"JSON");

			} 
		
		}else{
				
			$result['code'] = 2;
			$result['msg'] = 'permission key is null';
			$this->ajaxReturn($result,"JSON");	
		}

	
	}

	/*
		获得所有餐商账号	
	*/	
	public function getAllCompany(){
		switch ($this->_method){	
			case 'get':		
				$AuthUser = D('UserView');
				$condition['is_company'] = 1;
				$userList = $AuthUser->where($condition)->order('id desc')->select();
				$result['code'] = 0;
				$result['msg'] = 'request successed!';
				$result['data'] = $userList;				
				$this->ajaxReturn($result,"JSON");					
		}	
		
	}

	/*
		获得菜品	
	*/	
	public function getCompanyFood(){
		switch ($this->_method){

			case 'get': 
				
				$gpID = intval(I('gp_id','3'));	
				$Food = D('FoodView');
				$condition['gp_id'] = $gpID;
				$foodList = $Food->where($condition)->order('id desc')->select();
				if(!empty($foodList)){
					
					$result['code'] = 0;
					$result['msg'] = 'request successed!';	
					$result['data'] = $foodList;
					
				}else{
					
					$result['code'] = 2;
					$result['msg'] = 'request faild!';				
					
				}				
				$this->response($result,'json');
			break;
		}
	}
	
	public function clientCheck(){
		
		switch ($this->_method){
			
			case 'post': 
					
				$gid = I('gid','');	
				if(empty($gid)){
					
					$result['code'] = 2;
					$result['msg'] = 'gid is null';	
					$this->response($result,'json');
				}
				//连接116数据库
				$mysql = 'mysql://root:root@10.67.48.118/bus_payinfo#utf8';
				$Client = M('client','card_',$mysql);
				$condition['gid'] = $gid;
				$condition['status'] = array('NEQ',2);
				$clientList = $Client->where($condition)->order('id desc')->select();
				if(!empty($clientList)){
					
					$result['code'] = 0;
					$result['msg'] = 'request successed!';	
					$result['data'] = $clientList;
					
				}else{
					
					$result['code'] = 2;
					$result['msg'] = 'request faild!';				
					
				}				
				$this->response($result,'json');				
			break;
			
			
		}
		
		
	}
	
	/*
		上传刷卡记录	
	*/
    public function uploadRecord() {
		set_time_limit(0);
		switch ($this->_method){

			case 'post': 				

				$orderNO = buildOrderNO();
				$pnum = I('pnum','');
				$pname = I('pname','');
				$department = I('department','');
				$feecode = I('feecode','');
				$gid = I('gid','');
				$type = I('type','订餐');
				$amount = I('amount','');				
				$status = I('status','');				
				$payID = I('pay_id','');
				$payType = I('pay_type','');
				$foodType = I('food_type','0');
				$foodTake = I('food_take','0');					
				$payTime = I('pay_time','');			
				//$foodData = I('food_data','[{"order_id":20170000123,"food_id":56,"food_price":10,"food_name"："鱼香肉丝","company":"\u5174\u8363\u9910\u996e"},{"order_id":20170001234,"food_id":56,"food_name"："鱼香肉丝","food_price":10,"company":"\u5174\u8363\u9910\u996e"}]','','strip_tags');
				$foodData = $_POST['food_data'];
				$devid = I('get.devid','121231232');
				
				$data['order_no'] = $orderNO;
				$data['pnum'] = $pnum;
				$data['pname'] = $pname;
				$data['department'] = $department;
				$data['feecode'] = $feecode;
				$data['gid'] = $gid;					
				$data['type'] = $type;
				$data['amount']= $amount;					
				$data['status']= $status;			
				$data['pay_id']= $payID;
				$data['pay_type']= $payType;
				$data['food_type']= $foodType;
				$data['food_take']= $foodTake;
				$data['pay_time'] = date('Y-m-d H:i:s',$payTime);//传入刷卡时间戳
				$data['add_time'] = date('Y-m-d H:i:s',time());			
				$data['devid'] = $devid;
 				
				$Order = M('order');
				$Record = M('record');
				if($orderID = $Order->add($data)){
				
					if(!empty($foodData)){
						$foodList = json_decode($foodData,true);
						foreach($foodList as &$value){
							
							$value['order_id'] = $orderID;
							
						}

					$Record->addAll($foodList);
					}
	
					$condition['type'] = '订餐';
					$condition['status'] = 1;
					$condition['add_time'] = array(array('gt',date('Y-m-d 00:00:00',time())),array('lt',date('Y-m-d 23:59:59',time())));
					$orderList = $Order->where($condition)->getField('order_no',true);
					$result['code'] = 0;
					$result['msg'] = 'request successed!';
					$result['data'] =  array_search($orderNO, $orderList);
					
				
				}else{
					
					$result['code'] = 2;
					$result['msg'] = 'request faild!';				
					
				}
			
				$this->response($result,'json');
				break;
		}
    }



	/*
		获得当天刷卡金额
	*/		
	public function clientAccountCheck(){
		switch ($this->_method){
		
			case 'post':
			
				$pnum = I('pnum','');			
				$startTime = date('Y-m-d',time()).' 00:00:00';
				$endTime = date('Y-m-d', time()).' 23:59:59';
				
				if(empty($pnum)){
					
					$result['code'] = 2;
					$result['msg'] = 'pnum is null';	
					$this->response($result,'json');
				}
				$Order = M('order');
				$condition['pnum'] = $pnum;
				$condition['pay_time'] = array(array('gt',$startTime),array('lt',$endTime));
			
				$subQuery = $Order->group('order_no,pay_type,food_type,pay_time')->where($condition)->buildsql();
								
				$priceList = $Order->table($subQuery.' a')->field('SUM(food_price) AS food_price')->join('__RECORD__ ON a.id = __RECORD__.order_id','LEFT')->find();

				empty($priceList['food_price']) && $priceList['food_price'] = 0;
				
				$result['code'] = 0;
				$result['msg'] = 'request successed';
				$result['data'] = $priceList;
				$this->response($result,'json');				
			
				break;
		}		
			
	}
	
	
}


?>