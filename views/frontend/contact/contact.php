<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');



require_once('views/frontend/header.php'); ?>
<style>
    /* contact */
.footer-container .news-letter .wrap-news-letter {
    border-top: 1px solid #e6e9ec;
    padding: 40px 0
}
.footer-container .news-letter .wrap-news-letter .block-subscribe-footer form .newsletter-content .input-box input {
    padding-right: 115px;
    border-radius: 25px;
    -moz-border-radius: 25px;
    -webkit-border-radius: 25px;
    padding-left: 30px;
    height: 44px;
    font-size: 100%;
    border: 1px solid #e5e5e5;
    line-height: 1.66;
    background-color: #fff;
    margin-bottom: 0
}
.footer-container .news-letter .wrap-news-letter .block-subscribe-footer form .newsletter-content .action-button {
    position: absolute;
    top: 0;
    right: 0
}
.footer-container .news-letter .wrap-news-letter .block-subscribe-footer form .newsletter-content .action-button button {
    border-radius: 25px;
    -moz-border-radius: 25px;
    -webkit-border-radius: 25px;
    background-color: #ff3c58;
    width: auto;
    margin: 0;
    cursor: pointer;
    height: 44px;
    line-height: 44px;
    white-space: nowrap;
    text-transform: uppercase;
    text-decoration: none;
    border: none;
    padding: 0 20px;
    color: #fff
}
.footer-container .news-letter .wrap-news-letter .follow-us {
    text-align: right
}
.footer-container .news-letter .wrap-news-letter .follow-us .title-social {
    display: inline-block;
    vertical-align: middle;
    text-transform: uppercase;
    color: #222;
    margin-right: 40px;
    font-size: 18px;
    font-weight: 500
}
.footer-container .news-letter .wrap-news-letter .follow-us .social {
    display: inline-block;
    vertical-align: middle
}


</style>
<body>
    <section class="page margin-top-30 margin-bottom-30">
        <ul class="breadcrumb align-items-center pl-0 pr-0 m-0">
            <li class="font-weight-bold">
                <a href="index.php?" title="HN Store">Trang chủ</a>
            </li>
            <li class="font-weight-bold"> Liên hệ</li>
        </ul>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="widget-item info-contact in-fo-page-content">
                            <h1 class="title-head">Thông tin liên hệ</h1>
                            <!-- End .widget-title -->
                            <ul class="widget-menu contact-info-page">
                                <li>
                                    Bạn có thể tìm mua các loại điện thoại di động máy tính bảng hiện đại, đẹp với đa dạng thương hiệu tại trang HN Store. Không
                                    chỉ giao đến tận tay bạn những sản phẩm chính hãng, chất lượng mà HN Store còn có rất
                                    nhiều các chương trình khuyến mãi hấp dẫn.
                                </li>

                                <li><i class="fa fa-map-marker" aria-hidden="true"></i> Địa chỉ: XXX - P PHƯỚC LONG B - TP
                                    THỦ ĐỨC</li>
                                <li><i class="fa fa-phone" aria-hidden="true"></i> <a href="tel:19006750" title="19006759">1900 6759</a></li>
                                <li><i class="fa fa-envelope" aria-hidden="true"></i> <a href="mailto:support@hnstore.vn" title="support@HN Store.vn">support@hnstore.vn</a></li>

                            </ul>
                            <!-- End .widget-menu -->
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="page-login">
                            <h3 class="title-head">Gửi thông tin</h3>
                            <span class="text-contact margin-bottom-10 block">Bạn hãy điền nội dung tin nhắn vào form dưới
                                đây và gửi cho chúng tôi. Chúng tôi sẽ trả lời bạn sau khi nhận được.</span>
                            <form accept-charset="utf-8" action="index.php?option=contact/process" id="customer_contact" method="post">
                                <input name="userid" id="userid" value="<?php echo $_SESSION['userid']; ?>" type="hidden" />
                                <div class="form-signup clearfix">
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <fieldset class="form-group">
                                                <label>Họ và tên <span class="required">*</span></label>
                                                <input type="text" class="form-control form-control-lg" value="" name="data[name]" id="fullname" placeholder="Họ và tên" required>
                                            </fieldset>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <fieldset class="form-group">
                                                <label>Email <span class="required">*</span></label>
                                                <input type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control form-control-lg" value="" name="data[email]" id="email" placeholder="Email" required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-sm-12 col-xs-12">
                                            <fieldset class="form-group">
                                                <label>Số điện thoại <span class="required">*</span></label>
                                                <input placeholder="Số điện thoại" type="text" pattern="\d+" id="Phone" class="form-control form-control-comment form-control-lg" name="data[phone]" Required>
                                            </fieldset>
                                        </div>
                                        <div class="col-sm-12 col-xs-12">
                                            <fieldset class="form-group">
                                                <label>Tiêu đề<span class="required">*</span></label>
                                                <input type="text" name="data[title]" id="title" class="form-control form-control-lg" rows="5" data-validation-error-msg="Không được để trống" data-validation="required" required>
                                            </fieldset>
                                        </div>
                                        <div class="col-sm-12 col-xs-12">
                                            <fieldset class="form-group">
                                                <label>Chi tiết<span class="required">*</span></label>
                                                <input type="text" name="data[content]" id="detail" class="form-control form-control-lg" rows="5" data-validation-error-msg="Không được để trống" data-validation="required" required>
                                            </fieldset>
                                            <div class="pull-xs-center" style="margin-bottom:30px;">
                                                <button name="CONTACT" class="btn btn-dark btn-block btn-style btn-style-active" style="height:40px; width:100px;" type="submit" value="Gửi tin nhắn">Gửi tin nhắn</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md">
                        <div id="map" style="max-width:1400px;height:500px;">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15674.548258510302!2d106.78245435!3d10.839061800000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752701cbacce21%3A0xc55b53936092d0e1!2zS1RYIFRyxrDhu51uZyBDYW8gxJHhurNuZyBDw7RuZyBUaMawxqFuZyBUUC5IQ00!5e0!3m2!1svi!2s!4v1652948927304!5m2!1svi!2s" width="1200" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        <footer class="footer-container">
            <div class="container news-letter">
                <div class="wrap-news-letter">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                            <div class="content-block">
                                <h3 class="title-block">Đăng ký nhận tin</h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-8 col-xs-12">
                            <div class="content-block">
                                <div class="block-subscribe-footer">
                                    <form class="form subscribe" action="index.php?option=contact/email" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" target="_blank">
                                        <div class="newsletter-content">
                                            <div class="input-box">
                                                <input name="email" type="email" id="newsletter" value="" placeholder="Nhập địa chỉ Email" required>
                                            </div>
                                            <div class="action-button">
                                                <button class="NHANTIN" title="Đăng ký" type="submit">
                                                    <span>Đăng ký</span>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                            <div class="content-block follow-us">
                                <span class="title-social">Theo dõi</span>
                                <ul class="social">
                                    <a href="#" target="_blank" class="position-relative iso sitdown modal-open d-inline-block facebook mr-1" title="Facebook">
                                        <img src="public/images/facebook.png" alt="facebook">
                                    </a>
                                    <a href="#" target="_blank" class="position-relative iso sitdown modal-open d-inline-block twitter mr-1" title="Twitter">
                                        <img src="public/images/twitter.png" alt="twitter">
                                    </a>
                                    <a href="#" target="_blank" class="position-relative iso sitdown modal-open d-inline-block instagram mr-1" title="Instagram+">
                                        <img src="public/images/instagram.png" alt="instagram">
                                    </a>
                                    <a href="#" target="_blank" class="position-relative iso sitdown modal-open d-inline-block youtube mr-1" title="Youtube">
                                        <img src="public/images/youtube.png" alt="youtube">
                                    </a>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </footer>
    </section>
</body>

<?php require_once('views/frontend/footer.php'); ?>