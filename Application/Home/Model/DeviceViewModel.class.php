<?php
namespace Home\Model;
use Think\Model\ViewModel;
    class DeviceViewModel extends ViewModel {
		
	public $viewFields = array(
	

			'device'=>array('id','no','title','ip','devid','status','address','note','add_time','gp_id','group_id','_type'=>'LEFT'),
			'auth_group'=>array('title'=>'gp_title', '_on'=>'device.gp_id=auth_group.id','_table'=>'auth_group'),

		);
		
	}