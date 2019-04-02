<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class AuthRuleController extends CommonController {
	
	public function addRule(){
		
		if(IS_POST){
			
			$name = I('name','');
			$title = I('title','');
			$status = intval(I('status','0'));
			$pid = intval(I('pid','0'));
			$note = I('note','');
			$sort = I('sort','50');

			
			$AuthRule = D('AuthRule');	

			
			$data['name'] = $name;
			$data['title'] = $title;
			$data['status'] = $status;
			$data['level'] = $pid == 0 ? 0 : $AuthRule->where("id = $pid")->getField('level') + 1;
			$data['pid'] = $pid;
			$data['note'] = $note;
			$data['add_time'] = date('Y-m-d H:i:s',time());
			
			$condition['name'] = $name;

			if($AuthRule->where($condition)->count()>=1){
			
				$this->error('已有控制器/方法,请勿新增！',U('AuthRule/ruleList'));
			
			}else{
			
				$AuthRule->add($data) ? $this->success('新增成功！',U('AuthRule/ruleList')) : $this->error('新增失败！',U('AuthRule/ruleList'));
			
			}
		}else{
			
			$pidList = D('AuthRule')->getAuthRule();
			
			$this->assign('pidList',generateTree($pidList));
			$this->display();
		}
	
      
	}

	public function editRule(){

		$id = I('id','');
	
		if(IS_POST){
		
			$name = I('name','');
			$title = I('title','');
			$status = intval(I('status','0'));
			$pid = intval(I('pid','0'));
			$note = I('note','');
			$sort = I('sort','50');	

			$AuthRule = D('AuthRule');
			
			$data['id'] = intval($id);
			$data['name'] = $name;
			$data['title'] = $title;
			$data['status'] = $status;
			$level = $AuthRule->where("id = $pid")->getField('level');
			$data['level'] = $level == $pid ? 0 : $level + 1;
			$data['pid'] = $pid;
			$data['note'] = $note;
			$data['add_time'] = date('Y-m-d H:i:s',time());
									
			$condition['name'] = $name;
			
			$name = $AuthRule->where("id = $id")->getField('name');
			
			if($name == $AuthRule->where("id = $id")->getField('name')){
				
				//如果控制器方法相等
				$AuthRule->save($data) !== false ? $this->success('编辑成功！',U('AuthRule/ruleList')) : $this->error('编辑失败！',U('AuthRule/ruleList'));
				
			}else{
				
				if($AuthRule->where($condition)->count()>=1){
				
					$this->error('已有控制器/方法,请勿编辑！',U('AuthRule/ruleList'));
				
				}else{
				
					$AuthRule->save($data) !== false ? $this->success('编辑成功！',U('AuthRule/ruleList')) : $this->error('编辑失败！',U('AuthRule/ruleList'));
				
				}				
				
			}
							
		}else{
			

			
			if($id != ''){
				
				$condition['id'] = intval($id);
				$AuthRule = D('AuthRule');
				$ruleList = $AuthRule->where($condition)->find();
				$this->assign('ruleList',$ruleList);							
			}	
				
			$pidList = D('AuthRule')->getAuthRule();
			$pidList = array_merge(array(array('id' => '0','title' => '顶级权限')),generateTree($pidList));
			$this->assign('pidList',$pidList);
			$this->display();		
		}

	}
	public function delRule(){
		
		$id = I('id','');
		
		if($id != ''){
			
			$condition['id'] = intval($id);
			$AuthRule = D('AuthRule');

			if($AuthRule->where($condition)->getField('level') == 0){
				
				//判断是否含有子元素
				if(!empty($AuthRule->where("pid = $id")->select())){
					
					$result['code'] = 2;
					$result['msg'] = "请先删除子元素！";
					
				}else{
					
					if($AuthRule->where($condition)->delete()){
						

						$result['code'] = 1;
						$result['msg'] = "删除成功！";			
					
					}else{
					
						$result['code'] = 2;
						$result['msg'] = "删除失败！";					
					
					}
						
				}
				
				
			}else{
				
					if($AuthRule->where($condition)->delete()){
						

						$result['code'] = 1;
						$result['msg'] = "删除成功！";			
					
					}else{
					
						$result['code'] = 2;
						$result['msg'] = "删除失败！";					
					
					}		
				
			}
			
			//delete方法的返回值是删除的记录数，如果返回值是false则表示SQL出错，返回值如果为0表示没有删除任何数据。
			
		}

		$this->ajaxReturn($result);
		
	}
	public function ruleDetail(){
	
		$id = I('id','');
		
		if($id != ''){
			
			$condition['id'] = intval($id);
			$AuthRule = D('AuthRule');
			$ruleList = $AuthRule->where($condition)->find();
			$this->assign('ruleList',$ruleList);	
			
		}
		$pidList = D('AuthRule')->getAuthRule();
		$pidList = array_merge(array(array('id' => '0','title' => '顶级权限')),generateTree($pidList));
		$this->assign('pidList',$pidList);
		$this->display();	
	
	}
	
	public function ruleList(){
	
		$title = I('title','');
		if($title != ''){
			
			$condition['title'] = array('like','%'.$title.'%');
			
		}
		$AuthRule = D('AuthRule');
		$ruleList = $AuthRule->where($condition)->select();
		$this->assign('ruleList',generateTree($ruleList));	
		$this->assign('title',$title);	
		$this->display();
		 	 
	 
	}
	

}