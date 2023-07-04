       
<?php

use App\Models\Category;

$category = new Category();

$list = $category->category_list(['status' => 'index']);
$strcatid = '';
foreach ($list as $item) {
    $strcatid .= "<option value='" . $item['id'] . "'>" . $item['name'] . "</option>";
}
?>

<!DOCTYPE html>
<html>

<head>
    <link rel="icon" href="public/images/Logo.png" type="image/x-icon" />
    <link href="public/css/plugincss.css" rel="stylesheet" type="text/css" />
    <link href="public/css/main.scss.css" rel="stylesheet" type="text/css" />
    <link href="public/css/account_oder_style.scss.css" rel="stylesheet" type="text/css" />
</head>

<body>

    <div class="main-index">
        <section class="bread-crumb">
            <div class="container">
                <div class="row">
                    <div class="col-12 a-left">
                        <ul class="breadcrumb">
                            <li class="home">
                                <a href="index.php?"><span>Trang chủ</span></a>
                                <span class="mr_lr">&nbsp;/&nbsp;</span>
                            </li>
                            <li><strong><span>Đăng ký tài khoản</span></strong></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <div class="page-content-account">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 offset-lg-1 col-xl-8 offset-xl-2">
                        <div class="d-group">
                            <div class="left-col">
                                <div class="group-login group-log">
                                    <h1>
                                        Đăng ký tài khoản
                                    </h1>
                                    <form accept-charset="utf-8" action="index.php?option=account/process" id="customer_register" method="post" enctype="multipart/form-data">
                                        <input name="FormType" type="hidden" value="customer_register" />
                                        <input name="utf8" type="hidden" value="true" /><input type="hidden" id="Token-2f317d37ebc048729fcb80f06aeaefe7" name="Token" />
                                        <script src="public/js/api.js"></script>
                                        <script>
                                            grecaptcha.ready(function() {
                                                grecaptcha.execute("6Ldtu4IUAAAAAMQzG1gCw3wFlx_GytlZyLrXcsuK", {
                                                        action: "/account/register"
                                                    })
                                                    .then(function(token) {
                                                        document.getElementById("Token-2f317d37ebc048729fcb80f06aeaefe7").value = token
                                                    });
                                            });
                                        </script>

                                        <fieldset class="form-group">
                                            <label>Họ và tên <span class="required">*</span></label>
                                            <input type="text" class="form-control form-control-lg" value="" name="data[name]" id="name" placeholder="Họ và tên" required>
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <label>Email <span class="required">*</span></label>
                                            <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control form-control-lg" value="" name="data[email]" id="email" placeholder="Email" required="">
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <label>Số điện thoại <span class="required">*</span></label>
                                            <input placeholder="Số điện thoại" type="text" pattern="\d+" id="Phone" class="form-control form-control-comment form-control-lg" name="data[phone]" Required>
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <label>Tên đăng nhập <span class="required">*</span></label>
                                            <input type="text" class="form-control form-control-lg" value="" name="data[username]" id="username" placeholder="Tên đăng nhập" required>
                                        </fieldset>
                                        <fieldset class="form-group">
                                            <label>Mật khẩu <span class="required">*</span> </label>
                                            <input type="password" class="form-control form-control-lg" value="" name="password" id="password" placeholder="Mật khẩu" required>
                                        </fieldset>
                                        <!-- <fieldset class="form-group">
                                            <label>Xác nhận mật khẩu <span class="required">*</span> </label>
                                            <input type="confirmpassword" class="form-control form-control-lg" value="" name="confirmpassword" id="password" placeholder="Xác nhận mật khẩu" required>
                                        </fieldset> -->
                                        <fieldset class="form-group">
                                            <label>Địa chỉ <span class="required">*</span></label>
                                            <input type="address" class="form-control form-control-lg" value="" name="data[address]" id="address" placeholder="Địa chỉ" required>
                                        </fieldset>
                                        <div class="mb-3">
                                            <label for="hinh">Hinh</label>
                                            <input name="image" id="hinh" type="file" />
                                        </div>
                                        <fieldset class="form-group">
                                            <label>Giớ tính <span class="required">*</span></label>
                                            <input type="text" pattern="[0-1]" class="form-control form-control-lg" value="" name="data[gender]" id="gender" placeholder="Nữ nhập 0, Nam nhập 1" required>                    
                                        </fieldset>                                        
                                        <button name="REGISTER" class="btn-login" type="submit" value="Đăng ký">Đăng ký</button>
                                    </form>
                                    <div class="block social-login--facebooks">
                                        <p class="a-center">
                                            <span>Hoặc đăng nhập bằng</span>
                                        </p>
                                        <script>
                                            function loginFacebook() {
                                                var a = {
                                                        client_id: "947410958642584",
                                                        redirect_uri: "https://HNStore.net/account/facebook_account_callback",
                                                        state: JSON.stringify({
                                                            redirect_url: window.location.href
                                                        }),
                                                        scope: "email",
                                                        response_type: "code"
                                                    },
                                                    b = "https://www.facebook.com/v3.2/dialog/oauth" + encodeURIParams(a, !0);
                                                window.location.href = b
                                            }

                                            function loginGoogle() {
                                                var a = {
                                                        client_id: "997675985899-pu3vhvc2rngfcuqgh5ddgt7mpibgrasr.apps.googleusercontent.com",
                                                        redirect_uri: "https://HNStore.net/account/google_account_callback",
                                                        scope: "email profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile",
                                                        access_type: "online",
                                                        state: JSON.stringify({
                                                            redirect_url: window.location.href
                                                        }),
                                                        response_type: "code"
                                                    },
                                                    b = "https://accounts.google.com/o/oauth2/v2/auth" + encodeURIParams(a, !0);
                                                window.location.href = b
                                            }

                                            function encodeURIParams(a, b) {
                                                var c = [];
                                                for (var d in a)
                                                    if (a.hasOwnProperty(d)) {
                                                        var e = a[d];
                                                        null != e && c.push(encodeURIComponent(d) + "=" + encodeURIComponent(e))
                                                    } return 0 == c.length ? "" : (b ? "?" : "") + c.join("&")
                                            }
                                        </script>
                                        <a href="javascript:void(0)" class="social-login--facebook" onclick="loginFacebook()"><img width="129px" height="37px" alt="facebook-login-button" src="//bizweb.dktcdn.net/assets/admin/images/login/fb-btn.svg"></a>
                                        <a href="javascript:void(0)" class="social-login--google" onclick="loginGoogle()"><img width="129px" height="37px" alt="google-login-button" src="//bizweb.dktcdn.net/assets/admin/images/login/gp-btn.svg"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="right-col">
                                <h4>
                                    Quyền lợi với thành viên
                                </h4>
                                <div>
                                    <p>Vận chuyển siêu tốc</p>
                                    <p>Sản phẩm đa dạng </p>
                                    <p>Đổi trả dễ dàng</p>
                                    <p>Tích điểm đổi quà</p>
                                    <p>Được giảm giá cho lần mua tiếp theo lên đến 10% </p>
                                </div>
                                <a href="index.php?option=account/login" class="btn-register-default">Đăng nhập</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>