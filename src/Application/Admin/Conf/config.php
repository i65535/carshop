<?php
return array(
	//'配置项'=>'配置值'
	'URL_MODEL' => 0,
	'TMPL_PARSE_STRING' =>array(
		'__PUBLIC__' => '/Application/Admin/Public',
		'__JS__'     => '/api/Theme/static/js/',
		'__UPLOAD__' => '/api/Uploads',
	),
	'LANG_SWITCH_ON' => true,
	'LANG_AUTO_DETECT' => false, // 自动侦测语言 开启多语言功能后有效
	'LANG_LIST'        => 'zh-cn', // 允许切换的语言列表 用逗号分隔
	'VAR_LANGUAGE'     => 'l', // 默认语言切换变量
	'DEFAULT_LANG' => 'zh-cn',
);