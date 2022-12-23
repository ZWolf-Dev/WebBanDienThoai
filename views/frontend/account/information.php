<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\User;

$user = new User();

$userid = $_REQUEST['userid'];
$list_user = $user->user_list(['status' => 'index']);

?>
<?php require_once('views/frontend/header.php'); ?>

<head>
    <style>
        .image-upload>input {
            display: none;
        }
    </style>
</head>

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
                                <a disabled="disabled" class="title-info active" href="#">Thông tin tài khoản</a>
                            </li>
                            <li>
                                <a class="title-info" href="index.php?option=account/order&userid=<?php echo $userid; ?>">Đơn hàng</a>
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
                    <h1 class="title-head margin-top-0">Thông tin tài khoản</h1>
                    <div class="form-signup name-account m992">
                        <form accept-charset="utf-8" action="index.php?option=account/process" id="customer_register" method="post" enctype="multipart/form-data">
                            <input name="userid" id="userid" value="<?php echo $userid; ?>" type="hidden" />
                            <?php foreach ($list_user as $row) : ?>
                                <?php if ($row['id'] == $userid) : {
                                ?>
                                        <p><strong>Ảnh đại diện:</strong> <?php if (!isset($_SESSION['useradmin'])) { ?>
                                        <div class="image-upload">
                                            <label for="file-input">
                                                <img src="public/images/users/Logo (3).png" class="img-circle elevation-2 border border-dark border-5" style="height:50px; width:50px;" alt="">
                                            </label>
                                            <input id="file-input" name="image" type="file" />
                                        </div>
                                        <?php } else {
                                                                                if ($_SESSION['image'] != NULL) { ?>
                                            <div class="image-upload">
                                                <label for="file-input">
                                                    <img src="public/images/users/<?php echo $_SESSION['image']; ?>" class="img-circle elevation-2 border border-dark border-5" style="height:50px; width:50px;" alt="<?php echo $_SESSION['image']; ?>">
                                                </label>
                                                <input id="file-input" name="image" type="file" />
                                            </div>
                                        <?php } else { ?>
                                            <div class="image-upload">
                                                <label for="file-input">
                                                    <img src="public/images/users/Logo (3).png" class="img-circle elevation-2 border border-dark border-5" style="height:50px; width:50px;" alt="">
                                                </label>
                                                <input id="file-input" name="image" type="file" />
                                            </div>
                                    <?php }
                                                                            } ?>
                                    </p>
                                    <button name="AVATAR" class="btn-login btn-success" type="submit">Lưu Avatar</button>
                        </form>
                        <p><strong>Họ tên:</strong> <?php echo $row['name']; ?></p>
                        <p> <strong>Email:</strong> <?php echo $row['email']; ?> </p>
                        <p><strong>Giới tính:</strong> <?php if ($row['gender'] == 0) {
                                                            echo 'Nam';
                                                        } else {
                                                            echo 'Nữ';
                                                        } ?></p>
                        <p><strong>Địa chỉ:</strong> <?php echo $row['address']; ?></p>
                        <p> <strong>SĐT:</strong> <?php echo $row['phone']; ?> </p>
                    <?php
                                    }
                    ?>
                <?php endif; ?>
            <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

<?php require_once('views/frontend/footer.php'); ?>