<?php
namespace Ming\Controller;
use Think\Controller;


class NewsController extends Controller
{
	public function news(){
		$this->display();
	}
	
	public function internet(){
		$this->display();
	}
	
	public function company(){
		$this->display();
	}
	
}