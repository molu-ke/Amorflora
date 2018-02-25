<?php
/**
* 判断用户是否登录
* 登录的返回当前登录用户的信息：
* 如：{"uid":10, "uname":"dingding"}
* 未登录的返回null
*/
require_once('../init.php');
session_start();
@$output['uphone'] = $_SESSION['uphone'];
@$output['uid'] = $_SESSION['uid'];

echo json_encode($output);