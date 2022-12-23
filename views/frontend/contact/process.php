<?php

use App\Library\Myclass;
use App\Models\Contact;

$contact = new Contact();
if(isset($_POST['CONTACT'])){
    $data = $_POST['data']; 
    $data['userid'] = $_POST['userid'];
    $data['created_at'] = date('Y-m-d H:i:s');
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['updated_by'] = $_POST['userid'];

    // echo"<pre>";
    // print_r($data);
    // echo"</pre>";
    
    $contact->contact_insert($data);
    header("location:index.php?");
}
