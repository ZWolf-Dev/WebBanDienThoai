<?php

use App\Models\Contact;

$contact = new Contact(); //tạo đối tượng

$id = $_REQUEST["id"];
//$row = $contact->contact_row($id);
$contact->contact_delete($id);
header("location: index.php?option=contact&cat=trash");
