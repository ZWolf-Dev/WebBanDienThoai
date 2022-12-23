<?php

use App\Library\Myclass;
use App\Models\Menu;

$menu = new Menu();

if (isset($_POST['THEM'])) {
    $data = $_POST['data'];
    $data['position'] = 'mainmenu';
    //Lấy những thông tin hệ thống
    $data['created_at'] = date('Y-m-d H:i:s');
    $menu->menu_insert($data);
    echo "<pre>";
    print_r($data);
    echo "</pre>";
    // header("location:index.php?option=menu");
}
if (isset($_POST['CAPNHAT'])) {
    $id = $_POST['id'];
    $data = $_POST['data'];
    //Lấy những thông tin hệ thống
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['updated_by'] = 1; // xử lý sau khi đăng nhập
    $menu->menu_update($data, $id);
    header("location:index.php?option=menu");
}
