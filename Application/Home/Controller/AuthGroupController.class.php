<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class AuthGroupController extends CommonController {
	
	public function addGroup(){
		
		
		if(IS_POST){
			

			$title = I('title','');
			$status = intval(I('status','0'));
			$isCompany = intval(I('isCompany','0'));			
			$rules = I('rules','');
			$note = I('note','');		
		
			$AuthGroup = D('AuthGroup');	
	
			$data['title'] = $title;
			$data['status'] = $status;
			$data['rules'] = $rules != '' ? implode(",",$rules) : '';
			$data['is_company'] = $isCompany;			
			$data['shop_id'] =I("shop_id") ;
			$data['note'] = $note;
			
			$condition['title'] = $title;

			if($AuthGroup->where($condition)->count()>=1){
			
				$this->error('已有用户组,请勿新增！',U('AuthGroup/groupList'));
			
			}else{
			
				$AuthGroup->add($data) ? $this->success('新增成功！',U('AuthGroup/groupList')) : $this->error('新增失败！',U('AuthGroup/groupList'));
			
			}				

		}else{

            $shop = M("shop");
            $shopList = $shop->field("id,name")->select();
            $this->assign("shopList", $shopList);
			$pidList = D('AuthRule')->getAuthRule();
			$this->assign('pidList',generateTree($pidList));
			$this->display();
		}
	
      
	}
	public function editGroup(){
	
		$id = I('id','');
		
		if(IS_POST){
		

			$title = I('title','');
			$status = intval(I('status','0'));
			$isCompany = intval(I('isCompany','0'));			
			$rules = I('rules','');
			$note = I('note','');		
		
			$AuthGroup = D('AuthGroup');	
			
			$data['id'] = intval($id);
			$data['title'] = $title;
			$data['status'] = $status;
			$data['is_company'] = $isCompany;
			$data['shop_id'] = I("shop_id");
			$data['rules'] = $rules != '' ? implode(",",$rules) : '';
			$data['note'] = $note;
			
			
			$condition['title'] = $title;
					
			if($title == $AuthGroup->where("id = $id")->getField('title')){
				
				//如果控制器方法相等
				$AuthGroup->save($data) !== false ? $this->success('编辑成功！',U('AuthGroup/groupList')) : $this->error('编辑失败！',U('AuthGroup/groupList'));
				
			}else{
				
				if($AuthGroup->where($condition)->count()>=1){
				
					$this->error('已有控制器/方法,请勿编辑！',U('AuthGroup/groupList'));
				
				}else{
				
					$AuthGroup->save($data) !== false ? $this->success('编辑成功！',U('AuthGroup/groupList')) : $this->error('编辑失败！',U('AuthGroup/groupList'));
				
				}				
				
			}
		
		}else{
						
			if($id != ''){
				
				$condition['id'] = intval($id);
				$AuthGroup = D('AuthGroup');
				$groupList = $AuthGroup->where($condition)->find();
				$this->assign('groupList',$groupList);
				
			}

            $shop = M("shop");
            $shopList = $shop->field("id,name")->select();
            $this->assign("shopList", $shopList);
			$pidList = D('AuthRule')->getAuthRule();
			$this->assign('pidList',generateTree($pidList));
			$this->display();
		}

	}
	public function delGroup(){
		
		$id = I('id','');
		if(IS_POST){
			
			if($id != ''){
				
				$condition['id'] = intval($id);
				$AuthGroup = D('AuthGroup');
				//delete方法的返回值是删除的记录数，如果返回值是false则表示SQL出错，返回值如果为0表示没有删除任何数据。
				if($AuthGroup->where($condition)->delete()){

					$result['code'] = 1;
					$result['msg'] = "删除成功！";			
					
				}else{
					
					$result['code'] = 2;
					$result['msg'] = "删除失败！";					
					
				}
				
			}else{
				
				$result['code'] = 2;
				$result['msg'] = "id 不能为空！";				
				
			}
					
			
		}
		$this->ajaxReturn($result);
		
	}
	public function groupDetail(){
	
		$id = I('id','');
		
		if($id != ''){
			
			$condition['id'] = intval($id);
			$AuthGroup = D('AuthGroup');
			$groupList = $AuthGroup->where($condition)->find();
			$this->assign('groupList',$groupList);
			
		}
		
		$pidList = D('AuthRule')->getAuthRule();
		$this->assign('pidList',generateTree($pidList));
		$this->display();	
	
	}
	
	public function groupList($pageNum='1',$pageSize='15'){

		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		
		$title = I('title','');
		if($title != ''){
			
			$condition['title'] = array('like','%'.$title.'%');
			
		}
		$start = ((int)$pageNum-1)*(int)$pageSize;
		$AuthGroup = D('AuthGroup');
		$groupList = $AuthGroup->where($condition)->limit($start,$pageSize)->select();		
		$pageCount = intval(ceil($AuthGroup->where($condition)->count()/$pageSize));
		
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);
		
		//搜索参数
		$params = array(
			'title' => $title,		
		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);		
		
		$this->assign('pageList',$pageList);		
		$this->assign('groupList',$groupList);
		$this->assign('title',$title);		
		$this->display();
		 	 
	 
	}
	

}