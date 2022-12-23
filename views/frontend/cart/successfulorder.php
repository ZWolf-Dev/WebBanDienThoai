<?php

use App\Models\User;
use App\Models\Order;
use App\Models\Orderdetail;

$user = new User();
$order = new Order();
$orderdetail = new Orderdetail();

$userid = $_REQUEST['userid'];
$list_user = $user->user_list(['status' => 'index']);
$list = $order->orders_list(['status' => 'index', 'userid' => $userid]);
$list_orderdetail = $orderdetail->orderdetails_list(['status' => 'index', 'userid' => $userid]);
foreach ($list_user as $row) :  endforeach;
$id = $row['id'];

$name = $_REQUEST['name'];
$quantity = $_REQUEST['quantity'];
$price = $_REQUEST['price'];
$address = $_REQUEST['address'];
$email = $_REQUEST['email'];
$phone = $_REQUEST['phone'];
$date = date('Y-m-d H:i:s');
?>

<?php
// ini_set( 'display_errors', 1 );
// error_reporting( E_ALL );
// $from = "HNStore@gmail.com";  
// $to = $_REQUEST['email'];            
// $subject = "Hóa đơn mua hàng";      
// $message = "<h1>HN Store xin chao</h1>";
// $message .= "<h3>Day la hoa don mua hang cua ban.</h3>";
// $message .= "<p>Ma don hang: $id</p>";
// $message .= "<p>Ten san pham: $name</p>";
// $message .= "<p>So luong: $quantity</p>";
// $message .= "<p>Thanh tien: $price</p>";
// $message .= "<p>Dia chi nguoi nhan: $address</p>";
// $message .= "<p>Email nguoi nhan: $email</p>";
// $message .= "<p>So dien thoai nguoi nhan: $phone</p>";
// $message .= "<p>Ngày đặt hàng: $date</p>";

// $headers = "MIME-Version: 1.0\r\n";
// $headers .= "Content-type: text/html\r\n";
// mail($to,$subject,$message, $headers);;
?>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="public/css/formbootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="public/css/formmain.css" />
    <link rel="stylesheet" type="text/css" href="public/css/formpage.css" />
    <link rel="icon" href="public/images/Logo.png" type="image/x-icon" />
</head>

<body>

    <div id="main" class="nh-row">
        <div id="success-order">
            <div class="full-width">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="index.php?">Trang chủ</a></li>
                                <li class="active"> Hoàn thành</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="nav-step">
                <div class="container">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
                        <div class="box-step">
                            <ul class="clearfix row" id="myTabs" role="tablist">
                                <li class="col-sm-4 col-xs-12 step1"> <a href="javascript://"> <span class="num-of-step">1</span> <span>Thông tin đơn hàng</span> </a></li>
                                <li class="col-sm-4 col-xs-12 step3 active"> <a href="javascript://"> <span class="num-of-step">2</span> <span>Hoàn thành</span> </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="box-payment bottom">
                    <div class="content-info-content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="success-box">
                                    <h3 class="title-success-order">Bạn đã đặt hàng thành công</h3>
                                    <p>Bạn có thể quản lý và kiểm tra đơn hàng của bạn tại <a href="index.php?option=account/information&userid=<?php echo $_REQUEST['userid'] ?>">Tài khoản của tôi</a>/ <a href="index.php?option=account/order&userid=<?php echo $_REQUEST['userid'] ?>">Đơn hàng của tôi</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</body>

</html>