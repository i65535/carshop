<?php
namespace Admin\Model;
use Think\Model;

/* 访问控制 */
defined('ENTRANCE') or die('Deny Access');

class ImagesModel extends Model {
	protected $tableName = 'images';
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

		//array('album_id', 'require', '{%album_id_validate}', 2),

		//array('title', 'require', '{%title_validate}', 2),

		//array('desc', 'require', '{%desc_validate}', 2),

		//array('path', 'require', '{%path_validate}', 2),

		//array('size', 'require', '{%size_validate}', 2),

		//array('create_time', 'require', '{%create_time_validate}', 2),
	);
	
	public function __construct(){
		parent::__construct();
		$this->trueTableName = $this->tablePrefix . 'images';
		$this->table = $this->tablePrefix . 'images AS T ';
	}
	
	function get_images_list($filter, $offset='0,12'){
		$sql = 'select T.*, a.album_name from ' . $this->table . 'left join __PREFIX__album a on a.id=T.album_id';

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
	
	function images_detail($id){
		$res = $this->query('select * from ' . $this->trueTableName . " where id='$id'");
		if (is_array($res)){
			return $res[0];
		}
		return FALSE;
	}
}