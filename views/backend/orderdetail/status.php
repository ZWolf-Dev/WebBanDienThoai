<?php

use App\Models\Orderdetail;

$orderdetail = new Orderdetail(); //tạo đối tượng

$id = $_REQUEST["id"];
$row = $orderdetail->orderdetail_row($id);
$status_new = ($row['status'] == 1) ? 2 : 1;
$data = array(
    'updated_at' => date('Y-m-d H:i:s'),
    'updated_by' => 1,
    'status' => $status_new
);
$orderdetail->orderdetail_update($data, $id);
header("location: index.php?option=orderdetail");
