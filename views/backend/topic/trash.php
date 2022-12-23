<?php

use App\Models\Topic;

$topic = new Topic();

$list = $topic->topic_list(['status' => '0']);
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
            <strong class="text-danger">>THÙNG RÁC DANH MỤC LOẠI SẢN PHẨM</strong>
          </div>
          <div class="col-md-6 text-right">
            <a href="index.php?option=topic" class="btn btn-sm btn-info">
              <i class="fas fa-arrow-left"></i></i>Quay về danh sách</a>
          </div>
        </div>
      </div>
      <div class="card-body">
        <table class="table table-bordered" id="my table">
          <thead>
            <tr>
              <th class="text-center" style="width:20px">#</th>
              <th>Tên danh mục</th>
              <th>Slug</th>
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
                <td><?php echo $row['name']; ?></td>
                <td><?php echo $row['slug']; ?></td>
                <td class="text-center"><?php echo $row['created_at']; ?></td>
                <td class="text-center">
                  <a href="index.php?option=topic&cat=retrash&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-info"><i class="fas fa-plus"></i>
                  </a>
                  <a href="index.php?option=topic&cat=delete&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i>
                  </a>
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

<?php require_once('../views/backend/footer.php'); ?>