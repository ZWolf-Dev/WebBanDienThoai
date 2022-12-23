<?php

use App\Models\Contact;

$contact = new Contact();
$list = $contact->contact_list(['status' => 'index']);
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
<form name="form1" action="index.php?option=contact&cat=process" method="post">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger">THÊM CONTACT</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=contact" class="btn btn-sm btn-success">
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
                                <label for="fullname">Họ và tên</label>
                                <input name="data[fullname]" id="'fullname" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="email">Email</label>
                                <input name="data[email]" id="'email" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="phone">Số điện thoại</label>
                                <input name="data[phone]" id="phone" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="title">Tên chủ đề</label>
                                <input name="data[title]" id="'title" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="detail">Chi tiết</label>
                                <textarea name="data[detail]" id="detail" class="form-control" required rows="4"></textarea>
                            </div>
                        </div>
                        <div class="col-md-3">
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