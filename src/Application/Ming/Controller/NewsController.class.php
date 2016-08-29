<?php
namespace Ming\Controller;


class NewsController extends BaseController
{
	public function news(){
		$this->set_news();
		$this->display();
	}
	
	public function internet(){
		$this->set_internet_news();
		$this->display();
	}
	
	public function company(){
		$this->set_company_news();
		$this->display();
	}
	
	public function detail(){
		$id = I('id');
		$list = D('News')->where("id=$id")->find();
		\Think\Log::record('list=====++===>'. json_encode($list));
		$list["date"]=date("Y-m-d ", $list["create_time"]);
		$list["content"]=html_out($list["content"]);
		$this->assign('news', $list);
		$this->display('detail');
	}

    public function set_company_news(){
		$list = D('news')->where("type = 'company'")->select();
		\Think\Log::record('list=====+===>'. json_encode($list));
		foreach ($list as $key => $value) {
			$list[$key]["date"]=date("Y-m-d ", $list[$key]["create_time"]);
		}
		
		$this->assign('news', $list);
    }

    public function set_internet_news(){
		$list = D('news')->where("type = 'internet'")->select();
		foreach ($list as $key => $value) {
			$list[$key]["date"]=date("Y-m-d ", $list[$key]["create_time"]);
		}
		$this->assign('news', $list);
    }

    public function set_news(){
		$list = D('news')->where("type = 'news'")->select();
		foreach ($list as $key => $value) {
			$list[$key]["date"]=date("Y-m-d ", $list[$key]["create_time"]);
		}
		$this->assign('news', $list);
    }
}