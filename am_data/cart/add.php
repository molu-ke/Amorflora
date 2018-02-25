<?php
/**
* 添加到购物车
*/
require_once('../init.php');

@$lid = $_REQUEST['lid'] or die('{"code":401,"msg":"lid required"}');//产品的pid
@$buyCount = $_REQUEST['buyCount'] or die('{"code":401,"msg":"count required"}'); ;//购买的数量
@$buyStyle = $_REQUEST['buyStyle'] or die('{"code":401,"msg":"style required"}'); ;//购买的款式
@$buyDuration = $_REQUEST['buyDuration'] or die('{"code":401,"msg":"duartion required"}'); ;//配送的时长
@$buyPrice = $_REQUEST['buyPrice'] or die('{"code":401,"msg":"buyprice required"}');;//价格

session_start();
if(! @$_SESSION['uid']){
  $_SESSION['toBuyLid'] = $lid;
  $_SESSION['toBuyCount'] = $buyCount;
  $_SESSION['toBuyStyle'] = $buyStyle;
  $_SESSION['toBuyDuration'] = $buyDuration;
  $_SESSION['toBuyPrice'] = $buyPrice;
  die('{"code":300, "msg":"login required"}');
}
$sql = "SELECT iid FROM am_shoppingcart_item WHERE user_id=$_SESSION[uid] AND product_id=$lid AND  style='$buyStyle' AND  duration='$buyDuration'";
$result=mysqli_query($conn, $sql);
if(mysqli_fetch_row($result)){
  $sql = "UPDATE am_shoppingcart_item SET count=$buyCount+count,price=$buyPrice WHERE user_id=$_SESSION[uid] AND product_id=$lid AND  style='$buyStyle' AND  duration='$buyDuration'";
}else {
  $sql = "INSERT INTO am_shoppingcart_item VALUES(NULL, $_SESSION[uid],$lid,$buyCount,'$buyStyle','$buyDuration',$buyPrice,1)";
}
$result = mysqli_query($conn, $sql);
if($result){
  echo '{"code":200, "msg":"add succ"}';
}else {
  echo '{"code":500, "msg":"add err"}';
}