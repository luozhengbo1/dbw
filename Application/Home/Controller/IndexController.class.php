<?php
namespace Home\Controller;

use Think\Controller;

class IndexController extends Controller
{

    public function index(){
        $this->redirect('Index/login');
    }

    public function loginCheck(){
	
        $username = I('post.username','');
        $password = I('post.password','');
        $verifyCode = I('post.verifyCode','');
		
		$verify = new \Think\Verify();        
		if ($verify->check($verifyCode, 1)) {
            
            if (empty($username) || empty($password)) {
				
				$result['code'] = 2; 
				$result['msg'] = '用户名或密码为空！';
				
            } else {
				
				$condition['username'] = $username;
				$condition['password'] = md5($password);
				$condition['status'] = 1;
				
				$AuthUser = D('UserView');
				$userList = $AuthUser->where($condition)->find();
				if(!empty($userList)){
					//session(array('name'=>'PHPSESSID','expire'=>900));
                    session('user_info', $userList);
					session('uid',$userList['id']);	
					session('username',$userList['username']);
					session('gp_id',$userList['group_id']);		
					session('gp_title',$userList['title']);
					session('is_company',$userList['is_company']);	
					session('shop_id',$userList['shop_id']);

					//注册cookies					
/* 					cookie('username',$userList['username'],3600*24*7); // 指定cookie保存时间
					cookie('session_id',session_id(),3600*24*7); // 指定cookie保存时间				
					$Session = M('session');
					$data['username'] = cookie('username');
					$data['session_id'] = cookie('session_id');
					$data['add_time'] = date('Y-m-d H:i:s',time());					
					$data['expire_time'] = date('Y-m-d H:i:s', strtotime("+7 days"));			
					$Session->add($data); */
					
					
					//记录日志
					$LoginLog = M('LoginLog','auth_');
					$dataLog['name'] = session('username');
					$dataLog['ip'] = get_client_ip();
					$dataLog['operate'] = '登陆';
					$dataLog['add_time'] = date('Y-m-d H:i:s',time());
					$LoginLog->add($dataLog);

					
					
					$result['code'] = 0; 
					$result['msg'] = 'login successed';

					
				}else{
					
					$result['code'] = 2;				
					$result['msg'] = '用户名或密码错误！';					
				
				}				
			
			}
        } else {
            
				$result['code'] = 2; 
				$result['msg'] = '验证码错误！';
				$result['data'] = '';
        }
		
		$this->ajaxReturn($result,"JSON");
    }


    public function logout()
    {
 
		//记录日志
		$LoginLog = M('LoginLog','auth_');
		$dataLog['name'] = session('username');
		$dataLog['ip'] = get_client_ip();
		$dataLog['operate'] = '注销';
		$dataLog['add_time'] = date('Y-m-d H:i:s',time());
		
		if (!session('username', null)) {

			$LoginLog->add($dataLog);
			
            $this->redirect('Index/login');
        }
    }
	
	public function verifyCheck(){
		
		$verifyCode=I('post.verifyCode','');
		$verify = new \Think\Verify();
		$data['flag'] = ($verify->check($verifyCode, 1)==true)?true:false;		
		$this->ajaxReturn($data,"JSON");
	
	}

    public function verifyImg()
    {
        $config = array(
            'fontSize' => 20, // 验证码字体大小
            'length' => 4, // 验证码位数
            'useNoise' => false, // 关闭验证码杂点
            'imageW' => 150, // 验证码宽度
            'imageH' => 35, // 验证码高度
            'codeSet' => '0123456789'
        );
        $Verify = new \Think\Verify($config);        
        $Verify->entry(1);
    }
	public function unLock(){
		
        $username = I('post.username','');
        $password = I('post.password','');
		
		if (empty($username) || empty($password)) {
			
			$result['code'] = 2; 
			$result['msg'] = '用户名或密码为空！';
			
			
		}else{
			
			$condition['username'] = $username;
			$condition['password'] = md5($password);
			$User = D('UserView');
			$userList = $User->where($condition)->find();
			if(!empty($userList)){
				
				$result['code'] = 1;				
				$result['msg'] = '正确！';					
				
			}else{
				
				$result['code'] = 2;				
				$result['msg'] = '用户名或密码错误！';						
				
			}
		}
		$this->ajaxReturn($result,"JSON");		
		
	}
}