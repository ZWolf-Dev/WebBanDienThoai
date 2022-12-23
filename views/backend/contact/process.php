<?php

use App\Library\Myclass;
use App\Models\Contact;

$contact = new Contact();

if (isset($_POST['THEM'])) {
    $data = $_POST['data'];
    //Lấy những thông tin hệ thống
    $data['created_at'] = date('Y-m-d H:i:s');
    $contact->contact_insert($data);
    header("location:index.php?option=contact");
}
if (isset($_POST['CAPNHAT'])) {
    $id = $_POST['id'];
    $data = $_POST['data'];
    //Lấy những thông tin hệ thống
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['updated_by'] = 1; // xử lý sau khi đăng nhập
    $contact->contact_update($data, $id);
    header("location:index.php?option=contact");
}
