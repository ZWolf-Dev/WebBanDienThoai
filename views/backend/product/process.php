<?php

use App\Library\Myclass;
use App\Models\Product;
use App\Models\Productdetail;

$product = new Product();
$productdetail = new Productdetail();

if (isset($_POST['THEM'])) {
    $value = $_POST['value'];
    $value['created_at'] = date('Y-m-d H:i:s');
    $value['created_by'] = $_SESSION['userid'];
    $productdetail->productdetail_insert($value);
    // echo"<pre>";
    // print_r($value);
    // echo"</pre>";
   $detailid = $productdetail->productdetail_id();
    foreach ($detailid as $row) :
        $productdetailid = $row['id'];
    endforeach; 
    $data = $_POST['data'];
    $data['productdetailid'] = $productdetailid;
    $data['slug'] = Myclass::str_slug($data['name']);
    $data['created_at'] = date('Y-m-d H:i:s');
    $data['created_by'] = $_SESSION['userid'];
    //xử lý hình
    $target_dir = "../public/images/products/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    if (in_array($imageFileType, ['png', 'jpg', 'bmp', 'gif'])) {
        $data['image'] = $_FILES["image"]["name"];
        move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
        $product->product_insert($data);
    }
    // echo "<pre>";
    // print_r($data);
    // echo "</pre>";
    header("location:index.php?option=product");
}
if (isset($_POST['CAPNHAT'])) {
    $id = $_POST['id'];
    $row = $product->product_row($id);
    $data = $_POST['data'];
    $data['slug'] = Myclass::str_slug($data['name']);
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['updated_by'] = $_SESSION['userid'];
    //
    $target_dir = "../public/images/products/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    if (in_array($imageFileType, ['png', 'jpg', 'bmp', 'gif'])) {
        //Lấy hình củ lại
        $pathdel = $target_dir . $row['image'];
        if (file_exists($pathdel)) {
            unlink($pathdel);
        }
        $data['image'] = $_FILES["image"]["name"];
        move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
    }
    //
    $product->product_update($data, $id);
    header("location:index.php?option=product");
}
