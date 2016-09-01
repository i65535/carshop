<?php
namespace Ming\Controller;


class AboutController extends BaseController
{
	public function about(){
		$this->display();
	}
	
	public function contact(){
		$this->display();
	}
	
	public function customers(){
		$list = D('customers')->select();
    	$this->assign('list', $list);
		$this->display();
	}
	
}