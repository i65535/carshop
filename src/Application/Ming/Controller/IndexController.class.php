<?php
namespace Ming\Controller;

class IndexController extends BaseController {
	
	public function __construct()
	{
		parent::__construct();
	}
	
    public function index(){
    	$company_news = array();
    	$internet_news = array();
    	$news = array();
    	$this->assign('company_news', $company_news);
    	$this->assign('internet_news', $list);
    	$this->assign('news', $list);
        $this->display();
    }
}