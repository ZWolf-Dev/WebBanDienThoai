<?php

use App\Models\Slider;

$slider = new Slider(); // tạo đối tượng
$list = $slider->slider_list(['status' => 'index']);
$strparentid = '';
$strorders = '';

?>

<?php require_once('../views/backend/header.php'); ?>
<!-- Content Wrapper. Contains page content -->
<form name="form1" action="index.php?option=slider&cat=process" method="post">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="text-danger">THÊM Slider</h3>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=slider" class="btn btn-sm btn-success">
                                <i class="fas fa-undo-alt"></i> Quay về danh sách
                            </a>
                            <button name="THEM" type="submit" class="btn btn-sm btn-success">
                                <i class="fas fa-plus"></i>Lưu[Thêm]
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="md-3">
                                <label for="name">Tên slider</label>
                                <input name="data[name]" id="'name" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="link">Liên kết</label>
                                <input name="data[link]" id="link" type="text" class="form-control" required placeholder />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- <div class="md-3">
                        <label for="position">Vị trí</label>
                        <select name="data[position]" id="position" class="form-control">
                            <option value="0">Cấp cha</option>
                                <?php echo $strorders; ?>
                        </select>
                <div class="md-3">
                        <label for="orders">Sắp xếp</label>
                        <select name="data[orders]" id="orders" class="form-control">
                            <option value="0">Cấp cha</option>
                                <?php echo $strorders; ?>
                        </select> -->
                            <div class="md-3">
                                <label for="hinh">Hình</label>
                                <input name="data[img]" id="hinh" type="file" required />
                            </div>
                            <div class="md-3">
                                <label for="status">Trạng thái</label>
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