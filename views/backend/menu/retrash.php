<?php

use App\Models\Menu;

$menu = new Menu(); //tạo đối tượng

$id = $_REQUEST["id"];
$row = $menu->menu_row($id);

$data = array(
    'updated_at' => date('Y-m-d H:i:s'),
    'updated_by' => 1,
    'status' => 2
);
$menu->menu_update($data, $id);
header("location: index.php?option=menu&cat=trash");
