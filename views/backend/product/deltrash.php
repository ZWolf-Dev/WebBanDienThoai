<?php 
use App\Models\Product;

$product = new Product();//tao doi tuong

$id=$_REQUEST["id"];
$row = $product->product_row($id);

$data = array(
    'updated_at'=>date('Y-m-d H:i:s'),
    'updated_by'=> $_SESSION['userid'],
    'status'=> 0
);
$product->product_update($data,$id);
header("Location:index.php?option=product");