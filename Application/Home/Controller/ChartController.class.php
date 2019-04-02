<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class ChartController extends CommonController {

	/*
		交易金额构成
	*/
	public function transAmount(){
		
		//刷厂牌:0，现金：1， 微信:2，支付宝:3
		$Order = M('order');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['status'] = 1;
		$condition['pay_time'] = array(array('gt',$startTime),array('lt',$endTime));		
		$subQuery = $Order->group('order_no,pay_type,food_type,pay_time')->where($condition)->buildSql();
		//dump($subQuery);
		//统计付款方式

		$orderList = $Order->table($subQuery.' a')->field('pay_type,COUNT(id) AS count')->group('pay_type')->select();
		//dump($orderList);
		
		//计算金额
		$priceSum = $Order->table($subQuery.' a')->field('SUM(amount) AS amount')->find();
		
		$sourceList = array(array('pay_type'=>0,'count'=>0),array('pay_type'=>1,'count'=>0),array('pay_type'=>2,'count'=>0),array('pay_type'=>3,'count'=>0));
		
		//循环检测
		foreach($orderList as $key=>$value){
			
			foreach($sourceList as $k=>$v){
				
				$value['pay_type'] == $v['pay_type'] && $sourceList[$k]['count'] = intval($value['count']);				
				
			}		
			
		}
		//替换中文名字	
		foreach($sourceList as $key=>$value){
			
			switch($value['pay_type']){
				case 0:
					$sourceList[$key]['pay_type'] = '刷厂牌';
					break;
				case 1:
					$sourceList[$key]['pay_type'] = '现金';
					break;
				case 2:
					$sourceList[$key]['pay_type'] = '微信';
					break;
				case 3:
					$sourceList[$key]['pay_type'] = '支付宝';
					break;
			}
		}		
		$this->assign('startTime',date('Y/m/d', strtotime("-6 days")));
		$this->assign('endTime',date('Y/m/d', strtotime("-0 days")));		
		$this->assign('sourceList',$sourceList);
		$this->assign('priceSum',$priceSum);
		$this->display();
		
	}
	
	/*
		下载 交易金额构成Excel
	*/
	public function downTransAmountExcel(){
		
		header("X-Frame-Options: DENY");//加载空白		
		$Order = M('order');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['status'] = 1;
		$condition['pay_time'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Order->group('order_no,pay_type,food_type,pay_time')->where($condition)->buildSql();
		$orderList = $Order->table($subQuery.' a')->field('pay_type,COUNT(id) AS count')->group('pay_type')->select();
		$priceSum = $Order->table($subQuery.' a')->field('SUM(amount) AS amount')->find();
		foreach($orderList as $key=>$value){
			
			switch($value['pay_type']){
				case 0:
					$orderList[$key]['pay_type'] = '刷厂牌';
					break;
				case 1:
					$orderList[$key]['pay_type'] = '现金';
					break;
				case 2:
					$orderList[$key]['pay_type'] = '微信';
					break;
				case 3:
					$orderList[$key]['pay_type'] = '支付宝';
					break;					
			}
		}
		$orderList = array_merge(array(array('支付方式','数量')),$orderList);
		$orderList = array_merge($orderList,array(array('','','总交易额',$priceSum['amount'].'元') ));			
		outExcel($orderList);	
	
	}
	
	/*
		7日就餐人数/人次趋势
	*/
	public function foodTrend(){
		
		for($i = 6;$i >= 0;$i--){
			
			$dateList [] = date('n/j', strtotime("-$i days"));
					
		}
		$Order = M('order');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['status'] = 1;
		$condition['pay_time'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Order->group('order_no,pay_type,food_type,pay_time')->where($condition)->buildSql();
		//就餐人次
		$personNum = $Order->table($subQuery.' a')->field("date_format(pay_time, '%c/%e') AS date,COUNT(date_format(pay_time, '%c/%e')) as count")->group('date')->select();
	
		
		//就餐人数		
		$personCount = $Order->table($subQuery.' a')->field("date_format(pay_time, '%c/%e') AS date,COUNT(DISTINCT(pnum)) as count")->group('date')->select();

		//生成为0的数据
		foreach($dateList as $key=>$value){
			
			$temp['date'] = $value;
			$temp['count'] = 0;
			$_personNum[] = $temp;
			$_personCount[] = $temp;
		}
		//新就餐人次		
		foreach($_personNum as $key=>$value){
			
			foreach($personNum as $k=>$v){
				
				$value['date'] == $v['date'] && $_personNum[$key]['count'] = intval($v['count']);
				
			}
			foreach($personCount as $k=>$v){
				
				$value['date'] == $v['date'] && $_personCount[$key]['count'] = intval($v['count']);
				
			}			
			$arrayNum[] = $_personNum[$key]['count'];
			$arrayCount[] = $_personCount[$key]['count'];
		}
		
		//echo '就餐人次';
		//dump(implode(',',$arrayNum));

		//echo '就餐人数';
		//dump(implode(',',$arrayCount));
		$this->assign('dateList',json_encode($dateList));
		$this->assign('personNum',implode(',',$arrayNum));
		$this->assign('personCount',implode(',',$arrayCount));		
		$this->display();		
	}
	
	/*
		下载 7日就餐人数/人次趋势Excel
	*/	
	public function downFoodTrendExcel(){
		
		header("X-Frame-Options: DENY");//加载空白
		$Order = M('order');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['status'] = 1;
		$condition['pay_time'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Order->group('order_no,pay_type,food_type,pay_time')->where($condition)->buildSql();

		//就餐人次
		$personNum = $Order->table($subQuery.' a')->field("date_format(pay_time, '%c/%e') AS date,COUNT(date_format(pay_time, '%c/%e')) as count")->group('date')->select();
		//就餐人数
		$personCount = $Order->table($subQuery.' a')->field("date_format(pay_time, '%c/%e') AS date,COUNT(DISTINCT(pnum)) as count")->group('date')->select();
		$personNum = array_merge(array(array('日期','数量')),$personNum);
		$personNum = array_merge(array(array('就餐人次','')),$personNum);		
		$personCount = array_merge(array(array('日期','数量')),$personCount);
		$personCount = array_merge(array(array('就餐人数','')),$personCount);

		$body = array_merge($personNum,$personCount);
		
		outExcel($body);	
		
	}
	/*
		就餐类别
	*/		
	public function foodType(){
		
		$Order = M('order');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['status'] = 1;
		$condition['pay_time'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Order->group('order_no,pay_type,food_type,pay_time')->where($condition)->buildSql();
		$orderList = $Order->table($subQuery.' a')->field('food_type,COUNT(id) AS count')->group('food_type')->select();
		
		$sourceList = array(array('food_type'=>'早餐','count'=>0),array('food_type'=>'标准餐','count'=>0),array('food_type'=>'商务餐','count'=>0),array('food_type'=>'自选餐','count'=>0),array('food_type'=>'特色餐','count'=>0),array('food_type'=>'汉堡','count'=>0));
		
		//填0补充
		foreach($orderList as $key=>$value){
			
			foreach($sourceList as $k=>$v){
				
				$v['food_type'] == $value['food_type'] && $sourceList[$k]['count'] = intval($value['count']);
				
			}			
			
		}
		$this->assign('startTime',date('Y/m/d', strtotime("-6 days")));
		$this->assign('endTime',date('Y/m/d', strtotime("-0 days")));		
		$this->assign('sourceList',$sourceList);		
		$this->display();

	}
	/*
		下载就餐类别Excel
	*/		
	public function downFoodTypeExcel(){
		
		header("X-Frame-Options: DENY");//加载空白
		$Order = M('order');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['status'] = 1;
		$condition['pay_time'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Order->group('order_no,pay_type,food_type,pay_time')->where($condition)->buildSql();
		$orderList = $Order->table($subQuery.' a')->field('food_type,COUNT(id) AS count')->group('food_type')->select();
		$orderList = array_merge(array(array('就餐类别','数量')),$orderList);
		outExcel($orderList);
	}
	
}