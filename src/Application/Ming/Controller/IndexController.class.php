<?php
namespace Ming\Controller;

class IndexController extends BaseController {
	
	public function __construct()
	{
		parent::__construct();
	}
	
    public function index(){
    	$newsmgr = D('news');
		$internet_news= $newsmgr->where("type = 'internet'")->order('id desc')->limit(0,3)->select();
    	foreach ($internet_news as $key => $value) {
    		$internet_news[$key]["date"]=date("m-d ", $list[$key]["date"]);
    	}
    	
    	$company_news= $newsmgr->where("type = 'company'")->order('id desc')->limit(0,3)->select();
    	foreach ($company_news as $key => $value) {
    		$company_news[$key]["date"]=date("m-d ", $list[$key]["date"]);
    	}
    	
    	$news= $newsmgr->where("type = 'news'")->order('id desc')->limit(0,3)->select();
    	foreach ($news as $key => $value) {
    		$news[$key]["date"]=date("m-d ", $list[$key]["date"]);
    	}

    	$this->assign('company_news', $company_news);
    	$this->assign('internet_news', $internet_news);
    	$this->assign('news', $news);
        $this->display();
    }
}