<?php

use App\Models\Menu;

$menu = new Menu();
$args = array(
    'status' => 1,
    'position' => 'mainmenu',
    'parentid' => 0,
    'order' => array('field' => 'orders', 'orderby' => 'ASC')

);
$list_menu = $menu->menu_list($args);

?>
<div class="mainmenu pull-left" style="margin-left:14%;" >
    <ul class="menu nav navbar-nav collapse navbar-collapse">
        <?php foreach ($list_menu as $row_menu) : ?>
            <?php
            $args1 = array(
                'status' => 1,
                'position' => 'mainmenu',
                'parentid' => $row_menu['id'],
                'order' => array('field' => 'orders', 'orderby' => 'ASC')
            );
            $list_menu1 = $menu->menu_list($args1);
            ?>
            <?php if (count($list_menu1) != 0) : ?>
                <li class="nav-item dropdown" style="z-index:8000;">
                    <a style="color: burlywood;" class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <?php echo $row_menu['name']; ?>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <?php foreach ($list_menu1 as $row_menu1) : ?>
                            <li><a style="color: burlywood;" class="dropdown-item" href="<?php echo $row_menu1['link']; ?>"><?php echo $row_menu1['name']; ?></a></li>
                        <?php endforeach; ?>
                    </ul>
                </li>
            <?php else : ?>
                <li class="nav-item">
                    <a style="color: burlywood;" class="navbar-brand" href="<?php echo $row_menu['link']; ?>"><?php echo $row_menu['name']; ?></a>
                </li>
            <?php endif; ?>
        <?php endforeach; ?>
    </ul>
</div>
