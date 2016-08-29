<?php
namespace Ming\Controller;


class NewsController extends BaseController
{

	public function __construct(){
        parent::__construct();
        $this->instance = D('News');
    }

	public function news(){

		$offset = $this->pageLimit(U('news', array('page'=>'{page}','category'=>'news')), 5);
        $total = $this->get_total_count("category='news'");
        $this->assign('page', $this->pageShow($total));

        $list = $this->instance->where("category='news'")->order('id desc')->limit($offset)->select();
        foreach ($list as $key => $value) {
			$list[$key]["date"]=date("Y-m-d ", $list[$key]["create_time"]);
		}

        $this->assign('news', $list);

		$this->display();
	}
	
	public function internet(){
		$offset = $this->pageLimit(U('internet', array('page'=>'{page}','category'=>'internet')), 5);
        $total = $this->get_total_count("category='internet'");
        $this->assign('page', $this->pageShow($total));

        $list = $this->instance->where("category='internet'")->order('id desc')->limit($offset)->select();
        foreach ($list as $key => $value) {
			$list[$key]["date"]=date("Y-m-d ", $list[$key]["create_time"]);
		}

        $this->assign('news', $list);

		$this->display();
	}
	
	public function company(){
		$offset = $this->pageLimit(U('company', array('page'=>'{page}','category'=>'company')), 2);
        $total = $this->get_total_count("category='company'");
        $this->assign('page', $this->pageShow($total));

        $list = $this->instance->where("category='company'")->order('id desc')->limit($offset)->select();
        foreach ($list as $key => $value) {
			$list[$key]["date"]=date("Y-m-d ", $list[$key]["create_time"]);
		}

        $this->assign('news', $list);

		$this->display();
	}
	
	public function detail(){
		$id = I('id');
		$current = $this->instance->where("id=$id")->find();
		$current["create_time"]=date("Y-m-d ", $current["create_time"]);
		$current["content"]=html_out($current["content"]);
		$this->assign('news', $current);

		$pre = $this->instance->where("id<$id")->field('id, title')->order('id desc')->limit('0,1')->find();
		$this->assign('pre', $pre);

		$next = $this->instance->where("id>$id")->field('id, title')->order('id asc')->limit('0,1')->find();
		$this->assign('next', $next);

		$this->display('detail');
	}

    protected function get_total_count($condition='1=1'){
    	return $this->instance->where($condition)->count();
    }
    
    // 获取分页查询limit
    protected function pageLimit($url, $num = 10) {
    	$url = str_replace(urlencode('{page}'), '{page}', $url);
    	$page = is_object($this->pager ['obj']) ? $this->pager ['obj'] : new \Think\Pager();
    	$cur_page = $page->getCurPage($url);
    	$limit_start = ($cur_page - 1) * $num;
    	$limit = $limit_start . ',' . $num;
    	$this->pager = array(
    			'obj' => $page,
    			'url' => $url,
    			'num' => $num,
    			'cur_page' => $cur_page,
    			'limit' => $limit
    	);
    	return $limit;
    }
    
    // 分页结果显示
    protected function pageShow($count) {
    	return $this->pager ['obj']->show($this->pager ['url'], $count, $this->pager ['num']);
    }
}