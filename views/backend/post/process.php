<?php

use App\Library\Myclass;
use App\Models\Post;

$post = new Post();

if(isset($_POST['THEM'])){
    $id = $_POST['id'];
    $data = array(
        'topid' => $_POST['topid'],
        'title' => $_POST['title'],
        'detail' => $_POST['detail'],
        'slug' => $_POST['title'],
        'type' => 'page',
        'metakey' => $_POST['metakey'],
        'metadesc' => $_POST['metadesc'],
        'created_at' => date("Y-m-d H:i:s"),
        'created_by' => 1,
        );
    //xử lý hình
    // $target_dir = "../public/images/posts/";
    // $target_file = $target_dir . basename($_FILES["img"]["title"]);
    // $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    // if (in_array($imageFileType, ['png', 'jpg', 'bmp', 'gif'])) {
    //     $data['img'] = $_FILES["img"]["title"];
    //     move_uploaded_file($_FILES["img"]["tmp_title"], $target_file);
    //     $post->post_insert($data);
    // }
    // echo"<pre>";
    // print_r($data);
    // echo"</pre>";
    $post->post_insert($data);
    header("location:index.php?option=post");
}
if(isset($_POST['CAPNHAT'])) {
    $id = $_POST['id'];
    $row = $post->post_row($id);
    $data = $_POST['data'];
    $data['slug']= Myclass::str_slug($data['title']);
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['updated_by'] = $_SESSION['userid'];
    //
    $target_dir = "../public/images/posts/";
    $target_file = $target_dir . basename($_FILES["img"]["title"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    if (in_array($imageFileType, ['png', 'jpg', 'bmp', 'gif'])) {
        //Lấy hình củ lại
        $pathdel = $target_dir . $row['img'];
        if(file_exists($pathdel))
        {
            unlink($pathdel);
        }
        $data['img'] = $_FILES["img"]["title"];
        move_uploaded_file($_FILES["img"]["tmp_title"], $target_file);
    }
    //
    $post->post_update($data, $id);
    header("location:index.php?option=post");
}