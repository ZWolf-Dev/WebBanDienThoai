<?php $search = $_POST['search'] ?? null; ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="public/css/bootstrap_css.css?1644978201978" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="public/cssm/ain.css">
    <link rel="stylesheet" href="public/css/navbar.css">
    <link rel="stylesheet" href="public/css/menu.css">
    <link rel="icon" href="public/images/Logo.png" type="image/x-icon" />
    <link rel="stylesheet" href="public/css/all.min.css">
    <link rel="stylesheet" href="public/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/css/headerbootstrap.min.css">
    <script src="public/js/bootstrap.bundle.min.js"></script>
    <script src="public/js/jquery.min.js"></script>
    <script src="public/js/headerbootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="public/css/formpage.css" />
    <style>
        body {
            background-image: url("public/images/Letterhead-Layer-2.png");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            opacity: 100%;
        }

        #home {
            background-image: url("public/images/maxresdefault.jpg");
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


<body>
    <section class="header bg-warning">
        <div class="container">
            <div class="row">
                <div class="col-md-3 mt-4" style="float:left; margin-top:1em;">
                    <a href="http://localhost/DACN/admin/index.php#"><img src="public/images/HNSTORE.jpg" class="img-fluid" style=" height:50px; width:100px;" alt="Logo"></a>
                </div>
                <div class="col-md-6 ">
                    <form class="d-flex mt-5" accept-charset="utf-8" action="index.php?option=search/search" method="post">
                        <input name="search" class="form-control me-2" value="<?= $search ?>" type="search" required placeholder="Tìm kiếm">
                        <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
                    </form>
                </div>
                <div class="col-md-3 text-right mt-4">
                    <div class="image" style="float:right;">
                        <?php if (!isset($_SESSION['useradmin'])) { ?>
                            <img src="public/images/users/Logo (3).png" class="img-circle elevation-2 border border-dark border-5" style="height:50px; width:50px;" alt="">
                            <?php } else {
                            if ($_SESSION['image'] != NULL) { ?>
                                <img src="public/images/users/<?php echo $_SESSION['image']; ?>" class="img-circle elevation-2 border border-dark border-5" style="height:50px; width:50px;" alt="<?php echo $_SESSION['image']; ?>">
                            <?php } else { ?>
                                <img src="public/images/users/Logo (3).png" class="img-circle elevation-2 border border-dark border-5" style="height:50px; width:50px;" alt="">
                        <?php }
                        } ?>
                        <div class="btn btn-end" style="max-width:200px;">
                            <?php if (isset($_SESSION['useradmin'])) { ?>
                                <a class="nav-link  btn btn-dark btn-block text-light" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><?php echo $_SESSION['name']; ?>&nbsp;&nbsp;<i class="fas fa-list"></i></a>
                                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                                    <li>
                                        <a href="index.php?option=account/information&userid=<?php echo $_SESSION['userid']; ?>" class="btn btn-light btn-block text-dark" style="margin-bottom:5px;"><i class="fas fa-user-edit"></i>&nbsp;Tài khoản</a>
                                        <a href="index.php?option=cart/cart" class="btn btn-light btn-block text-dark" style="margin-bottom:5px;" title="Giỏ hàng"> <i class="fab fa-opencart" style="font-size:15px;"></i> &nbsp; Giỏ hàng</a>
                                        <a href="index.php?option=account/logout" class="btn btn-light btn-block text-dark" style="margin-bottom:5px;"><i class="fas fa-sign-out-alt" style="font-size:15px;"></i>&nbsp; Đăng xuất</a>
                                    </li>
                                    <input name="userid" id="userid" value="<?php echo $_SESSION['userid']; ?>" type="hidden" />
                                    <input name="name" id="name" value="<?php echo $_SESSION['name']; ?>" type="hidden" />
                                </ul>
                            <?php } else { ?>
                                <a href="index.php?option=account/login" class="nav-link  btn btn-dark btn-block text-light"><i class="fas fa-user-circle"></i>&nbsp;&nbsp;<?php echo 'Đăng nhập'; ?></a>
                            <?php } ?>
                        </div>
                        <div class="evo-main-hotline text-end ">
                            <a href="tel:19006750" title="Gọi mua hàng:" class="text-danger"><span>Gọi mua hàng:</span>1900 6759</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!--section header-->
    <section id="navbars" class="mainmenu bg-dark" style="z-index:9000;">
        <div class="container">
            <nav class=" navbar-expand-lg navbar-light bg-mainmenu ">
                <?php require_once('views/frontend/mod_mainmenu.php'); ?>
            </nav>
        </div>
    </section>
    <!--section mainmenu-->

    <!-- script left-menu -->
    <script src="public/js/navbar.js"></script>