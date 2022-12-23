<?php

use App\Models\Post;

$post = new Post();

// $list = $post->post_list(['status' => 'index']);
$args = array(
  'topid' => 1,
  'order' => array('field' => 'id', 'orderby' => 'ASC')

);
$list_post = $post->post_list($args);
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
            <strong class="text-danger">TẤT CẢ TIN TỨC</strong>
          </div>
          <div class="col-md-6 text-right">
            <a href="index.php?option=post&cat=insert" class="btn btn-sm btn-success">
              <i class="fas fa-plus"></i>Thêm</a>
            <a href="index.php?option=post&cat=trash" class="btn btn-sm btn-danger">
              <i class="fas fa-trash"></i>Thùng rác</a>
          </div>
        </div>
      </div>
      <div class="card-body">
        <table class="table table-bordered" id="myTable">
          <thead>
            <tr>
              <th class="text-center" style="width:20px">#</th>
              <th class="text-center" style="width:90px">Hình</th>
              <th>Tên tin tức</th>
              <th>Slug</th>
              <th class="text-center">Ngày tạo</th>
              <th class="text-center">Chức năng</th>
              <th class="text-center" style="width:20px">ID</th>
            </tr>
          </thead>
          <tbody>
          <?php foreach ($list_post as $post_row) : ?>
              <tr>
                <td class="text-center">
                  <input title="checkid" type="checkbox" />
                </td>
                <td>
                  <img src="../public/images/posts/<?php echo $post_row['image']; ?>" class="img-fluid" alt="<?php echo $post_row['img']; ?>">
                </td>
                <td><?php echo $post_row['title']; ?></td>
                <td><?php echo $post_row['slug']; ?></td>
                <td class="text-center"><?php echo $post_row['created_at']; ?></td>
                <td class="text-center">
                  <?php if ($post_row['status'] == 1) : ?>
                    <a href="index.php?option=post&cat=status&id=<?php echo $post_row['id']; ?>" class="btn btn-sm btn-success"><i class="fas fa-toggle-on"></i></a>
                  <?php else : ?>
                    <a href="index.php?option=post&cat=status&id=<?php echo $post_row['id']; ?>" class="btn btn-sm btn-danger"><i class="fas fa-toggle-off"></i></a>
                  <?php endif; ?>
                  <a href="index.php?option=post&cat=update&id=<?php echo $post_row['id']; ?>" class="btn btn-sm btn-info"><i class="fas fa-edit"></i></a>
                  <a href="index.php?option=post&cat=deltrash&id=<?php echo $post_row['id']; ?>" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                </td>
                <td class="text-center"><?php echo $post_row['id']; ?></td>
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