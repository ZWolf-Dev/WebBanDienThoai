<?php 
use App\Models\Product;

$product = new Product();//tao doi tuong
$id=$_REQUEST["id"];
$row = $product->product_row($id);
$status_new=($row['status'] == 1) ? 2:1;
$data = array(
    'updated_at'=>date('Y-m-d H:i:s'),
    'updated_by'=>$_SESSION['userid'],
    'status'=>$status_new
);
$product->product_update($data,$id);
header("Location:index.php?option=product");