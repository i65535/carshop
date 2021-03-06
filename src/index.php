<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用入口文件
/* 访问控制 */
define('ENTRANCE', true);
/* 设置系统编码格式 */
header("Content-Type:text/html;charset=utf-8");
/* 设置系统编码格式 */
header("Pragma: no-cache");
/* 修复后退没有提交数据的问题 */
header("Cache-control: private");

// 检测PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',True);

define('BIND_MODULE','Ming');
// 定义应用目录
define('APP_PATH','./Application/');

//定义网站项目根目录
define('SITEURL','httP://127.0.0.1/carshop/');
define('ADMIN_PUC', '/Application/Admin/Public');
// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';

// 亲^_^ 后面不需要任何代码了 就是如此简单