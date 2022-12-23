<?php 
use App\Models\Product;
$product = new Product();//tao doi tuong
use App\Models\Productdetail;
$productdetail = new Productdetail();
$detailid = $productdetail->productdetail_id();
    foreach ($detailid as $row) :
        $productdetailid = $row['id'];
    endforeach;

$id=$_REQUEST["id"];
$productdetailid=$productdetailid;
$row = $product->product_row($id);
$target_dir = "../public/images/products/";
$pathdel = $target_dir . $row['image'];
if(file_exists($pathdel))
{
    unlink($pathdel);
}
$product->product_delete($id);
$productdetail->productdetail_delete($productdetailid);
header("Location:index.php?option=product&cat=trash");