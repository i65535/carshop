<?php
namespace Ming\Controller;


class ProductController extends BaseController
{
	public function vpc(){
		$this->display();
	}
	
	public function index(){
		$list = D('product')->where("type = 'vm'")->select();
		$this->assign('list', $list);
		$this->display();
	}
	
	public function vm(){
		$this->display();
	}
	
	public function host(){
		$list = D('product')->where("type = 'host'")->select();
		$this->assign('list', $list);
		$this->display();
	}
	
	public function lb(){
		$this->display();
	}
	
	public function ops(){
		$this->display();
	}
	
	public function line(){
		$this->display();
	}
}