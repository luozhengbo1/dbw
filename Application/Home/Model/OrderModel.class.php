<?php
namespace Home\Model;
use Think\Model;
use Think\Model\RelationModel;
class OrderModel extends RelationModel{
		
    protected $_link = array(
        'record_data'=>array(
            'mapping_type'      => self::HAS_MANY,
            'class_name'        => 'record',
			'foreign_key'		=> 'order_id',
			'mapping_name'		=> 'food_items',
            ),
    );
}