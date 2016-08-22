<?php
namespace Admin\Controller;
use Think\Controller;

class ImagesController extends CommonController {
    function __construct(){
        parent::__construct();
        $this->id = 'id';
        $this->name = 'xx_name';
        $this->instance = D('images');
    }

    public function index() {
        $filter = $this->parse_query_condition();
        
        /* 模板赋值 */
        $this->assign('full_page', 1);
        $offset = $this->pageLimit(U('index', $filter['page']), 12);
        $total = $this->get_total_count($filter['where_single']);
        $this->assign('page', $this->pageShow($total));
        
        
        $list = D('Images')->get_images_list($filter, $offset);
        $this->assign('list', $list);
        $this->assign('filter', $filter['filter']);
        $this->assign('ur_here', L('list'));
        $this->assign('action_link1', array('text' => L('add'), 'href' => U('add')));
        $this->display('index');
    }

    function parse_query_condition(){
        /* 过滤条件 */
        $keyword = empty($_REQUEST['keyword']) ? '' : trim($_REQUEST['keyword']);
        if (isset($_REQUEST['is_ajax']) && $_REQUEST['is_ajax'] == 1)
        {
            $keyword = json_str_iconv($keyword);
        }
        $filter['sort_by']      = empty($_REQUEST['sort_by']) ? 'T.id' : trim($_REQUEST['sort_by']);
        $filter['sort_order']   = empty($_REQUEST['sort_order']) ? 'DESC' : trim($_REQUEST['sort_order']);
        $filter['filter'] = array();
        
        $filter['where_single'] = (empty($keyword)) ? '':" goods_name LIKE '%" . mysql_like_quote($keyword) . "%'";
        $filter['where'] = (empty($keyword)) ? '':" T.goods_name LIKE '%" . mysql_like_quote($keyword) . "%'";
        $filter['page'] = array('page'=>'{page}','keyword'=>$keyword);
        return $filter;
    }

    public function edit(){
        $id = intval($_GET['id']);
        if ($id <= 0)
        {
            die('invalid param');
        }
        $detail = $this->instance->find($id);
        $this->assign('info', $detail);

        /* 模板赋值 */
        $this->assign('ur_here', L('list'));
        $this->assign('action_link', array('text' => L('list'), 'href' => U('index')));
        $this->set_album_option($detail['album_id']);
        
        $this->display('edit');
    }
    
    public function add(){
        $info = array(
            'id'  => 0
        );
        $this->assign('info', $info);
        
        /* 模板赋值 */
        $this->assign('ur_here', L('add'));
        $this->set_album_option();
        $this->assign('action_link', array('text' => L('list'), 'href' => U('index')));

        $this->display('add');
    }

    public function insert(){
        $data = I('data');
        
        $info = $this->upload('image_file');
        if($info === FALSE){
        	$this->error(L('upload_images_fail'), U('index'));
        }
        else{
        	$data['path'] = $info['savepath'].$info['savename'];
        	$data['size'] = $info['size'];
        }
        
        $data['create_time'] = time();

        if ($this->add_record($data) !== false)
        {
            // model('Admin')->admin_log($goods_id, 'add', 'images');
        
            // clear_cache_files(); // 清除相关的缓存文件
            $this->success(L('add_success'), U('index'));
        }
        else
        {
            $this->error(L('add_fail'), U('index'));
        }
    }
    
    private function upload($image_name){
//     	$config = array(
//     			'maxSize'    =>    3145728,
//     			'rootPath'   =>    './Uploads/',
//     			'savePath'   =>    '',
//     			'saveName'   =>    array('uniqid',''),
//     			'exts'       =>    array('jpg', 'gif', 'png', 'jpeg'),
//     			'autoSub'    =>    true,
//     			'subName'    =>    array('date','Ymd'),
//     	);
    	
    	$upload = new \Think\Upload();// 实例化上传类
    	$upload->maxSize   =     3145728 ;// 设置附件上传大小
    	$upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
    	$upload->rootPath  =      './Public/Uploads/'; // 设置附件上传根目录
    	// 上传单个文件
    	$info   =   $upload->uploadOne($_FILES[$image_name]);
    	if(!$info) {// 上传错误提示错误信息
    		\Think\Log::record('=====upload========================>'. $upload->getError());
    		
    		return FALSE;
    	}else{// 上传成功 获取上传文件信息
    		\Think\Log::record('=====upload========================>'. json_encode($info));
    		return $info;
    	}
    }
    
    private function get_image_path($id){
    	$data = $this->instance->where("id=$id")->field('path')->find();
    	\Think\Log::record('=====get_image_path=================>'. json_encode($data));
    	return $data['path'];
    }
    
    public function update(){
        $data = I('data');
        $id = $_POST['id'];
        
        if ($_FILES['image_file']['name']) {
        	//得到原先的图片路径 删除
        	$img = $this->get_image_path($id);
        	//排除远程图片
        	if ($img && strpos($img, 'http://') === false && strpos($img, 'https://') === false){
        		$filename = './Public/Uploads/' . $img;
        		@unlink($filename);
        	}
        
        	/* ad_img广告图片 */
        	$info = $this->upload('image_file');
	        if($info === FALSE){
	        	$this->error(L('upload_images_fail'), U('index'));
	        }
	        else{
	        	$data['path'] = $info['savepath'].$info['savename'];
	        	$data['size'] = $info['size'];
	        }
        }
        
        $data['create_time'] = time();
        
        if ($this->update_by_id($data, $id))
        {
            //model('Admin')->admin_log($id, 'edit', 'images');
        
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
        
        $list = D('Images')->get_images_list($filter, $page->firstRow.','.$page->listRows);
        $this->assign('list', $list);
        $this->assign('page', $page->show());   // 分页显示输出

        
        $sort_flag  = sort_flag($filter);
        $this->assign($sort_flag['tag'], $sort_flag['img']);
        
        make_json_result($this->display('images_index', true), '', array('filter' => $filter['page']));
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
                //model('Admin')->admin_log($id,'remove','images');
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
    
	function set_album_option($selected=0){
        $list = D('album')->get_album_name_str();
        $select = '';
        foreach ($list as $key=>$value) {
            $select .= '<option value="' . $value['id'] . '" ';
            $select .= ($selected == $value['id']) ? "selected='true'" : '';
            $select .= '>';
            $select .= $value['album_name_str'] . '</option>';
        }
        $this->assign('album_option', $select);
    }

}