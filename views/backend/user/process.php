<?php
use App\Models\User;
$user = new User();

if(isset($_POST['THEM'])){
  $data = $_POST['data']; 
  $data['created_at']=date('Y-m-d H:i:s');
  $created_at = date("Y-m-d H:i:s");
  $created_by = 1;
  $roles = 1;
    // xử lý hình
    $img=
    $target_dir = "../public/images/users/";
    $target_file = $target_dir . basename($_FILES["img"]["name"]);
    // echo $target_file;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    if (in_array($imageFileType, ['png', 'jpg', 'bmp', 'gif'])) {
       $data['img'] = $_FILES["img"]["name"];
      move_uploaded_file($_FILES["img"]["tmp_name"], $target_file);
      
    }
    // echo"<pre>";
    // print_r($data);
    // echo"</pre>";

    $user->user_insert($data);
    header("location:index.php?option=user");
}
if(isset($_POST['CAPNHAT'])){
 
    $data = $_POST['data']; 
    $id = $_POST['id'];
    $row = $user->users_row($id);
    $data['created_at']=date('Y-m-d H:i:s');
    $created_at = date("Y-m-d H:i:s");
    $created_by = 1;
    $roles = 1;

    // xử lý hình
    $target_dir = "../public/images/users/";
    // echo $target_dir;
    $target_file = $target_dir.basename($_FILES["img"]["name"]);
    // echo $target_file;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    if (in_array($imageFileType, ['png', 'jpg', 'bmp', 'gif'])) {
        //Lấy hình củ lại
        $pathdel = $target_dir . $row['img'];
        if(file_exists($pathdel))
        {
            unlink($pathdel);
        }
        $data['img'] = $_FILES["img"]["name"];
        move_uploaded_file($_FILES["img"]["tmp_name"], $target_file);
    }
   
    
    // echo"<pre>";
    // print_r($data);
    // echo"</pre>";
    $user->user_update($data, $id);
    header("location:index.php?option=user");
}