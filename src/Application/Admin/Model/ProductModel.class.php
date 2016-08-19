<?php
namespace Admin\Model;
use Think\Model;

/* 访问控制 */
defined('ENTRANCE') or die('Deny Access');

class ProductModel extends Model {
	protected $tableName = 'product';
	protected $trueTableName = '';
	protected $table = '';

	/*
	protected $_validate = array(
		array('username','require','管理员名称不得为空！',1),  // 都有时间都验证
		array('username','','管理员名称不得重复！',1,unique,1), 
		array('username','','管理员名称不得重复！',1,unique,2),
		array('password','require','管理员密码不得为空！',1),
		array('verify','verify','验证码错误！',1,'callback',4),
	);
	*/

	protected $_validate = array(
	
		//array('id', 'require', '{%id_validate}', 2),

		//array('name', 'require', '{%name_validate}', 2),

		//array('type', 'require', '{%type_validate}', 2),

		//array('desc', 'require', '{%desc_validate}', 2),

		//array('region', 'require', '{%region_validate}', 2),

		//array('zone', 'require', '{%zone_validate}', 2),

		//array('location', 'require', '{%location_validate}', 2),

		//array('price_month', 'require', '{%price_month_validate}', 2),

		//array('cpu', 'require', '{%cpu_validate}', 2),

		//array('memory', 'require', '{%memory_validate}', 2),

		//array('disk', 'require', '{%disk_validate}', 2),

		//array('suitable', 'require', '{%suitable_validate}', 2),

		//array('bandwidth', 'require', '{%bandwidth_validate}', 2),

		//array('price_year', 'require', '{%price_year_validate}', 2),

		//array('create_time', 'require', '{%create_time_validate}', 2),

		//array('status', 'require', '{%status_validate}', 2),
	);
	
	public function __construct(){
		parent::__construct();
		$this->trueTableName = $this->tablePrefix . 'product';
		$this->table = $this->tablePrefix . 'product AS T ';
	}
	
	function get_product_list($filter, $offset='0,12'){
		$sql = 'select T.* from ' . $this->table;

		if(!empty($filter['where'])){
			$sql .= ' WHERE ' . $filter['where'];
		}
		if(!empty($filter['sort_by'])){
			$sql .= ' ORDER BY ' . $filter['sort_by'] . ' ' . $filter['sort_order'];
		}
		
		$sql .= " limit $offset";

		$res = $this->query($sql);
		/*
		foreach ($res as $key=>$row){
			$res[$key]['start_time'] = date(C('date_format'), $row['start_time']);
			$res[$key]['end_time']   = date(C('date_format'), $row['end_time']);
		}*/
		return $res;
	}
	
	function product_detail($id){
		$res = $this->query('select * from ' . $this->trueTableName . " where id='$id'");
		if (is_array($res)){
			return $res[0];
		}
		return FALSE;
	}
}