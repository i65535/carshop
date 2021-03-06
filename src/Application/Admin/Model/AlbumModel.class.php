<?php
namespace Admin\Model;
use Think\Model;

/* 访问控制 */
defined('ENTRANCE') or die('Deny Access');

class AlbumModel extends Model {
	protected $tableName = 'album';
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
	
		//array('album_id', 'require', '{%album_id_validate}', 2),

		//array('album_name', 'require', '{%album_name_validate}', 2),

		//array('image_width', 'require', '{%image_width_validate}', 2),

		//array('image_height', 'require', '{%image_height_validate}', 2),

		//array('album_desc', 'require', '{%album_desc_validate}', 2),
	);
	
	public function __construct(){
		parent::__construct();
		$this->trueTableName = $this->tablePrefix . 'album';
		$this->table = $this->tablePrefix . 'album AS T ';
	}
	
	function get_album_list($filter, $offset='0,12'){
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
	
	function album_detail($id){
		$res = $this->query('select * from ' . $this->trueTableName . " where album_id='$id'");
		if (is_array($res)){
			return $res[0];
		}
		return FALSE;
	}
	
	/**
	 * 获取组合式广告位名称
	 * @return [type]   首页banner [ 200x100 ]
	 */
	function get_album_name_str(){
	
		$list = $this->order('id asc')->field('id,album_name,image_width,image_height')->select();
		$album_name_arr = array();
		foreach ($list as $key => $value) {
			$album_name_arr[$key]['id'] = $value['id'];
			$album_name_arr[$key]['album_name_str'] = $value['album_name'] . ' [ ' . $value['image_width'] . ' x ' . $value['image_height'] . ' ] ';
		}
		return $album_name_arr;
	}
}