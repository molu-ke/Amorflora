<?php
/**
* 向首页提供必需的数据，包括轮播广告、限时抢购 、订阅惊喜 、单束花礼、永生花礼、花边小物
* 返回数据形如：
  {
    carouselItems: [ ],
	limitItems: [ ],
    takeItems: [ ],
    topSaleItems: [ ],
	singleBeamItems:[],
	immortalItems:[],
	articleItems:[]
  }
*/

require_once('../init.php');

$output = [];

//1.获取轮播广告项
$sql = "SELECT cid,img,title,href FROM am_index_carousel";
$result = mysqli_query($conn, $sql);
$output['carouselItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

//2.限时抢购  5
$sql = "SELECT pid,pic,cover_title,cover_price,cover_rate_price	FROM am_product WHERE family_id=5 ORDER BY shelf_time  LIMIT 4";
$result = mysqli_query($conn, $sql);
$output['limitItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

//3.订阅惊喜 1
$sql = "SELECT pid,pic,cover_title,cover_price,cover_rate_price	FROM am_product WHERE family_id=1 ORDER BY shelf_time  LIMIT 5";
$result = mysqli_query($conn, $sql);
$output['takeItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

//4.单束花礼 6
$sql = "SELECT pid,pic,cover_title,cover_price,cover_rate_price	FROM am_product WHERE family_id=6 ORDER BY shelf_time  LIMIT 6";
$result = mysqli_query($conn, $sql);
$output['singleBeamItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

//5.永生花礼 3
$sql ="SELECT pid,pic,cover_title,cover_price,cover_rate_price	FROM am_product WHERE family_id=3 ORDER BY shelf_time  LIMIT 4";
$result = mysqli_query($conn, $sql);
$output['immortalItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

//6.花边小物  4
$sql = "SELECT pid,pic,cover_title,cover_price,cover_rate_price	FROM am_product WHERE family_id=4 ORDER BY shelf_time  LIMIT 4";
$result = mysqli_query($conn, $sql);
$output['articleItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($output);