<?php
namespace Admin\Controller;
use Think\Controller;

class CustomersController extends CommonController {
    function __construct(){
        parent::__construct();
        $this->id = 'id';
        $this->name = 'xx_name';
        $this->instance = D('customers');
    }

    public function index() {
        $filter = $this->parse_query_condition();
        
        /* 模板赋值 */
        $this->assign('full_page', 1);
        $offset = $this->pageLimit(U('index', $filter['page']), 12);
        $total = $this->get_total_count($filter['where_single']);
        $this->assign('page', $this->pageShow($total));
        $this->set_category_option(I('search_type'));
        
        $list = D('Customers')->get_customers_list($filter, $offset);
        $this->assign('list', $list);
        $this->assign('filter', $filter['filter']);
        $this->assign('ur_here', L('list'));
        $this->assign('action_link1', array('text' => L('add'), 'href' => U('add')));
        $this->display('index');
    }

    function parse_query_condition(){
        $search_type = I('search_type');

        $filter['sort_by']      = empty($_REQUEST['sort_by']) ? 'T.id' : trim($_REQUEST['sort_by']);
        $filter['sort_order']   = empty($_REQUEST['sort_order']) ? 'DESC' : trim($_REQUEST['sort_order']);
        $filter['filter'] = array();
        
        $filter['where_single'] = (empty($search_type)) ? '':" category='$search_type'";
        $filter['where'] = (empty($search_type)) ? '':" T.category='$search_type'";
        $filter['page'] = array('page'=>'{page}','category'=>$search_type);
        return $filter;
    }

    public function edit(){
        $id = intval($_GET['id']);
        if ($id <= 0)
        {
            die('invalid param');
        }

        $detail = $this->instance->find($id);
        \Think\Log::record('====detail=======>'. json_encode($detail));
        $this->set_category_option($detail['category']);

        $this->assign('info', $detail);
    
        /* 模板赋值 */
        $this->assign('ur_here', L('list'));
        $this->assign('action_link', array('text' => L('list'), 'href' => U('index')));
    
        $this->display('edit');
    }
    
    public function add(){
        $info = array(
            'id'  => 0
        );
        $this->assign('info', $info);
        $this->set_category_option();

        /* 模板赋值 */
        $this->assign('ur_here', L('add'));
        $this->assign('action_link', array('text' => L('list'), 'href' => U('index')));

        $this->display('add');
    }

    public function insert(){
        $data = I('data');
        
        /*检查是否重复*/
        /*
        $goods_id = $_POST['goods_id'];
        $is_only = $this->is_only('goods_id', $goods_id, 0, " goods_id ='$goods_id'");
        if (!$is_only)
        {
            $this->error(L('goods_exist'), U('index'));
        }
        */

        // $data['cat_name']   = sub_str($_POST['cat_name'], 60);

        if ($this->add_record($data) !== false)
        {
            // model('Admin')->admin_log($goods_id, 'add', 'customers');
        
            // clear_cache_files(); // 清除相关的缓存文件
            $this->success(L('add_success'), U('index'));
        }
        else
        {
            $this->error(L('add_fail'), U('index'));
        }
    }
    
    public function update(){
        $data = I('data');
        $id = $_POST['id'];
        
        if ($this->update_by_id($data, $id))
        {
            //model('Admin')->admin_log($id, 'edit', 'customers');
        
            // clear_cache_files();
            $this->success(L('edit_succee'), U('index'));
        }
        else
        {
            $this->error(L('edit_fail'), U('index'));
        }
    }

    public function del(){
        $id=I('id');

        if($this->instance->delete($id)){
            $this->success(L('delete_succee'), U('Index'));
        }else{
            $this->error(L('delete_fail'), U('index'));
        }
    }
    
    function query(){
        $filter = $this->parse_query_condition();
        
        /* 模板赋值 */
        $total = $this->get_total_count($filter['where_single']);
        $page = new \Think\Page($total,15);// 实例化分页类 传入总记录数和每页显示的记录数(15)
        
        $list = D('Customers')->get_customers_list($filter, $page->firstRow.','.$page->listRows);
        $this->assign('list', $list);
        $this->assign('page', $page->show());   // 分页显示输出

        
        $sort_flag  = sort_flag($filter);
        $this->assign($sort_flag['tag'], $sort_flag['img']);
        
        make_json_result($this->display('customers_index', true), '', array('filter' => $filter['page']));
    }

    public function operate(){
        $act = I('act');
        $id = intval(I('id', 0));
        

        if ('query' == $act){
            return $this->query();        
        }
        elseif('remove' == $act){            
            if ($this->drop($id))
            {
                //model('Admin')->admin_log($id,'remove','customers');
                clear_cache_files();
            }
            return $this->query();
        }
        elseif('toggle_hot' == $act){
            $val    = intval($_POST['val']);
        
            $this->update_by_id("is_hot = '$val'", $id);
            clear_cache_files();
        
            make_json_result($val);
        }
        elseif('edit_total_num' == $act){
            $val = intval($_POST['val']);
            
            $this->update_by_id(array('total_num'=>$val), $id);
            
            clear_cache_files();
            
            make_json_result($val);
        }
    }
    
    function set_xxxx_option($selected=0){
        $list = model('xxxx')->get_xxxx_name_list();
        // $list = L('xxxx');
        $select = '';
        foreach ($list as $key=>$value) {
            $select .= '<option value="' . $key . '" ';
            $select .= ($selected == $key) ? "selected='true'" : '';
            $select .= '>';
            $select .= $value . '</option>';
        }
        $this->assign('xxxx_option', $select);
    }

    function set_category_option($selected=''){
        $list = L('category_list');
        $select = '';
        foreach ($list as $key=>$value) {
            $select .= '<option value="' . $key . '" ';
            $select .= ($selected === $key) ? "selected='true'" : '';
            $select .= '>';
            $select .= $value . '</option>';
        }
        $this->assign('category_option', $select);
    }
}