<?php
require_once('../init.php');
@$fid = $_REQUEST['fid'];

$output = [];

//获取产品例表
$sql = "SELECT pid,pic,cover_title,cover_price,cover_rate_price	FROM am_product WHERE family_id=$fid ORDER BY shelf_time";
$result = mysqli_query($conn, $sql);
$output['limitItems'] = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($output);