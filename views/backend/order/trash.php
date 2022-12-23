<?php

use App\Models\Order;

$order = new Order(); // tạo đối tượng
$list = $order->order_list(['status' => '0']);
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
                        <h3 class="card-title text-danger">THÙNG RÁC DANH MỤC LOẠI SẢN PHẨM</h3>
                    </div>
                    <div class="col-md-6 text-right">
                        <a href="index.php?option=order" class="btn btn-sm btn-info">
                            <i class="fas fa-undo-alt"></i> Quay về danh sách
                        </a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered" id="myTable">
                    <thead>
                        <tr>
                            <th class="text-center" style="width:20px;">#</th>
                            <th>Code</th>
                            <th class="text-center">Userid</th>
                            <th class="text-center">Deliveryaddress</th>
                            <th class="text-center">Deliveryaname</th>
                            <th class="text-center">Deliveryaphone</th>
                            <th class="text-center">Deliveryaemail</th>
                            <th class="text-center">Chức năng</th>
                            <th>ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($list as $row) : ?>
                            <tr>
                                <td class="text-center">
                                    <input name="checkid" type="checkbox" />
                                </td>
                                <td><?php echo $row["code"]; ?></td>
                                <td><?php echo $row["userid"]; ?></td>
                                <td><?php echo $row["deliveryaddress"]; ?></td>
                                <td><?php echo $row["deliveryname"]; ?></td>
                                <td><?php echo $row["deliveryphone"]; ?></td>
                                <td><?php echo $row["deliveryemail"]; ?></td>
                                <!-- Chức năng -->
                                <td class="text-center">
                                    <a href="index.php?option=order&cat=retrash&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-info">
                                        <i class="fas fa-trash-restore"></i>
                                    </a>
                                    <a href="index.php?option=order&cat=delete&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
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
<?php require_once('../views/backend/footer.php'); ?>