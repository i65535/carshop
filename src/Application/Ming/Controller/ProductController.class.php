<?php
namespace Ming\Controller;


class ProductController extends BaseController
{
	public function vpc(){
		$this->display();
	}
	
	public function index(){
		$list = D('product')->where("type = 'vm' AND recommend=1")->select();
		$this->assign('list', $list);
		$this->display();
	}
	
	public function vm(){
		$idc = I('idc');
		$idc_info = D('idc')->where("id = $idc")->find();
		$this->assign('idc', $idc_info);
		
		$list = D('product')->where("type = 'vm' AND status=1 AND idc_id = $idc")->order('id asc')->limit('0,4')->select();
		\Think\Log::record('vm list=====+++===>'. json_encode($list));
		$this->assign('list', $list);
		$this->display();
	}
	
	public function host(){
		$sql="SELECT I.zone, P.* from cs_product P right join cs_idc I on I.id=P.idc_id WHERE I.status=1 AND P.status=1 AND P.type='host' AND recommend=1";
    	$list = M()->query($sql);
		$this->assign('list', $list);
		$this->display();
	}

	public function server(){
		$idc = I('idc');
		$idc_info = D('idc')->where("id = $idc")->find();
		$this->assign('idc', $idc_info);
		
		$list = D('product')->where("type = 'host' AND status=1 AND idc_id = $idc")->order('id asc')->limit('0,4')->select();
		\Think\Log::record('server list=====+++===>'. json_encode($list));
		$this->assign('list', $list);
		
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