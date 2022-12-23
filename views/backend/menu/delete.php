<?php

use App\Models\Menu;

$menu = new Menu(); //tạo đối tượng

$id = $_REQUEST["id"];
//$row = $menu->menu_row($id);
$menu->menu_delete($id);
header("location: index.php?option=menu&cat=trash");
