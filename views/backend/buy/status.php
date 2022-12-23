<?php 
use App\Models\Buy;

$buy = new Buy();//tao doi tuong
$id=$_REQUEST["id"];
$row = $buy->buy_row($id);
$status_new=($row['status'] == 1) ? 2:1;
$data = array(
    'updated_at'=>date('Y-m-d H:i:s'),
    'updated_by'=>$_SESSION['userid'],
    'status'=>$status_new
);
$buy->buy_update($data,$id);
header("Location:index.php?option=buy");