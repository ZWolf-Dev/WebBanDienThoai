<?php 
use App\Models\Category;

$category = new Category();//tao doi tuong

$id=$_REQUEST["id"];
// $row = $category->category_row($id);

$category->category_delete($id);
header("Location:index.php?option=category&cat=trash");