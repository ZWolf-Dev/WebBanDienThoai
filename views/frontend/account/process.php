<?php

use App\Library\Myclass;
use App\Models\User;

$register = new User();

if(isset($_POST['REGISTER'])){
    $data = $_POST['data']; 
    $data['created_by'] = 1;
    $data['updated_by'] = 0;
    $data['password']=sha1($data['password']);
    $data['roles'] = 0;
    $data['status']=1;
    $data['created_at']=date('Y-m-d H:i:s');
    $data['updated_at']=date('Y-m-d H:i:s');
    // xử lý hình
    $target_dir = "public/images/users/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    if (in_array($imageFileType, ['png', 'jpg', 'bmp', 'gif'])) {
        $data['image'] = $_FILES["image"]["name"];
        move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
    }
    $register->register_insert($data);
    // echo"<pre>";
    // print_r($data);
    // echo"</pre>";
   
    header("location:index.php?option=account/Successful-registration");
}
if(isset($_POST['AVATAR'])){
    $data = $_POST['data']; 
    $id = $_POST['userid'];
    // xử lý hình
    $target_dir = "public/images/products/";
    $uploads_dir = 'public/images/carts';
    $tmp_name =  $target_dir . $data['image'];
    $name = $data['image'];
    // move_uploaded_file($tmp_name, "$uploads_dir/$name");
    // rename($tmp_name, "$uploads_dir/$name"); ////cut chuyển từ target_dir -> uploads_dir
    copy($tmp_name, "$uploads_dir/$name");
    
    $register->user_update($data, $id);
    echo"<pre>";
    print_r($data);
    echo"</pre>";
   
    // header("location:index.php?option=account/Successful-registration.php");
}
