<?php


/**
 * 返回字符集列表数组
 *
 * @access public
 * @param
 *
 * @return void
 */
function get_charset_list()
{
	return array(
			'UTF8' => 'UTF-8',
			'GB2312' => 'GB2312/GBK',
			'BIG5' => 'BIG5'
	);
}

/**
 * 创建一个JSON格式的数据
 *
 * @access public
 * @param string $content
 * @param integer $error
 * @param string $message
 * @param array $append
 * @return void
 */
function make_json_response($content = '', $error = "0", $message = '', $append = array())
{
	$res = array(
			'error' => $error,
			'message' => $message,
			'content' => $content
	);

	if (! empty($append)) {
		foreach ($append as $key => $val) {
			$res[$key] = $val;
		}
	}

	$val = json_encode($res);

	exit($val);
}

/**
 *
 * @access public
 * @param
 *
 * @return void
 */
function make_json_result($content, $message = '', $append = array())
{
	make_json_response($content, 0, $message, $append);
}

/**
 * 创建一个JSON格式的错误信息
 *
 * @access public
 * @param string $msg
 * @return void
 */
function make_json_error($msg)
{
	make_json_response('', 1, $msg);
}

/**
 * 系统提示信息
 *
 * @access public
 * @param
 *            string msg_detail 消息内容
 * @param
 *            int msg_type 消息类型， 0消息，1错误，2询问
 * @param
 *            array links 可选的链接
 * @param boolen $auto_redirect
 *            是否需要自动跳转
 * @return void
 */
function sys_msg($msg_detail, $msg_type = 0, $links = array(), $auto_redirect = true)
{
	if (count($links) == 0) {
		$links[0]['text'] = L('go_back');
		$links[0]['href'] = 'javascript:history.go(-1)';
	}

	$this->assign('ur_here', L('system_message'));
	$this->assign('msg_detail', $msg_detail);
	$this->assign('msg_type', $msg_type);
	$this->assign('links', $links);
	$this->assign('default_url', $links[0]['href']);
	$this->assign('auto_redirect', $auto_redirect);

	$this->display('message.htm');

	exit();
}


/**
 * 获得当前格林威治时间的时间戳
 *
 * @return  integer
 */
function gmtime() {
	return (time() - date('Z'));
}

/**
 * 获得服务器的时区
 *
 * @return  integer
 */
function server_timezone() {
	if (function_exists('date_default_timezone_get')) {
		return date_default_timezone_get();
	} else {
		return date('Z') / 3600;
	}
}

/**
 *  生成一个用户自定义时区日期的GMT时间戳
 *
 * @access  public
 * @param   int     $hour
 * @param   int     $minute
 * @param   int     $second
 * @param   int     $month
 * @param   int     $day
 * @param   int     $year
 *
 * @return void
 */
function local_mktime($hour = NULL, $minute = NULL, $second = NULL, $month = NULL, $day = NULL, $year = NULL) {
	$timezone = isset($_SESSION['timezone']) ? $_SESSION['timezone'] : C('timezone');

	/**
	 * $time = mktime($hour, $minute, $second, $month, $day, $year) - date('Z') + (date('Z') - $timezone * 3600)
	 * 先用mktime生成时间戳，再减去date('Z')转换为GMT时间，然后修正为用户自定义时间。以下是化简后结果
	 */
	$time = mktime($hour, $minute, $second, $month, $day, $year) - $timezone * 3600;

	return $time;
}

/**
 * 将GMT时间戳格式化为用户自定义时区日期
 *
 * @param  string       $format
 * @param  integer      $time       该参数必须是一个GMT的时间戳
 *
 * @return  string
 */
function local_date($format, $time = NULL) {
	$timezone = isset($_SESSION['timezone']) ? $_SESSION['timezone'] : C('timezone');

	if ($time === NULL) {
		$time = gmtime();
	} elseif ($time <= 0) {
		return '';
	}

	$time += ($timezone * 3600);

	return date($format, $time);
}

/**
 * 转换字符串形式的时间表达式为GMT时间戳
 *
 * @param   string  $str
 *
 * @return  integer
 */
function gmstr2time($str) {
	$time = strtotime($str);

	if ($time > 0) {
		$time -= date('Z');
	}

	return $time;
}

/**
 *  将一个用户自定义时区的日期转为GMT时间戳
 *
 * @access  public
 * @param   string      $str
 *
 * @return  integer
 */
function local_strtotime($str) {
	$timezone = isset($_SESSION['timezone']) ? $_SESSION['timezone'] : C('timezone');

	/**
	 * $time = mktime($hour, $minute, $second, $month, $day, $year) - date('Z') + (date('Z') - $timezone * 3600)
	 * 先用mktime生成时间戳，再减去date('Z')转换为GMT时间，然后修正为用户自定义时间。以下是化简后结果
	 * */
	$time = strtotime($str) - $timezone * 3600;

	return $time;
}

/**
 * 获得用户所在时区指定的时间戳
 *
 * @param   $timestamp  integer     该时间戳必须是一个服务器本地的时间戳
 *
 * @return  array
 */
function local_gettime($timestamp = NULL) {
	$tmp = local_getdate($timestamp);
	return $tmp[0];
}

/**
 * 获得用户所在时区指定的日期和时间信息
 *
 * @param   $timestamp  integer     该时间戳必须是一个服务器本地的时间戳
 *
 * @return  array
 */
function local_getdate($timestamp = NULL) {
	$timezone = isset($_SESSION['timezone']) ? $_SESSION['timezone'] : C('timezone');

	/* 如果时间戳为空，则获得服务器的当前时间 */
	if ($timestamp === NULL) {
		$timestamp = time();
	}

	$gmt = $timestamp - date('Z');       // 得到该时间的格林威治时间
	$local_time = $gmt + ($timezone * 3600);    // 转换为用户所在时区的时间戳

	return getdate($local_time);
}

/* * ********************************************************
 * 基础函数库
 * ******************************************************** */

/**
 * 截取UTF-8编码下字符串的函数
 *
 * @param   string      $str        被截取的字符串
 * @param   int         $length     截取的长度
 * @param   bool        $append     是否附加省略号
 *
 * @return  string
 */
function sub_str($str, $length = 0, $append = true) {
	$str = trim($str);
	$strlength = strlen($str);

	if ($length == 0 || $length >= $strlength) {
		return $str;
	} elseif ($length < 0) {
		$length = $strlength + $length;
		if ($length < 0) {
			$length = $strlength;
		}
	}

	if (function_exists('mb_substr')) {
		$newstr = mb_substr($str, 0, $length, EC_CHARSET);
	} elseif (function_exists('iconv_substr')) {
		$newstr = iconv_substr($str, 0, $length, EC_CHARSET);
	} else {
		//$newstr = trim_right(substr($str, 0, $length));
		$newstr = substr($str, 0, $length);
	}

	if ($append && $str != $newstr) {
		$newstr .= '...';
	}

	return $newstr;
}

/**
 * 获得用户的真实IP地址
 *
 * @access  public
 * @return  string
 */
function real_ip() {
	static $realip = NULL;

	if ($realip !== NULL) {
		return $realip;
	}

	if (isset($_SERVER)) {
		if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			$arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);

			/* 取X-Forwarded-For中第一个非unknown的有效IP字符串 */
			foreach ($arr AS $ip) {
				$ip = trim($ip);

				if ($ip != 'unknown') {
					$realip = $ip;

					break;
				}
			}
		} elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
			$realip = $_SERVER['HTTP_CLIENT_IP'];
		} else {
			if (isset($_SERVER['REMOTE_ADDR'])) {
				$realip = $_SERVER['REMOTE_ADDR'];
			} else {
				$realip = '0.0.0.0';
			}
		}
	} else {
		if (getenv('HTTP_X_FORWARDED_FOR')) {
			$realip = getenv('HTTP_X_FORWARDED_FOR');
		} elseif (getenv('HTTP_CLIENT_IP')) {
			$realip = getenv('HTTP_CLIENT_IP');
		} else {
			$realip = getenv('REMOTE_ADDR');
		}
	}

	preg_match("/[\d\.]{7,15}/", $realip, $onlineip);
	$realip = !empty($onlineip[0]) ? $onlineip[0] : '0.0.0.0';

	return $realip;
}

/**
 * 计算字符串的长度（汉字按照两个字符计算）
 *
 * @param   string      $str        字符串
 *
 * @return  int
 */
function str_len($str) {
	$length = strlen(preg_replace('/[\x00-\x7F]/', '', $str));

	if ($length) {
		return strlen($str) - $length + intval($length / 3) * 2;
	} else {
		return strlen($str);
	}
}

/**
 * 获得用户操作系统的换行符
 *
 * @access  public
 * @return  string
 */
function get_crlf() {
	/* LF (Line Feed, 0x0A, \N) 和 CR(Carriage Return, 0x0D, \R) */
	if (stristr($_SERVER['HTTP_USER_AGENT'], 'Win')) {
		$the_crlf = '\r\n';
	} elseif (stristr($_SERVER['HTTP_USER_AGENT'], 'Mac')) {
		$the_crlf = '\r'; // for old MAC OS
	} else {
		$the_crlf = '\n';
	}

	return $the_crlf;
}

/**
 * 邮件发送
 *
 * @param: $name[string]        接收人姓名
 * @param: $email[string]       接收人邮件地址
 * @param: $subject[string]     邮件标题
 * @param: $content[string]     邮件内容
 * @param: $type[int]           0 普通邮件， 1 HTML邮件
 * @param: $notification[bool]  true 要求回执， false 不用回执
 *
 * @return boolean
 */
function send_mail($name, $email, $subject, $content, $type = 0, $notification = false) {
	/* 如果邮件编码不是EC_CHARSET，创建字符集转换对象，转换编码 */
	if (C('mail_charset') != EC_CHARSET) {
		$name = ecs_iconv(EC_CHARSET, C('mail_charset'), $name);
		$subject = ecs_iconv(EC_CHARSET, C('mail_charset'), $subject);
		$content = ecs_iconv(EC_CHARSET, C('mail_charset'), $content);
		$shop_name = ecs_iconv(EC_CHARSET, C('mail_charset'), C('shop_name'));
	}
	$charset = C('mail_charset');
	/**
	 * 使用mail函数发送邮件
	 */
	if (C('mail_service') == 0 && function_exists('mail')) {
		/* 邮件的头部信息 */
		$content_type = ($type == 0) ? 'Content-Type: text/plain; charset=' . $charset : 'Content-Type: text/html; charset=' . $charset;
		$headers = array();
		$headers[] = 'From: "' . '=?' . $charset . '?B?' . base64_encode($shop_name) . '?=' . '" <' . C('smtp_mail') . '>';
		$headers[] = $content_type . '; format=flowed';
		if ($notification) {
			$headers[] = 'Disposition-Notification-To: ' . '=?' . $charset . '?B?' . base64_encode($shop_name) . '?=' . '" <' . C('smtp_mail') . '>';
		}

		$res = @mail($email, '=?' . $charset . '?B?' . base64_encode($subject) . '?=', $content, implode("\r\n", $headers));

		if (!$res) {
			ECTouch::err()->add(L('sendemail_false'));

			return false;
		} else {
			return true;
		}
	}
	/**
	 * 使用smtp服务发送邮件
	 */ else {
	 /* 邮件的头部信息 */
	$content_type = ($type == 0) ?
	'Content-Type: text/plain; charset=' . $charset : 'Content-Type: text/html; charset=' . $charset;
	$content = base64_encode($content);

	$headers = array();
	$headers[] = 'Date: ' . gmdate('D, j M Y H:i:s') . ' +0000';
	$headers[] = 'To: "' . '=?' . $charset . '?B?' . base64_encode($name) . '?=' . '" <' . $email . '>';
	$headers[] = 'From: "' . '=?' . $charset . '?B?' . base64_encode($shop_name) . '?=' . '" <' . C('smtp_mail') . '>';
	$headers[] = 'Subject: ' . '=?' . $charset . '?B?' . base64_encode($subject) . '?=';
	$headers[] = $content_type . '; format=flowed';
	$headers[] = 'Content-Transfer-Encoding: base64';
	$headers[] = 'Content-Disposition: inline';
	if ($notification) {
		$headers[] = 'Disposition-Notification-To: ' . '=?' . $charset . '?B?' . base64_encode($shop_name) . '?=' . '" <' . C('smtp_mail') . '>';
	}

	/* 获得邮件服务器的参数设置 */
	$params['host'] = C('smtp_host');
	$params['port'] = C('smtp_port');
	$params['user'] = C('smtp_user');
	$params['pass'] = C('smtp_pass');

	if (empty($params['host']) || empty($params['port'])) {
		// 如果没有设置主机和端口直接返回 false
		ECTouch::err()->add(L('smtp_setting_error'));

		return false;
	} else {
		// 发送邮件
		if (!function_exists('fsockopen')) {
			//如果fsockopen被禁用，直接返回
			ECTouch::err()->add(L('disabled_fsockopen'));

			return false;
		}

		static $smtp;

		$send_params['recipients'] = $email;
		$send_params['headers'] = $headers;
		$send_params['from'] = C('smtp_mail');
		$send_params['body'] = $content;

		if (!isset($smtp)) {
			$smtp = new EcsSmtp($params);
		}

		if ($smtp->connect() && $smtp->send($send_params)) {
			return true;
		} else {
			$err_msg = $smtp->error_msg();
			if (empty($err_msg)) {
				ECTouch::err()->add('Unknown Error');
			} else {
				if (strpos($err_msg, 'Failed to connect to server') !== false) {
					ECTouch::err()->add(sprintf(L('smtp_connect_failure'), $params['host'] . ':' . $params['port']));
				} else if (strpos($err_msg, 'AUTH command failed') !== false) {
					ECTouch::err()->add(L('smtp_login_failure'));
				} elseif (strpos($err_msg, 'bad sequence of commands') !== false) {
					ECTouch::err()->add(L('smtp_refuse'));
				} else {
					ECTouch::err()->add($err_msg);
				}
			}

			return false;
		}
	}
	}
}

/**
 * 获得服务器上的 GD 版本
 *
 * @access      public
 * @return      int         可能的值为0，1，2
 */
function gd_version() {
	return EcsImage::gd_version();
}

/**
 * 文件或目录权限检查函数
 *
 * @access          public
 * @param           string  $file_path   文件路径
 * @param           bool    $rename_prv  是否在检查修改权限时检查执行rename()函数的权限
 *
 * @return          int     返回值的取值范围为{0 <= x <= 15}，每个值表示的含义可由四位二进制数组合推出。
 *                          返回值在二进制计数法中，四位由高到低分别代表
 *                          可执行rename()函数权限、可对文件追加内容权限、可写入文件权限、可读取文件权限。
 */
function file_mode_info($file_path) {
	/* 如果不存在，则不可读、不可写、不可改 */
	if (!file_exists($file_path)) {
		return false;
	}

	$mark = 0;

	if (strtoupper(substr(PHP_OS, 0, 3)) == 'WIN') {
		/* 测试文件 */
		$test_file = $file_path . '/cf_test.txt';

		/* 如果是目录 */
		if (is_dir($file_path)) {
			/* 检查目录是否可读 */
			$dir = @opendir($file_path);
			if ($dir === false) {
				return $mark; //如果目录打开失败，直接返回目录不可修改、不可写、不可读
			}
			if (@readdir($dir) !== false) {
				$mark ^= 1; //目录可读 001，目录不可读 000
			}
			@closedir($dir);

			/* 检查目录是否可写 */
			$fp = @fopen($test_file, 'wb');
			if ($fp === false) {
				return $mark; //如果目录中的文件创建失败，返回不可写。
			}
			if (@fwrite($fp, 'directory access testing.') !== false) {
				$mark ^= 2; //目录可写可读011，目录可写不可读 010
			}
			@fclose($fp);

			@unlink($test_file);

			/* 检查目录是否可修改 */
			$fp = @fopen($test_file, 'ab+');
			if ($fp === false) {
				return $mark;
			}
			if (@fwrite($fp, "modify test.\r\n") !== false) {
				$mark ^= 4;
			}
			@fclose($fp);

			/* 检查目录下是否有执行rename()函数的权限 */
			if (@rename($test_file, $test_file) !== false) {
				$mark ^= 8;
			}
			@unlink($test_file);
		}
		/* 如果是文件 */ elseif (is_file($file_path)) {
		/* 以读方式打开 */
		$fp = @fopen($file_path, 'rb');
		if ($fp) {
			$mark ^= 1; //可读 001
		}
		@fclose($fp);

		/* 试着修改文件 */
		$fp = @fopen($file_path, 'ab+');
		if ($fp && @fwrite($fp, '') !== false) {
			$mark ^= 6; //可修改可写可读 111，不可修改可写可读011...
		}
		@fclose($fp);

		/* 检查目录下是否有执行rename()函数的权限 */
		if (@rename($test_file, $test_file) !== false) {
			$mark ^= 8;
		}
		}
	} else {
		if (@is_readable($file_path)) {
			$mark ^= 1;
		}

		if (@is_writable($file_path)) {
			$mark ^= 14;
		}
	}

	return $mark;
}

function log_write($arg, $file = '', $line = '') {
	if ((DEBUG_MODE & 4) != 4) {
		return;
	}

	$str = "\r\n-- " . date('Y-m-d H:i:s') . " --------------------------------------------------------------\r\n";
	$str .= "FILE: $file\r\nLINE: $line\r\n";

	if (is_array($arg)) {
		$str .= '$arg = array(';
		foreach ($arg AS $val) {
			foreach ($val AS $key => $list) {
				$str .= "'$key' => '$list'\r\n";
			}
		}
		$str .= ")\r\n";
	} else {
		$str .= $arg;
	}

	file_put_contents(ROOT_PATH . DATA_DIR . '/log.txt', $str);
}

/**
 * 检查目标文件夹是否存在，如果不存在则自动创建该目录
 *
 * @access      public
 * @param       string      folder     目录路径。不能使用相对于网站根目录的URL
 *
 * @return      bool
 */
function make_dir($folder) {
	$reval = false;

	if (!file_exists($folder)) {
		/* 如果目录不存在则尝试创建该目录 */
		@umask(0);

		/* 将目录路径拆分成数组 */
		preg_match_all('/([^\/]*)\/?/i', $folder, $atmp);

		/* 如果第一个字符为/则当作物理路径处理 */
		$base = ($atmp[0][0] == '/') ? '/' : '';

		/* 遍历包含路径信息的数组 */
		foreach ($atmp[1] AS $val) {
			if ('' != $val) {
				$base .= $val;

				if ('..' == $val || '.' == $val) {
					/* 如果目录为.或者..则直接补/继续下一个循环 */
					$base .= '/';

					continue;
				}
			} else {
				continue;
			}

			$base .= '/';

			if (!file_exists($base)) {
				/* 尝试创建目录，如果创建失败则继续循环 */
				if (@mkdir(rtrim($base, '/'), 0777)) {
					@chmod($base, 0777);
					$reval = true;
				}
			}
		}
	} else {
		/* 路径已经存在。返回该路径是不是一个目录 */
		$reval = is_dir($folder);
	}

	clearstatcache();

	return $reval;
}

/**
 * 获得系统是否启用了 gzip
 *
 * @access  public
 *
 * @return  boolean
 */
function gzip_enabled() {
	static $enabled_gzip = NULL;

	if ($enabled_gzip === NULL) {
		$enabled_gzip = (C('enable_gzip') && function_exists('ob_gzhandler'));
	}

	return $enabled_gzip;
}

/**
 * 递归方式的对变量中的特殊字符进行转义
 *
 * @access  public
 * @param   mix     $value
 *
 * @return  mix
 */
function addslashes_deep($value) {
	if (empty($value)) {
		return $value;
	} else {
		return is_array($value) ? array_map('addslashes_deep', $value) : addslashes($value);
	}
}

/**
 * 将对象成员变量或者数组的特殊字符进行转义
 *
 * @access   public
 * @param    mix        $obj      对象或者数组
 * @author   Xuan Yan
 *
 * @return   mix                  对象或者数组
 */
function addslashes_deep_obj($obj) {
	if (is_object($obj) == true) {
		foreach ($obj AS $key => $val) {
			$obj->$key = addslashes_deep($val);
		}
	} else {
		$obj = addslashes_deep($obj);
	}

	return $obj;
}

/**
 * 递归方式的对变量中的特殊字符去除转义
 *
 * @access  public
 * @param   mix     $value
 *
 * @return  mix
 */
function stripslashes_deep($value) {
	if (empty($value)) {
		return $value;
	} else {
		return is_array($value) ? array_map('stripslashes_deep', $value) : stripslashes($value);
	}
}

/**
 *  将一个字串中含有全角的数字字符、字母、空格或'%+-()'字符转换为相应半角字符
 *
 * @access  public
 * @param   string       $str         待转换字串
 *
 * @return  string       $str         处理后字串
 */
function make_semiangle($str) {
	$arr = array('０' => '0', '１' => '1', '２' => '2', '３' => '3', '４' => '4',
			'５' => '5', '６' => '6', '７' => '7', '８' => '8', '９' => '9',
			'Ａ' => 'A', 'Ｂ' => 'B', 'Ｃ' => 'C', 'Ｄ' => 'D', 'Ｅ' => 'E',
			'Ｆ' => 'F', 'Ｇ' => 'G', 'Ｈ' => 'H', 'Ｉ' => 'I', 'Ｊ' => 'J',
			'Ｋ' => 'K', 'Ｌ' => 'L', 'Ｍ' => 'M', 'Ｎ' => 'N', 'Ｏ' => 'O',
			'Ｐ' => 'P', 'Ｑ' => 'Q', 'Ｒ' => 'R', 'Ｓ' => 'S', 'Ｔ' => 'T',
			'Ｕ' => 'U', 'Ｖ' => 'V', 'Ｗ' => 'W', 'Ｘ' => 'X', 'Ｙ' => 'Y',
			'Ｚ' => 'Z', 'ａ' => 'a', 'ｂ' => 'b', 'ｃ' => 'c', 'ｄ' => 'd',
			'ｅ' => 'e', 'ｆ' => 'f', 'ｇ' => 'g', 'ｈ' => 'h', 'ｉ' => 'i',
			'ｊ' => 'j', 'ｋ' => 'k', 'ｌ' => 'l', 'ｍ' => 'm', 'ｎ' => 'n',
			'ｏ' => 'o', 'ｐ' => 'p', 'ｑ' => 'q', 'ｒ' => 'r', 'ｓ' => 's',
			'ｔ' => 't', 'ｕ' => 'u', 'ｖ' => 'v', 'ｗ' => 'w', 'ｘ' => 'x',
			'ｙ' => 'y', 'ｚ' => 'z',
			'（' => '(', '）' => ')', '〔' => '[', '〕' => ']', '【' => '[',
			'】' => ']', '〖' => '[', '〗' => ']', '“' => '[', '”' => ']',
			'‘' => '[', '’' => ']', '｛' => '{', '｝' => '}', '《' => '<',
			'》' => '>',
			'％' => '%', '＋' => '+', '—' => '-', '－' => '-', '～' => '-',
			'：' => ':', '。' => '.', '、' => ',', '，' => '.', '、' => '.',
			'；' => ',', '？' => '?', '！' => '!', '…' => '-', '‖' => '|',
			'”' => '"', '’' => '`', '‘' => '`', '｜' => '|', '〃' => '"',
			'　' => ' ');

	return strtr($str, $arr);
}

/**
 * 检查文件类型
 *
 * @access      public
 * @param       string      filename            文件名
 * @param       string      realname            真实文件名
 * @param       string      limit_ext_types     允许的文件类型
 * @return      string
 */
function check_file_type($filename, $realname = '', $limit_ext_types = '') {
	if ($realname) {
		$extname = strtolower(substr($realname, strrpos($realname, '.') + 1));
	} else {
		$extname = strtolower(substr($filename, strrpos($filename, '.') + 1));
	}

	if ($limit_ext_types && stristr($limit_ext_types, '|' . $extname . '|') === false) {
		return '';
	}

	$str = $format = '';

	$file = @fopen($filename, 'rb');
	if ($file) {
		$str = @fread($file, 0x400); // 读取前 1024 个字节
		@fclose($file);
	} else {
		if (stristr($filename, ROOT_PATH) === false) {
			if ($extname == 'jpg' || $extname == 'jpeg' || $extname == 'gif' || $extname == 'png' || $extname == 'doc' ||
					$extname == 'xls' || $extname == 'txt' || $extname == 'zip' || $extname == 'rar' || $extname == 'ppt' ||
					$extname == 'pdf' || $extname == 'rm' || $extname == 'mid' || $extname == 'wav' || $extname == 'bmp' ||
					$extname == 'swf' || $extname == 'chm' || $extname == 'sql' || $extname == 'cert' || $extname == 'pptx' ||
					$extname == 'xlsx' || $extname == 'docx') {
						$format = $extname;
					}
		} else {
			return '';
		}
	}

	if ($format == '' && strlen($str) >= 2) {
		if (substr($str, 0, 4) == 'MThd' && $extname != 'txt') {
			$format = 'mid';
		} elseif (substr($str, 0, 4) == 'RIFF' && $extname == 'wav') {
			$format = 'wav';
		} elseif (substr($str, 0, 3) == "\xFF\xD8\xFF") {
			$format = 'jpg';
		} elseif (substr($str, 0, 4) == 'GIF8' && $extname != 'txt') {
			$format = 'gif';
		} elseif (substr($str, 0, 8) == "\x89\x50\x4E\x47\x0D\x0A\x1A\x0A") {
			$format = 'png';
		} elseif (substr($str, 0, 2) == 'BM' && $extname != 'txt') {
			$format = 'bmp';
		} elseif ((substr($str, 0, 3) == 'CWS' || substr($str, 0, 3) == 'FWS') && $extname != 'txt') {
			$format = 'swf';
		} elseif (substr($str, 0, 4) == "\xD0\xCF\x11\xE0") {   // D0CF11E == DOCFILE == Microsoft Office Document
			if (substr($str, 0x200, 4) == "\xEC\xA5\xC1\x00" || $extname == 'doc') {
				$format = 'doc';
			} elseif (substr($str, 0x200, 2) == "\x09\x08" || $extname == 'xls') {
				$format = 'xls';
			} elseif (substr($str, 0x200, 4) == "\xFD\xFF\xFF\xFF" || $extname == 'ppt') {
				$format = 'ppt';
			}
		} elseif (substr($str, 0, 4) == "PK\x03\x04") {
			if (substr($str, 0x200, 4) == "\xEC\xA5\xC1\x00" || $extname == 'docx') {
				$format = 'docx';
			} elseif (substr($str, 0x200, 2) == "\x09\x08" || $extname == 'xlsx') {
				$format = 'xlsx';
			} elseif (substr($str, 0x200, 4) == "\xFD\xFF\xFF\xFF" || $extname == 'pptx') {
				$format = 'pptx';
			} else {
				$format = 'zip';
			}
		} elseif (substr($str, 0, 4) == 'Rar!' && $extname != 'txt') {
			$format = 'rar';
		} elseif (substr($str, 0, 4) == "\x25PDF") {
			$format = 'pdf';
		} elseif (substr($str, 0, 3) == "\x30\x82\x0A") {
			$format = 'cert';
		} elseif (substr($str, 0, 4) == 'ITSF' && $extname != 'txt') {
			$format = 'chm';
		} elseif (substr($str, 0, 4) == "\x2ERMF") {
			$format = 'rm';
		} elseif ($extname == 'sql') {
			$format = 'sql';
		} elseif ($extname == 'txt') {
			$format = 'txt';
		}
	}

	if ($limit_ext_types && stristr($limit_ext_types, '|' . $format . '|') === false) {
		$format = '';
	}

	return $format;
}

/**
 * 对 MYSQL LIKE 的内容进行转义
 *
 * @access      public
 * @param       string      string  内容
 * @return      string
 */
function mysql_like_quote($str) {
	return strtr($str, array("\\\\" => "\\\\\\\\", '_' => '\_', '%' => '\%', "\'" => "\\\\\'"));
}

/**
 * 获取服务器的ip
 *
 * @access      public
 *
 * @return string
 * */
function real_server_ip() {
	static $serverip = NULL;

	if ($serverip !== NULL) {
		return $serverip;
	}

	if (isset($_SERVER)) {
		if (isset($_SERVER['SERVER_ADDR'])) {
			$serverip = $_SERVER['SERVER_ADDR'];
		} else {
			$serverip = '0.0.0.0';
		}
	} else {
		$serverip = getenv('SERVER_ADDR');
	}

	return $serverip;
}


function geoip($ip) {
	static $fp = NULL, $offset = array(), $index = NULL;

	$ip = gethostbyname($ip);
	$ipdot = explode('.', $ip);
	$ip = pack('N', ip2long($ip));

	$ipdot[0] = (int) $ipdot[0];
	$ipdot[1] = (int) $ipdot[1];
	if ($ipdot[0] == 10 || $ipdot[0] == 127 || ($ipdot[0] == 192 && $ipdot[1] == 168) || ($ipdot[0] == 172 && ($ipdot[1] >= 16 && $ipdot[1] <= 31))) {
		return 'LAN';
	}

	if ($fp === NULL) {
		$fp = fopen(ROOT_PATH . 'data/common/ipdata.dat', 'rb');
		if ($fp === false) {
			return 'Invalid IP data file';
		}
		$offset = unpack('Nlen', fread($fp, 4));
		if ($offset['len'] < 4) {
			return 'Invalid IP data file';
		}
		$index = fread($fp, $offset['len'] - 4);
	}

	$length = $offset['len'] - 1028;
	$start = unpack('Vlen', $index[$ipdot[0] * 4] . $index[$ipdot[0] * 4 + 1] . $index[$ipdot[0] * 4 + 2] . $index[$ipdot[0] * 4 + 3]);
	for ($start = $start['len'] * 8 + 1024; $start < $length; $start += 8) {
		if ($index{$start} . $index{$start + 1} . $index{$start + 2} . $index{$start + 3} >= $ip) {
			$index_offset = unpack('Vlen', $index{$start + 4} . $index{$start + 5} . $index{$start + 6} . "\x0");
			$index_length = unpack('Clen', $index{$start + 7});
			break;
		}
	}

	fseek($fp, $offset['len'] + $index_offset['len'] - 1024);
	$area = fread($fp, $index_length['len']);

	fclose($fp);
	$fp = NULL;

	return $area;
}

/**
 * 去除字符串右侧可能出现的乱码
 *
 * @param   string      $str        字符串
 *
 * @return  string
 */
function trim_right($str) {
	$len = strlen($str);
	/* 为空或单个字符直接返回 */
	if ($len == 0 || ord($str{$len - 1}) < 127) {
		return $str;
	}
	/* 有前导字符的直接把前导字符去掉 */
	if (ord($str{$len - 1}) >= 192) {
		return substr($str, 0, $len - 1);
	}
	/* 有非独立的字符，先把非独立字符去掉，再验证非独立的字符是不是一个完整的字，不是连原来前导字符也截取掉 */
	$r_len = strlen(rtrim($str, "\x80..\xBF"));
	if ($r_len == 0 || ord($str{$r_len - 1}) < 127) {
		return sub_str($str, 0, $r_len);
	}

	$as_num = ord(~$str{$r_len - 1});
	if ($as_num > (1 << (6 + $r_len - $len))) {
		return $str;
	} else {
		return substr($str, 0, $r_len - 1);
	}
}

/**
 * 将上传文件转移到指定位置
 *
 * @param string $file_name
 * @param string $target_name
 * @return blog
 */
function move_upload_file($file_name, $target_name = '') {
	if (function_exists("move_uploaded_file")) {
		if (move_uploaded_file($file_name, $target_name)) {
			@chmod($target_name, 0755);
			return true;
		} else if (copy($file_name, $target_name)) {
			@chmod($target_name, 0755);
			return true;
		}
	} elseif (copy($file_name, $target_name)) {
		@chmod($target_name, 0755);
		return true;
	}
	return false;
}

/**
 * 将JSON传递的参数转码
 *
 * @param string $str
 * @return string
 */
function json_str_iconv($str) {
	if (EC_CHARSET != 'utf-8') {
		if (is_string($str)) {
			return addslashes(stripslashes(ecs_iconv('utf-8', EC_CHARSET, $str)));
		} elseif (is_array($str)) {
			foreach ($str as $key => $value) {
				$str[$key] = json_str_iconv($value);
			}
			return $str;
		} elseif (is_object($str)) {
			foreach ($str as $key => $value) {
				$str->$key = json_str_iconv($value);
			}
			return $str;
		} else {
			return $str;
		}
	}
	return $str;
}

/**
 * 循环转码成utf8内容
 *
 * @param string $str
 * @return string
 */
function to_utf8_iconv($str) {
	if (EC_CHARSET != 'utf-8') {
		if (is_string($str)) {
			return ecs_iconv(EC_CHARSET, 'utf-8', $str);
		} elseif (is_array($str)) {
			foreach ($str as $key => $value) {
				$str[$key] = to_utf8_iconv($value);
			}
			return $str;
		} elseif (is_object($str)) {
			foreach ($str as $key => $value) {
				$str->$key = to_utf8_iconv($value);
			}
			return $str;
		} else {
			return $str;
		}
	}
	return $str;
}

/**
 * 获取文件后缀名,并判断是否合法
 *
 * @param string $file_name
 * @param array $allow_type
 * @return blob
 */
function get_file_suffix($file_name, $allow_type = array()) {
	$file_suffix = strtolower(array_pop(explode('.', $file_name)));
	if (empty($allow_type)) {
		return $file_suffix;
	} else {
		if (in_array($file_suffix, $allow_type)) {
			return true;
		} else {
			return false;
		}
	}
}

/* * ********************************************************
 * 公共函数库
 * ******************************************************** */

/**
 * 创建像这样的查询: "IN('a','b')";
 *
 * @access   public
 * @param    mix      $item_list      列表数组或字符串
 * @param    string   $field_name     字段名称
 *
 * @return   void
 */
function db_create_in($item_list, $field_name = '') {
	if (empty($item_list)) {
		return $field_name . " IN ('') ";
	} else {
		if (!is_array($item_list)) {
			$item_list = explode(',', $item_list);
		}
		$item_list = array_unique($item_list);
		$item_list_tmp = '';
		foreach ($item_list AS $item) {
			if ($item !== '') {
				$item_list_tmp .= $item_list_tmp ? ",'$item'" : "'$item'";
			}
		}
		if (empty($item_list_tmp)) {
			return $field_name . " IN ('') ";
		} else {
			return $field_name . ' IN (' . $item_list_tmp . ') ';
		}
	}
}

/**
 * 验证输入的邮件地址是否合法
 *
 * @access  public
 * @param   string      $email      需要验证的邮件地址
 *
 * @return bool
 */
function is_email($user_email) {
	$chars = "/^([a-z0-9+_]|\\-|\\.)+@(([a-z0-9_]|\\-)+\\.)+[a-z]{2,6}\$/i";
	if (strpos($user_email, '@') !== false && strpos($user_email, '.') !== false) {
		if (preg_match($chars, $user_email)) {
			return true;
		} else {
			return false;
		}
	} else {
		return false;
	}
}

/**
 * 验证输入的手机号是否合法
 *
 * @access  public
 * @param   string      $mobile      需要验证的手机号
 *
 * @return bool
 */
function is_mobile($user_email) {
	$chars = "/^13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$/";
	if (preg_match($chars, $user_email)) {
		return true;
	} else {
		return false;
	}
}

/**
 * 检查是否为一个合法的时间格式
 *
 * @access  public
 * @param   string  $time
 * @return  void
 */
function is_time($time) {
	$pattern = '/[\d]{4}-[\d]{1,2}-[\d]{1,2}\s[\d]{1,2}:[\d]{1,2}:[\d]{1,2}/';

	return preg_match($pattern, $time);
}

/**
 * 获得查询时间和次数，并赋值给smarty
 *
 * @access  public
 * @return  void
 */
function assign_query_info() {
	if (M()->queryTime == '') {
		$query_time = 0;
	} else {
		$query_time = number_format(microtime(true) - M()->queryTime, 6);
	}
	ECTouch::view()->assign('query_info', sprintf(L('query_info'), M()->queryCount, $query_time));

	/* 内存占用情况 */
	if (L('memory_info') && function_exists('memory_get_usage')) {
		ECTouch::view()->assign('memory_info', sprintf(L('memory_info'), memory_get_usage() / 1048576));
	}

	/* 是否启用了 gzip */
	$gzip_enabled = gzip_enabled() ? L('gzip_enabled') : L('gzip_disabled');
	ECTouch::view()->assign('gzip_enabled', $gzip_enabled);
}



/**
 * 格式化商品价格
 *
 * @access  public
 * @param   float   $price  商品价格
 * @return  string
 */
function price_format($price, $change_price = true) {
	if ($price === '') {
		$price = 0;
	}
	if ($change_price && defined('ECS_ADMIN') === false) {
		switch (C('price_format')) {
			case 0:
				$price = number_format($price, 2, '.', '');
				break;
			case 1: // 保留不为 0 的尾数
				$price = preg_replace('/(.*)(\\.)([0-9]*?)0+$/', '\1\2\3', number_format($price, 2, '.', ''));

				if (substr($price, -1) == '.') {
					$price = substr($price, 0, -1);
				}
				break;
			case 2: // 不四舍五入，保留1位
				$price = substr(number_format($price, 2, '.', ''), 0, -1);
				break;
			case 3: // 直接取整
				$price = intval($price);
				break;
			case 4: // 四舍五入，保留 1 位
				$price = number_format($price, 1, '.', '');
				break;
			case 5: // 先四舍五入，不保留小数
				$price = round($price);
				break;
		}
	} else {
		$price = number_format($price, 2, '.', '');
	}

	return sprintf(C('currency_format'), $price);
}

/**
 *  清除指定后缀的模板缓存或编译文件
 *
 * @access  public
 * @param  bool       $is_cache  是否清除缓存还是清出编译文件
 * @param  string     $ext       需要删除的文件名，不包含后缀
 *
 * @return int        返回清除的文件个数
 */
function clear_tpl_files($is_cache = true, $ext = '') {
	$dirs = array();

	if ($is_cache) {
		$cache_dir = ROOT_PATH . DATA_DIR . '/caches/';
		$dirs[] = ROOT_PATH . DATA_DIR . '/query_caches/';
		$dirs[] = ROOT_PATH . DATA_DIR . '/static_caches/';
		for ($i = 0; $i < 16; $i++) {
			$hash_dir = $cache_dir . dechex($i);
			$dirs[] = $hash_dir . '/';
		}
	} else {
		$dirs[] = ROOT_PATH . DATA_DIR . '/compiled/';
		$dirs[] = ROOT_PATH . DATA_DIR . '/compiled/admin/';
	}

	$str_len = strlen($ext);
	$count = 0;

	foreach ($dirs AS $dir) {
		$folder = @opendir($dir);

		if ($folder === false) {
			continue;
		}

		while ($file = readdir($folder)) {
			if ($file == '.' || $file == '..' || $file == 'index.htm' || $file == 'index.html') {
				continue;
			}
			if (is_file($dir . $file)) {
				/* 如果有文件名则判断是否匹配 */
				$pos = ($is_cache) ? strrpos($file, '_') : strrpos($file, '.');

				if ($str_len > 0 && $pos !== false) {
					$ext_str = substr($file, 0, $pos);

					if ($ext_str == $ext) {
						if (@unlink($dir . $file)) {
							$count++;
						}
					}
				} else {
					if (@unlink($dir . $file)) {
						$count++;
					}
				}
			}
		}
		closedir($folder);
	}

	return $count;
}

/**
 * 清除模版编译文件
 *
 * @access  public
 * @param   mix     $ext    模版文件名， 不包含后缀
 * @return  void
 */
function clear_compiled_files($ext = '') {
	return clear_tpl_files(false, $ext);
}

/**
 * 清除缓存文件
 *
 * @access  public
 * @param   mix     $ext    模版文件名， 不包含后缀
 * @return  void
 */
function clear_cache_files($ext = '') {
	return clear_tpl_files(true, $ext);
}

/**
 * 清除模版编译和缓存文件
 *
 * @access  public
 * @param   mix     $ext    模版文件名后缀
 * @return  void
 */
function clear_all_files($ext = '') {
	del_dir(ROOT_PATH . DATA_DIR);
	@mkdir(ROOT_PATH . DATA_DIR, 0777);
}


/**
 * 格式化重量：小于1千克用克表示，否则用千克表示
 * @param   float   $weight     重量
 * @return  string  格式化后的重量
 */
function formated_weight($weight) {
	$weight = round(floatval($weight), 3);
	if ($weight > 0) {
		if ($weight < 1) {
			/* 小于1千克，用克表示 */
			return intval($weight * 1000) . L('gram');
		} else {
			/* 大于1千克，用千克表示 */
			return $weight . L('kilogram');
		}
	} else {
		return 0;
	}
}


/* * ********************************************************
 * 加密解密函数
 * ******************************************************** */

/**
 * 加密函数
 * @param   string  $str    加密前的字符串
 * @param   string  $key    密钥
 * @return  string  加密后的字符串
 */
function encrypt($str, $key = AUTH_KEY) {
	$coded = '';
	$keylength = strlen($key);

	for ($i = 0, $count = strlen($str); $i < $count; $i += $keylength) {
		$coded .= substr($str, $i, $keylength) ^ $key;
	}

	return str_replace('=', '', base64_encode($coded));
}

/**
 * 解密函数
 * @param   string  $str    加密后的字符串
 * @param   string  $key    密钥
 * @return  string  加密前的字符串
 */
function decrypt($str, $key = AUTH_KEY) {
	$coded = '';
	$keylength = strlen($key);
	$str = base64_decode($str);

	for ($i = 0, $count = strlen($str); $i < $count; $i += $keylength) {
		$coded .= substr($str, $i, $keylength) ^ $key;
	}

	return $coded;
}



/**
 * 处理序列化的支付、配送的配置参数
 * 返回一个以name为索引的数组
 *
 * @access  public
 * @param   string       $cfg
 * @return  void
 */
function unserialize_config($cfg) {
	if (is_string($cfg) && ($arr = unserialize($cfg)) !== false) {
		$config = array();

		foreach ($arr AS $key => $val) {
			$config[$val['name']] = $val['value'];
		}

		return $config;
	} else {
		return false;
	}
}

/**
 * 生成随机字符串
 *
 */
function generate_rand_str( $length = 8 ) {
	// 密码字符集，可任意添加你需要的字符
	$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.';
	$str = '';
	for ( $i = 0; $i < $length; $i++ )
	{
		$str .= $chars[ mt_rand(0, strlen($chars) - 1) ];
	}
	return $str;
}

/*
 ------------------------------------------------------
 参数：
 $str_cut    需要截断的字符串
 $length     允许字符串显示的最大长度

 程序功能：截取全角和半角（汉字和英文）混合的字符串以避免乱码
 ------------------------------------------------------
 */
function substr_cut($str_cut,$length)
{
	if (strlen($str_cut) > $length)
	{
		for($i=0; $i < $length; $i++)
			if (ord($str_cut[$i]) > 128)    $i++;
			$str_cut = substr($str_cut,0,$i)."..";
	}
	return $str_cut;
}

/**
 * $str 原始中文字符串
 * $encoding 原始字符串的编码，默认UTF-8
 * $prefix 编码后的前缀，默认"&#"
 * $postfix 编码后的后缀，默认";"
 */
function unicode_encode($str, $encoding = 'UTF-8', $prefix = '[', $postfix = ']') {
	$str = iconv($encoding, 'UCS-2', $str);
	$arrstr = str_split($str, 2);
	$unistr = '';
	for($i = 0, $len = count($arrstr); $i < $len; $i++) {
		$dec = hexdec(bin2hex($arrstr[$i]));
		$unistr .= $prefix . $dec . $postfix;
	}
	return $unistr;
}

/**
 * $str Unicode编码后的字符串
 * $decoding 原始字符串的编码，默认UTF-8
 * $prefix 编码字符串的前缀，默认"&#"
 * $postfix 编码字符串的后缀，默认";"
 */
function unicode_decode($unistr, $encoding = 'UTF-8', $prefix = '[', $postfix = ']') {
	$arruni = explode($prefix, $unistr);
	$unistr = '';
	for($i = 1, $len = count($arruni); $i < $len; $i++) {
		if (strlen($postfix) > 0) {
			$arruni[$i] = substr($arruni[$i], 0, strlen($arruni[$i]) - strlen($postfix));
		}
		$temp = intval($arruni[$i]);
		$unistr .= ($temp < 256) ? chr(0) . chr($temp) : chr($temp / 256) . chr($temp % 256);
	}
	return iconv('UCS-2', $encoding, $unistr);
}
