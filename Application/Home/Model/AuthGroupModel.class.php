<?php
namespace Home\Model;
use Think\Model;
	class AuthGroupModel extends Model {
			
		protected $tablePrefix = ''; 
		
    	public function getIsCompany(){
			
			$AuthGroup = D('AuthGroup');
			$condition['status'] = 1;
			$condition['is_company'] = 1;
			$groupList = $AuthGroup->where($condition)->field('id,title,is_company')->select();
			return $groupList;
			
		}
	}