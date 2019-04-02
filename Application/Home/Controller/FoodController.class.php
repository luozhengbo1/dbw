<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class FoodController extends CrudController
{
    public function _add()
    {
        # 食品分类
        $type = M('food_class');
        $shopId = session('shop_id');
        
        $where = array('shop_id' => $shopId);
        $typeList = $type->field('id,name')->where($where)->select();
        $this->assign('typeList',$typeList);

        # 所属店铺
        $merchant = M("shop");
        $shopWhere = array("id" => $shopId);
        if ($shopId > 0) {
            $this->assign('shop', $merchant->where($shopWhere)->field("id,name")->select());
        } else{
            $this->assign('shop', $merchant->field("id,name")->select());
        }
    }
    # 新增之后写入操作日志
    public function add_($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '新增食品', $obj);
        }
        $this->success('新增成功',U("Food/lists"),2);
        exit;
    }
    # 编辑之前获取关联表信息
    public function _edit()
    {
        $this->_add();
    }
    # 编辑完成后写入操作日志
    public function edit_()
    {
        $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '编辑食品', session('edit_object'));
    }
    public function _lists(&$where)
    {
        $_GET['limit'] = 6;
        if (session('is_company') == 1) {
            $where['shop_id'] = session("shop_id");
        }

        # 分类搜索
        if (isset($_GET['name'])) {
            $where['name'] = array('like', "%{$_GET['name']}%");
            $this->assign("name", $_GET['name']);
        }

        # 类型搜索
        if (isset($_GET['class_id'])) {
            $where['name'] = array('class_id' =>$_GET['class_id']);
            $this->assign("class_id", $_GET['class_id']);
        }
    }
    public function lists_(&$data)
    {
        $foodClass = M("food_class");
        $classList = $foodClass->select();
        $classList = array_column($classList, 'name', 'id');

        $shop = M('shop');
        $shopList = $shop->select();
        $shopList = array_column($shopList, 'name', 'id');

        foreach ($data->data as &$val) {
            $val['class_id'] = $classList[$val['class_id']];
            $val['shop_id'] = $shopList[$val['shop_id']];
        }
    }
    # 删除之前进行检测
    public function _del($id)
    {
        $where = array("id" => $id);
        if ($obj = $this->exists($where)) {
            # 记录系统操作日志
            $this->eventLog(CONTROLLER_NAME."/".ACTION_NAME, '删除食品', $obj);
        }
    }

	public function foodDetail(){
		
		$id = I('id','');
		
		if($id != ''){
			
			$condition['id'] = intval($id);
			$Food = D('FoodView');
			$foodList = $Food->where($condition)->find();			
			
			$Type = M('type');
			$typeList = $Type->field('id,title')->select();		
			$this->assign('typeList',$typeList);
			$this->assign('foodList',$foodList);
			
			//显示所有可用的餐商
			$groupList = D('AuthGroup')->getIsCompany();
			$this->assign('groupList',$groupList);
		}		

		$this->display();
		
	}
	public function downExcel(){
		
		header("X-Frame-Options: DENY");//加载空白
		$name = I('name','');
		$type_id = I('type_id','');
		!empty($name) && $condition['name'] = array('like','%'.$name.'%');
		!empty($type_id) && $condition['type_id'] = $type_id;
		//判断gp_id
		session('is_company') == 1 ? $condition['gp_id'] = session('gp_id') : '';
		$Food = D('FoodView');
		$foodList = $Food->where($condition)->field('name,price,thumb,status,type_title,gp_title,note')->order('id desc')->select();
		$foodList = array_merge(array(array('标题','价格','封面','状态','备注','类型','所属用户')),$foodList);
		outExcel($foodList);
		
	}
	public function uploadFoodThumb(){
		
		$upload = new \Think\Upload();// 实例化上传类
		$upload->maxSize = 10485760 ;// (字节)设置附件上传大小 10M 
		$upload->exts = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
		$upload->rootPath = 'Uploads/images/thumb/'; // 设置附件上传根目录
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