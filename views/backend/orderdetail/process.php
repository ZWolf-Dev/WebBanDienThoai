<?php

use App\Library\Myclass;
use App\Models\Orderdetail;

$orderdetail = new Orderdetail();

if (isset($_POST['THEM'])) {
    $data = $_POST['data'];
    $data['slug'] = Myclass::str_slug($data['name']);
    $data['created_at'] = date('Y-m-d H:i:s');
    $data['created_by'] = 1;
    $orderdetail->orderdetail_insert($data);
    header("location:index.php?option=orderdetail");
}
if (isset($_POST['CAPNHAT'])) {
    $id = $_POST['id'];
    $data = $_POST['data'];
    $data['slug'] = Myclass::str_slug($data['name']);
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['updated_by'] = 1;
    $orderdetail->orderdetail_update($data, $id);
    header("location:index.php?option=orderdetail");
}
