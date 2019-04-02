<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class PayController extends CommonController {

	public function payDetail($pageNum='1',$pageSize='15'){

        $pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		
		$pnum = I('pnum','');
		$time = I('time',date('Y-m',time()));
		if($pnum != ''){
			$start = ($pageNum-1) * $pageSize;
			$Order = M('order');
			$Record = M('record');
			$condition['pnum'] = $pnum;
			$condition['add_time']= array(array('EGT',$time.date('-01',time()).' 00:00:00'),array('ELT',$time.date('-t',time()).' 23:59:59'));
			$condition['status'] = 1;
			$condition['pay_type'] = 0;
			$orderList = $Order->where($condition)->order('id desc')->limit($start,$pageSize)->select();
			foreach($orderList as &$value){
				$map['order_id'] = intval($value['id']);
				$value['food_items'] = $Record->where($map)->select();

			}
			$pageCount = intval(ceil($Order->where($condition)->count()/$pageSize));
			
		}
		//搜索参数
		$params = array(
			'pnum' => $pnum,
			'time' => $time,
		);


		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);
		
		$this->assign('payList',$orderList);	
		$this->assign('pageList',$pageList);		
		$this->display();


	}
    public function payList($pageNum='1',$pageSize='15'){

		$pageNum = intval($pageNum);
		$pageSize = intval($pageSize);
		$time = I('time',date('Y-m',time()));		
			
		$pnum = I('pnum','');
		$pname = I('pname','');
		$department = I('department','');
		$time = I('time',date('Y-m',time()));
		!empty($pnum) && $condition['pnum'] = array('like','%'.$pnum.'%');
		!empty($pname) && $condition['pname'] = array('like','%'.$pname.'%');
		!empty($department) && $condition['department'] = array('like','%'.$department.'%');
		$condition['add_time']= array(array('EGT',$time.date('-01',time()).' 00:00:00'),array('ELT',$time.date('-t',time()).' 23:59:59'));
		$start = ($pageNum-1) * $pageSize;

		$Order = M('Order');
		$condition['status'] = 1;
		$condition['pay_type'] = 0;
		$orderList = $Order->where($condition)->field('SUM(amount) AS amount,pnum,pname,department')->group('pnum')->limit($start,$pageSize)->select();
		$subQuery = $Order->where($condition)->group('pnum')->buildSql();
		$pageCount = intval(ceil($Order->table($subQuery.' a')->count()/$pageSize));
		

		//搜索参数
		$params = array(
			'pname' => $pname,
			'pnum' => $pnum,
			'department' => $department,
			'time' => $time,
		);

		//需要显示的页码
		$showPage = setShowPage( 3 ,$pageNum, $pageCount);		
		$pageList = setPageList($showPage,$pageNum,$pageSize,$pageCount,$params);
		

		$this->assign('payList',$orderList);
		$this->assign('pageList',$pageList);
		$this->assign('params',$params);
        $this->display();
    }
	
	public function downExcel(){
		header("X-Frame-Options: DENY");//加载空白		
		$pnum = I('pnum','');
		$pname = I('pname','');
		$department = I('department','');
		$time = I('time',date('Y-m',time()));
		!empty($pnum) && $condition['pnum'] = array('like','%'.$pnum.'%');
		!empty($pname) && $condition['pname'] = array('like','%'.$pname.'%');
		!empty($department) && $condition['department'] = array('like','%'.$department.'%');
		$condition['add_time']= array(array('EGT',$time.date('-01',time()).' 00:00:00'),array('ELT',$time.date('-t',time()).' 23:59:59'));
		
		$Order = M('Order');
		$condition['status'] = 1;
		$condition['pay_type'] = 0;
		$orderList = $Order->where($condition)->field('pnum,pname,department,feecode,SUM(amount) AS amount')->group('pnum')->limit($start,$pageSize)->select();		
		$orderList = array_merge(array(array('工号','姓名','部门','费用代码','总金额')),$orderList);	
		outExcel($orderList);		
	
	}
}