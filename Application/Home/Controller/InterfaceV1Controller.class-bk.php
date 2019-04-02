<?php
namespace Home\Controller;
use Think\Controller\RestController;
class InterfaceV1Controller extends RestController {
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
			
			$username = I('username','H70000');
			$password = I('password','admin');
			
			$condition['username'] = $username;
			$condition['password'] = md5($password);
			$condition['status'] = 1;
			
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
        switch ($this->_method){

		case 'post': 
				
			$upload = new \Think\Upload();// 实例化上传类
			$upload->maxSize = 10485760 ;// 设置附件上传大小 10M
			$upload->exts = array('json');// 设置附件上传类型
			$upload->rootPath = './Uploads/files/record'; // 设置附件上传根目录
			$upload->subName = '';
			$upload->saveName = 'time';

			$info = $upload->uploadOne($_FILES['file']);//上传单个文件 
			if($info) {
				//处理刷卡记录
			
				$filePath = '/'.$upload->rootPath.$info['savepath'].$info['savename'];
				$file = fopen($filePath, 'a+') or die("Unable to open file!");//这要处理一下
				$body= fread($file,filesize($filePath));
				fclose($file);
				
				$dataList = json_decode($body,true);
				$Record = M('record');
				
				if($Record->addAll($dataList)){
					
					$data['code'] = 0;
					$data['msg'] = '上传成功！';
					$data['data'] = count($recordList);//上传成功默认返回条数
					
				}else{
					

					$data['code'] = 2;
					$data['msg'] = '上传失败！';
					$data['data'] = $upload->getError();						
					
				}
			
			}else{

				$data['code'] = 2;
				$data['msg'] = '上传失败！';
				$data['data'] = $upload->getError();	
			}

			//$this->response($result,'json');				
		
			
			break;
		}		
		
	}	
	/*
		上传刷卡记录	
	*/
    public function uploadRecord() {

		switch ($this->_method){

		case 'post': 
			
			$orderID = I('order_id','');
			$pnum = I('pnum','');
			$pname = I('pname','');
			$department = I('department','');
			$feecode = I('feecode','');
			$type = I('type','点餐');
			$payID = I('pay_id','');
			$payType = I('pay_type','');
			$status = I('status','正常');
			$foodID = I('food_id','');			
			$foodName = I('food_name','');
			$foodPrice = I('food_price','');		
			$foodType = I('food_type','0');
			$ptime = I('ptime','');
			$company = I('company','');			
			$devid = I('get.devid','');
			
			$data['order_id'] = $orderID;
			$data['pnum'] = $pnum;
			$data['pname'] = $pname;
			$data['department'] = $department;
			$data['type'] = $type;
			$data['feecode'] = $feecode;			
			$data['pay_id'] = $payID;
			$data['pay_type'] = $payType;			
			$data['status'] = $status;
			$data['food_id'] = $foodID;
			$data['food_name'] = $foodName;
			$data['food_price'] = $foodPrice;
			switch($foodType){				
				case 1 :
					$data['food_type'] = '早餐';	
					break;
				case 2 :
					$data['food_type'] = '标准餐';	
					break;	
				case 3 :
					$data['food_type'] = '商务餐';	
					break;							
				case 4 :
					$data['food_type'] = '自选餐';	
					break;
				case 5 :
					$data['food_type'] = '特色餐';	
					break;
				default:
					$data['food_type'] = '';	
					break;
			}
		
			$data['ptime'] = urldecode($ptime);
			$data['utime'] = date('Y-m-d H:i:s',time());			
			$data['company'] = $company;
			$data['devid'] = $devid;
			
			$Record = M('record');		
			if($Record->add($data)){
				
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
		同步菜品列表	
	*/
    public function syncFoodList() {
		set_time_limit(0);
		switch ($this->_method){

		case 'post': 

			$devid = I('get.devid','1111');			
			$syncTime = I('syncTime','1501516800');//时间戳
			//分用户同步
			$gpID = I('gp_id','3');	//2：创维康 3: 兴荣餐饮		
			
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
			$result['data'] = $foodList;


			
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
			$mysql = 'mysql://root:123456@127.0.0.1/ccardcardev#utf8';
			$Client = M('client','car_',$mysql);
			$condition['utime'] = array('GT',date('Y-m-d H:i:s',$syncTime));
			$clientList = $Client->where($condition)->select();

			
			$SyncClientLog = M('SyncClientLog');
			$dataLog['devid'] = $devid;
			$dataLog['operate'] = '同步';
			$dataLog['add_time'] = date('Y-m-d H:i:s',time());		
			$SyncClientLog->add($dataLog);
			
			$result['code'] = 0;
			$result['msg'] = 'request successed';
			$result['data'] = $clientList;

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
			
			$devid = I('get.devid','123456');
			$username = I('username','admin');			
			$name = I('name','');
			$typeID = I('type_id','');
			$price = I('price','');
			$gpID = I('gp_id','2');	


			
/* 			if(empty($name)){
				
				$result['code'] = 2;
				$result['msg'] = 'name is null';	
				$this->response($result,'json');
			} */
			
/* 			if(empty($typeID)){
				
				$result['code'] = 2;
				$result['msg'] = 'typeID is null';	
				$this->response($result,'json');
			} */
				
			
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
}


?>