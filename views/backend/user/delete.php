<?php 
use App\Models\user;

$user = new user();//tao doi tuong
$id=$_REQUEST["id"];
// $row = $user->user_row($id);

$user->user_delete($id);
header("Location:index.php?option=user&cat=trash");