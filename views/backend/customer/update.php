<?php

use App\Models\user;

$user = new user();
$id = $_REQUEST['id'];
$row = $user->users_row($id);


$list = $user->user_list(['status' => 'index']);
$strparentid = '';
$strorders = '';

?>

<?php require_once('../views/backend/header.php'); ?>
<!-- Content Wrapper. Contains page content -->
<form name="form 1" action="index.php?option=customer&cat=process" method="post" enctype="multipart/form-data">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger">THÊM KHÁCH HÀNG</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=customer" class="btn btn-sm btn-success">
                                <i class="fas fa-plus"></i>Quay về danh sách</a>
                            <button name="CAPNHAT" type="submit" class="btn btn-sm btn-success">
                                <i class="fas fa-plus"></i>Lưu[Thêm]</button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                <div class="row">
                        <div class="col-md-9">
                            <fieldset class="form-group">
                                <input name="id" value="<?php echo $row['id']; ?>" type="hidden" />
                                <label for="fullname">Họ và tên <span class="required">*</span></label>
                                <input name="data[fullname]" value="<?php echo $row['fullname']; ?>" id="'fullname" type="text" class="form-control" required placeholder="Nhập tên loại" />
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Tên đăng nhập <span class="required">*</span></label>
                                <input type="text" class="form-control form-control-lg" value="<?php echo $row['username']; ?>" name="data[username]" id="username" placeholder="Tên đăng nhập" required>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Mật khẩu <span class="required">*</span> </label>
                                <input type="password" class="form-control form-control-lg" value="<?php echo $row['password']; ?>" name="data[password]" id="password" placeholder="Mật khẩu" required>
                            </fieldset>
                            <fieldset class="form-group">
                                <label for="email">Email <span class="required">*</span></label>
                                <input name="data[email]" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" class="form-control form-control-lg" value="<?php echo $row['email']; ?>" id="email" placeholder="Email" required="">
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Giớ tính <span class="required">*</span></label>
                                <input type="text" pattern="[0-1]" class="form-control form-control-lg" value="<?php echo $row['gender']; ?>" name="data[gender]" id="gender" placeholder="Nữ nhập 0, Nam nhập 1" required>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Số điện thoại <span class="required">*</span></label>
                                <input placeholder="Số điện thoại" type="text" pattern="\d+" id="Phone" class="form-control form-control-comment form-control-lg" value="<?php echo $row['phone']; ?>" name="data[Phone]" Required>
                            </fieldset>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label for="hinh">Hinh</label>
                                <input name="img" id="img" type="file" />
                            </div>
                            <div class="md-3">
                                <label for="status">Sắp xếp</label>
                                <select name="data[status]" id="status" class="form-control">
                                    <option value="2">Chưa xuất bản</option>
                                    <option value="1">Xuất bản</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    Footer
                </div>
                <!-- /.card-footer-->
            </div>
            <!-- /.card -->

        </section>
        <!-- /.content -->
    </div>
</form>
<!-- /.content-wrapper -->

<?php require_once('../views/backend/footer.php'); ?>