<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class DeviceController extends CommonController {

	public function addDevice(){
		
		if(IS_POST){
			
			$no = I('no','');
			$title = I('title','');
			$ip = I('ip','');
			$devid = I('devid','');
			$address = I('address','0');			
			$note = I('note','0');
			
			$Device = M('Device');
			
			$data['no'] = $no;
			$data['title'] = $title;
			$data['ip'] = $ip;
			$data['devid'] = $devid;
			$data['address'] = $address;	
			$data['note'] = $note;
			$data['add_time'] = date('Y-m-d H:i:s', time());
			
			
			$condition['no'] = $no;
			
			if($Device->where($condition)->count()>=1){
			
				$this->error('已有编号,请勿新增！');
			
			}else{
			

				$Device->add($data) ? $this->success('新增成功！',U('Device/deviceList')) : $this->error('新增失败！',U('Device/deviceList'));			
			
			}
		}else{
			
			$this->display();
		}
    }
	public function editDevice(){
		$id = I('id','');

		if(IS_POST){
			
			$no = I('no','');
			$title = I('title','');
			$ip = I('ip','');
			$devid = I('devid','0');
			$address = I('address','0');			
			$note = I('note','0');
			
			$Device = M('Device');
			
			$data['id'] = intval($id);
			$data['no'] = $no;
			$data['title'] = $title;
			$data['ip'] = $ip;
			$data['devid'] = $devid;			
			$data['address'] = $address;	
			$data['note'] = $note;
			$data['add_time'] = date('Y-m-d H:i:s', time());
				
						
			$condition['no'] = $no;
			
			if($no == $Device->where("id = $id")->getField('no')){
				

				$Device->save($data) ? $this->success('修改成功！',U('Device/deviceList')) : $this->error('修改失败！',U('Device/deviceList'));
				
			}else{
				
				if($Device->where($condition)->count()>=1){
				
					$this->error('已有编号,请勿修改！');
				
				}else{
				

					$Device->save($data) ? $this->success('修改成功！',U('Device/deviceList')) : $this->error('修改失败！',U('Device/deviceList'));
				
				}				
				
			}			
				
		
		}else{
						
			if($id != ''){
				
				$condition['id'] = intval($id);
				$Device = M('device');
				$deviceList = $Device->where($condition)->find();
				$this->assign('deviceList',$deviceList);		
				$this->display();
			}
				
		}		
				
	}
	
	public function delDevice(){
		
		$id = I('id','');
		if(IS_POST){
			
			if($id != ''){
				
				$condition['id'] = intval($id);
				$Device = M('Device');
				//delete方法的返回值是删除的记录数，如果返回值是false则表示SQL出错，返回值如果为0表示没有删除任何数据。
				if($Device->where($condition)->delete()){

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
	public function deviceDetail(){

        
		$id = I('id','');
		if($id != ''){
			
			$condition['id'] = intval($id);
			$Device = M('Device');
			$deviceList = $Device->where($condition)->find();
			$this->assign('deviceList',$deviceList);
			
		}
		
		$this->display();


	}
    public function deviceList($pageNum='1',$pageSize='15'){
		
		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		
		$title = I('title','');
		
		!empty($title) && $condition['title'] = array('like','%'.$title.'%');
		
		$start = ($pageNum-1) * $pageSize;
		$Device = M('Device');
		
		
		$deviceList = $Device->where($condition)->limit($start,$pageSize)->select();		
		$pageCount = intval(ceil($Device->where($condition)->count()/$pageSize));

		//搜索参数
		$params = array(
			'title' => $title,		
		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);
		
		$this->assign('deviceList',$deviceList);
		$this->assign('pageList',$pageList);
		$this->assign('title',$title);		
        $this->display();
    }
}