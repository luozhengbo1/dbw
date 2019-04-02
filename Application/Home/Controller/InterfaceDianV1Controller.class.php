<?php
namespace Home\Controller;
use Think\Controller\RestController;
class InterfaceDianV1Controller extends RestController {
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
		用户登录	
	*/
    public function loginCheck() {

		switch ($this->_method){

			case 'post': 
			
				$username = I('username','');
				$password = I('password','');
								
				if(empty($username)){
					
					$result['code'] = 2;
					$result['msg'] = 'username is null';
					$this->ajaxReturn($result,"JSON");			
				}
				if(empty($password)){
					
					$result['code'] = 2;
					$result['msg'] = 'password is null';
					$this->ajaxReturn($result,"JSON");		
				}
				
				$AuthUser = D('UserView');
				
				$condition['username'] = $username;
				$condition['password'] = md5($password);
				$condition['status'] = 1;	
				
				$userList = $AuthUser->where($condition)->find();
				
				if(!empty($userList)){
					
					$result['code'] = 0;
					$result['msg'] = 'request successed!';	
					$result['data'] = $userList;
					
				}else{
					
					$result['code'] = 2;
					$result['msg'] = 'request faild!';				
					
				}
				$this->response($result,'json');
				break;
		}
    }
	/*
		上报程序版本
	*/		
    public function uploadVersion() {
        
		switch ($this->_method){
			
			case 'post':
				
				$devid = I('get.devid','');
				$version = I('version','');
				
				$APKLog = M('apkLog');
				$dataLog['devid'] = $devid;
				$dataLog['version'] = $version;
				$dataLog['add_time'] = date('Y-m-d H:i:s',time());
				if($APKLog->add($dataLog)){

					$result['code'] = 0;
					$result['msg'] = 'request successed!';
				
				}else{

					$result['code'] = 2;
					$result['msg'] = 'request faild!';					

				}
				$this->response($result,'json');					
				break;			
		}
	}	
	/*
		检测版本	
	*/	
    public function versionCheck() {
        switch ($this->_method){

			case 'get': 
				
				$APK = M('apk');
				$apkList = $APK->order('id desc')->find();
				if(!empty($apkList)){

					$result['code'] = 0;
					$result['msg'] = 'request successed!';
					$result['data'] = $apkList;
				
				}else{

					$result['code'] = 2;
					$result['msg'] = 'request faild!';					

				}
				
				$this->response($result,'json');
				break;
		}
    }
	/*
		批量上传-文件	
	*/	
    public function uploadRecordFile() {
		set_time_limit(0);
		ini_set('memory_limit', '128M');
        switch ($this->_method){

			case 'post': 
				
				$devid = I('get.devid','');
				
				$upload = new \Think\Upload();// 实例化上传类
				$upload->maxSize = 10485760 ;// 设置附件上传大小 10M
				$upload->exts = array('json');// 设置附件上传类型
				$upload->rootPath = 'Uploads/files/record/'; // 设置附件上传根目录
				$upload->subName = '';
				$upload->saveName = 'time';

				$info = $upload->uploadOne($_FILES['file']);//上传单个文件 
				if($info) {
					//处理刷卡记录
				
 					$filePath = $upload->rootPath.$info['savepath'].$info['savename'];
					$file = fopen($filePath, 'a+');
					$body= fread($file,filesize($filePath));
					fclose($file);

					$dataList = json_decode($body,true);
 					$Order = M('order');					
					$Record = M('record');
					if(!empty($dataList)){
												
						foreach($dataList as $key=>$value){
							
							
							$dataList[$key]['pay_time'] = date('Y:m:d H:i:s',$value['pay_time']);
							$dataList[$key]['add_time'] = date('Y-m-d H:i:s',time());
							
							if($orderID = $Order->add($value)){
								$foodList =	json_decode($value['food_data'],true);
								//替换订单号
								foreach($foodList as $k=>$v){
									
									$foodList[$k]['order_id'] = $orderID;
							
								}
								$Record->addAll($foodList);									
								$count++;
							}else{
								
								$result['code'] = 2;
								$result['msg'] = '保存失败！';									
								$this->response($result,'json');	
							}
						
						}
						//日志处理
						$uploadFileLog = M('uploadFileLog');
						$dataLog['devid'] = $devid;
						$dataLog['operate'] = '上传';
						$dataLog['file_name'] = $info['savename'];
						$dataLog['count'] = count($dataList);							
						$dataLog['add_time'] = date('Y-m-d H:i:s',time());		
						$uploadFileLog->add($dataLog);
						
						$result['code'] = 0;
						$result['msg'] = 'request successed!';									
						$result['data'] = $count;	
						
					}else{
						

						$result['code'] = 2;
						$result['msg'] = '文件读取失败！';					
						
					}
				
				}else{

					$result['code'] = 2;
					$result['msg'] = '上传失败！';
					$result['data'] = $upload->getError();	
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
				$type = I('type','点餐');
				$amount = I('amount','');				
				$status = I('status','');				
				$payID = I('pay_id','');
				$payType = I('pay_type','');
				$foodType = I('food_type','');
				$foodTake = I('food_take','');					
				$payTime = I('pay_time','');			
				//$foodData = I('food_data','[{"order_id":20170000123,"food_id":56,"food_price":10,"food_name"："鱼香肉丝","company":"\u5174\u8363\u9910\u996e"},{"order_id":20170001234,"food_id":56,"food_name"："鱼香肉丝","food_price":10,"company":"\u5174\u8363\u9910\u996e"}]','','strip_tags');
				$foodData = $_POST['food_data'];
				$devid = I('get.devid','');
				
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
					$result['code'] = 0;
					$result['msg'] = 'request successed!';
					$result['data'] = $orderNO;
					
				
				}else{
					
					$result['code'] = 2;
					$result['msg'] = 'request faild!';				
					
				}
			
				$this->response($result,'json');
				break;
		}
    }
	/*
		同步菜品列表	
	*/
    public function syncFoodList() {
		set_time_limit(0);
		switch ($this->_method){

			case 'post': 

				$devid = I('get.devid','');			
				$syncTime = I('syncTime','');//时间戳
				$gpID = I('gp_id','3');	//分用户同步 2：创维康 3: 兴荣餐饮		
				
				if(empty($devid)){
					
					$result['code'] = 2;
					$result['msg'] = 'devid is null';	
					$this->response($result,'json');
				}
				
				if(empty($syncTime)){
					
					$result['code'] = 2;
					$result['msg'] = 'syncTime is null';	
					$this->response($result,'json');
				}			
					
				$Food = M('food');
				$condition['gp_id'] = $gpID;
				$condition['update_time'] = array('GT',date('Y-m-d H:i:s',$syncTime));
				$foodList = $Food->where($condition)->select();
				foreach($foodList as $key=>$value){
					
					$foodList[$key]['id'] = intval($value['id']);
					
				}				
				$SyncFoodLog = M('SyncFoodLog');
				$dataLog['devid'] = $devid;
				$dataLog['operate'] = '同步';
				$dataLog['add_time'] = date('Y-m-d H:i:s',time());		
				$SyncFoodLog->add($dataLog);
			
				$result['code'] = 0;
				$result['msg'] = 'request successed';
				$result['data'] = array('update_time' => time(),'data' => $foodList);

				$this->response($result,'json');
				break;
		}
    }
	/*
		同步白名单
	*/
    public function syncClientList() {
		set_time_limit(0);
		switch ($this->_method){

			case 'post': 
			
				$devid = I('get.devid','');			
				$syncTime = I('syncTime','');//时间戳
				
				
				if(empty($devid)){
					
					$result['code'] = 2;
					$result['msg'] = 'devid is null';	
					$this->response($result,'json');
				}
				
				if(empty($syncTime)){
					
					$result['code'] = 2;
					$result['msg'] = 'syncTime is null';	
					$this->response($result,'json');
				}
				
				
				//连接116数据库
				$mysql = 'mysql://root:root@10.67.48.118/bus_payinfo#utf8';
				$Client = M('client','card_',$mysql);
				$condition['ntime'] = array('GT',date('Y-m-d H:i:s',$syncTime));
				$clientList = $Client->where($condition)->select();
				
				foreach($clientList as &$value){
					
					$value['id'] = intval($value['id']);
					
				}		
				
				$SyncClientLog = M('SyncClientLog');
				$dataLog['devid'] = $devid;
				$dataLog['operate'] = '同步';
				$dataLog['add_time'] = date('Y-m-d H:i:s',time());		
				$SyncClientLog->add($dataLog);
				
				$result['code'] = 0;
				$result['msg'] = 'request successed';
				$result['data'] = array('update_time' => time(),'data' => $clientList);

				$this->response($result,'json');
				break;
			}
    }	

	/*
		餐商上传菜品
	*/	
    public function uploadFood() {
		set_time_limit(0);
		switch ($this->_method){
		
			case 'post':
			
				$devid = I('get.devid','');
				$username = I('username','');			
				$name = I('name','');
				$typeID = I('type_id','');
				$price = I('price','');
				$gpID = I('gp_id','2');	
		
				if(empty($name)){
					
					$result['code'] = 2;
					$result['msg'] = 'name is null';	
					$this->response($result,'json');
				}
				
				if(empty($typeID)){
					
					$result['code'] = 2;
					$result['msg'] = 'typeID is null';	
					$this->response($result,'json');
				}
					
				
				$Food = M('food');
				
				$data['name'] = $name;
				$data['type_id'] = $typeID;
				$data['price'] = $price;
				$data['status'] = 1;			
				$data['gp_id'] = $gpID;
				$data['update_time'] = date('Y-m-d H:i:s',time());
				$data['add_time'] = date('Y-m-d H:i:s',time());
				
				$condition['name'] = $name;
				$condition['gp_id'] = $gpID;
				$condition['status'] = array('neq',2);
				
				if($Food->where($condition)->count() >= 1){
					
					$result['code'] = 1;
					$result['msg'] = 'the name already exists';			
					
				}else{
					
					if(!empty($_FILES['thumb']['name'])){
						
						$upload = new \Think\Upload();// 实例化上传类
						$upload->maxSize = 10485760 ;// (字节)设置附件上传大小 10M 
						$upload->exts = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
						$upload->rootPath = 'Uploads/images/thumb/'; // 设置附件上传根目录
						$upload->subName = '';
						$upload->saveName = 'time';

						$info = $upload->uploadOne($_FILES['thumb']);//上传单个文件 
						if($info) {

							$thumb = "/".$upload->rootPath.$info['savepath'].$info['savename'];

						}else{

							$map['code'] = 2;
							$map['msg'] = 'upload thumb faild';
							$map['data'] = $upload->getError();
							$this->ajaxReturn($map);
						}
						$data['thumb'] = $thumb;							
					}			
					
					if($Food->add($data)){
														
						$FoodLog = M('FoodLog');
						$dataLog['name'] = $username;
						$dataLog['content'] = json_encode($data,JSON_UNESCAPED_SLASHES);
						$dataLog['operate'] = '增加';				
						$dataLog['add_time'] = date('Y-m-d H:i:s');
						$dataLog['source'] = 'app-'.$devid;						
						$FoodLog->add($dataLog);						
						
						$result['code'] = 0;
						$result['msg'] = 'request successed';
					
					}else{
						
						$result['code'] = 2;
						$result['msg'] = 'request faild';				
					}				
					
				}		
				$this->response($result,'json');
			}	
			break;			
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
	/*
		获得订餐的列表
	*/
	public function getDingFoodTypeList(){
		switch ($this->_method){
			
			case 'get':
				
				$foodType = I('food_type','汉堡');
				$startTime = date('Y-m-d',time()).' 00:00:00';
				$endTime = date('Y-m-d', time()).' 23:59:59';			
				$condition['type'] = '订餐';
				$condition['food_type'] = $foodType;
				$condition['pay_time'] = array(array('gt',$startTime),array('lt',$endTime));	
				$Order = M('order');	
				$Record = M('record');
				$orderList = $Order->where($condition)->select();
				foreach($orderList as &$value){
					$map['order_id'] = intval($value['id']);
					$value['food_items'] = $Record->where($map)->select();

				}	
				$result['code'] = 0;
				$result['msg'] = 'request successed!';
				$result['data'] = $orderList;
					
				$this->response($result,'json');
			break;					
		}
	
	}
	/*
		取餐
	
	*/
	public function foodTakeChange(){
		
		switch ($this->_method){
			
			case 'post':
				
				$ids = I('ids','');
				$pnum = I('pnum','');
				$gid = I('gid','');
				$devid = I('get.devid','');
				if(empty($ids)){
					
					$result['code'] = 2;
					$result['msg'] = 'id is null';	
					$this->response($result,'json');
				}
				if(empty($pnum)){
					
					$result['code'] = 2;
					$result['msg'] = 'pnum is null';	
					$this->response($result,'json');
				}				
				if(empty($gid)){
					
					$result['code'] = 2;
					$result['msg'] = 'gid is null';	
					$this->response($result,'json');
				}

				$Order = M('order');
				$condition['id'] = array('in',$ids);
				if($Order->where($condition)->setField('food_take',1) !== false){
					
					$TakeFoodLog = M('TakeFoodLog');
					
					$orderList = $Order->where($condition)->getField('order_no',true);
					
					$dataLog['pnum'] = $pnum;
					$dataLog['gid'] = $gid;
					$dataLog['devid'] = $devid;
 					$dataLog['operate'] = '取餐';
 					
					foreach($orderList as $value){
						$dataLog['order_no'] = $value;
						$dataLog['add_time'] = date('Y-m-d H:i:s',time());
						$TakeFoodLog->add($dataLog);
					}
					
					$result['code'] = 0;
					$result['msg'] = 'request successed!';				
				
				}else{
					
					$result['code'] = 2;
					$result['msg'] = 'request faild!';						
				}				

					
				$this->response($result,'json');		
			break;					
		}
			
	}
}


?>