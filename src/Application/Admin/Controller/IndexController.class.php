<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends CommonController {
    public function index(){
    	$this->assign('datetime', date('Y-m-d H:i:s'));
        $this->display();
    }
}