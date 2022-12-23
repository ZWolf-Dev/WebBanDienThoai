<?php

use App\Library\Myclass;
use App\Models\Cart;
use App\Models\User;
use App\Models\Product;
use App\Models\Order;
use App\Models\Orderdetail;
use App\Models\Buy;

$cart = new Cart();
$product = new Product();
$user = new User();
$order = new Order();
$orderdetail = new Orderdetail();
$buy = new Buy();

$id = $_REQUEST['addcat'] ?? null;
$row = $cart->cart_row($id);
$sale = $product->product_row($id);
// $ord = $order->order_row($id);
// $ordetail = $orderdetail->orderdetail_row($id);
// $buy = $buy->buy_row($id);
$orderid = $order->orders_id();
foreach ($orderid as $ord) :
    $orderdetailid = $ord['id'];
endforeach;


if (isset($_POST['CART'])) {
    $data = $_POST['data'];
    $data['slug'] = Myclass::str_slug($data['name']);
    $data['created_at'] = date('Y-m-d H:i:s');
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['created_by'] = 1;
    $data['updated_by'] = $data['userid'];
    $data['image'] = $_POST['image'];
    $data['quantity'] = $_POST['quantity'];
    $data['price'] = $_POST['price'];
    $data['pricesale'] = $_POST['pricesale'];

    //xử lý hình
    $target_dir = "public/images/products/";
    $uploads_dir = 'public/images/carts';
    $tmp_name =  $target_dir . $data['image'];
    $name = $data['image'];
    // move_uploaded_file($tmp_name, "$uploads_dir/$name");
    // rename($tmp_name, "$uploads_dir/$name"); ////cut chuyển từ target_dir -> uploads_dir
    copy($tmp_name, "$uploads_dir/$name");


    if (isset($row['id'])) {
        $data = $_POST['data'];
        $id = $_POST['newid'];
        $data['quantity'] =  $_POST['quantity'] + $row['quantity'];
        $data['price'] =   $_POST['price'] * $data['quantity'];
        $data['pricesale'] =    $_POST['pricesale'] * $data['quantity'];
        $cart->cart_update($data, $id);
        header("location:index.php?option=account/index");
    } else {
        $data['quantity'] =  $_POST['quantity'] + $row['quantity'];
        $data['price'] =   $_POST['price'] * $data['quantity'];
        $data['pricesale'] =    $_POST['pricesale'] * $data['quantity'];
        $cart->cart_insert($data);
        header("location:index.php?option=account/index");
    }
    echo "<pre>";
    print_r($data);
    echo "</pre>";
}

if (isset($_POST['BUY'])) {
    $quantity =  $_POST['quantity'];
    $pricesale =    $_POST['pricesale'] * $quantity;
    header("location:index.php?option=cart/order&id=" . $id . "&quantity=" . $quantity . "&pricesale=" . $pricesale);
}

if (isset($_POST['DETAIL'])) {
    $quantity =  $_POST['quantity'];
    $price =    $_POST['price'] * $quantity;
    $pricesale =    $_POST['pricesale'] * $quantity;
    header("location:index.php?option=product/product&id=" . $id . "&quantity=" . $quantity . "&price=" . $price . "&pricesale=" . $pricesale);
}

if (isset($_POST['CARTUPDATE'])) {
    $data = $_POST['data'];
    $data['slug'] = Myclass::str_slug($data['name']);
    $data['created_at'] = date('Y-m-d H:i:s');
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['created_by'] = 1;
    $data['updated_by'] = $_POST['userid'];
    $data['image'] = $_POST['image'];
    $data['quantity'] = $_POST['quantity'];
    $data['price'] = $_POST['price'];
    $data['pricesale'] = $_POST['pricesale'];
    //xử lý hình
    $target_dir = "public/images/products/";
    $uploads_dir = 'public/images/carts';
    $tmp_name =  $target_dir . $data['image'];
    $name = $data['image'];
    // move_uploaded_file($tmp_name, "$uploads_dir/$name");
    // rename($tmp_name, "$uploads_dir/$name"); ////cut chuyển từ target_dir -> uploads_dir
    copy($tmp_name, "$uploads_dir/$name");

    $data = $_POST['data'];
    $id = $_POST['newid'];
    $data['quantity'] =  $_POST['quantity'] + $row['quantity'];
    $data['price'] =   $_POST['price'] + $data['price'];
    $data['pricesale'] =    $_POST['pricesale'] + $data['pricesale'];
    $cart->cart_update($data, $id);
    header("location:index.php?option=account/index");
    // echo "<pre>";
    // print_r($data);
    // echo "</pre>";
}
if (isset($_POST['DELETECART'])) {
    // if ($row['quantity'] > 1) {
    //     $data = $_POST['data'];
    //     $data['slug'] = Myclass::str_slug($data['name']);
    //     $data['created_at'] = date('Y-m-d H:i:s');
    //     $data['updated_at'] = date('Y-m-d H:i:s');
    //     $data['created_by'] = 1;
    //     $data['updated_by'] = $_POST['userid'];
    //     $data['image'] = $_POST['image'];
    //     $data['quantity'] = $_POST['quantity'];
    //     $data['price'] = $_POST['price'];
    //     $data['pricesale'] = $_POST['pricesale'];
    //     //xử lý hình
    //     $target_dir = "public/images/products/";
    //     $uploads_dir = 'public/images/carts';
    //     $tmp_name =  $target_dir . $data['image'];
    //     $name = $data['image'];
    //     // move_uploaded_file($tmp_name, "$uploads_dir/$name");
    //     // rename($tmp_name, "$uploads_dir/$name"); ////cut chuyển từ target_dir -> uploads_dir
    //     copy($tmp_name, "$uploads_dir/$name");
    //     $data = $_POST['data'];
    //     $id = $_POST['newid'];
    //     $data['quantity'] = $row['quantity'] - 1;
    //     $data['price'] = $_POST['price'] - $sale['price'];
    //     $data['pricesale'] = $_POST['pricesale'] - $sale['pricesale'];
    //     $cart->cart_update($data, $id);
    //     header("Location:index.php?option=cart/cart");
    //     // echo "<pre>";
    //     // print_r($data);
    //     // echo "</pre>";
    //     // echo $sale['pricesale'];
    // } else {
    $id = $_REQUEST['addcat'];
    $row = $cart->cart_row($id);
    $target_dir = "public/images/carts/";
    $pathdel = $target_dir . $row['image'];
    if (file_exists($pathdel)) {
        unlink($pathdel);
    }
    $cart->cart_delete($id);
    header("Location:index.php?option=cart/cart");
    // }
}

if (isset($_POST['EDITCART'])) {

    if ($_POST['qt'] == 0) {

        $id = $_REQUEST['addcat'];
        $row = $cart->cart_row($id);
        $target_dir = "public/images/carts/";
        $pathdel = $target_dir . $row['image'];
        if (file_exists($pathdel)) {
            unlink($pathdel);
        }
        $cart->cart_delete($id);
        header("Location:index.php?option=cart/cart");
    } else {
        $data = $_POST['data'];
        $data['slug'] = Myclass::str_slug($data['name']);
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['updated_at'] = date('Y-m-d H:i:s');
        $data['created_by'] = 1;
        $data['updated_by'] = $_POST['userid'];
        $data['image'] = $_POST['image'];
        $data['price'] = $_POST['price'];
        $data['pricesale'] = $_POST['pricesale'];
        //xử lý hình
        $target_dir = "public/images/products/";
        $uploads_dir = 'public/images/carts';
        $tmp_name =  $target_dir . $data['image'];
        $name = $data['image'];
        // move_uploaded_file($tmp_name, "$uploads_dir/$name");
        // rename($tmp_name, "$uploads_dir/$name"); ////cut chuyển từ target_dir -> uploads_dir
        copy($tmp_name, "$uploads_dir/$name");
        $data = $_POST['data'];
        $id = $_POST['newid'];
        $data['quantity'] =  $_POST['qt'];
        $data['price'] =  $sale['price'] * $data['quantity'];
        $data['pricesale'] =  $sale['pricesale'] * $data['quantity'];
        $cart->cart_update($data, $id);
        header("Location:index.php?option=cart/cart");
        // echo "<pre>";
        // print_r($data);
        // echo "</pre>";
    }
}
if (isset($_POST['ORDER'])) {

    //order_insert
    $data = $_POST['data'];
    $data['id'] = $orderdetailid + 1;
    // $data['address'] = $_POST['addressdetail'] . ", " . $_POST['address'];
    $data['address'] = $_POST['Address'] . " " . $_POST['Province']." " . $_POST['District']." " . $_POST['Ward'];
    $data['created_at'] = date('Y-m-d H:i:s');
    $data['updated_at'] = date('Y-m-d H:i:s');
    $data['updated_by'] = $_POST['userid'];
    $data['userid'] = $_POST['userid'];
    $data['status'] = 2;
    $order->order_insert($data);
    // echo "<pre>";
    // print_r($data);
    // echo "</pre>";

    //buy_insert
    $buydata = $_POST['buydata'];
    $buydata['orderid'] = $data['id'];
    $buydata['slug'] = Myclass::str_slug($buydata['name']);
    $buydata['productid'] = $_REQUEST['addcat'];
    $buydata['userid'] = $_POST['userid'];
    $buydata['image'] = $_POST['image'];
    $buydata['quantity'] = $_POST['quantity'];
    $buydata['pricesale'] = $_POST['price'] * $_POST['quantity'];
    $buydata['price'] = $_POST['pricesale'];
    $buydata['created_by'] = 1;
    $buydata['created_at'] = date('Y-m-d H:i:s');
    $buydata['updated_at'] = date('Y-m-d H:i:s');
    $buydata['updated_by'] = $_POST['userid'];
    $buydata['status'] = 2;
    $buy->buy_insert($buydata);
    // echo "<pre>";
    // print_r($buydata);
    // echo "</pre>";

    //orderdetail_insert
    $value = $_POST['value'];
    $value['quantity'] = $_POST['quantity'];
    $value['price'] = $_POST['pricesale'];
    $value['orderid'] = $data['id'];
    $value['userid'] = $_POST['userid'];
    $value['productid'] = $_REQUEST['addcat'];
    $value['created_at'] = date('Y-m-d H:i:s');
    $value['updated_at'] = date('Y-m-d H:i:s');
    $value['updated_by'] = $_POST['userid'];
    $orderdetail->orderdetail_insert($value);
    // echo "<pre>";
    // print_r($value);
    // echo "</pre>";

    //product_update
    $idproupdate = $_REQUEST['addcat'];
    $proupdate['storehouse'] = $sale['storehouse'] - $_POST['quantity'];
    $proupdate['sold'] = $sale['sold'] + $_POST['quantity'];
    $product->product_update($proupdate, $id);
    // echo "<pre>";
    // print_r($proupdate);
    // echo "</pre>";

    //send mail


    $url = "https://script.google.com/macros/s/AKfycbzbFGrsHwf3koDEvnMFzggDW3Q6xa1SVJ7PXhYrd370Q0wAAVoFI47tlNhPI2qwCMpjvg/exec";
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_POSTFIELDS => http_build_query([
            "recipient" => $data['email'],
            "subject"   => 'Hóa đơn mua hàng',
            "body"      =>
               'HN Store xin chào!
                Đây là hóa đơn mua hàng của bạn:
                Mã đơn hàng: ' . $data['id'] . '
                Tên sản phẩm: ' . $buydata['name'] . '
                Số lượng: ' . $value['quantity'] . '
                Thành tiền: ' . $value['price'] . 'VNĐ
                Địa chỉ người nhận: ' . $data['address'] . '
                Số điện thoại người nhận: ' . $data['phone'] . '
                Ngày đặt hàng: ' . date('Y-m-d H:i:s')
        ])
    ]);
    $result = curl_exec($ch);
    echo $result;

    header("location:index.php?option=cart/successfulorder&userid=" . $_POST['userid'] . "&email=" . $data['email'] . "&name=" . $buydata['name'] . "&quantity=" . $_POST['quantity'] . "&price=" . $_POST['pricesale'] . "&address=" . $data['address'] . "&phone=" . $data['phone']);
    // header("location:index.php?option=cart/successfulorder&userid=" . $_POST['userid']);
}