<?php 
use App\Models\user;

$user = new user();//tao doi tuong
$id=$_REQUEST["id"];
$row = $user->user_row($id);

$data = array(
    'updated_at'=>date('Y-m-d H:i:s'),
    'updated_by'=>1,
    'status'=>2
);
$user->user_update($data,$id);
header("Location:index.php?option=customer&cat=trash");