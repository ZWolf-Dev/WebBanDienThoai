<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="../public/images/Logo.png" type="image/x-icon" />
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../public/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="../public/css/jquery.dataTables.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../public/dist/css/adminlte.min.css">
  <!-- jQuery -->
  <script src="../public/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="../public/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../public/js/jquery.dataTables.min.js"></script>
  <!-- AdminLTE App -->
  <script src="../public/dist/js/adminlte.min.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="../public/dist/js/demo.js"></script>
</head>

<body class="hold-transition sidebar-mini">
  <!-- Site wrapper -->
  <div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="#" class="nav-link">Home</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="#" class="nav-link">Contact</a>
        </li>
      </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="#" class="brand-link">
        <img src="../public/images/users/Logo (3).png" alt="Admin Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Admin | HN Store</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <?php if (!isset($_SESSION['useradmin'])) { ?>
              <img src="../public/images/users/Logo (3).png" class="img-circle elevation-2 border border-dark border-5" alt="">
              <?php } else {
              if ($_SESSION['image'] != NULL) { ?>
                <img src="../public/images/users/<?php echo $_SESSION['image']; ?>" class="img-circle elevation-2 border border-dark border-5" alt="<?php echo $_SESSION['image']; ?>">
              <?php } else { ?>
                <img src="../public/images/users/user.png" class="img-circle elevation-2 border border-dark border-5" alt="">
            <?php }
            } ?>
          </div>
          <div class="info">
            <a href="#" class="d-block"><?php echo $_SESSION['name']; ?></a>
          </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
              <a href="#" class="nav-link">
              <i class="fas fa-jedi"></i>
                <p>
                  Sản Phẩm
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="index.php?option=product" class="nav-link">
                  <i class="fab fa-jedi-order"></i>
                    <p>Tất cả sản phẩm</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=product&cat=insert" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Thêm sản phẩm </p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=category" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Danh mục sản phẩm</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=brand" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Thương hiệu sản phẩm</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="fas fa-vihara"></i>
                <p>
                  Bài viết
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="index.php?option=post" class="nav-link">
                  <i class="fas fa-yin-yang"></i>
                    <p>Tất cả bài viết</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=post&cat=insert" class="nav-link">
                  <i class="fas fa-yin-yang"></i>
                    <p>Thêm bài viết </p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=topic" class="nav-link">
                  <i class="fas fa-yin-yang"></i>
                    <p>Chủ đề bài viết</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=page" class="nav-link">
                  <i class="fas fa-yin-yang"></i>
                    <p>Tất cả trang đơn</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="fas fa-x-ray"></i>
                <p>
                  Menu
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="index.php?option=menu" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Tất cả menu</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=menu&cat=insert" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Thêm menu </p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=menu" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Chi tiết danh mục</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
              <i class="fas fa-dragon"></i>
                <p>
                  Slider
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="index.php?option=slider" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Tất cả Slider</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=slider&cat=insert" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Thêm Slider </p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=slider" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Chi tiết danh mục</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="fas fa-users"></i>
                <p>
                  Thành viên và khách hàng
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="index.php?option=user" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Tất cả thành vien</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=user&cat=insert" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Thêm thành vien </p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=customer" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Tất cả khách hàng</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=customer&cat=insert" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Thêm khách hàng </p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=user" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Chi tiết thành vien</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
              <i class="fas fa-blender-phone"></i>
                <p>
                  Câu hỏi của khách hàng
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="index.php?option=contact" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Tất cả câu hỏi</p>
                  </a>
                </li>
                <!-- <li class="nav-item">
                  <a href="index.php?option=contact&cat=insert" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Thêm liên hệ </p>
                  </a>
                </li> -->
                <!-- <li class="nav-item">
                  <a href="index.php?option=contact" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Chi tiết thành vien</p>
                  </a>
                </li> -->
              </ul>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
              <i class="fab fa-first-order-alt"></i>
                <p>
                  Đơn hàng
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="index.php?option=order" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Tất cả đơn hàng</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=orderdetail" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Chi tiết đơn hàng</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="index.php?option=buy" class="nav-link">
                     <i class="fab fa-jedi-order"></i>
                    <p>Sản phẩm đã bán</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-header">LABELS</li>
            <li class="nav-item">
              <a href="logout.php" class="nav-link">
                <i class="nav-icon far fa-circle text-danger"></i>
                <p class="text">Đăng xuất</p>
              </a>
            </li>
          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>