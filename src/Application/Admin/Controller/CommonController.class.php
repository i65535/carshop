<?php
namespace Admin\Controller;
use Think\Controller;
class CommonController extends Controller 
{
	protected $page_size = 50;
	protected $batch_size = 10;
    
    public function __construct(){
        parent::__construct();

        if(!session('id')){
            $this->error('请先登录系统！',U('Login/index'));
        }
        if(MODULE_NAME=='Admin' && CONTROLLER_NAME=='Index'){
        	return true;
        }
        if(MODULE_NAME=='Admin' && CONTROLLER_NAME=='Admin' && ACTION_NAME=='logout'){
        	return true;
        }
        //if(session('privilege')!='*' && !in_array(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME,session('privilege'))){
        	//$this->error('没有权限访问该功能！');
        //}
    }
    
    protected function is_only($field, $value, $id = 0, $where=''){
    	$sql = "$field='$value' ";
    	$sql .= empty($id) ? '' : " AND " . $this->id . " <> '$id'";
    	$sql .= empty($where) ? '' : ' AND ' .$where;
    
    	$count = $this->instance->where($sql)->count();
    	return count==0?true:false;
    }
    
    protected function update_by_id($data, $id){
    	$rlt = $this->instance->data($data)->where(" $this->id='$id'")->update();
    	return $rlt > 0;
    }
    
    protected function drop($id){
    	$rlt = $this->instance->where(" $this->id='$id'")->delete();
    	return $rlt > 0;
    }
    
    protected function get_name($id, $field=''){
    	if (empty($field))
    	{
    		$field = $this->name;
    	}
    	return $this->instance->field($field)->where(" $this->id='$id'")->getOne();
    }
    
    protected function get_record($id){
    	return $this->instance->where(" $this->id='$id'")->find();
    }
    
    protected function add_record($data){
    	return $this->instance->data($data)->insert();
    }
    
    protected function update_record($id,$data,$condition=''){
    	if(empty($condition)){
    		$condition = " $this->id='$id'";
    	}
    	$rlt = $this->instance->data($data)->where($condition)->update();
    	return $rlt > 0;
    }
    
    protected function get_total_count($condition='1=1'){
    	return $this->instance->where($condition)->count();
    }
    
    // 获取分页查询limit
    protected function pageLimit($url, $num = 10) {
    	$url = str_replace(urlencode('{page}'), '{page}', $url);
    	$page = is_object($this->pager ['obj']) ? $this->pager ['obj'] : new \Think\Pager();
    	$cur_page = $page->getCurPage($url);
    	$limit_start = ($cur_page - 1) * $num;
    	$limit = $limit_start . ',' . $num;
    	$this->pager = array(
    			'obj' => $page,
    			'url' => $url,
    			'num' => $num,
    			'cur_page' => $cur_page,
    			'limit' => $limit
    	);
    	return $limit;
    }
    
    // 分页结果显示
    protected function pageShow($count) {
    	return $this->pager ['obj']->show($this->pager ['url'], $count, $this->pager ['num']);
    }
    
    /**
     * 分批取记录
     * @param unknown $amount
     * @return 当前的取记录的条件和下一次调用的参数
     */
    protected function patchShow($amount){
    	$page = isset($_GET['page']) ? $_GET['page'] : 1;
    	$last = isset($_GET['batch_last']) ? $_GET['batch_last'] : 0;
    	$total = isset($_GET['batch_total']) ? $_GET['batch_total'] : 0;
    	 
    	if($last + $amount > $total ){
    		$limit = $total - $last;
    	}
    	else{
    		$limit = $amount;
    	}
    	 
    	$cfg = array('limit'=>$limit,'start'=>$last + ($page -1) * $this->page_size);
    	 
    	 
    	$patch_last = $last + $amount;
    	if($patch_last < $total){
    		$cfg['filter'] = array('batch_last'=>$patch_last, 'batch_total'=>$total,'page'=>$page);
    	}
    	return $cfg;
    }
    
    // 操作成功之后跳转,默认三秒钟跳转
    protected function message($msg, $url = NULL, $type = 'succeed', $waitSecond = 2) {
    	if ($url == NULL)
    		$url = 'javascript:history.back();';
    		if ($type == 'error') {
    			$title = '错误信息';
    		} else {
    			$title = '提示信息';
    		}
    		$data ['title'] = $title;
    		$data ['message'] = $msg;
    		$data ['type'] = $type;
    		$data ['url'] = $url;
    		$data ['second'] = $waitSecond;
    		$this->assign('data', $data);
    		$this->display('message');
    		exit();
    }
    
    // 弹出信息
    protected function alert($msg, $url = NULL, $parent = false) {
    	header("Content-type: text/html; charset=utf-8");
    	$alert_msg = "alert('$msg');";
    	if (empty($url)) {
    		$gourl = 'history.go(-1);';
    	} else {
    		$gourl = ($parent ? 'parent' : 'window') . ".location.href = '{$url}'";
    	}
    	echo "<script>$alert_msg $gourl</script>";
    	exit();
    }










}