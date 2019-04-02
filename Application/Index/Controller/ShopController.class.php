<?php
namespace Index\Controller;

class ShopController extends CrudController
{
    public function index()
    {
        $merchant = M("merchant");
        $merchantInfo= $merchant->find();
        $this->assign("merchantInfo", $merchantInfo);

        $mShop = M("shop");
        $shopList = $mShop->limit(6)->select();

        $shopClass = M("shop_class");
        $shopClassList =  $shopClass->field("id,name")->select();
        $shopClassList = array_column($shopClassList, 'name', 'id');
        foreach ($shopList as &$val) {
            $val['class_id'] = $shopClassList[$val['class_id']];
            $this->dealShopStatus($val);
        }

        $this->assign("lists", $shopList);
        $this->display();
    }
    public function _lists(&$where)
    {
        header("content-type:text/html;charset=utf-8;");
        $_GET['limit'] = 6;
        # 搜索
        if($name = I('name')) {
            $this->assign('name', $name);
            $where['name'] = array("like", "%{$name}%");
        }
        # 堂食，外带店铺搜索
        if($eatType = I('eat_type')) {
            $where['eat_type'] = array("like", "%{$eatType}%");
            $this->assign('eatType', $eatType);
        }

    }
    # list之后如果数据需要做关联处理在此处处理
    public function lists_(&$data)
    {
        $merchant = M("merchant");
        $merchantInfo= $merchant->find();
        $this->assign("merchantInfo", $merchantInfo);

        $shopClass = M("shop_class");
        $shopList =  $shopClass->field("id,name")->select();
        $shopList = array_column($shopList, 'name', 'id');
        foreach ($data->data as &$val) {
            $val['class_id'] = $shopList[$val['class_id']];
            $this->dealShopStatus($val);
        }
        # 异步请求获取店铺列表
        if (IS_AJAX) {
            $this->assign("lists", $data->data);
            $backData = array('status' => 1, 'msg' => '获取成功', 'data' => $this->fetch("Shop/search"));
            die(json_encode($backData));
        }
    }

    # 获取店铺信息
    public function info($shopId)
    {
        $shop = M("shop");
        $shopWhere = array('id' => $shopId);
        $shopInfo = $shop->where($shopWhere)->find();
        $shopInfo['status_cn'] =  $shopInfo['status'] == "on" ? "营业中": "打烊了";
        $now = date("H:i:s");
        $openTime = str_replace(" ", "", explode("-", $shopInfo['open_time']));
        if ($now < $openTime[0] || $now > $openTime[1]) {
            $shopInfo['status'] = "off";
            $shopInfo['status_cn'] = "打烊了";
        }
        return $shopInfo;
    }
    public function dealShopStatus(&$shopInfo)
    {
        $shopInfo['status_cn'] =  $shopInfo['status'] == "on" ? "营业中": "打烊了";
        $now = date("H:i:s");
        $openTime = str_replace(" ", "", explode("-", $shopInfo['open_time']));
        if ($now < $openTime[0] || $now > $openTime[1]) {
            $shopInfo['status'] = "off";
            $shopInfo['status_cn'] = "打烊了";
        }
    }
    #上滑加载店铺
    public function getShop()
    { 
    	if( IS_AJAX ){
            $mShop = M("shop");
            $eatType = I("type");
            $where = "1=1";
            if ($eatType > 0) {
                $where = array('like' => array("eat_type", "%{$eatType}%"));
            }
            $pageSize = 6;
            $offset = ($_POST['targetPage']-1) * $pageSize + 6;
            $rowCount =  $mShop->where($where)->count();
            $totalPage = ceil($rowCount/$pageSize);
            $shopList = $mShop->limit($offset, $pageSize)->select();

            $shopClass = M("shop_class");
            $shopClassList =  $shopClass->where($where)->field("id,name")->select();
            $shopClassList = array_column($shopClassList, 'name', 'id');
            foreach ($shopList as &$val) {
                $val['class_id'] = $shopClassList[$val['class_id']];
                $this->dealShopStatus($val);
            }
            if( !empty($shopList) ){

                $this->assign("lists", $shopList);
                $this->assign("totalPage", $totalPage);
                if ($eatType == 0) {
                    $view = $this->fetch("Shop/commonShop");

                } else {
                    $view =$this->fetch("Shop/search");
                }
                $backData = array("status" => 1,'msg'=> '获取成功', 'data'=> $view, 'totalPage' => $totalPage);
                die(json_encode($backData));
            }
    	}

    }
    /**
    *店铺首页
    */
    public function shop() 
    {
        $shop_id =  (int)$_GET['shop_id'];
    	if(!$shop_id ){
    		 redirect(U('Shop/index'));
    	}
    	$getShopInfo = M('shop')
            ->where(['id'=>$shop_id])
            ->find();
        $this->dealShopStatus($getShopInfo);
        $this->assign('shop',$getShopInfo);
    	$this->display();
    }
}