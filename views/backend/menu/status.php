<?php

use App\Models\Menu;

$menu = new Menu(); //tạo đối tượng

$id = $_REQUEST["id"];
$row = $menu->menu_row($id);
$status_new = ($row['status'] == 1) ? 2 : 1;
$data = array(
    'updated_at' => date('Y-m-d H:i:s'),
    'updated_by' => 1,
    'status' => $status_new
);
$menu->menu_update($data, $id);
header("location: index.php?option=menu");
