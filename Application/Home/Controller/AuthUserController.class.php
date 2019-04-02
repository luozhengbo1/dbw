<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class AuthUserController extends CommonController {
	
	public function addUser(){
		
		
		if(IS_POST){
			
			$username = I('username','');
			$password = I('password','');
			$groupId = I('group_id','');
			$status = I('status','0');
			$note = I('note','0');			
			
			$AuthUser = M('user','auth_');
			
			$data['username'] = $username;
			$data['password'] = md5($password);			
			$data['status'] = $status;
			$data['note'] = $note;
			$data['add_time'] = date('Y-m-d H:i:s', time());
			
			
			$condition['username'] = $username;
			
			if($AuthUser->where($condition)->count()>=1){
			
				$this->error('已有用户名,请勿编辑！');
			
			}else{
			
				if($id = $AuthUser->add($data)){
					
					$AuthAccess = M('access','auth_');
					$_data['uid'] = $id;
					$_data['group_id'] = $groupId;
					
					$AuthAccess->add($_data) ? $this->success('新增成功！',U('AuthUser/userList')) : $this->error('新增失败！',U('AuthUser/userList'));
				
				}				
			
			}				

		}else{
			$AuthGroup = M('group','auth_');
			$map['status'] = 1;
			$groupList = $AuthGroup->where($map)->field('id,title')->select();
			$this->assign('groupList',$groupList);
			$this->display();
		}
	
      
	}
	public function editUser(){
		
		$id = I('id','');
		
		if(IS_POST){
		
			$username = I('username','');
			$password = I('password','');
			$groupId = I('group_id','');
			$status = I('status','0');
			$note = I('note','');			
			
			$AuthUser = M('user','auth_');
			
			$data['id'] = intval($id);
			$data['username'] = $username;
			!empty($password) && $data['password'] = md5($password);
			
			$data['status'] = $status;
			$data['note'] = $note;
			$data['add_time'] = date('Y-m-d H:i:s', time());
	
			$condition['username'] = $username;
			
			if($username == $AuthUser->where("id = $id")->getField('username')){
				

				$AuthAccess = M('access','auth_');						
				if($groupId != $AuthAccess->where("uid = $id")->getField('group_id')){
									
					$_data['group_id'] = $groupId;			
					$AuthAccess->where("uid = $id")->save($_data);

				}

				$AuthUser->save($data) ? $this->success('编辑成功！',U('AuthUser/userList')) : $this->error('编辑失败！',U('AuthUser/userList'));
				
			}else{
				
				if($AuthUser->where($condition)->count()>=1){
				
					$this->error('已有用户名,请勿编辑！');
				
				}else{
				
					$AuthAccess = M('access','auth_');						
					if($groupId != $AuthAccess->where("uid = $id")->getField('group_id')){
						
						$_data['uid'] = $id;					
						$_data['group_id'] = $groupId;			
						$AuthAccess->save($_data);

					}
					$AuthUser->save($data) ? $this->success('编辑成功！',U('AuthUser/userList')) : $this->error('编辑失败！',U('AuthUser/userList'));
				
				}				
				
			}
			
		
		}else{
			
			
			if($id != ''){
				
				$condition['id'] = intval($id);
				$AuthUser = D('UserView');
				$userList = $AuthUser->where($condition)->find();
				$this->assign('userList',$userList);
			}
			$AuthGroup = M('group','auth_');
			$map['status'] = 1;
			$groupList = $AuthGroup->where($map)->field('id,title')->select();
			$this->assign('groupList',$groupList);
			$this->display();
		
		
		}

	}
	public function delUser(){
		
		$id = I('id','');
		if(IS_POST){
			
			if($id != ''){
				
				$condition['id'] = intval($id);
				$AuthUser = M('user','auth_');
				//delete方法的返回值是删除的记录数，如果返回值是false则表示SQL出错，返回值如果为0表示没有删除任何数据。
				if($AuthUser->where($condition)->delete()){

					$result['code'] = 1;
					$result['msg'] = "删除成功！";			
					
				}else{
					
					$result['code'] = 2;
					$result['msg'] = "删除失败！";					
					
				}
				
			}else{
				
				$result['code'] = 0;
				$result['msg'] = "id 不能为空！";		
					
			}
		}
		$this->ajaxReturn($result);
		
	}
	public function userDetail(){
	
		$id = I('id','');
		
		if($id != ''){
			
			$condition['id'] = intval($id);
			$AuthUser = D('UserView');
			$userList = $AuthUser->where($condition)->find();
			$this->assign('userList',$userList);
			
		}
		$AuthGroup = M('group','auth_');
		$groupList = $AuthGroup->field('id,title')->select();
		$this->assign('groupList',$groupList);
		$this->display();
	
	}

    public function userList($pageNum='1',$pageSize='15'){
		
		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		
		$username = I('username','');
		
		!empty($username) && $condition['username'] = array('like','%'.$username.'%');

		$start = ($pageNum-1) * $pageSize;
		$AuthUser = D('UserView');
		$userList = $AuthUser->where($condition)->limit($start,$pageSize)->order('id desc')->select();
		$pageCount = intval(ceil($AuthUser->where($condition)->count()/$pageSize));



		//搜索参数
		$params = array(
			'username' => $username,		
		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);

		$this->assign('pageList',$pageList);
		$this->assign('pageCount',$pageCount);		
		$this->assign('userList',$userList);
		$this->assign('username',$username);
		$this->display();
		
	}
	public function userInfo(){
		
		$AuthUser = D('UserView');
		$condition['username'] = session('username');
		$userList = $AuthUser->where($condition)->find();
		$this->assign('userList',$userList);
		$this->display();	
	}

}