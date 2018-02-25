<?php
/**
* 获取当前登录用户的购物车内容
*/
require_once('../init.php');
session_start();
if(! @$_SESSION['uid']){
  die('{"code":300, "msg":"login required"}');
}
//获取总记录数  iid,lid,title,spec,price,count
$sql = "SELECT s.iid,s.product_id,s.count,s.style,s.duration,s.price,s.is_checked,p.pic,p.title FROM am_product p, am_shoppingcart_item s WHERE p.pid=s.product_id AND s.user_id=$_SESSION[uid]";
$result = mysqli_query($conn, $sql);
$list = mysqli_fetch_all($result, MYSQLI_ASSOC);
$output = [
  'code'=>200,
  'data'=>$list
];
echo json_encode($output);