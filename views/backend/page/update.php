<?php

use App\Models\Post;
use App\Models\Category;

$post = new Post();
$category = new Category();

$id = $_REQUEST['id'];

$row = $post->post_row($id);


$list = $category->category_list(['status' => 'index']);
$strtopid = '';
foreach ($list as $item) {
    if ($row['topid'] == $item['id']) {
        $strtopid .= "<option selected value='" . $item['id'] . "'>" . $item['title'] . "</option>";
    } else {
        $strtopid .= "<option value='" . $item['id'] . "'>" . $item['title'] . "</option>";
    }
}
?>

<?php require_once('../views/backend/header.php'); ?>
<!-- Content Wrapper. Contains page content -->
<form title="form1" action="index.php?option=page&cat=process" method="post" enctype="multipart/form-data">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger">CẬP NHẬT SẢN PHẨM</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=post" class="btn btn-sm btn-success">
                                <i class="fas fa-plus"></i>Quay về danh sách
                            </a>
                            <button title="CAPNHAT" type="submit" class="btn btn-sm btn-success">
                                <i class="fas fa-plus"></i>Lưu[Cập nhật]
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                    <input title="id" value="<?php echo $row['id']; ?>" type="hidden"/>
                        <div class="col-md-9">
                            <div class="mb-3">
                                <label for="title">Tên chủ đề</label>
                                <input title="data[title]" id="title" value="<?php echo $row['title']; ?>" type="text" class="form-control" required placeholder="Nhập tên loại" />
                            </div>
                            <div class="mb-3">
                                <label for="detail">Chi tiết sản phẩm</label>
                                <textarea title="data[detail]" id="detail" class="form-control" required rows="4"><?php echo $row['title']; ?></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metakey">Từ khóa SEO</label>
                                <textarea title="data[metakey]" id="metakey" class="form-control" required rows="4"><?php echo $row['metakey']; ?></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Mô tả SEO</label>
                                <textarea title="data[metadesc]" id="metadesc" class="form-control" required rows="4"><?php echo $row['metadesc']; ?></textarea>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label for="topid">Chọn loại sản phẩm</label>
                                <select title="data[topid]" id="topid" class="form-control" required>
                                    <option value="">Chọn loại</option>
                                    <?php echo $strtopid; ?>
                                </select>
                            </div>
                         
                            <div class="mb-3">
                                <label for="hinh">Hinh</label>
                                <input title="img" id="hinh" type="file" />
                            </div>
                            <div class="mb-3">
                                <label for="status">Trạng thái</label>
                                <select title="data[status]" id="status" class="form-control">
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