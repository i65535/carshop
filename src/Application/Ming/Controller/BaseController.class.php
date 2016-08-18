<?php
namespace Ming\Controller;
use Think\Controller;

class BaseController extends Controller {
    
    public function __construct()
    {
    	parent::__construct();
    	$this->set_sales();
    }
    
    public function set_sales(){
    	$list = D('Sales')->limit('0, 12')->select();
    	\Think\Log::record('list========================>'. json_encode($list));
    	$this->assign('sales', $list);
    }
}