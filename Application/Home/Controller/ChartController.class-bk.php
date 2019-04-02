<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class ChartController extends CommonController {

	public function transAmount(){
		
		//刷厂牌:0，现金：1， 微信:2，支付宝:3
		$Record = M('record');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['ptime'] = array(array('gt',$startTime),array('lt',$endTime));		
		$subQuery = $Record->field('DISTINCT(ptime),id,pnum,pname,department,feecode,type,pay_id,pay_type,status,food_id,food_name,food_price,food_type,utime')->group('pay_type,food_name,food_type,ptime')->where($condition)->buildSql();
		$recordList = $Record->table($subQuery.' a')->field('pay_type,COUNT(id) AS count')->group('pay_type')->select();
		$priceSum = $Record->table($subQuery.' a')->field('SUM(food_price) AS food_price')->find();
		$this->assign('startTime',date('Y/m/d', strtotime("-6 days")));
		$this->assign('endTime',date('Y/m/d', strtotime("-0 days")));		
		$this->assign('recordList',$recordList);
		$this->assign('priceSum',$priceSum);
		$this->display();
		
	}
	public function downTransAmountExcel(){
		
		header("X-Frame-Options: DENY");//加载空白		
		$Record = M('record');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['ptime'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Record->field('DISTINCT(ptime),id,pnum,pname,department,feecode,type,pay_id,pay_type,status,food_id,food_name,food_price,food_type,utime')->group('pay_type,food_name,food_type,ptime')->where($condition)->buildSql();
		$recordList = $Record->table($subQuery.' a')->field('pay_type,COUNT(id) AS count')->group('pay_type')->select();
		$priceSum = $Record->table($subQuery.' a')->field('SUM(food_price) AS food_price')->find();
		foreach($recordList as $key=>$value){
			
			switch($value['pay_type']){
				case 0:
					$recordList[$key]['pay_type'] = '刷厂牌';
					break;
				case 1:
					$recordList[$key]['pay_type'] = '现金';
					break;
				case 2:
					$recordList[$key]['pay_type'] = '微信';
					break;
				case 3:
					$recordList[$key]['pay_type'] = '支付宝';
					break;					
			}
		}
		$recordList = array_merge(array(array('支付方式','数量')),$recordList);
		$recordList = array_merge($recordList,array(array('','','总交易额',$priceSum['food_price'].'元') ));			
		outExcel($recordList);	
	
	}
	
	
	public function foodTrend(){
		
		for($i = 6;$i >= 0;$i--){
			
			$dateList [] = date('n/j', strtotime("-$i days"));
					
		}
		$Record = M('record');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['ptime'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Record->field('DISTINCT(ptime),id,order_id,pnum,pname,department,feecode,type,pay_id,pay_type,status,food_id,food_name,food_price,food_type,utime')->group('order_id,pay_type,food_name,food_type,ptime')->where($condition)->buildSql();		
		
		//就餐人次
		$personNum = $Record->table($subQuery.' a')->field("date_format(ptime, '%c/%e') AS date,COUNT(date_format(ptime, '%c/%e')) as count")->group('date')->select();
		//dump($Record->getlastsql());		
		
		//就餐人数		
		$personCount = $Record->table($subQuery.' a')->field("date_format(ptime, '%c/%e') AS date,COUNT(DISTINCT(pnum)) as count")->group('date')->select();
		//dump($personCount);
		//生成新的
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
	public function downFoodTrendExcel(){
		
		header("X-Frame-Options: DENY");//加载空白
		$Record = M('record');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['ptime'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Record->field('DISTINCT(ptime),id,pnum,pname,department,feecode,type,pay_id,pay_type,status,food_id,food_name,food_price,food_type,utime')->group('pay_type,food_name,food_type,ptime')->where($condition)->buildSql();
		//就餐人次
		$personNum = $Record->table($subQuery.' a')->field("date_format(ptime, '%c/%e') AS date,COUNT(date_format(ptime, '%c/%e')) as count")->group('date')->select();
		//就餐人数
		$personCount = $Record->table($subQuery.' a')->field("date_format(ptime, '%c/%e') AS date,COUNT(DISTINCT(pnum)) as count")->group('date')->select();
		$personNum = array_merge(array(array('日期','数量')),$personNum);
		$personNum = array_merge(array(array('就餐人次','')),$personNum);		
		$personCount = array_merge(array(array('日期','数量')),$personCount);
		$personCount = array_merge(array(array('就餐人数','')),$personCount);

		$body = array_merge($personNum,$personCount);
		
		outExcel($body);	
		
	}
	
	public function foodType(){
		
		$Record = M('record');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['ptime'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Record->field('DISTINCT(ptime),id,pnum,pname,department,feecode,type,pay_id,pay_type,status,food_id,food_name,food_price,food_type,utime')->group('pay_type,food_name,food_type,ptime')->where($condition)->buildSql();
		$recordList = $Record->table($subQuery.' a')->field('food_type,COUNT(id) AS count')->group('food_type')->select();
		
		$sourceList = array(array('food_type'=>'早餐','count'=>0),array('food_type'=>'标准餐','count'=>0),array('food_type'=>'商务餐','count'=>0),array('food_type'=>'自选餐','count'=>0),array('food_type'=>'特色餐','count'=>0));
		
		//填0补充
		foreach($recordList as $key=>$value){
			
			foreach($sourceList as $k=>$v){
				
				$v['food_type'] == $value['food_type'] && $sourceList[$k]['count'] = intval($value['count']);
				
			}			
			
		}

		$this->assign('startTime',date('Y/m/d', strtotime("-6 days")));
		$this->assign('endTime',date('Y/m/d', strtotime("-0 days")));		
		$this->assign('recordList',$sourceList);		
		$this->display();

	}
	public function downFoodTypeExcel(){
		
		header("X-Frame-Options: DENY");//加载空白
		$Record = M('record');
		$startTime = date('Y-m-d', strtotime("-6 days")).' 00:00:00';
		$endTime = date('Y-m-d', strtotime("-0 days")).' 23:59:59';
		$condition['ptime'] = array(array('gt',$startTime),array('lt',$endTime));
		$subQuery = $Record->field('DISTINCT(ptime),id,pnum,pname,department,feecode,type,pay_id,pay_type,status,food_id,food_name,food_price,food_type,utime')->group('pay_type,food_name,food_type,ptime')->where($condition)->buildSql();
		$recordList = $Record->table($subQuery.' a')->field('food_type,COUNT(id) AS count')->group('food_type')->select();$recordList = array_merge(array(array('就餐类别','数量')),$recordList);
		outExcel($recordList);
	}
	
}