<?php

use App\Models\Slider;

$slider = new Slider();
$id = $_REQUEST['id'];
$row = $slider->slider_row($id);

$list = $slider->slider_list(['status' => 'index']);
$strparentid = '';
$strorders = '';
// foreach($list as $item)
// {
//     $strparentid .="<option value='" . $item['id'] . "'>" . $item['name'] . "</option>";
//     $strorders .="<option value='" . $item['orders'] . "'>Sau: " . $item['name'] . "</option>";
// }
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
                            <strong class="text-danger">THÊM slider</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=slider" class="btn btn-sm btn-success">
                                <i class="fas fa-undo-alt"></i> Quay về danh sách
                            </a>
                            <button name="CAPNHAT" type="submit" class="btn btn-sm btn-success">
                                <i class="fas fa-plus"></i>Lưu[Cập nhật]
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="md-3">
                                <input name="id" value="<?php echo $row['id']; ?>" type="hidden" />
                                <label for="name">Tên slider</label>
                                <input name="data[name]" value="<?php echo $row['name']; ?>" id="'name" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="link">Liên kết</label>
                                <input name="data[link]" value="<?php echo $row['link']; ?>" id="link" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="position">Vị trí</label>
                                <input name="data[position]" value="<?php echo $row['position']; ?>" id="position" type="text" class="form-control" required placeholder />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="md-3">
                                <label for="hinh">Hình</label>
                                <input name="img" id="hinh" type="file" />
                            </div>
                            <div class="md-3">
                                <label for="status">Trạng thái</label>
                                <select name="data[status]" id="status" class="form-control">
                                    <option value="2" <?php echo ($row['status'] == 2) ? 'selected' : ''; ?>>Chưa xuất bản</option>
                                    <option value="1" <?php echo ($row['status'] == 1) ? 'selected' : ''; ?>>Xuất bản</option>
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