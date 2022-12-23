<?php
session_start();

use App\Models\User;

// $list = $user->user_list(['status'=> 'index']);
?>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập</title>
    <link rel="icon" href="public/images/Logo.png" type="image/x-icon" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="public/plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="public/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="public/dist/css/adminlte.min.css">
    <style>
        body {
            background-image: url("public/images/LGIT.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        #card {
            background-image: url("public/images/Letterhead-Layer-2.png");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>

<body class="hold-transition login-page">

    <?php
    if (isset($_POST['DANGNHAP'])) {
        $user = new User();
        $str_error = '';
        $username = $_POST['username'];
        $password = sha1($_POST['password']);
        if (filter_var($username, FILTER_VALIDATE_EMAIL)) {
            $data['email'] = $username;
        } else {
            $data['username'] = $username;
        }
        $data['status'] = 1;
        $row = $user->user_row($data);
        if ($row != null) {
            if ($password == $row['password']) {
                $_SESSION['useradmin'] = $username;
                $_SESSION['userid'] = $row['id'];
                $_SESSION['image'] = $row['image'];
                $_SESSION['name'] = $row['name'];
                $_SESSION['roles'] = $row['roles'];
                header("location:index.php?option=account/index");
            } else {
                $str_error = 'Mật khẩu không chính xác';
            }
        } else {
            $str_error = 'Tài khoản không tồn tại';
        }
    }
    ?>

    <div class="login-box">
        <div class="login-logo text-white">
            <b>ĐĂNG NHẬP</b>
        </div>
        <!-- /.login-logo -->
        <div id="login" class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Thông tin đăng nhập</p>

                <form id="form" action="" name="frm1" method="post">
                    <div class="input-group mb-3">
                        <input name="username" type="text" class="form-control" placeholder="Tên đăng nhập hoặc email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input name="password" type="password" class="form-control" placeholder="Mật khẩu">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button name="DANGNHAP" type="submit" class="btn btn-dark btn-block">Đăng nhập</button>
                        </div>
                        <!-- /.col -->
                    </div>
                    <div class="row">
                        <div class="col-12 text-red">
                            <?php echo isset($str_error) ? $str_error : ''; ?>
                        </div>
                    </div>
                </form>

                <div class="social-auth-links text-center mb-3">
                    <p>- OR -</p>
                    <a href="#" class="btn btn-block btn-primary">
                        <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
                    </a>
                    <a href="#" class="btn btn-block btn-danger">
                        <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
                    </a>
                </div>
                <!-- /.social-auth-links -->
                <div class="row">
                    <div class="col-md-7">

                        <p class="mb-1">
                            <a href="forgot-password.html">Tôi quên mật khẩu</a>
                        </p>
                        <p class="mb-0">
                            <a href="index.php?option=account/register" class="text-center">Đăng ký thành viên mới</a>
                        </p>
                    </div>
                    <div class="col-md-5"><a href="index.php?"><button type="submit" class="btn btn-dark btn-block">Trang chủ</button></a></div>
                </div>
            </div>

        </div>
    </div>

    <!-- jQuery -->
    <script src="../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/adminlte.min.js"></script>
</body>

</html>