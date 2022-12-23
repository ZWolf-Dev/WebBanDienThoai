<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\User;
use App\Models\Order;
use App\Models\Orderdetail;

$user = new User();
$order = new Order(); // tạo đối tượng
$orderdetail = new Orderdetail(); // tạo đối tượng

$userid = $_REQUEST['userid'];
$list_user = $user->user_list(['status' => 'index']);
$list = $order->orders_list(['status' => 'index', 'userid' => $userid]);
$list_orderdetail = $orderdetail->orderdetails_list(['status' => 'index', 'userid' => $userid]);


?>
<!DOCTYPE html>
<html lang="en">

<?php require_once('views/frontend/header.php'); ?>

<body>
    <section class="signup page_customer_account" style="min-height:500px;">
        <span class="crumb-border"></span>
        <div class="row">
            <div class="col-xs-12 a-left">
                <ul class="breadcrumb list-unstyled">
                    <li class="home">
                        <a href="index.php?option=account/index"><span>Trang chủ</span></a>
                    </li>
                    <li><strong><span>Trang khách hàng</span></strong></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-lg-3 col-left-ac">
                    <div class="block-account">
                        <p>Xin chào, <span style="color:red;">
                                <?php foreach ($list_user as $row) : ?>
                                    <?php if ($row['id'] == $userid) : {
                                            echo $row['name'];
                                        }
                                    ?>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </span>&nbsp;!</p>
                        <ul>
                            <li>
                                <a disabled="disabled" class="title-info active" href="index.php?option=account/information&userid=<?php echo $userid ?>">Thông tin tài khoản</a>
                            </li>
                            <li>
                                <a class="title-info" href="#">Đơn hàng</a>
                            </li>
                            <li>
                                <a class="title-info" href="index.php?option=account/resetpassword&userid=<?php echo $userid; ?>">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <a class="title-info" href="index.php?option=account/buy&userid=<?php echo $userid; ?>">Sản phẩm đã mua</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-lg-9 col-right-ac">
                    <h1 class="title-head margin-top-0">Đơn hàng của bạn</h1>
                    <div class="form-signup name-account m992">
                        <div class="content-wrapper py-2">
                            <!-- Main content -->
                            <section class="content">
                                <table class="table table-bordered" id="myTable">
                                    <thead>
                                        <tr>
                                            <th class="text-center" style="width:20px;">#</th>
                                            <th class="text-center">Mã đơn hàng</th>
                                            <th class="text-center">Tên người nhận</th>
                                            <th class="text-center">Ghi chú</th>
                                            <th class="text-center">Địa chỉ người nhận</th>
                                            <th class="text-center">Số điện thoại người nhận</th>
                                            <th class="text-center">Email người nhận</th>
                                            <th class="text-center">Giá</th>
                                            <th class="text-center">Số lượng</th>
                                            <th class="text-center">Tình trạng</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php foreach ($list as $row) : ?>
                                            <tr>
                                                <td class="text-center">
                                                    <input name="checkid" type="checkbox" />
                                                </td>
                                                <td><?php echo $row["id"]; ?></td>
                                                <td><?php echo $row["name"]; ?></td>
                                                <td><?php echo $row["note"]; ?></td>
                                                <td><?php echo $row["address"]; ?></td>
                                                <td><?php echo $row["phone"]; ?></td>
                                                <td><?php echo $row["email"]; ?></td>
                                                <?php foreach ($list_orderdetail as $order) : endforeach; ?>
                                                <td><?php echo $order["price"]; ?></td>
                                                <td><?php echo $order["quantity"]; ?></td>
                                                <?php if ($row["status"] != 1) { ?>
                                                    <td>Đang vận chuyển</td>
                                                <?php } else { ?>
                                                    <td>Đã giao thành công</td>
                                                <?php } ?>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </section>
                            <!-- /.content -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<?php require_once('views/frontend/footer.php'); ?>