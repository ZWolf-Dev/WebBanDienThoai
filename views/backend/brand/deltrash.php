<?php 
use App\Models\Brand;

$brand = new Brand();//tao doi tuong
$id=$_REQUEST["id"];
$row = $brand->brand_row($id);

$data = array(
    'updated_at'=>date('Y-m-d H:i:s'),
    'updated_by'=> $_SESSION['userid'],
    'status'=> 0
);
$brand->brand_update($data,$id);
header("Location:index.php?option=brand");