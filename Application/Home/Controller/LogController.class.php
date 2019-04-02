<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class LogController extends CommonController {
    
	public function foodList($pageNum='1',$pageSize='15'){
		
		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		
		$devid = I('devid','');
		
		!empty($devid) && $condition['devid'] = array('like','%'.$devid.'%');

		$start = ($pageNum-1) * $pageSize;
		$FoodLog = M('SyncFoodLog');
		$foodList = $FoodLog->where($condition)->limit($start,$pageSize)->order('id desc')->select();
		$pageCount = intval(ceil($FoodLog->where($condition)->count()/$pageSize));



		//搜索参数
		$params = array(
			'devid' => $devid,		
		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);

		$this->assign('pageList',$pageList);
		$this->assign('pageCount',$pageCount);		
		$this->assign('foodList',$foodList);
		$this->assign('devid',$devid);
		$this->display();
		
	}

	public function clientList($pageNum='1',$pageSize='15'){
		
		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		
		$devid = I('devid','');
		
		!empty($devid) && $condition['devid'] = array('like','%'.$devid.'%');

		$start = ($pageNum-1) * $pageSize;
		$ClientLog = M('SyncClientLog');
		$clientList = $ClientLog->where($condition)->limit($start,$pageSize)->order('id desc')->select();
		$pageCount = intval(ceil($ClientLog->where($condition)->count()/$pageSize));

		//搜索参数
		$params = array(
			'devid' => $devid,		
		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);

		$this->assign('pageList',$pageList);
		$this->assign('pageCount',$pageCount);		
		$this->assign('clientList',$clientList);
		$this->assign('devid',$devid);
		$this->display();
		
	}
	
	public function apkList($pageNum='1',$pageSize='15'){
		
		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		
		$devid = I('devid','');
		
		!empty($devid) && $condition['devid'] = array('like','%'.$devid.'%');

		$start = ($pageNum-1) * $pageSize;
		$ApkLog = M('ApkLog');
		$apkList = $ApkLog->where($condition)->limit($start,$pageSize)->order('id desc')->select();
		$pageCount = intval(ceil($ApkLog->where($condition)->count()/$pageSize));

		//搜索参数
		$params = array(
			'devid' => $devid,		
		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);

		$this->assign('pageList',$pageList);
		$this->assign('pageCount',$pageCount);		
		$this->assign('apkList',$apkList);
		$this->assign('devid',$devid);
		$this->display();
		
	}
	public function takeFoodList($pageNum='1',$pageSize='15'){
		
		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		

		$pnum = trim(I('pnum',''));
		$gid = trim(I('gid',''));		
		$devid = trim(I('devid',''));		
		
		!empty($pnum) && $condition['pnum'] = array('like','%'.$pnum.'%');
		!empty($gid) && $condition['gid'] = array('like','%'.$gid.'%');
		!empty($devid) && $condition['devid'] = array('like','%'.$devid.'%');
		
		$start = ($pageNum-1) * $pageSize;
		$TakeFoodLog = M('takeFoodLog');
		$takeFoodList = $TakeFoodLog->where($condition)->limit($start,$pageSize)->order('id desc')->select();
		$pageCount = intval(ceil($TakeFoodLog->where($condition)->count()/$pageSize));

		//搜索参数
		$params = array(
			'devid' => $devid,		
		);
		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);

		$this->assign('pageList',$pageList);
		$this->assign('pageCount',$pageCount);		
		$this->assign('takeFoodList',$takeFoodList);
		$this->assign('devid',$devid);
		$this->display();
		
	}	
}