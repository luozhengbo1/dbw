<?php
namespace Home\Model;
use Think\Model\ViewModel;
    class UserViewModel extends ViewModel {
		
	public $viewFields = array(
	
			'user'=>array('id','username','status','note','add_time','_type'=>'LEFT','_table'=>'auth_user'),
			'auth_access'=>array('group_id','_on'=>'user.id=auth_access.uid','_table'=>'auth_access'),
			'auth_group'=>array('title','is_company', 'shop_id', '_on'=>'auth_access.group_id=auth_group.id','_table'=>'auth_group'),

		);		
	}