<?php
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {

    public function _initialize(){
		
 		$auth=new \Think\Auth();
		if(!$auth->check(CONTROLLER_NAME.'/'.ACTION_NAME,session('uid'))){
			if(stristr(ACTION_NAME,'del')){
				
				$result['code'] = 2; 
				$result['msg'] = '您无此权限！';				
				$this->ajaxReturn($result,"JSON");
				return;
			}else{
				
				$this->error('对不起,您无此权限！');
				
			}
			
		
		}
    }
}