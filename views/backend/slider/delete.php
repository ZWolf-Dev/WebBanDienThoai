<?php

use App\Models\Slider;

$slider = new Slider(); //tạo đối tượng

$id = $_REQUEST["id"];
//$row = $slider->slider_row($id);
$slider->slider_delete($id);
header("location: index.php?option=slider&cat=trash");
