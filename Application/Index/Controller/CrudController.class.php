<?php
/*
 +----------------------------------------
 |对数据进行CRUD的基本类，主要适用于单表
 +----------------------------------------
 |Auth:<dark2light@qq.com>
 +----------------------------------------
 |version:latest
 +----------------------------------------
 |main:对单表进行增删改查
 +----------------------------------------
*/
namespace Index\Controller;

use Org\Util\PageBar;
use Think\Controller;

class CrudController extends Controller
{
    private $model;
    public function _initialize()
    {
        header("content-type:text/html;charset=utf-8;");
        $this->model = M(CONTROLLER_NAME);
    }
    # 新增数据
    public function add()
    {
        if(method_exists($this,"_add")) {
            $this->_add();
        }
        if(IS_POST) {
            if(method_exists($this,"_enterDB")) {
                $this->_enterDB();
            }
            $addId = $this->model->add($_POST);
            if($addId){
                if(method_exists($this,"add_")) {
                    $this->add_($addId);
                }
                $this->success("新增成功");
            }else {
                $this->error("新增失败");
            }
        } else {
            $this->display(CONTROLLER_NAME."/".ACTION_NAME);
        }
    }
    # 编辑数据
    public function edit()
    {
        $id = $_REQUEST['id'];
        $where ['id'] = $id;
        $info = $this->exists($where);
        session('edit_object', $info);
        if(method_exists($this,"_edit")) {
            $this->_edit($where);
        }
        if (IS_POST) {
            if(method_exists($this,"_enterDB")) {
                $this->_enterDB();
            }
            if($this->model->where($where)->save($_POST)) {
                if(method_exists($this,"edit_")) {
                    $this->edit_();
                    session('edit_object', null);
                }
                $this->success("更新成功");
            }else {
                $this->error("更新失败或未作修改");
            }
        } else {
            if($info) {
                $this->assign('data', $info);
                $this->display(CONTROLLER_NAME."/".ACTION_NAME);
            } else {
                echo "<script>history.back()</script>";
            }
        }
    }
    # 删除数据
    public function del()
    {
        $id = (int)$_REQUEST['id'];
        $where = array('id' => $id);
        if(method_exists($this,"_del")) {
            $this->_del($id);
        }
        $deleteResult = $this->model->where($where)->delete();
        if  ($deleteResult) {
            if(method_exists($this,"del_")) {
                $this->del_($id);
            }
            $this->success("删除成功");
        } else {
            $this->error("删除失败");
        }
    }
    # 分页列出数据
    public function lists()
    {
        if(method_exists($this,'_lists')){
            $this->_lists( $where, $order,  $group);
        }
        $tgtPage = abs(I('get.tgtPage', 1));
        $pageSize = abs(I('get.limit', 10));
        $getAll = I('get.getAll', false);
        # 获取所有
        if ($getAll == "true") {
            $crtData = $this->model->where($where)->order($order)->select();
            $back = $crtData;
        } else {   # 分页获取
            $rowCnt = $this->model->where($where)->count('id');
            $offset =abs (($tgtPage - 1) * $pageSize);
            $crtData = $this->model->where($where)->limit($offset, $pageSize)->order($order)->select();

            $back = new PageBar($tgtPage, $crtData, $rowCnt, '', $_GET, $pageSize);
        }
        if(method_exists($this,'lists_')){
            $this->lists_($back);
        }
        // die;
        $this->assign("lists", $back->data);
        $this->assign("pageBar", $back->pageBar);
        $this->display();
    }
    public function exists($where)
    {
        $data = $this->model->where($where)->find();
        if(!empty($data)){
            return $data;
        } else {
            return false;
        }
    }
    # 记录系统操作日志
    public function eventLog($method, $method_zh, $object)
    {
        $eventLog = M("event_log");
        $data['uid'] = session('uid');
        $data['username'] = session('username');
        $data['group_id'] = session('gp_id');
        $data['group_name'] = session('gp_title');
        $data['date_time'] = date("Y-m-d H:i:s");
        $data['method']  = $method;
        $data['method_zh']  = $method_zh;
        $data['object']  = json_encode($object);
        $data['ip'] = get_client_ip();
        $eventLog->add($data);
    }
}
