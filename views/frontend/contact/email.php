<?php
    ini_set( 'display_errors', 1 );
    error_reporting( E_ALL );
    $from = "HNStore@gmail.com";  //$from – Email gửi từ.
    $to = $_POST['email'];                //$to – Email người nhận. 
    $subject = "Đăng ký nhận tin qua mail";    //$subject – Tiêu đề email
    $message = "Xin chào! Từ bây h bạn sẻ nhận được các tin tức mới nhất từ HN Store.";  //$message – Đây là chỗ bạn điền nội dung của email vào
    $headers = "Từ: HNSTORE " . $from ="/ Email: HNStore@gmail.com";                //$headers – Mỗi email có headers. Chúng bao gồm những thông tin như là email gửi từ, địa chỉ email để trả lời (reply-to address)
    mail($to,$subject,$message, $headers);
    // echo "The email message was sent.";
?>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Thông tin đơn hàng</title>
    <meta http-equiv="content-language" content="vie" />
    <meta property="og:url" content="" />
    <meta property="og:title" content="Thông tin đơn hàng" />
    <meta property="og:description" content="" />
    <meta property="og:image" content="" />
    <meta content="" name="description" />
    <meta content="" name="keywords" />


    <link rel="stylesheet" type="text/css" href="public/css/formbootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="public/css/formmain.css" />
    <link rel="stylesheet" type="text/css" href="public/css/formpage.css" />
    <link rel="icon" href="public/images/Logo.png" type="image/x-icon" />

    </script>

</head>

<body>
    <div id="main" class="nh-row">
            <div class="container">
                <div class="box-payment bottom">
                    <div class="content-info-content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="success-box">
                                    <h2 class="title-success-order">Bạn đã gửi email nhận tin thành công</h2>
                                    <h3>Bạn sẻ nhận được các tin tức mới nhất của chúng tôi</h3>
                                    <button class="btn btn-info btn-block" href="index.php?option=contact/contact"><a href="index.php?option=contact/contact">Thoát</a></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</body>

</html>