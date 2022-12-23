<?php

use App\Models\Order;

$order = new Order(); //tạo đối tượng

$id = $_REQUEST["id"];
//$row = $order->order_row($id);
$order->order_delete($id);
header("location: index.php?option=order&cat=trash");
