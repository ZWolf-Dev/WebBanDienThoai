<?php 
use App\Models\Brand;

$brand = new Brand();//tao doi tuong

$id=$_REQUEST["id"];
// $row = $brand->brand_row($id);

$brand->brand_delete($id);
header("Location:index.php?option=brand&cat=trash");