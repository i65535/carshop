<?php
namespace Ming\Controller;
use Think\Controller;

class BaseController extends Controller {
    
    public function __construct()
    {
    	parent::__construct();
    	$this->set_sales();
        $this->set_banner();
    }
    
    public function set_sales(){
    	$list = D('Sales')->limit('0, 12')->select();
    	\Think\Log::record('list=======>'. json_encode($list));
    	$this->assign('sales', $list);
    }

    public function set_banner(){
        $sql="SELECT A.*, I.* from cs_album A left join cs_images I on I.album_id=A.id WHERE A.album_name='BannerAD'";;
        $album=D('album');
        $data=$album->query($sql);
        \Think\Log::record('lis=======>'. json_encode($data));
        $this->assign('data', $data);
    }
}