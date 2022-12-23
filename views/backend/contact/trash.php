<?php

use App\Models\Contact;

$contact = new Contact(); // tạo đối tượng
$list = $contact->contact_list(['status' => '0']);
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
                        </a>
                        <a href="index.php?option=contact" class="btn btn-sm btn-info">
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
                            <th>FullName</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Phone</th>
                            <th class="text-center">Title</th>
                            <th class="text-center">Detail</th>
                            <th class="text-center">Created at</th>
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
                                <td><?php echo $row["fullname"]; ?></td>
                                <td><?php echo $row["email"]; ?></td>
                                <td><?php echo $row["phone"]; ?></td>
                                <td><?php echo $row["title"]; ?></td>
                                <td class="text-center"><?php echo $row["detail"]; ?></td>
                                <td class="text-center"><?php echo $row["created_at"]; ?></td>
                                <!-- Chức năng -->
                                <td class="text-center">
                                    <a href="index.php?option=contact&cat=retrash&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-info">
                                        <i class="fas fa-trash-restore"></i>
                                    </a>
                                    <a href="index.php?option=contact&cat=delete&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger">
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