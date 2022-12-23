<?php

use App\Models\Contact;

$contact = new Contact(); //tạo đối tượng

$id = $_REQUEST["id"];
$row = $contact->contact_row($id);
$status_new = ($row['status'] == 1) ? 2 : 1;
$data = array(
    'updated_at' => date('Y-m-d H:i:s'),
    'updated_by' => 1,
    'status' => $status_new
);
$contact->contact_update($data, $id);
header("location: index.php?option=contact");
