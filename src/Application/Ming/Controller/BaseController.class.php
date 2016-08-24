<?php
namespace Ming\Controller;
use Think\Controller;

class BaseController extends Controller {
    
    public function __construct()
    {
    	parent::__construct();
    	$this->set_sales();
        $this->set_banner();
        $this->set_nav();
    }
    
    public function set_sales(){
    	$list = D('Sales')->limit('0, 12')->select();
    	$this->assign('sales', $list);
    }

    public function set_banner(){
        $sql="SELECT A.*, I.* from cs_album A left join cs_images I on I.album_id=A.id WHERE A.album_name='BannerAD'";
        $data=M()->query($sql);
        $this->assign('data', $data);
    }
    
    public function set_nav(){
    	$m = M();
    	
    	$sql="SELECT * from cs_idc WHERE is_hot=1 AND status=1";
    	$hot_idc_list = $m->query($sql);
    	$this->assign('hot_idc_list', $hot_idc_list);
    	
    	$sql = "SELECT region from cs_idc WHERE status=1 GROUP BY region limit 0, 2";
    	$idc_list = $m->query($sql);
    	foreach ($idc_list as $key=>$idc){
    		$idc_list[$key]['zone_list'] = $this->query_zone_list($idc['region']);
    	}
    	
    	//\Think\Log::record('===============idc_list=======>'. json_encode($idc_list));
    	$this->assign('idc_list', $idc_list);
    	
    	$sql="SELECT I.* from cs_product P left join cs_idc I on I.id=P.idc_id WHERE I.status=1 AND P.status=1 AND P.type='host'";
    	$host_list = $m->query($sql);
    	$this->assign('host_list', $host_list);
    	
    }
    
    function query_zone_list($region){
    	$sql="SELECT * FROM cs_idc WHERE region='$region' AND status=1";
    	return M()->query($sql);
    }
}