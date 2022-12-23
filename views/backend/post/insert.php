<?php


use App\Models\Post;

$post = new post();
$args = array(
    'status' => 1,
    'topid' => 1,
    'order' => array('field' => 'id', 'orderby' => 'ASC')
);
$list_post = $post->post_list($args);
?>
<?php require_once('../views/backend/header.php'); ?>
<!-- Content Wrapper. Contains page content -->
<form name="form1" action="index.php?option=post&cat=process" method="post">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">
            <input name="id" value="<?php echo $post_row['id']; ?>" type="hidden" />
            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger">THÊM BÀI VIẾT</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=post" class="btn btn-sm btn-success">
                                <i class="fas fa-plus"></i>Quay về danh sách
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
                            <fieldset class="form-group">
                                <label>Mã chủ đề <span class="required">*</span></label>
                                <input type="text" class="form-control form-control-lg" value="" name="topid" id="topid" placeholder="0,1 or 2. 0 = trang đơn, 1 = tin tức, 2 = dịch vụ" required>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Tiêu đề bài viết<span class="required">*</span></label>
                                <input type="text" class="form-control form-control-lg" value="" name="title" id="title" required>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Chi tiết bài viết<span class="required">*</span> </label>
                                <input type="text" class="form-control form-control-lg" value="" name="detail" id="detail" required>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Kiểu bài viết<span class="required">*</span> </label>
                                <input type="text" class="form-control form-control-lg" value="" name="type" id="type" placeholder="page or post" required>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Từ khóa SEO<span class="required">*</span> </label>
                                <input type="text" class="form-control form-control-lg" value="" name="metakey" id="metakey" required>
                            </fieldset>
                            <fieldset class="form-group">
                                <label>Mô tả SEO<span class="required">*</span> </label>
                                <input type="text" class="form-control form-control-lg" value="" name="metadesc" id="metadesc" required>
                            </fieldset>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label for="hinh">Hinh</label>
                                <input name="img" id="hinh" type="file" />
                            </div>
                            <div class="mb-3">
                                <label for="status">Trạng thái</label>
                                <select name="status" id="status" class="form-control">
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