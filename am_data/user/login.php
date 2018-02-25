<?php
/**
* 接收客户端提交的登录信息：phone、pwd，执行登录验证；
* 返回表明登录成功或失败的JSON消息：
* 如：{"code":200, "msg":"check passed"}
*/
require_once('../init.php');

@$uphone = $_REQUEST['uphone'] or die('{"code":401,"msg":"uphone required"}');
@$upwd = $_REQUEST['upwd'] or die('{"code":402,"msg":"upwd required"}');

$sql = "SELECT uid FROM am_user WHERE phone='$uphone' AND upwd='$upwd'";
$result = mysqli_query($conn,$sql);

if(!$result){       //SQL语句执行失败
  echo('{"code":500, "msg":"db execute err"}');
}else {
  $row = mysqli_fetch_assoc($result);
  if(!$row){        //用户名或密码错误
    echo('{"code":201, "msg":"uname or upwd err"}');
  }else {           //登录成功
    session_start();
    $_SESSION['uphone'] = $uphone;
    $_SESSION['uid'] = $row['uid'];
    if(@$_SESSION['toBuyLid']){
		$lid=$_SESSION['toBuyLid'];
		$buyCount=$_SESSION['toBuyCount'];
		$buyStyle=$_SESSION['toBuyStyle'];
		$buyDuration=$_SESSION['toBuyDuration'];
		$buyPrice=$_SESSION['toBuyPrice'];
		//完成购物车添加
		$sql = "SELECT iid FROM am_shoppingcart_item WHERE user_id=$_SESSION[uid] AND product_id=$lid AND  style='$buyStyle' AND  duration='$buyDuration'";
		$result=mysqli_query($conn, $sql);
		if(mysqli_fetch_row($result)){
		  $sql = "UPDATE am_shoppingcart_item SET count=$buyCount+count,price=$buyPrice WHERE user_id=$_SESSION[uid] AND product_id=$lid AND  style='$buyStyle' AND  duration='$buyDuration'";
		}else {
		  $sql = "INSERT INTO am_shoppingcart_item VALUES  (NULL,$_SESSION[uid],$lid,$buyCount,'$buyStyle','$buyDuration',$buyPrice)";
		}
		$result = mysqli_query($conn, $sql);
		unset($_SESSION['toBuyLid']);
		unset($_SESSION['toBuyCount']);
		unset($_SESSION['toBuyStyle']);
		unset($_SESSION['toBuyDuration']);
		unset($_SESSION['toBuyPrice']);
		echo('{"code":200, "msg":"login succ","sign":1}');
	  
   // }else if($pageToJump==='cart.html'){
      //完成购物车查看
     // unset($_SESSION['pageToJump']);
      //echo('{"code":200, "msg":"login succ", "pageToJump":"'.$pageToJump.'"}');
    }else {
	  //不用添加、查看购物车登录--》成功
      echo('{"code":200, "msg":"login succ"}');
    }
  }
}