<?php

use App\Models\Orderdetail;

$orderdetail = new Orderdetail(); // tạo đối tượng
$list = $orderdetail->orderdetail_list();
?>

<?php require_once('../views/backend/header.php'); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper py-2">
    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-6">
                        <h3 class="card-title text-danger">DANH MỤC CHI TIẾT ĐƠN HÀNG</h3>
                    </div>
                    <div class="col-md-6 text-right">
                        </a>
                        <a href="index.php?option=orderdetail&cat=insert" class="btn btn-sm btn-success">
                            <i class="fas fa-plus"></i> Thêm
                        </a>
                        </a>
                        <a href="index.php?option=orderdetail&cat=trash" class="btn btn-sm btn-danger">
                            <i class="fas fa-trash-alt"></i>Thùng rác
                        </a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered" id="myTable">
                    <thead>
                        <tr>
                            <th class="text-center" style="width:20px;">#</th>
                            <th>Orderid</th>
                            <th class="text-center">Productid</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Quantity</th>
                            <th>ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($list as $row) : ?>
                            <tr>
                                <td class="text-center">
                                    <input name="checkid" type="checkbox" />
                                </td>
                                <td class="text-center"><?php echo $row["orderid"]; ?></td>
                                <td class="text-center"><?php echo $row["productid"]; ?></td>
                                <td class="text-center"><?php echo $row["price"]; ?></td>
                                <td class="text-center"><?php echo $row["quantity"]; ?></td>
                                <td class="text-center"><?php echo $row["id"]; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
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
<!-- /.content-wrapper -->
<script>
    $(document).ready(function() {
        $('#myTable').DataTable();
    });
</script>
<?php require_once('../views/backend/footer.php'); ?>