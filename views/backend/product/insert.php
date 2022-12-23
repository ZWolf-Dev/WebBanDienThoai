<?php

use App\Models\Category;
use App\Models\Brand;

$category = new Category();
$brand = new Brand();

$listcat = $category->category_brandid(['status' => 'index']);
$strcategoryid = '';
foreach ($listcat as $cat) {
    $strcategoryid .= "<option value='" . $cat['id'] . "'>" . $cat['name'] . "</option>";
}

$listbra = $brand->brands_list(['status' => 'index']);
$strbrandid = '';
foreach ($listbra as $bra) {
    $strbrandid .= "<option value='" . $bra['id'] . "'>" . $bra['name'] . "</option>";
}
?>

<?php require_once('../views/backend/header.php'); ?>
<!-- Content Wrapper. Contains page content -->
<form name="form1" action="index.php?option=product&cat=process" method="post" enctype="multipart/form-data">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger">THÊM SẢN PHẨM</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=product" class="btn btn-sm btn-success">
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
                            <div class="mb-3">
                                <label for="name">Tên chủ đề</label>
                                <input name="data[name]" id="name" type="text" class="form-control" required placeholder="Nhập tên loại" />
                            </div>
                            <div class="mb-3">
                                <label for="detail">Chi tiết sản phẩm</label>
                                <textarea name="data[detail]" id="detail" class="form-control" required rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metakey">Từ khóa SEO</label>
                                <textarea name="data[metakey]" id="metakey" class="form-control" required rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Mô tả SEO</label>
                                <textarea name="data[metadesc]" id="metadesc" class="form-control" required rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Kích thước</label>
                                <textarea name="value[Kich_thuoc]" id="Kich_thuoc" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Trọng lượng</label>
                                <textarea name="value[Trong_luong]" id="Trong_luong" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Màu sắc</label>
                                <textarea name="value[Mau_sac]" id="Mau_sac" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Âm thanh</label>
                                <textarea name="value[Am_thanh]" id="Am_thanh" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Bộ nhớ</label>
                                <textarea name="value[Bo_nho]" id="Bo_nho" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Hệ điều hành</label>
                                <textarea name="value[He_dieu_hanh]" id="He_dieu_hanh" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Thẻ nhớ</label>
                                <textarea name="value[The_nho]" id="The_nho" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Camera</label>
                                <textarea name="value[Camera]" id="Camera" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Pin</label>
                                <textarea name="value[Pin]" id="Pin" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Bảo hành</label>
                                <textarea name="value[Bao_hanh]" id="Bao_hanh" class="form-control"  rows="1"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="metadesc">Kết nối</label>
                                <textarea name="value[Ket_noi]" id="Ket_noi" class="form-control"  rows="1"></textarea>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label for="categoryid">Chọn loại sản phẩm</label>
                                <select name="data[categoryid]" id="categoryid" class="form-control" required>
                                    <option value="">Chọn loại</option>
                                    <?php echo $strcategoryid; ?>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="brandid">Chọn thương hiệu sản phẩm</label>
                                <select name="data[brandid]" id="brandid" class="form-control" required>
                                    <option value="">Chọn thương hiệu</option>
                                    <?php echo $strbrandid; ?>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="number">Số lượng</label>
                                <input name="data[quantity]" id="number" class="form-control" type="number" min="1" max="1000000" value="1" />
                            </div>
                            <div class="mb-3">
                                <label for="price">Giá</label>
                                <input name="data[price]" id="price" class="form-control" type="number" step="1000" min="50000" max="999999999" value="50000" />
                            </div>
                            <div class="mb-3">
                                <label for="pricesale">Giá khuyến mãi</label>
                                <input name="data[pricesale]" id="pricesale" class="form-control" type="number" step="1000" min="50000" max="9999999999" value="50000" />
                            </div>
                            <div class="mb-3">
                                <label for="hinh">Hinh</label>
                                <input name="image" id="hinh" type="file" required />
                            </div>
                            <div class="mb-3">
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