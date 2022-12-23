<?php 
use App\Models\Topic;

$topic = new Topic();//tao doi tuong

$id=$_REQUEST["id"];
// $row = $topic->topic_row($id);

$topic->topic_delete($id);
header("Location:index.php?option=topic&cat=trash");