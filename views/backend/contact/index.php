<?php

use App\Models\Contact;

$contact = new Contact(); // tạo đối tượng
$list = $contact->contact_list(['status' => 'index']);
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
            <h3 class="card-title text-danger">DANH MỤC LOẠI LIÊN HỆ</h3>
          </div>
          <div class="col-md-6 text-right">
            </a>
            <a href="index.php?option=contact&cat=insert" class="btn btn-sm btn-success">
              <i class="fas fa-plus"></i> Thêm
            </a>
            </a>
            <a href="index.php?option=contact&cat=trash" class="btn btn-sm btn-danger">
              <i class="fas fa-trash-alt"></i>Thùng rác
            </a>
          </div>
        </div>
      </div>
      <div class="card-body">
        <table class="table table-bordered" id="myTable">
          <thead>
            <tr>
              <th class="text-center" style="width:20px">#</th>
              <th>Tên</th>
              <th>Email</th>
              <th>SĐT</th>
              <th>Tiêu đề</th>
              <th>Chi tiết</th>
              <th class="text-center">Ngày tạo</th>
              <th class="text-center">Chức năng</th>
              <th class="text-center" style="width:20px">ID</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($list as $row) : ?>
              <tr>
                <td class="text-center">
                  <input name="checkid" type="checkbox" />
                </td>
                <td><?php echo $row["name"]; ?></td>
                <td><?php echo $row["email"]; ?></td>
                <td><?php echo $row["phone"]; ?></td>
                <td><?php echo $row["title"]; ?></td>
                <td class="text-center"><?php echo $row["content"]; ?></td>
                <td class="text-center"><?php echo $row["created_at"]; ?></td>
                <!-- Chức năng -->
                <td class="text-center">
                  <?php if ($row["status"] == 1) : ?>
                    <a href="index.php?option=contact&cat=status&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-success">
                      <i class="fas fa-toggle-on"></i>
                    </a>
                  <?php else : ?>
                    <a href="index.php?option=contact&cat=status&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger">
                      <i class="fas fa-toggle-off"></i>
                    </a>
                  <?php endif; ?>
                  <a href="index.php?option=contact&cat=update&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-info">
                    <i class="fas fa-edit"></i>
                  </a>
                  <a href="index.php?option=contact&cat=deltrash&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger">
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
<script>
  $(document).ready(function() {
    $('#myTable').DataTable();
  });
</script>
<?php require_once('../views/backend/footer.php'); ?>