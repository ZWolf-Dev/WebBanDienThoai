<?php

use App\Models\Slider;

$slider = new Slider(); //tạo đối tượng

$id = $_REQUEST["id"];
$row = $slider->slider_row($id);

$data = array(
    'updated_at' => date('Y-m-d H:i:s'),
    'updated_by' => 1,
    'status' => 0
);
$slider->slider_update($data, $id);
header("location: index.php?option=slider");
