<?php
/**
* 接收客户端
*/
require_once('../init.php');

@$phone = $_REQUEST['phone'] or die('{"code":401,"msg":"phone required"}');
@$upwd = $_REQUEST['upwd'] or die('{"code":402,"msg":"upwd required"}');

$sql = "INSERT INTO am_user(phone,upwd) VALUES('$phone','$upwd')";
$result = mysqli_query($conn,$sql);

if(!$result){
  echo('{"code":500, "msg":"db execute err"}');
}else {
  $uid = mysqli_insert_id($conn);
  echo('{"code":200, "msg":"register succ", "uid":'.$uid.'}');
}