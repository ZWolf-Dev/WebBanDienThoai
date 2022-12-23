<?php

use App\Models\Orderdetail;

$orderdetail = new Orderdetail();
$list = $orderdetail->orderdetail_list(['status' => 'index']);
$strparentid = '';
$strorderdetails = '';
// foreach($list as $item)
// {
//     $strparentid .="<option value='" . $item['id'] . "'>" . $item['name'] . "</option>";
//     $strorderdetails .="<option value='" . $item['orderdetails'] . "'>Sau: " . $item['name'] . "</option>";
// }
?>
<?php require_once('../views/backend/header.php'); ?>
<!-- Content Wrapper. Contains page content -->
<form name="form1" action="index.php?option=orderdetail&cat=process" method="post">
    <div class="content-wrapper py-2">
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-6">
                            <strong class="text-danger">THÊM Orderdetail</strong>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="index.php?option=orderdetail" class="btn btn-sm btn-success">
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
                                <label for="orderid">Mã đơn hàng</label>
                                <input name="data[orderid]" id="'orderid" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="productid">Mã sản phẩm</label>
                                <input name="data[productid]" id="'productid" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="price">Giá sản phẩm</label>
                                <input name="data[price]" id="price" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="quantity">Số lượng</label>
                                <input name="data[quantity]" id="'quantity" type="text" class="form-control" required placeholder />
                            </div>
                            <div class="md-3">
                                <label for="amount">Thành tiền</label>
                                <input name="data[amount]" id="'amount" type="text" class="form-control" required placeholder />
                            </div>
                        </div>
                        <!-- <div class="col-md-3">
                    <div class="md-3">
                        <label for="status">Trạng thái</label>
                        <select name="data[status]" id="status" class="form-control">
                            <option value="2">Chưa xuất bản</option>
                            <option value="1">Xuất bản</option>
                        </select> -->
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