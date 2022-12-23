<?php

use App\Models\Menu;

$menu = new Menu();
$id = $_REQUEST['id'];
$row = $menu->menu_row($id);

$list = $menu->menu_list(['status' => 'index']);
$strparentid = '';
$strorders = '';
foreach ($list as $item) {
    if ($row['parentid'] == $item['id']) {
        $strparentid .= "<option selected value='" . $item['id'] . "'>" . $item['name'] . "</option>";
    } else {
        $strparentid .= "<option value='" . $item['id'] . "'>" . $item['name'] . "</option>";
    }
    if ($row['orders'] == $item['orders']) {
        $strorders .= "<option selected value='" . $item['orders'] . "'>Sau: " . $item['name'] . "</option>";
    } else {
        $strorders .= "<option value='" . $item['orders'] . "'>Sau: " . $item['name'] . "</option>";
    }
}
?>
<?php require_once('../views/backend/header.php'); ?>
<!-- Content Wrapper. Contains page content -->
<form name="form1" action="index.php?option=menu&cat=process" method="post">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger">THÊM menu</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=menu" class="btn btn-sm btn-success">
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
                                <label for="name">Họ và tên</label>
                                <input name="data[name]" value="<?php echo $row['name']; ?>" id="'name" type="text" class="form-control" required placeholder="Nhập tên " />
                            </div>
                            <div class="md-3">
                                <label for="link">Link</label>
                                <input name="data[link]" value="<?php echo $row['link']; ?>" id="'link" type="text" class="form-control" required placeholder="Nhập link" />
                            </div>
                            <div class="md-3">
                                <label for="type">Kiểu Menu</label>
                                <input name="data[type]" value="<?php echo $row['type']; ?>" id="type" type="text" class="form-control" required placeholder="Nhập menu" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="md-3">
                                <label for="name">Chủ đề cấp cha</label>
                                <select name="data[parentid]" id="parentid" class="form-control">
                                    <option value="0">Cấp cha</option>
                                    <?php echo $strparentid; ?>
                                </select>
                            </div>
                            <div class="md-3">
                                <label for="orders">Sắp xếp</label>
                                <select name="data[orders]" id="orders" class="form-control">
                                    <option value="0">Cấp cha</option>
                                    <?php echo $strorders; ?>
                                </select>
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
<?php require_once('../views/backend/footer.php'); ?>v