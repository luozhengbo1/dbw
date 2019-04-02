<?php
namespace Home\Controller;

use Home\Controller\CommonController;

class TypeController extends CommonController
{
	public function addType()
    {
		if(IS_POST){
			$title = I('title','');
			$note = I('note','');

			$Type = M('type');	
			$data['title'] = $title;
			$data['note'] = $note;
			$data['gp_id'] = session('gp_id');
			$data['add_time'] = date('Y-m-d H:i:s',time());
			
			$condition['title'] = $title;
			$condition['gp_id'] = session('gp_id');
			if($Type->where($condition)->count()>=1){
				$this->error('已有此分组！',U('Type/typeList'));
			}else{
				$Type->add($data) ? $this->success('新增成功！',U('Type/typeList')) : $this->error('新增失败！',U('Type/typeList'));
			}
		}else{
			$this->display();
		}
    }     
	public function editType(){
		$id = I('id','');
		if(IS_POST){
			$title = I('title','');
			$note = I('note','');
			$Type = M('type');			
			if(!empty($title)){
				$condition['title'] = $title;
				$Type->where($condition)->count() >= 1 &&  $this->error('已有此类型名！');
			}else{
				$this->error('类型名不能为空！');
			}
			$data['id'] = intval($id);
			$data['title'] = $title;
			$data['note'] = $note;
			$data['add_time'] = date('Y-m-d H:i:s',time());
			$Type->save($data) !== false ? $this->success('编辑成功！',U('Type/typeList')) : $this->error('编辑失败！',U('Type/typeList'));
		}else{
			if($id != ''){
				$condition['id'] = intval($id);
				$Type = M('type');
				$typeList = $Type->where($condition)->find();
				$this->assign('typeList',$typeList);
			}
			$this->display();	
		}
	}
	public function delType()
    {
		$id = I('id','');
		if(IS_POST){
			if($id != ''){
				$condition['id'] = intval($id);
				$Type = M('type');
				//delete方法的返回值是删除的记录数，如果返回值是false则表示SQL出错，返回值如果为0表示没有删除任何数据。
				if($Type->where($condition)->delete()){
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
        $this->display();
	}		
	public function typeDetail()
    {
		$id = I('id','');
		if($id != ''){
			$condition['id'] = intval($id);
			$Type = M('type');
			$typeList = $Type->where($condition)->find();
			$this->assign('typeList',$typeList);
		}
		$this->display();
	}	
	public function typeList($pageNum='1',$pageSize='15')
    {
		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		$title = I('title','');
		if($title != ''){
			$condition['title'] = array('like','%'.$title.'%');
		}
		$start = ((int)$pageNum-1)*(int)$pageSize;
		//管理员显示全部
		(session('gp_id') != 1 || session('title') != '超级管理员' ) && $condition['gp_id'] = session('gp_id');
		$Type = M('type');
		$typeList = $Type->where($condition)->limit($start,$pageSize)->order('id desc')->select();
		$pageCount = intval(ceil($Type->where($condition)->count()/$pageSize));
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);
		//搜索参数
		$params = array(
			'title' => $title,		
		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);
		$this->assign('pageList',$pageList);		
		$this->assign('typeList',$typeList);
		$this->assign('title',$title);		
		$this->display();
	}
}