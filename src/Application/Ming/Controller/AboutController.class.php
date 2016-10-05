<?php
namespace Ming\Controller;


class AboutController extends BaseController
{
	public function about(){
		$list=D('article')->select();
		$this->assign('title',html_out($list[0][title]));
		$this->assign('content',html_out($list[0][content]));
		\Think\Log::record('====list======>'.html_out($list[0][content]));
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