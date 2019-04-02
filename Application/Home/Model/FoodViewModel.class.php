<?php
namespace Home\Model;
use Think\Model\ViewModel;
    class foodViewModel extends ViewModel {
		
	public $viewFields = array(
	
			'food'=>array('id','name','price','thumb','status','type_id','gp_id','note','_type'=>'LEFT'),
			'type'=>array('title'=>'type_title', '_on'=>'food.type_id=type.id'),
			'auth_group'=>array('title'=>'gp_title', '_on'=>'food.gp_id=auth_group.id','_table'=>'auth_group'),
		);
	public function getGroupInfo(){
		
		$Group = D('GroupView');
		(session('gp_id') != 1 || session('gp_title') != '超级管理员' ) && $map['gp_id'] = session('gp_id');
		$groupList = $Group->where($map)->select();
		return !empty($map['gp_id'])? $groupList : mkOptGroup($groupList);
		
	}
}