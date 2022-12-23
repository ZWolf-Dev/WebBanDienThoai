<?php 
use App\Models\Post;

$post = new Post();//tao doi tuong
$id=$_REQUEST["id"];
$row = $post->post_row($id);

$data = array(
    'updated_at'=>date('Y-m-d H:i:s'),
    'updated_by'=> $_SESSION['userid'],
    'status'=> 0
);
$post->post_update($data,$id);
header("Location:index.php?option=post");