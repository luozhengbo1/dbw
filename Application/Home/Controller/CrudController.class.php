<?php
/*
 +----------------------------------------
 |对数据进行CRUD的基本类，主要适用于单表
 +----------------------------------------
 |Auth:九九一十八<761297884@qq.com>
 +----------------------------------------
 |version:1.0
 +----------------------------------------
 |main:对单表进行增删改查.提供了许多钩子
 +----------------------------------------
*/
namespace Home\Controller;

use Org\Util\PageBar;
use Think\Controller;

class CrudController extends Controller
{
    private $model;
    public function _initialize()
    {
      /*  foreach ($_POST as &$p) {
            $p = str_replace(" ","", $p);
        }
        foreach ($_GET as &$g) {
            $p = str_replace(" ","", $g);
        }*/
        $this->model = M(CONTROLLER_NAME);
        if (empty(session("uid"))) {
            redirect(U('Index/index'));
        }
       /* $auth=new \Think\Auth();
        if(!$auth->check(CONTROLLER_NAME.'/'.ACTION_NAME,session('uid'))){
            if(stristr(ACTION_NAME,'del')){

                $result['code'] = 2;
                $result['msg'] = '您无此权限！';
                $this->ajaxReturn($result,"JSON");
                return;
            }else{

                $this->error('对不起,您无此权限！');

            }
        }*/
    }
    # 新增数据
    public function add()
    {
        # add数据前准备相关联的数据
        if(method_exists($this,"_add")) {
            $this->_add();
        }
        if(IS_POST) {
            # 数据进入数据库之前，数据的合法性，数据的处理
            if(method_exists($this,"_enterDB")) {
                $this->_enterDB();
            }
            # 保存到数据库
            $addId = $this->model->add($_POST);
            if($addId){
                # 数据新增成功后要进行的操作，例如记录操作日志等
                if(method_exists($this,"add_")) {
                    $this->add_($addId);
                }
                $this->success('新增成功', U(CONTROLLER_NAME."/lists"), 2);
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
            $this->_edit();
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
        $id = $_REQUEST['id'];
        $where = array('id' => $id);
        if(method_exists($this,"_del")) {
            $this->_del($id);
        }
        $deleteResult = $this->model->where($where)->delete();
        if  ($deleteResult) {
            $this->success("删除成功");
        } else {
            $this->error("删除失败");
        }
    }
    # 分页列出数据
    public function lists()
    {
        # 列出数据前进行的操作，比如增加筛选条件，排序，分组等
        $where = array();
        $order = array();
        $group = array();
        if(method_exists($this,'_lists')){
            $this->_lists( $where, $order,  $group);
        }

        # 获取数据
        $tgtPage = abs(I('get.tgtPage', 1)); # 目标页码 targetPage
        $pageSize = abs(I('get.limit', 10)); # 每页显示几条数据
        $getAll = I('get.getAll', false);
        if ($getAll == "true") { # 不分页获取数据
            $crtData = $this->model->where($where)->order($order)->select();
            $back = $crtData;
        } else { # 分页获取
            $rowCnt = $this->model->where($where)->count('id'); # 记录总数
            $offset =abs (($tgtPage - 1) * $pageSize); # 计算偏移
            $crtData = $this->model->where($where)->limit($offset, $pageSize)->order($order)->select();
            # pageBar的各个参数请参看Org\Util\PageBar.php
            $back = new PageBar($tgtPage, $crtData, $rowCnt, '', $_GET, $pageSize);
        }

        # 列出数据后进行的操作，一般用于获取关联 id2name
        if(method_exists($this,'lists_')){
            $this->lists_($back);
        }

        # 分配查询出来的数据，名称固定为lists
        $this->assign("lists", $back->data);
        # 分配导航条
        $this->assign("pageBar", $back->pageBar);
        $this->display();
    }

    # 判断指定条件下的记录是否存在，如果存在则返回存在的记录，否则返回false
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
