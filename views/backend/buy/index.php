<?php

use App\Models\Buy;

$buy = new Buy();

$list = $buy->buy_list(['status' => 'index']);
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
            <strong class="text-danger">SẢN PHẨM ĐÃ BÁN</strong>
          </div>
        </div>
      </div>
      <div class="card-body">
        <table class="table table-bordered" id="myTable">
          <thead>
            <tr>
              <th class="text-center" style="width:90px">Hình</th>
              <th>Tên sản phẩm</th>
              <th class="text-center">Ngày tạo</th>
              <th class="text-center">Trạng thái</th>
              <th class="text-center" style="width:20px">ID</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($list as $row) : ?>
              <tr>
                <td>
                  <image src="../public/images/products/<?php echo $row['image']; ?>" style="width: 5em;" class="image-fluid" alt="<?php echo $row['image']; ?>">
                </td>
                <td><?php echo $row['name']; ?></td>
                <td class="text-center"><?php echo $row['created_at']; ?></td>
                <td class="text-center">
                  <?php if ($row['status'] == 1) : ?>
                    <a href="index.php?option=buy&cat=status&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-success"><i class="fas fa-toggle-on"></i> Đã giao thành công</a>
                  <?php else : ?>
                    <a href="index.php?option=buy&cat=status&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger"><i class="fas fa-toggle-off"></i> Đang chờ xác nhận</a>
                  <?php endif; ?>
                </td>
                <td class="text-center"><?php echo $row['id']; ?></td>
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