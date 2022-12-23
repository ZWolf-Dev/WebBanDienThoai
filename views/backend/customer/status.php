<?php 
use App\Models\user;

$user = new user();//tao doi tuong
$id=$_REQUEST["id"];
$row = $user->users_row($id);
$status_new=($row['status'] == 1) ? 2:1;
$data = array(
    'updated_at'=>date('Y-m-d H:i:s'),
    'updated_by'=>1,
    'status'=>$status_new
);
$user->user_update($data,$id);
header("Location:index.php?option=customer");