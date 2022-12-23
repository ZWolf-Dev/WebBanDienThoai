<?php

use App\Models\User;

$user = new User();

$userid = $_REQUEST['userid'];
$list_user = $user->user_list(['status' => 'index']);
?>
<!DOCTYPE html>
<html lang="en">
<?php require_once('views/frontend/header.php'); ?>

<!-- <head>
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="icon" href="public/images/Logo.png" type="image/x-icon" />
    <link rel="stylesheet" href="public/css/headerbootstrap.min.css">
</head> -->

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
                                <a class="title-info" href="index.php?option=account/order&userid=<?php echo $userid; ?>">Đơn hàng</a>
                            </li>
                            <li>
                                <a class="title-info" href="#">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <a class="title-info" href="index.php?option=account/buy&userid=<?php echo $userid; ?>">Sản phẩm đã mua</a>
                            </li>
                        </ul>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-lg-9 col-right-ac">
                    <h1 class="title-head margin-top-0">Đổi mật khẩu</h1>
                    <div class="row">
                        <div class="col-md-6 col-12">
                            <div class="page-account">
                                <form accept-charset="utf-8" action="/account/process.php" id="resetpassword" method="post">
                                    <p>
                                        Để đảm bảo tính bảo mật vui lòng đặt mật khẩu với ít nhất 8 kí tự
                                    </p>
                                    <div class="form-signup clearfix">
                                        <fieldset class="form-group">
                                            <label for="oldPass">Mật khẩu cũ <span class="error">*</span></label>
                                            <input type="password" name="OldPassword" id="OldPass" required class="form-control form-control-lg">
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <label for="changePass">Mật khẩu mới <span class="error">*</span></label>
                                            <input type="password" name="Password" id="changePass" required class="form-control form-control-lg">
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <label for="confirmPass">Xác nhận lại mật khẩu <span class="error">*</span></label>
                                            <input type="password" name="ConfirmPassword" id="confirmPass" required class="form-control form-control-lg">
                                        </fieldset>
                                        <button class="button btn-edit-addr btn btn-dark btn-more"><i class="hoverButton"></i>Đặt lại mật khẩu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </section>
</body>

<?php require_once('views/frontend/footer.php'); ?>