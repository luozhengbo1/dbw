<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class APKController extends CommonController {

	
	public function addAPK(){

		if(IS_POST){
			
			
			$version = I('version','');
			$url = I('url','');
			$type = I('type','');
			$note = I('note','');
			
			$APK = M('apk');
	
			$data['version'] = $version;
			$data['url'] = $url;
			$data['type'] = $type;	
			$data['add_time'] = date('Y-m-d H:i:s',time());			
			$data['note'] = $note;
						
			$condition['version'] = $version;
			
			if($APK->where($condition)->count()>=1){
			
				$this->error('已有此版本！');

			
			}else{
			
				$APK->add($data) ? $this->success('新增成功！',U('APK/apkList')) : $this->error('新增失败！',U('APK/apkList'));
		
			}			
				
			
		}else{
			
			$this->display();			
			
		}	
			
	}

	public function editAPK(){

		$id = I('id','');
		
		if(IS_POST){
			
			$id = intval($id);
			$version = I('version','');
			$url = I('url','');
			$type = I('type','');
			$note = I('note','');			
			
			$APK = M('apk');
	
			$data['version'] = $version;
			$data['url'] = $url;
			$data['type'] = $type;
			$data['add_time'] = date('Y-m-d H:i:s',time());		
			$data['note'] = $note;
			
			$APKList = $APK->where("id = $id")->find();

			if($APK->save($data) !== false){
								
				$this->success('编辑成功',U('apk/apkList'));
				
			}else{
				
				$this->error('编辑失败',U('apk/apkList'));
			}		
			
		}else{
			
			
			if($id != ''){
				
				$condition['id'] = intval($id);
				$APK = M('apk');
				$APKList = $APK->where($condition)->find();
				$this->assign('apkList',$APKList);

			}
			
			$this->display();			
					
		}

		
	}
	public function delAPK(){
		
		$id = I('id','');
		if(IS_POST){
			
			if($id != ''){
				
				$condition['id'] = intval($id);
				$APK = M('apk');
								
				$data['id'] = intval($id);
				$data['status'] = 2;
				$data['upload_time'] = date('Y-m-d H:i:s',time());		
				
				if($APK->save($data)){

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
	public function apkDetail(){
		
		$id = I('id','');
		
		if($id != ''){
			
			$condition['id'] = intval($id);
			$APK = M('apk');
			$apkList = $APK->where($condition)->find();			
			$this->assign('apkList',$apkList);		
		}		

		$this->display();
		
	}

	public function apkList($pageNum='1',$pageSize='15'){

		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		
		$version = I('version','');
		
		!empty($version) && $condition['version'] = array('like','%'.$version.'%');
	
		
		$start = ($pageNum-1) * $pageSize;
		$APK = M('apk');
		$apkList = $APK->where($condition)->limit($start,$pageSize)->order('id desc')->select();
		$pageCount = intval(ceil($APK->where($condition)->count()/$pageSize));
		
		//搜索参数
		$params = array(
			'version' => $version,

		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);
			
		$this->assign('apkList',$apkList);
		$this->assign('pageList',$pageList);
		$this->assign('version',$version);	
		$this->display();
		 	 
	 
	}
	public function uploadAPK(){
		
		$upload = new \Think\Upload();// 实例化上传类
		$upload->maxSize = 10485760 ;// (字节)设置附件上传大小 10M 
		$upload->exts = array('apk');// 设置附件上传类型
		$upload->rootPath = 'Uploads/files/apk'; // 设置附件上传根目录
		$upload->subName = '';
		$upload->saveName = 'time';

		$info = $upload->uploadOne($_FILES['file']);//上传单个文件 
		if($info) {

			$data['code'] = 1;
			$data['msg'] = '上传成功！';
			$data['data'] = "/".$upload->rootPath.$info['savepath'].$info['savename'];

		}else{

			$data['code'] = 2;
			$data['msg'] = '上传失败！';
			$data['data'] = $upload->getError();	
		}
		$this->ajaxReturn($data);
	}
}