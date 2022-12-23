<?php

use App\Models\Category;

$category = new Category();
$args = array(
    'status' => 1,
    'parentid' => 0,
    'order' => array('field' => 'orders', 'orderby' => 'ASC')

);
$list_category = $category->categorys_list($args);

?>
<section id="navbars" class="mainmenu bg-dark card" style="min-width:20em; border-radius:15px;">
    <div class="title_menu" style="color:darkorange; text-align:center;">
        <span class="title_">Danh mục sản phẩm</span>
        <ul class="list-group card">
            <?php foreach ($list_category as $row_category) : ?>
                <?php
                $args1 = array(
                    'status' => 1,
                    'parentid' => $row_category['id'],
                    'order' => array('field' => 'orders', 'orderby' => 'ASC')
                );
                $list_category1 = $category->categorys_list($args1);
                ?>
                <?php if (count($list_category1) != 0) : ?>
                    <li class="list-group-item">
                        <a href="#" class="dropdown-toggle navbar-brand" style="color: burlywood;" data-toggle="dropdown"> <?php echo $row_category['name']; ?></a>
                        <ul class="dropdown-menu" style=" right: 0; left: auto;">
                            <?php foreach ($list_category1 as $row_category1) : ?>
                                <li><a style="color: burlywood;" class="navbar-brand" href="index.php?option=product&bra=<?php echo $row_category1['slug']; ?>"><?php echo $row_category1['name']; ?></a></li>
                            <?php endforeach; ?>
                        </ul>
                    </li>
                <?php else : ?>
                    <li class="list-group-item">
                        <a style="color: burlywood;" class="navbar-brand" href="index.php?option=product&cat=<?php echo $row_category['slug']; ?>"><?php echo $row_category['name']; ?></a>
                    </li>
                <?php endif; ?>
            <?php endforeach; ?>
        </ul>
    </div>
</section>