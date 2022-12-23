<?php
session_start();
require_once("../vendor/autoload.php");

use App\Models\User;
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập</title>
    <link rel="icon" href="../public/images/Logo.png" type="image/x-icon" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../public/plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../public/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../public/dist/css/adminlte.min.css">
    <style>
        body {
            background-image: url("../public/images/LoginAdmin.png");
        }
        #login {
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
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
                if ($row['roles'] == 0) {
                    $str_error = 'Tài khoản của bạn không phải là tài khoản Admin nên không có quyền truy cập.';
                } else {
                    header("location: index.php");
                }
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
                <p class="login-box-msg">Đăng Nhập Trang Admin</p>

                <form action="" name="frm1" method="post">
                    <div class="input-group mb-3">
                        <input name="username" type="text" class="form-control" required placeholder="Tên đăng nhập hoặc email admin">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input name="password" type="password" class="form-control" required placeholder="Mật khẩu admin">
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
            </div>
        </div>
    </div>

</html>