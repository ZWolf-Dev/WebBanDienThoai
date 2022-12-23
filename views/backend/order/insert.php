<?php

use App\Models\Order;

$order = new Order();
$list = $order->order_list(['status' => 'index']);
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
<form name="form1" action="index.php?option=order&cat=process" method="post">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger">THÊM Order</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=order" class="btn btn-sm btn-success">
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
                                <label for="code">Code đơn hàng</label>
                                <input name="data[code]" id="'code" type="text" class="form-control" required placeholder="Nhập code" />
                            </div>
                            <div class="md-3">
                                <label for="userid">mã khách hàng</label>
                                <input name="data[userid]" id="'userid" type="text" class="form-control" required placeholder="Nhập mã khách hàng" />
                            </div>
                            <div class="md-3">
                                <label for="deliveryaddress">Địa chỉ nhận </label>
                                <input name="data[deliveryaddress]" id="deliveryaddress" type="text" class="form-control" required placeholder="Nhập địa chỉ" />
                            </div>
                            <div class="md-3">
                                <label for="deliveryname">Tên người nhận</label>
                                <input name="data[deliveryname]" id="'deliveryname" type="text" class="form-control" required placeholder="Nhập tên người nhận" />
                            </div>
                            <div class="md-3">
                                <label for="deliveryphone">Số điện thoại </label>
                                <input name="data[deliveryphone]" id="'deliveryphone" type="text" class="form-control" required placeholder="Nhập số điện thoại" />
                            </div>
                            <div class="md-3">
                                <label for="deliveryemail">Email</label>
                                <input name="data[deliveryemail]" id="'deliveryemail" type="text" class="form-control" required placeholder="Nhập email" />
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