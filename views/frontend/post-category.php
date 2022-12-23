<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\Post;

$post = new post();
$args = array(
    'status' => 1,
    'topicid' => 1,
    'order' => array('field' => 'id', 'orderby' => 'ASC')
);
$list_post = $post->post_list($args);
?>


<?php require_once('views/frontend/header.php'); ?>

<section class="maincontent">
    <ul class="breadcrumb align-items-center pl-0 pr-0 m-0">
        <li class="font-weight-bold">
            <a href="index.php?" title="HN Store">Trang chủ</a>
        </li>
        <li class="font-weight-bold"> Tin khuyến mãi</li>
    </ul>
    <div class="container">
        <input name="id" value="<?php echo $post_row['id']; ?>" type="hidden" />
        <div class="row post-home my-3">
            <h1>Tin Tức</h1>
            <div class="col-md-12">
                <?php foreach ($list_post as $post_row) : ?>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-4 news-item">
                        <a href="index.php?option=postdetail&top=<?php echo $post_row['id']; ?>" title="" class="news-item-img">
                            <img src="public/images/posts/<?php echo $post_row['image']; ?>" alt="<?php echo $post_row['image']; ?>" class="lazy img-responsive center-block" />
                        </a>
                        <h3>
                            <a href="#" title=""><?php echo $post_row['title']; ?></a>
                        </h3>
                        <p class="news-item-date"><?php echo $post_row['updated_at']; ?></p>
                    </div>
                <?php endforeach; ?>
            </div>
            <?php
            $args = array(
                'status' => 1,
                'topicid' => 2,
                'order' => array('field' => 'id', 'orderby' => 'ASC')
            );
            $list_posts = $post->post_list($args);
            ?>
            <h1>Dịch vụ</h1>
            <div class="col-md-12">
                <?php foreach ($list_posts as $posts_row) : ?>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-12 news-item">
                        <a href="index.php?option=postdetail&cat=<?php echo $posts_row['id']; ?>" title="" class="news-item-img">
                            <img src="public/images/posts/<?php echo $posts_row['image']; ?>" alt="<?php echo $posts_row['image']; ?>" class="lazy img-responsive center-block" />
                        </a>
                        <h3>
                            <a href="#" title=""><?php echo $posts_row['title']; ?></a>
                        </h3>
                        <p class="news-item-date"><?php echo $post_row['updated_at']; ?></p>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</section>
<script>
    function msg() {
        alert("Sản phẩm đã được thêm vào giỏ hàng của bạn! ");
        alert("Vào giỏ hàng để kiểm tra nha. :))");
    }
</script>
<!--section maincontent-->
<?php require_once('views/frontend/footer.php'); ?>