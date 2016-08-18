<?php
return array(
	//'配置项'=>'配置值'
	'TMPL_PARSE_STRING' =>array(
		'__PUBLIC__' => '/Theme/static',
		'__JS__'     => '/Theme/static/js/',
		'__UPLOAD__' => '/Uploads'
	),
	'LANG_SWITCH_ON' => true,
	'LANG_AUTO_DETECT' => false, // 自动侦测语言 开启多语言功能后有效
	'LANG_LIST'        => 'zh-cn', // 允许切换的语言列表 用逗号分隔
	'VAR_LANGUAGE'     => 'l', // 默认语言切换变量
	'DEFAULT_LANG' => 'zh-cn',
);