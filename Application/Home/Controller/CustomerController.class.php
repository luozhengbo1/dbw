<?php
namespace Home\Controller;

class CustomerController extends CrudController
{
    public function _lists(&$where)
    {
        if (session('is_company') == 1) {
            $where['id'] = session('shop_id');
        }
        $_GET['limit'] = 15; # 每页显示5条
        # 列出列表之前如果有搜索条件则增加搜索条件
        if (isset($_GET['name'])) {
            $where['name'] = array('like', "%{$_GET['name']}%");
            $this->assign("name", $_GET['name']);
        }
    }
    # list之后如果数据需要做关联处理在此处处理
    public function lists_(&$data)
    {
        foreach ($data->data as &$val) {
            $val['sex'] =   $val['sex'] == 1 ? "男" : "女";
        }
    }
    # 删除之前进行检测
    public function _del($id)
    {
     
    }
}