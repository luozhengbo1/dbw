<?php
namespace Home\Model;
use Think\Model;
	class AuthRuleModel extends Model {
			
	protected $tablePrefix = ''; 
    
	public function getAuthRule($field){
			
			$AuthRule = D('AuthRule');
			$map['status'] = 1;
			$ruleList = $AuthRule->where($map)->field('id,title,name,pid')->select();
			return !isset($field) ? $ruleList : $ruleList[$field];
			
		}
	
	}
	