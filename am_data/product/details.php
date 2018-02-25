<?php
/**
* 根据产品编号pid查询商品的所有信息
* 参数： pid
* 返回：{
*     "details":{ ..., "picList":[{},...] }
*     "family":{ "fid":.., "fname":.., "laptopList":[ {"lid":..,"spec":..},... ]}
*  }
*/
require_once('../init.php');

@$pid = $_REQUEST['pid'];
if(!$pid){
  $pid = 1;
}

$output = [
  'details'=>[],
  'picList'=>[]
];
//读取商品的信息
$sql = "SELECT pid,title,subtitle,range_price,freight,expect,rule,style,duration FROM am_product WHERE pid=$pid";
$result = mysqli_query($conn, $sql);
$output['details'] = mysqli_fetch_assoc($result);

//读取商品的图片列表
$sql = "SELECT * FROM  am_product_img WHERE product_id=$pid ORDER BY iid";
$result = mysqli_query($conn, $sql);
$output['picList'] = mysqli_fetch_all($result, MYSQLI_ASSOC);


echo json_encode($output);