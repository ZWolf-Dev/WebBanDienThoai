<?php 
use App\Models\Topic;

$topic = new Topic();//tao doi tuong
$id=$_REQUEST["id"];
$row = $topic->topic_row($id);

$data = array(
    'updated_at'=>date('Y-m-d H:i:s'),
    'updated_by'=>$_SESSION['userid'],
    'status'=>2
);
$topic->topic_update($data,$id);
header("Location:index.php?option=topic&cat=trash");