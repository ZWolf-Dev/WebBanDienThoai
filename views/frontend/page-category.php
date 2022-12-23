<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\Post;

$post = new post();
$args = array(
    'status' => 1,
    'topicid' => 0,
    'order' => array('field' => 'id', 'orderby' => 'ASC')
);
$list_post = $post->post_list($args);
?>

<?php require_once('views/frontend/header.php'); ?>

<body>
    <section class="page margin-top-30 margin-bottom-30">
        <ul class="breadcrumb align-items-center pl-0 pr-0 m-0">
            <li class="font-weight-bold">
                <a href="index.php?" title="HN Store">Trang chủ</a>
            </li>
            <li class="font-weight-bold"> Giới thiệu</li>
        </ul>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="content-page rte">
                        <?php foreach ($list_post as $post_row) : ?>
                            <div>
                                <h1>
                                    <a href="#" title=""><?php echo $post_row['title']; ?></a>
                                </h1>
                            </div>
                            <div style="text-align: justify;">
                                <h3><a title=""><?php echo $post_row['detail']; ?></a></h3>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>
<?php require_once('views/frontend/footer.php'); ?>