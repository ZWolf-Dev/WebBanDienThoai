<?php

use App\Models\User;

$user = new User();
$args = array(
  'roles' => 0,
  'order' => array('field' => 'id', 'orderby' => 'ASC')
);
$list= $user->users_list($args);
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
             <strong class="text-danger">DANH MỤC KHÁCH HÀNG</strong>
          </div>
          <div class="col-md-6 text-right">
          <a href="index.php?option=customer&cat=insert"class="btn btn-sm btn-success">
            <i class="fas fa-plus"></i>Thêm</a>
          <a href="index.php?option=customer&cat=trash"class="btn btn-sm btn-danger">
            <i class="fas fa-trash"></i>Thùng rác</a>
          </div>
        </div>
      </div>
      <div class="card-body">
        <table class="table table-bordered" id="my table">
          <thead>
            <tr>
              <th class="text-center" style="width:20px">#</th>
              <th style="width:20px">Hình</th>
              <th>Tên khách hàng</th>
              <th>Email</th>
              <th>Giới tính</th>
              <th>SĐT</th>
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
                <td>
                  <img src="../public/images/users/<?php echo $row['image']; ?>"  class="img-fluid" alt="<?php echo $row['img']; ?>">
                </td>
                <td><?php echo $row['name'];?></td>
         
                <td><?php echo $row['email'];?></td>
                <td><?php echo $row['gender'];?></td>
                <td><?php echo $row['phone'];?></td>
                <td class="text-center"><?php echo $row['created_at']; ?></td>
                <td class="text-center">
                  <?php if ($row['status'] == 1): ?>
                  <a href="index.php?option=customer&cat=status&id=<?php echo $row['id'];?>" class="btn btn-sm btn-success"><i class="fas fa-toggle-on"></i></a>
                  <?php else:?>
                    <a href="index.php?option=customer&cat=status&id=<?php echo $row['id'];?>" class="btn btn-sm btn-danger"><i class="fas fa-toggle-off"></i></a>
                    <?php endif;?>
                  <a href="index.php?option=customer&cat=update&id=<?php echo $row['id'];?>" class="btn btn-sm btn-info"><i class="fas fa-edit"></i></a>
                  <a href="index.php?option=customer&cat=deltrash&id=<?php echo $row['id'];?>" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                </td>
                <td class="text-center"><?php echo $row['id'];?></td>
              </tr>
            <?php endforeach;?>
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