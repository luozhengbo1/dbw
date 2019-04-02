<?php
namespace Home\Model;
use Think\Model\ViewModel;
    class OrderViewModel extends ViewModel {
		
	public $viewFields = array(
	
			'myorder'=>array('id','order_id','pnum','pname','department','feecode','gid','type','status','food_take','pay_id','pay_type','food_type','amount','pay_time','add_time','devid','_type'=>'LEFT','_table'=>'__ORDER__'),
			'record'=>array('order_id','food_id','food_name','food_price','food_num','company', '_on'=>'myorder.id=record.order_id'),
		);
}