<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\Product;
use App\Models\Productdetail;
use App\Models\Brand;
use App\Models\Cart;
use App\Models\Category;

$product = new Product();
$productdetail = new Productdetail();
$brand = new Brand();
$cart = new Cart();
$category = new Category();

$id = $_REQUEST['id'];
$quantity = $_REQUEST['quantity'];
$price = $_REQUEST['price'] * $quantity;
$pricesale = $_REQUEST['pricesale'] * $quantity;
$row = $product->product_row($id);
$bra = $brand->brand_row($row['brandid']);
$cart = $cart->cart_row($row['brandid']);
$cat = $category->category_row($row['categoryid']);
$pro = $productdetail->productdetail_row($row['productdetailid']);


$list = $category->category_list(['status' => 'index']);
$strcatid = '';
foreach ($list as $item) {
    if ($row['categoryid'] == $item['id']) {
        $strcatid .= "<option selected value='" . $item['id'] . "'>" . $item['name'] . "</option>";
    } else {
        $strcatid .= "<option value='" . $item['id'] . "'>" . $item['name'] . "</option>";
    }
}
?>



<?php require_once('views/frontend/header.php'); ?>
<!DOCTYPE html>
<html>

<head>
    <link href="public/css/noindex.scss.css?1644978201978" rel="stylesheet" type="text/css" />
    <link href="public/css/swatch_style.scss.css?1644978201978" rel="stylesheet" type="text/css" />
    <link href="public/css/product_style.scss.css?1644978201978" rel="stylesheet" type="text/css" />
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v13.0" nonce="H7TIIpxG"></script>
</head>

<body id="body_m">
    <section class="maincontent">
        <ul class="breadcrumb align-items-center pl-0 pr-0 m-0">
            <li class="font-weight-bold">
                <a href="index.php?" title="HN Store">Trang chủ</a>
            </li>
            <li class="font-weight-bold">
                <a href="index.php?option=product/product">Tất cả sản phẩm</a>
            </li>
            <li class="font-weight-bold">
                <?php echo $row['name']; ?>
            </li>
        </ul>
        <div class="page-body">
            <section class="product-layout product-layout2">
                <div class="container">
                    <div class="row clearfix mb-4 pt-3">
                        <div class="product-layout_col-left col-12 col-lg-7 col-xl-8 mb-lg-0 mb-3">
                            <div class="product-main-slide mb-4 stk-pro">
                                <img src="public/images/products/<?php echo $row['image']; ?>" class="img-fluid" alt="<?php echo $row['image']; ?>">
                            </div>
                        </div>
                        <div class="product-layout_col-right col-12 col-lg-5 col-xl-4 product-warp">
                            <div class="stk-pro">
                                <h1 class="product-name font-weight-bold text-uppercase"><input style="border: 0px;" name="data[name]" id="name" value="<?php echo $row['name']; ?>" type="text"></h1>
                                <div class="product-info position-relative">
                                    <?php if ($row['storehouse'] == 0) {  ?>
                                        <span class="inventory_quantity text-danger">Hết hàng</span>
                                    <?php } else { ?>
                                        <span class="inventory_quantity text-success">Còn hàng: <?php echo $row['storehouse']; ?>sp</span>
                                    <?php } ?>
                                </div>
                                <div class="product-info position-relative">
                                    <span>Đã bán: <?php echo $row['sold']; ?>sp</span>
                                </div>
                                <div class="product-info position-relative">Thương hiệu: <span id="brand"><?php echo $bra['name']; ?></span>
                                </div>
                                <div class="product-info position-relative">Loại: <span id="category"><?php echo $cat['name']; ?></span>
                                    <form action="index.php?option=cart/process&addcat=<?php echo $row['id']; ?>" method="post" enctype="multipart/form-data" id="add-to-cart-form">
                                        <input type="hidden" name="productAlias" value="ao-thun-t-shirt-m-f-07" />
                                        <div class="row align-items-start pt-3 pb-2">
                                            <div class="product-control mb-4">
                                                <div class="d-sm-flex align-items-center swatch-color swatch clearfix flex-wrap" data-option-index="0">
                                                    <div class="header font-weight-bold mb-2">Màu sắc</div>
                                                    <div data-value="Cam" class="swatch-element color Cam position-relative mb-2 mr-2 float-left">
                                                        <input id="swatch-0-cam" class="position-absolute w-100 m-0" type="radio" name="option-0" value="Cam" checked />
                                                        <label title="Cam" for="swatch-0-cam" class="sw-color-cam border m-0 pl-1 pr-1 rounded float-left text-center text-uppercase" style="background-image: url(public/images/006.jpg);background-size: contain;background-repeat:no-repeat;background-position:center;"></label>
                                                        <div class="product-variation__tick position-absolute">
                                                            <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12" x="0" y="0" class="icon-tick-bold">
                                                                <g>
                                                                    <path d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                    </path>
                                                                </g>
                                                            </svg>
                                                        </div>
                                                    </div>

                                                    <div data-value="Tr&#7855;ng" class="swatch-element color Trắng position-relative mb-2 mr-2 float-left">
                                                        <input id="swatch-0-trang" class="position-absolute w-100 m-0" type="radio" name="option-0" value="Tr&#7855;ng" />
                                                        <label title="Trắng" for="swatch-0-trang" class="sw-color-trang border m-0 pl-1 pr-1 rounded float-left text-center text-uppercase" style="background-image: url();background-size: contain;background-repeat:no-repeat;background-position:center;"></label>
                                                        <div class="product-variation__tick position-absolute">
                                                            <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12" x="0" y="0" class="icon-tick-bold">
                                                                <g>
                                                                    <path d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                    </path>
                                                                </g>
                                                            </svg>
                                                        </div>
                                                    </div>

                                                    <div data-value="Tr&#7855;ng" class="swatch-element color Trắng position-relative mb-2 mr-2 float-left">
                                                        <input id="swatch-0-trang" class="position-absolute w-100 m-0" type="radio" name="option-0" value="Tr&#7855;ng" />
                                                        <label title="Trắng" for="swatch-0-trang" class="sw-color-trang border m-0 pl-1 pr-1 rounded float-left text-center text-uppercase" style="background-image: url(public/images/003.jpg);background-size: contain;background-repeat:no-repeat;background-position:center;"></label>
                                                        <div class="product-variation__tick position-absolute">
                                                            <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12" x="0" y="0" class="icon-tick-bold">
                                                                <g>
                                                                    <path d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                    </path>
                                                                </g>
                                                            </svg>
                                                        </div>
                                                    </div>

                                                    <div data-value="Tr&#7855;ng" class="swatch-element color Trắng position-relative mb-2 mr-2 float-left">
                                                        <input id="swatch-0-trang" class="position-absolute w-100 m-0" type="radio" name="option-0" value="Tr&#7855;ng" />
                                                        <label title="Trắng" for="swatch-0-trang" class="sw-color-trang border m-0 pl-1 pr-1 rounded float-left text-center text-uppercase" style="background-image: url(public/images/004.jpg);background-size: contain;background-repeat:no-repeat;background-position:center;"></label>
                                                        <div class="product-variation__tick position-absolute">
                                                            <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12" x="0" y="0" class="icon-tick-bold">
                                                                <g>
                                                                    <path d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                    </path>
                                                                </g>
                                                            </svg>
                                                        </div>
                                                    </div>

                                                    <div data-value="Tr&#7855;ng" class="swatch-element color Trắng position-relative mb-2 mr-2 float-left">
                                                        <input id="swatch-0-trang" class="position-absolute w-100 m-0" type="radio" name="option-0" value="Tr&#7855;ng" />
                                                        <label title="Trắng" for="swatch-0-trang" class="sw-color-trang border m-0 pl-1 pr-1 rounded float-left text-center text-uppercase" style="background-image: url(public/images/005.jpg);background-size: contain;background-repeat:no-repeat;background-position:center;"></label>
                                                        <div class="product-variation__tick position-absolute">
                                                            <svg enable-background="new 0 0 12 12" viewBox="0 0 12 12" x="0" y="0" class="icon-tick-bold">
                                                                <g>
                                                                    <path d="m5.2 10.9c-.2 0-.5-.1-.7-.2l-4.2-3.7c-.4-.4-.5-1-.1-1.4s1-.5 1.4-.1l3.4 3 5.1-7c .3-.4 1-.5 1.4-.2s.5 1 .2 1.4l-5.7 7.9c-.2.2-.4.4-.7.4 0-.1 0-.1-.1-.1z">
                                                                    </path>
                                                                </g>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-sm-flex align-items-center  swatch clearfix flex-wrap" data-option-index="1">
                                                    <span class="header font-weight-bold mb-2">Kích thước</span>
                                                    <span class="special-price m-0 cl_swatch"><?php echo $pro['Kich_thuoc']; ?></span>
                                                </div>
                                                <div class="product-price font-weight-bold mt-2 mb-2 position-relative ">
                                                    <span class="cl_swatch f_price">Giá: </span>&ensp;
                                                    <span class="special-price m-0 cl_swatch"><?php echo $pricesale ?>đ</span>&emsp;
                                                    <del class="old-price m-0"><?php echo $price ?>đ</del>
                                                </div>

                                                <input name="data[id]" value="<?php echo $row['id']; ?>" type="hidden" />
                                                <input name="newid" value="<?php echo $row['id']; ?>" type="hidden" />
                                                <input name="data[categoryid]" value="<?php echo $row['categoryid']; ?>" type="hidden" />
                                                <input name="data[brandid]" value="<?php echo $row['brandid']; ?>" type="hidden" />
                                                <input name="data[userid]" value="<?php echo $_SESSION['userid']; ?>" type="hidden" />
                                                <input name="data[name]" id="name" value="<?php echo $row['name']; ?>" type="hidden" />
                                                <input name="data[detail]" id="detail" value="<?php echo $row['detail']; ?>" type="hidden" />
                                                <input name="price" id="price" value="<?php echo $price ?>" type="hidden" />
                                                <input name="pricesale" id="pricesale" value="<?php echo $pricesale ?>" type="hidden" />
                                                <input name="image" value="<?php echo $row['image']; ?>" hidden />
                                                <input name="data[status]" id="status" value="<?php echo $row['status']; ?>" type="hidden" />
                                                <input name="userid" id="userid" value="1" type="hidden" />
                                                <input name="data[metakey]" id="metakey" value="<?php echo $row['metakey']; ?>" type="hidden" />
                                                <input name="data[metadesc]" id="metadesc" value="<?php echo $row['metadesc']; ?>" type="hidden" />
                                                <div class="d-sm-flex align-items-center ">
                                                    <span>Số lượng: </span>
                                                    <span> <input type="number" style="width:5em;" maxlength="2" id="qtym" name="quantity" min="1" max="<?php echo $row['storehouse']; ?>" value="<?php echo $quantity ?>" class="border-0 form-control text-center prd_quantity font-weight-bold" onkeypress="if ( isNaN(this.value + String.fromCharCode(event.keyCode) )) return false;" onchange="if(this.value == 0)this.value=1;"></span>
                                                </div>
                                                <?php if (!isset($_SESSION['useradmin'])) { ?>
                                                    <div class="d-inline-flex banner-w position-relative modal-open buy_mewshoes clearfix bg_swatch align-items-center justify-content-center pt-2 pb-2 pl-3 pr-3">
                                                        <div class="border-0 product-action_buy js-addToCart p-0 d-flex">
                                                            <span class="mr-3 text-light " onclick="msgt()">Thêm vào giỏ hàng</span>
                                                        </div>
                                                    </div>
                                                    <div class="d-inline-flex banner-w position-relative modal-open buy_mewshoes clearfix bg_swatch align-items-center justify-content-center pt-2 pb-2 pl-3 pr-3">
                                                        <div class="border-0 product-action_buy js-addToCart p-0 d-flex">
                                                            <svg enable-background="new 0 0 511.987 511.987" height="24" viewBox="0 0 511.987 511.987" width="24">
                                                                <g>
                                                                    <path d="m375.472 449.911c34.464 0 62.502-28.039 62.502-62.502v-39.255c9.286-3.137 15.992-11.926 15.992-22.257 0-12.953-10.538-23.491-23.492-23.491-12.953 0-23.491 10.538-23.491 23.491 0 10.331 6.706 19.119 15.991 22.257v39.255c0 26.193-21.31 47.502-47.502 47.502-26.193 0-47.503-21.31-47.503-47.502v-39.255c9.285-3.138 15.991-11.926 15.991-22.257 0-12.953-10.538-23.491-23.491-23.491s-23.491 10.538-23.491 23.491c0 10.331 6.706 19.119 15.991 22.257v39.255c0 34.463 28.039 62.502 62.503 62.502zm55.002-132.506c4.683 0 8.492 3.809 8.492 8.491s-3.81 8.492-8.492 8.492-8.491-3.81-8.491-8.492 3.809-8.491 8.491-8.491zm-110.005 0c4.682 0 8.491 3.809 8.491 8.491s-3.81 8.492-8.491 8.492-8.491-3.81-8.491-8.492 3.81-8.491 8.491-8.491z" />
                                                                    <path d="m37.089 511.986h444.688c11.476 0 20.419-9.982 19.168-21.384l-8.756-79.901c-.451-4.119-4.146-7.084-8.272-6.639-4.117.452-7.089 4.155-6.638 8.272l8.756 79.902c.277 2.535-1.705 4.75-4.258 4.75h-212.602-.01c-2.533 0-4.537-2.194-4.258-4.75l21.63-197.371c.238-2.175 2.069-3.816 4.258-3.816h169.354c2.188 0 4.019 1.641 4.258 3.816l9.037 82.469c.451 4.117 4.129 7.087 8.272 6.639 4.117-.452 7.089-4.155 6.638-8.272l-9.037-82.469c-1.074-9.795-9.314-17.182-19.168-17.182h-82.974l-11.582-105.69c-1.456-13.291-12.637-23.313-26.007-23.313h-29.839v-42.767c0-57.5-46.78-104.28-104.28-104.28s-104.28 46.78-104.28 104.28v42.767h-29.838c-13.371 0-24.552 10.022-26.008 23.313l-34.259 312.614c-1.695 15.475 10.446 29.012 26.007 29.012zm-11.096-27.379 34.259-312.613c.622-5.67 5.393-9.947 11.098-9.947h29.838v27.928c-9.798 3.172-16.905 12.38-16.905 23.221 0 13.457 10.948 24.405 24.405 24.405s24.405-10.948 24.405-24.405c0-10.841-7.107-20.049-16.905-23.221v-27.928h71.78c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-71.78v-42.767c0-49.229 40.051-89.28 89.28-89.28s89.28 40.051 89.28 89.28v42.767h-71.78c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h71.78v27.928c-9.798 3.172-16.904 12.38-16.904 23.221 0 13.457 10.947 24.405 24.404 24.405s24.405-10.948 24.405-24.405c0-10.841-7.107-20.049-16.905-23.221v-27.928h29.839c5.704 0 10.475 4.276 11.097 9.947l11.402 104.056h-71.29c-9.855 0-18.096 7.387-19.168 17.183l-21.63 197.371c-.236 2.148-.046 4.562.369 6.383h-213.278c-6.65-.001-11.821-5.754-11.096-12.38zm82.694-280.816c5.187 0 9.405 4.219 9.405 9.405s-4.219 9.405-9.405 9.405-9.405-4.219-9.405-9.405 4.218-9.405 9.405-9.405zm193.56 0c5.187 0 9.405 4.219 9.405 9.405s-4.219 9.405-9.405 9.405-9.404-4.219-9.404-9.405 4.219-9.405 9.404-9.405z" />
                                                                </g>
                                                            </svg>
                                                            <span class="mr-3 " onclick="msgt()">Mua hàng</span>
                                                        </div>
                                                    </div>
                                                <?php } else { ?>
                                                    <?php if ($row['storehouse'] == 0) { ?>
                                                        <div class="d-inline-flex banner-w position-relative modal-open buy_mewshoes clearfix bg_swatch align-items-center justify-content-center pt-2 pb-2 pl-3 pr-3">
                                                            <button type="submit" action="index.php?option=cart/process&addcat=<?php echo $row['id']; ?>" class="border-0 product-action_buy js-addToCart p-0 d-flex">
                                                                <span class="mr-3" onclick="mst()">Thêm vào giỏ hàng</span>
                                                            </button>
                                                        </div>
                                                        <div class="d-inline-flex banner-w position-relative modal-open buy_mewshoes clearfix bg_swatch align-items-center justify-content-center pt-2 pb-2 pl-3 pr-3">
                                                            <button  type="submit" class="border-0 product-action_buy js-addToCart p-0 d-flex">
                                                                <svg enable-background="new 0 0 511.987 511.987" height="24" viewBox="0 0 511.987 511.987" width="24">
                                                                    <g>
                                                                        <path d="m375.472 449.911c34.464 0 62.502-28.039 62.502-62.502v-39.255c9.286-3.137 15.992-11.926 15.992-22.257 0-12.953-10.538-23.491-23.492-23.491-12.953 0-23.491 10.538-23.491 23.491 0 10.331 6.706 19.119 15.991 22.257v39.255c0 26.193-21.31 47.502-47.502 47.502-26.193 0-47.503-21.31-47.503-47.502v-39.255c9.285-3.138 15.991-11.926 15.991-22.257 0-12.953-10.538-23.491-23.491-23.491s-23.491 10.538-23.491 23.491c0 10.331 6.706 19.119 15.991 22.257v39.255c0 34.463 28.039 62.502 62.503 62.502zm55.002-132.506c4.683 0 8.492 3.809 8.492 8.491s-3.81 8.492-8.492 8.492-8.491-3.81-8.491-8.492 3.809-8.491 8.491-8.491zm-110.005 0c4.682 0 8.491 3.809 8.491 8.491s-3.81 8.492-8.491 8.492-8.491-3.81-8.491-8.492 3.81-8.491 8.491-8.491z" />
                                                                        <path d="m37.089 511.986h444.688c11.476 0 20.419-9.982 19.168-21.384l-8.756-79.901c-.451-4.119-4.146-7.084-8.272-6.639-4.117.452-7.089 4.155-6.638 8.272l8.756 79.902c.277 2.535-1.705 4.75-4.258 4.75h-212.602-.01c-2.533 0-4.537-2.194-4.258-4.75l21.63-197.371c.238-2.175 2.069-3.816 4.258-3.816h169.354c2.188 0 4.019 1.641 4.258 3.816l9.037 82.469c.451 4.117 4.129 7.087 8.272 6.639 4.117-.452 7.089-4.155 6.638-8.272l-9.037-82.469c-1.074-9.795-9.314-17.182-19.168-17.182h-82.974l-11.582-105.69c-1.456-13.291-12.637-23.313-26.007-23.313h-29.839v-42.767c0-57.5-46.78-104.28-104.28-104.28s-104.28 46.78-104.28 104.28v42.767h-29.838c-13.371 0-24.552 10.022-26.008 23.313l-34.259 312.614c-1.695 15.475 10.446 29.012 26.007 29.012zm-11.096-27.379 34.259-312.613c.622-5.67 5.393-9.947 11.098-9.947h29.838v27.928c-9.798 3.172-16.905 12.38-16.905 23.221 0 13.457 10.948 24.405 24.405 24.405s24.405-10.948 24.405-24.405c0-10.841-7.107-20.049-16.905-23.221v-27.928h71.78c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-71.78v-42.767c0-49.229 40.051-89.28 89.28-89.28s89.28 40.051 89.28 89.28v42.767h-71.78c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h71.78v27.928c-9.798 3.172-16.904 12.38-16.904 23.221 0 13.457 10.947 24.405 24.404 24.405s24.405-10.948 24.405-24.405c0-10.841-7.107-20.049-16.905-23.221v-27.928h29.839c5.704 0 10.475 4.276 11.097 9.947l11.402 104.056h-71.29c-9.855 0-18.096 7.387-19.168 17.183l-21.63 197.371c-.236 2.148-.046 4.562.369 6.383h-213.278c-6.65-.001-11.821-5.754-11.096-12.38zm82.694-280.816c5.187 0 9.405 4.219 9.405 9.405s-4.219 9.405-9.405 9.405-9.405-4.219-9.405-9.405 4.218-9.405 9.405-9.405zm193.56 0c5.187 0 9.405 4.219 9.405 9.405s-4.219 9.405-9.405 9.405-9.404-4.219-9.404-9.405 4.219-9.405 9.404-9.405z" />
                                                                    </g>
                                                                </svg>
                                                                <span class="mr-3" onclick="mst()">Mua hàng</span>
                                                            </button>
                                                        </div>
                                                    <?php } else { ?>
                                                        <div class="d-inline-flex banner-w position-relative modal-open buy_mewshoes clearfix bg_swatch align-items-center justify-content-center pt-2 pb-2 pl-3 pr-3">
                                                            <button name="CART" type="submit" action="index.php?option=cart/process&addcat=<?php echo $row['id']; ?>" class="border-0 product-action_buy js-addToCart p-0 d-flex">
                                                                <span class="mr-3" onclick="msg()">Thêm vào giỏ hàng</span>
                                                            </button>
                                                        </div>
                                                        <div class="d-inline-flex banner-w position-relative modal-open buy_mewshoes clearfix bg_swatch align-items-center justify-content-center pt-2 pb-2 pl-3 pr-3">
                                                            <button name="BUY" type="submit" class="border-0 product-action_buy js-addToCart p-0 d-flex">
                                                                <svg enable-background="new 0 0 511.987 511.987" height="24" viewBox="0 0 511.987 511.987" width="24">
                                                                    <g>
                                                                        <path d="m375.472 449.911c34.464 0 62.502-28.039 62.502-62.502v-39.255c9.286-3.137 15.992-11.926 15.992-22.257 0-12.953-10.538-23.491-23.492-23.491-12.953 0-23.491 10.538-23.491 23.491 0 10.331 6.706 19.119 15.991 22.257v39.255c0 26.193-21.31 47.502-47.502 47.502-26.193 0-47.503-21.31-47.503-47.502v-39.255c9.285-3.138 15.991-11.926 15.991-22.257 0-12.953-10.538-23.491-23.491-23.491s-23.491 10.538-23.491 23.491c0 10.331 6.706 19.119 15.991 22.257v39.255c0 34.463 28.039 62.502 62.503 62.502zm55.002-132.506c4.683 0 8.492 3.809 8.492 8.491s-3.81 8.492-8.492 8.492-8.491-3.81-8.491-8.492 3.809-8.491 8.491-8.491zm-110.005 0c4.682 0 8.491 3.809 8.491 8.491s-3.81 8.492-8.491 8.492-8.491-3.81-8.491-8.492 3.81-8.491 8.491-8.491z" />
                                                                        <path d="m37.089 511.986h444.688c11.476 0 20.419-9.982 19.168-21.384l-8.756-79.901c-.451-4.119-4.146-7.084-8.272-6.639-4.117.452-7.089 4.155-6.638 8.272l8.756 79.902c.277 2.535-1.705 4.75-4.258 4.75h-212.602-.01c-2.533 0-4.537-2.194-4.258-4.75l21.63-197.371c.238-2.175 2.069-3.816 4.258-3.816h169.354c2.188 0 4.019 1.641 4.258 3.816l9.037 82.469c.451 4.117 4.129 7.087 8.272 6.639 4.117-.452 7.089-4.155 6.638-8.272l-9.037-82.469c-1.074-9.795-9.314-17.182-19.168-17.182h-82.974l-11.582-105.69c-1.456-13.291-12.637-23.313-26.007-23.313h-29.839v-42.767c0-57.5-46.78-104.28-104.28-104.28s-104.28 46.78-104.28 104.28v42.767h-29.838c-13.371 0-24.552 10.022-26.008 23.313l-34.259 312.614c-1.695 15.475 10.446 29.012 26.007 29.012zm-11.096-27.379 34.259-312.613c.622-5.67 5.393-9.947 11.098-9.947h29.838v27.928c-9.798 3.172-16.905 12.38-16.905 23.221 0 13.457 10.948 24.405 24.405 24.405s24.405-10.948 24.405-24.405c0-10.841-7.107-20.049-16.905-23.221v-27.928h71.78c4.143 0 7.5-3.358 7.5-7.5s-3.357-7.5-7.5-7.5h-71.78v-42.767c0-49.229 40.051-89.28 89.28-89.28s89.28 40.051 89.28 89.28v42.767h-71.78c-4.143 0-7.5 3.358-7.5 7.5s3.357 7.5 7.5 7.5h71.78v27.928c-9.798 3.172-16.904 12.38-16.904 23.221 0 13.457 10.947 24.405 24.404 24.405s24.405-10.948 24.405-24.405c0-10.841-7.107-20.049-16.905-23.221v-27.928h29.839c5.704 0 10.475 4.276 11.097 9.947l11.402 104.056h-71.29c-9.855 0-18.096 7.387-19.168 17.183l-21.63 197.371c-.236 2.148-.046 4.562.369 6.383h-213.278c-6.65-.001-11.821-5.754-11.096-12.38zm82.694-280.816c5.187 0 9.405 4.219 9.405 9.405s-4.219 9.405-9.405 9.405-9.405-4.219-9.405-9.405 4.218-9.405 9.405-9.405zm193.56 0c5.187 0 9.405 4.219 9.405 9.405s-4.219 9.405-9.405 9.405-9.404-4.219-9.404-9.405 4.219-9.405 9.404-9.405z" />
                                                                    </g>
                                                                </svg>
                                                                <span class="mr-3">Mua hàng</span>
                                                            </button>
                                                        </div>
                                                    <?php } ?>
                                                <?php } ?>
                                                <div class="gift_cnt position-relative p-3 rounded mb-3">
                                                    <div class="product-promotions-list-title pb-1 mb-2 font-weight-bold">
                                                        <span>KHUYẾN MÃI</span>
                                                    </div>
                                                    <div class="product-promotions-list-content">
                                                        <div class="promo-detail">
                                                            <ul>
                                                                <li>Phiếu tích điểm cho các lần mua tiếp theo.</li>
                                                                <li>Mua 3 sản phẩm giảm 5%.</li>
                                                                <li>Mua 5 sản phẩm giảm 6%.</li>
                                                                <li>Ưu đãi khách hàng Vip.</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-content rte">
                                                    <div class="panel-group" id="accordion">
                                                        <div class="card mb-2">

                                                            <div class="card-header">
                                                                <a data-toggle="collapse" class="" title="Thông tin chi tiết ">
                                                                    <h3 class="panel-title">Thông tin chi tiết </h3>
                                                                </a>
                                                            </div>
                                                            <div id="collapse0" class="panel-collapse collapse show">
                                                                <div class="card-body">
                                                                    <p><strong>Trọng lượng:&nbsp;</strong><?php echo $pro['Trong_luong']; ?> </p>
                                                                    <p><strong>Âm thanh:</strong>&nbsp;<?php echo $pro['Am_thanh']; ?> </p>
                                                                    <p><strong>Bộ nhớ:</strong>&nbsp;<?php echo $pro['Bo_nho']; ?> </p>
                                                                    <p><strong>Hệ điều hành:&nbsp;</strong><?php echo $pro['He_dieu_hanh']; ?> </p>
                                                                    <p><strong>Thẻ nhớ:&nbsp;</strong><?php echo $pro['The_nho']; ?> </p>
                                                                    <p><strong>Camera:&nbsp;</strong><?php echo $pro['Camera']; ?> </p>
                                                                    <p><strong>Pin:&nbsp;</strong><?php echo $pro['Pin']; ?> </p>
                                                                    <p><strong>Bảo hành:&nbsp;</strong><?php echo $pro['Bao_hanh']; ?> </p>
                                                                    <p><strong>Kết nối:&nbsp;</strong><?php echo $pro['Ket_noi']; ?> </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="true"></div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
        </div>
    </section>
</body>
<script>
    function msg() {
        alert("Sản phẩm đã được thêm vào giỏ hàng của bạn! ");
        alert("Vào giỏ hàng để kiểm tra nha. :))");
    }
    function mst() {
        alert("Sản phẩm này hiện đã hết hàng!");
    }
    function msgg() {
        alert("Sản phẩm đã có trong giỏ hàng của bạn nên số lượng sẻ được cộng thêm! ", 1000);
        alert("Vào giỏ hàng để kiểm tra nha. :))");
    }

    function msgt() {
        alert("Bạn chưa đăng nhập! ");
        alert("Hảy đăng nhập để tiếp tục. :))");
    }
</script>

</html>
<?php require_once('views/frontend/footer.php'); ?>