<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\Product;
use App\Models\Category;
use App\Models\Productdetail;
use App\Models\User;

require_once('views/frontend/header.php');
$product = new Product();
$category = new Category();
$productdetail = new Productdetail();
$user = new User();

$id = $_REQUEST['id'];
$rowuser = $user->users_row($_SESSION['userid']);
$quantity = $_REQUEST['quantity'];
$pricesale = $_REQUEST['pricesale'] * $quantity;

$row = $product->product_row($id);
$pro = $productdetail->productdetail_row($row['productdetailid']);

$list = $category->category_list(['status' => 'index']);
$strcatid = '';
foreach ($list as $item) {
    if ($row['categoryid'] == $item['id']) {
        $strcatid .= "<option selected value='" . $item['id'] . "'>" . $item['name'] . "</option>";
    } else {
        $strcatid .= "<option value='" . $item['id'] . "'>" . $item['name'] . "</option>";
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <style>
        /* order-detail dưới */
        .card ul.nav.nav-tabs li {
            width: 50%;
            text-align: center;
            margin: 0;
        }

        .box-cart-left>.card>.nav-tabs>li.active>a {
            border-width: 0;
            border: none;
            color: #ef2b2b !important;
            background: transparent;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .box-cart-left .box-cont,
        .box-cart-left>.card>.tab-content {
            padding: 40px 30px;
        }

        .box-cart-left>.card>.tab-content .form-group {
            margin-bottom: 20px;
        }

        .title_style4 h3 {
            font-size: 16px;
            color: #383838;
            font-weight: bold;
            text-transform: uppercase;
            display: block;
            margin: 0 0 10px;
            padding: 16px 0px;
            position: relative;
        }

        #list-method ul.nav.nav-tabs li {
            width: 100%;
            margin-bottom: 20px;
        }

        .nav-tabs-bank>.nav-tabs>li>a {
            border-radius: 0 !important;
            text-align: center;
            margin: 0;
            display: block;
            padding: 20px 8px;
            padding-bottom: 49px !important;
            border: 1px solid #ddd;
        }

        .nav-tabs-bank>.nav-tabs>li>a>img {
            width: auto;
            height: 30px;

            display: inline-block;
        }

        .nav-tabs-bank>.nav-tabs>li>a>input {
            position: absolute;
            opacity: 0;
        }

        .nav-tabs-bank .nav-tabs>li>a>span {
            display: block;
            border: 0;
            border-radius: 0;
            color: #555;
            margin-bottom: 15px;
            overflow: hidden;
            height: 40px;
            text-align: left;
            line-height: 30px;
            float: right;
            width: calc(100% - 50px);
            font-weight: 500;
        }

        .box-cart-left>.card .button-cart {
            margin: 0;
            width: 100%;
            clear: both;
        }

        .box-cart-left>.card>.tab-content {
            padding: 20px
        }

        .box-cart-left>.card {
            background: #f8f8f8 none repeat scroll 0% 0%;
            box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);
            margin-bottom: 30px;
        }

        .scrollbar {
            float: left;
            max-height: 300px;
            width: 100%;
            overflow-y: auto;
        }

        #style-3::-webkit-scrollbar-track {

            background-color: #F5F5F5;
        }

        #style-3::-webkit-scrollbar {
            width: 6px;
        }

        #style-3::-webkit-scrollbar-thumb {
            background-color: #1e1e1e;

        }

        body {
            font-family: 'Quicksand', sans-serif;
            font-weight: 400;
            line-height: 1.68;
            color: #888;
        }

        a {
            color: #333;
        }

        a,
        span,
        i {
            -webkit-transition: all 0.25s ease 0s;
            -o-transition: all 0.25s ease 0s;
            transition: all 0.25s ease 0s;
        }

        ul {
            list-style: none;
        }

        .headerSection-1 {
            padding-top: 30px;
            padding-bottom: 30px;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        .h1,
        .h2,
        .h3,
        .h4,
        .h5,
        .h6 {
            margin-top: 0;
            color: #333;
            font-weight: bold;
            line-height: 1.42857;
        }
    </style>
</head>

<body>
    <div id="main" class="nh-row">
        <div id="order-info">
            <div class="full-width">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <ol class="breadcrumb">
                                <li><a href="index.php?">Trang chủ</a></li>
                                <li class="active"> Thông tin đơn hàng</li>
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
                                <li class="col-sm-4 col-xs-12 step1 active"> <a href="javascript://"> <span class="num-of-step">1</span> <span>Thông tin đơn hàng</span> </a></li>
                                <li class="col-sm-4 col-xs-12 step3"> <a href="javascript://"> <span class="num-of-step">2</span> <span>Hoàn thành</span> </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="box-payment bottom">
                    <div class="row">
                        <form accept-charset="utf-8" action="index.php?option=cart/process&addcat=<?php echo $id; ?>" id="customer_order" method="post">
                            <div class="col-md-12 col-sm-7 col-xs-12 box-cart-left">
                                <div class="card bg-cart">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"> <a href="#diachi-giaohang" aria-controls="diachi-giaohang" role="tab" data-toggle="tab"> Địa chỉ
                                                giao hàng </a></li>
                                        <li role="presentation" class="active"> <a href="#diachi-giaohang" aria-controls="diachi-giaohang" role="tab" data-toggle="tab"> Phương
                                                thức thanh toán </a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="diachi-giaohang">
                                            <div id="form-add-address" class="row-md-12">
                                                <input name="buydata[categoryid]" value="<?php echo $row['categoryid']; ?>" type="hidden" />
                                                <input name="buydata[brandid]" value="<?php echo $row['brandid']; ?>" type="hidden" />
                                                <input name="price" id="price" value="<?php echo $row['price']; ?>" type="hidden" />
                                                <input name="userid" value="<?php echo $_SESSION['userid']; ?>" type="hidden" />
                                                <input name="status" value="<?php echo $row['status']; ?>" type="hidden" />
                                                <div class="col-md-6  col-xs-12">
                                                    <div class="form-group">
                                                        <input name="data[name]" id="name" class="form-control" placeholder="Họ và tên" value="<?php echo $rowuser['name']; ?>" required="" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input name="data[email]" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" id="email" class="form-control form-control-lg" placeholder="Email" value="<?php echo $rowuser['email']; ?>" required="" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input name="data[note]" id="note" class="form-control form-control-lg" placeholder="Ghi chú" value="" required="" />
                                                    </div>
                                                    <div class="form-group">
                                                        <select id="address" style="height: 2.5em;" name="address" class="chosen-select form-control required ">
                                                            <option value="<?php echo $rowuser['address']; ?>"><?php echo $rowuser['address']; ?></option>
                                                            <option value="Hà Nội">Hà Nội</option>
                                                            <option value="Hà Giang">Hà Giang</option>
                                                            <option value="Cao Bằng">Cao Bằng</option>
                                                            <option value="Bắc Kạn">Bắc Kạn</option>
                                                            <option value="Tuyên Quang">Tuyên Quang</option>
                                                            <option value="Lào Cai">Lào Cai</option>
                                                            <option value="Điện Biên">Điện Biên</option>
                                                            <option value="Lai Châu">Lai Châu</option>
                                                            <option value="Sơn La">Sơn La</option>
                                                            <option value="Yên Bái">Yên Bái</option>
                                                            <option value="Hòa Bình">Hòa Bình</option>
                                                            <option value="Thái Nguyên">Thái Nguyên</option>
                                                            <option value="Lạng Sơn">Lạng Sơn</option>
                                                            <option value="Quảng Ninh">Quảng Ninh</option>
                                                            <option value="Bắc Giang">Bắc Giang</option>
                                                            <option value="Phú Thọ">Phú Thọ</option>
                                                            <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                                            <option value="Bắc Ninh">Bắc Ninh</option>
                                                            <option value="Hải Dương">Hải Dương</option>
                                                            <option value="Hải Phòng">Hải Phòng</option>
                                                            <option value="Hưng Yên">Hưng Yên</option>
                                                            <option value="Thái Bình">Thái Bình</option>
                                                            <option value="Hà Nam">Hà Nam</option>
                                                            <option value="Nam Định">Nam Định</option>
                                                            <option value="Ninh Bình">Ninh Bình</option>
                                                            <option value="Thanh Hóa">Thanh Hóa</option>
                                                            <option value="Nghệ An">Nghệ An</option>
                                                            <option value="Hà Tĩnh">Hà Tĩnh</option>
                                                            <option value="Quảng Bình">Quảng Bình</option>
                                                            <option value="Quảng Trị">Quảng Trị</option>
                                                            <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                                                            <option value="Đà Nẵng">Đà Nẵng</option>
                                                            <option value="Quảng Nam">Quảng Nam</option>
                                                            <option value="Quảng Ngãi">Quảng Ngãi</option>
                                                            <option value="Bình Định">Bình Định</option>
                                                            <option value="Phú Yên">Phú Yên</option>
                                                            <option value="Khánh Hòa">Khánh Hòa</option>
                                                            <option value="Ninh Thuận">Ninh Thuận</option>
                                                            <option value="Bình Thuận">Bình Thuận</option>
                                                            <option value="Kon Tum">Kon Tum</option>
                                                            <option value="Gia Lai">Gia Lai</option>
                                                            <option value="Đắk Lắk">Đắk Lắk</option>
                                                            <option value="Đắk Nông">Đắk Nông</option>
                                                            <option value="Lâm Đồng">Lâm Đồng</option>
                                                            <option value="Bình Phước">Bình Phước</option>
                                                            <option value="Tây Ninh">Tây Ninh</option>
                                                            <option value="Bình Dương">Bình Dương</option>
                                                            <option value="Đồng Nai">Đồng Nai</option>
                                                            <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                                            <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                                                            <option value="Long An">Long An</option>
                                                            <option value="Tiền Giang">Tiền Giang</option>
                                                            <option value="Bến Tre">Bến Tre</option>
                                                            <option value="Trà Vinh">Trà Vinh</option>
                                                            <option value="Vĩnh Long">Vĩnh Long</option>
                                                            <option value="Đồng Tháp">Đồng Tháp</option>
                                                            <option value="An Giang">An Giang</option>
                                                            <option value="Kiên Giang">Kiên Giang</option>
                                                            <option value="Cần Thơ">Cần Thơ</option>
                                                            <option value="Hậu Giang">Hậu Giang</option>
                                                            <option value="Sóc Trăng">Sóc Trăng</option>
                                                            <option value="Bạc Liêu">Bạc Liêu</option>
                                                            <option value="Cà Mau">Cà Mau</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <input name="addressdetail" id="addressdetail" class="form-control" placeholder="Địa chỉ cụ thể" value="" required="" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input name="data[phone]" pattern="\d+" id="phone" class="form-control" placeholder="Số điện thoại" value="<?php echo $rowuser['phone']; ?>" required="" />
                                                    </div>
                                                </div>
                                                <div id="list-method" class="nav-tabs-bank col-sm-6 col-xs-12" style=" left: 120px; ">
                                                    <ul class="nav nav-tabs" role="tablist" required="">
                                                        <li class="payment_method_item"> <a href="javascript://">
                                                                <img src="public/images/COD.png"> <input id="COD" type="radio" value="COD" checked name="value[payment]" data-sub="">
                                                                <span for="item-1" class="name-tabs txt-upper">
                                                                    thanh toán trực tiếp </span> </a></li>
                                                        <li class="payment_method_item"> <a href="javascript://">
                                                                <img src="public/images/ATM.png"> <input id="ATM" type="radio" value="ATM" name="value[payment]" data-sub=""> <span for="item-2" class="name-tabs txt-upper">
                                                                    Thanh toán chuyển khoản </span> </a></li>
                                                        <li class="payment_method_item"> <a href="javascript://">
                                                                <img src="public/images/PAYPAL.png"> <input id="PAYPAL" type="radio" value="PAYPAL" name="value[payment]" data-sub=""> <span for="item-3" class="name-tabs txt-upper">
                                                                    Thanh toán Paypal </span> </a></li>
                                                        <li class="payment_method_item"> <a href="javascript://">
                                                                <img src="public/images/ONEPAY.png"> <input id="ONEPAYND" type="radio" value="ONEPAYND" name="value[payment]" data-sub="domestic">
                                                                <span for="item-4" class="name-tabs txt-upper">
                                                                    Onepay Nội địa
                                                                </span> </a></li>
                                                        <li class="payment_method_item"> <a href="javascript://">
                                                                <img src="public/images/ONEPAY.png"> <input id="ONEPAYQT" type="radio" value="ONEPAYQT" name="value[payment]" data-sub="international">
                                                                <span for="item-5" class="name-tabs txt-upper">
                                                                    Onepay Quốc tế
                                                                </span> </a></li>
                                                    </ul>
                                                </div>
                                                <div class="button-cart text-center">
                                                    <button class="btn btn-main btn-danger txt-upper btn-cancel" name="ORDER" type="submit" style="border: 0px;"> Tiếp tục thanh toán</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card col-xs-12" style="padding: 0;">
                                <div class="box-cont  clearfix row">
                                    <div class="col-md-6 col-sm-5 col-xs-12 ">
                                        <div class="box-cart-right clearfix">
                                            <div class="title_style4">
                                                <h3>Thông tin đơn hàng</h3>
                                            </div>
                                            <div class="scrollbar md-6" id="style-3">
                                                <div class="force-overflow list-products-order">
                                                    <img src="public/images/products/<?php echo $row['image']; ?>" class="img-fluid" alt="<?php echo $row['image']; ?>">
                                                    <input name="image" value="<?php echo $row['image']; ?>" hidden />
                                                </div>
                                            </div>
                                            <h4 class="media-heading" style="color: red;"> <input style="border: 0px;" name="buydata[name]" id="name" style="color: red; width:350px;" class="text-center" value="<?php echo $row['name']; ?>" type="text"></h4>
                                            <div id="collapse0" class="panel-collapse collapse show text-center">
                                                <p><strong>Số lượng:&nbsp;</strong><input style="border: 0px;" name="quantity" id="quantity" value="<?php echo $quantity; ?>" /></p>
                                                <p><strong>Tổng cộng:&nbsp;</strong><input style="border: 0px;" id="pricesale" value="<?php echo $pricesale; ?>" />đ</p>
                                                <p><strong>Vận chuyển:&nbsp;</strong><input style="border: 0px; color: red;" name="value[ship]" value="Miễn phí" /></p>
                                                <p><strong>Thành tiền:&nbsp;</strong><input style="border: 0px; text-left" name="pricesale" id="price" value="<?php echo $pricesale; ?>" />đ</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-5 col-xs-12 ">
                                        <div class="box-cart-right clearfix">
                                            <div class="title_style4">
                                                <h3>Chi tiết sản phẩm</h3>
                                            </div>
                                            <div id="collapse0" class="panel-collapse collapse show ">
                                                <p><strong>Trọng lượng:&nbsp;</strong><?php echo $pro['Trong_luong']; ?> </p>
                                                <p><strong>Kích Thước:&nbsp;</strong><?php echo $pro['Kich_thuoc']; ?> </p>
                                                <p><strong>Âm thanh:</strong>&nbsp;<?php echo $pro['Am_thanh']; ?> </p>
                                                <p><strong>Bộ nhớ:</strong>&nbsp;<?php echo $pro['Bo_nho']; ?> </p>
                                                <p><strong>Hệ điều hành:&nbsp;</strong><?php echo $pro['He_dieu_hanh']; ?> </p>
                                                <p><strong>Thẻ nhớ:&nbsp;</strong><?php echo $pro['The_nho']; ?> </p>
                                                <p><strong>Camera:&nbsp;</strong><?php echo $pro['Camera']; ?> </p>
                                                <p><strong>Pin:&nbsp;</strong><?php echo $pro['Pin']; ?> </p>
                                                <p><strong>Bảo hành:&nbsp;</strong><?php echo $pro['Bao_hanh']; ?> </p>
                                                <p><strong>Kết nối:&nbsp;</strong><?php echo $pro['Ket_noi']; ?> </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
<?php require_once('views/frontend/footer.php'); ?>