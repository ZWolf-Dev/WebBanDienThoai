<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');


use App\Models\User;
use App\Models\Product;
use App\Models\Buy;
use App\Models\Category;

$category = new Category();
$user = new User();
$product = new Product();
$buy = new Buy();

$userid = $_REQUEST['userid'];
$list_user = $user->user_list(['status' => 'index']);
$listcat = $category->category_parentid(0);

// $row = $buy->buy_list(['status' => 'index']);
$listproduct = $buy->buy_pro($userid);
// // foreach ($list as $row) : $productid = $row["productid"]; endforeach;
// $listproduct = $product->product_id($list);

?>
<!DOCTYPE html>
<html lang="en">

<?php require_once('views/frontend/header.php'); ?>


<body>
    <section class="signup page_customer_account" style="min-height:500px;">
        <span class="crumb-border"></span>

        <div class="row">
            <div class="col-xs-12 a-left">
                <ul class="breadcrumb list-unstyled">
                    <li class="home">
                        <a href="index.php?option=account/index"><span>Trang chủ</span></a>
                    </li>
                    <li><strong><span>Trang khách hàng</span></strong></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-lg-3 col-left-ac">
                    <div class="block-account">
                        <p>Xin chào, <span style="color:red;">
                                <?php foreach ($list_user as $row) : ?>
                                    <?php if ($row['id'] == $userid) : {
                                            echo $row['name'];
                                        }
                                    ?>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </span>&nbsp;!</p>
                        <ul>
                            <li>
                                <a disabled="disabled" class="title-info active" href="index.php?option=account/information&userid=<?php echo $userid ?>">Thông tin tài khoản</a>
                            </li>
                            <li>
                                <a class="title-info" href="index.php?option=account/order&userid=<?php echo $userid; ?>">Đơn hàng</a>
                            </li>
                            <li>
                                <a class="title-info" href="index.php?option=account/resetpassword&userid=<?php echo $userid; ?>">Đổi mật khẩu</a>
                            </li>
                            <li>
                                <a class="title-info" href="#">Sản phẩm đã mua</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-lg-9 col-right-ac">
                    <h1 class="title-head margin-top-0">Sản phẩm đã mua</h1>
                    <div class="form-signup name-account m992">
                        <div class="content-wrapper py-2">
                            <!-- Main content -->
                            <section class="content">
                                <?php foreach ($listproduct as $pro) : ?>
                                    <div class="col-md-3">
                                        <div style="height:28em;" id="card" class="card">
                                            <a href="index.php?option=product/product&id=<?php echo $pro['id']; ?>&quantity=<?php echo $pro['quantity']; ?>&price=<?php echo $pro['price']; ?>&pricesale=<?php echo $pro['pricesale']; ?>">
                                                <img style="height:12em;" id="imgcard" src="public/images/products/<?php echo $pro['image']; ?>" class="card-img-top" alt="<?php echo $pro['image']; ?>">
                                            </a>
                                            <div class="card-body">
                                                <?php if (!isset($_SESSION['useradmin'])) { ?>
                                                    <h5 href="index.php?option=product/&id=<?php echo $pro['id']; ?>" class="card-title"><?php echo $pro['name']; ?></h5>
                                                    <?php if ($pro['storehouse'] == 0) {  ?>
                                                        <span class="inventory_quantity text-danger">Hết hàng</span>
                                                    <?php } else { ?>
                                                        <span class="inventory_quantity text-success">Còn hàng: <?php echo $pro['storehouse']; ?>sp</span>
                                                    <?php } ?>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <h5 style="text-align:right;">Số lượng: </h5>
                                                        </div>
                                                        <div class="col-4">
                                                            <input type="number" style="width:5em;" maxlength="2" id="qtym" name="quantity" min="0" max="<?php echo $pro['storehouse']; ?>" value="<?php echo $pro['quantity']; ?>" class="border-0 form-control text-center prd_quantity font-weight-bold" onkeypress="if ( isNaN(this.value + String.fromCharCode(event.keyCode) )) return false;" onchange="if(this.value == 0)this.value=1;">
                                                        </div>
                                                    </div>
                                                    <input class="btn btn-warning btn-block" type="button" style="max-width:20em;" value="Thêm vào giỏ hàng" onclick="msgt()">
                                                    <div class="product-price font-weight-bold mt-2 mb-2 position-relative ">
                                                        <span class="cl_swatch f_price">Giá: </span>
                                                        <span class="special-price m-0 cl_swatch"><?php echo number_format($pro['pricesale']); ?></span>
                                                        <del class="old-price m-0 text-danger"> <?php echo number_format($pro['price']); ?></del>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <button onclick="msgt()" class="btn btn-dark btn-block"><i class="fas fa-eye"></i></button>
                                                        </div>
                                                        <!-- /.col -->
                                                        <div class="col-6">
                                                            <button onclick="msgt()" class="btn btn-dark btn-block"><i class="fa-solid fa-cart-arrow-down"></i></button>
                                                        </div>
                                                    </div>
                                                <?php } else { ?>
                                                    <?php if (isset($pro['id'])) { ?>
                                                        <form accept-charset="utf-8" action="index.php?option=cart/process&addcat=<?php echo $pro['id']; ?>" id="customer_cart" method="post">
                                                            <input name="data[id]" value="<?php echo $pro['id']; ?>" type="hidden" />
                                                            <input name="newid" value="<?php echo $pro['id']; ?>" type="hidden" />
                                                            <input name="data[categoryid]" value="<?php echo $pro['categoryid']; ?>" type="hidden" />
                                                            <input name="data[brandid]" value="<?php echo $pro['brandid']; ?>" type="hidden" />
                                                            <input name="data[userid]" value="<?php echo $_SESSION['userid']; ?>" type="hidden" />
                                                            <input name="data[name]" id="name" value="<?php echo $pro['name']; ?>" type="hidden" />
                                                            <input name="data[detail]" id="detail" value="<?php echo $pro['detail']; ?>" type="hidden" />
                                                            <input name="price" id="price" value="<?php echo $pro['price']; ?>" type="hidden" />
                                                            <input name="pricesale" id="pricesale" value="<?php echo $pro['pricesale']; ?>" type="hidden" />
                                                            <input name="image" value="<?php echo $pro['image']; ?>" hidden />
                                                            <input name="data[status]" id="status" value="<?php echo $pro['status']; ?>" type="hidden" />
                                                            <input name="data[metakey]" id="metakey" value="<?php echo $pro['metakey']; ?>" type="hidden" />
                                                            <input name="data[metadesc]" id="metadesc" value="<?php echo $pro['metadesc']; ?>" type="hidden" />
                                                            <h5 href="index.php?option=product/&id=<?php echo $pro['id']; ?>" class="card-title"><?php echo $pro['name']; ?></h5>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <h5 style="text-align:right;">Số lượng: </h5>
                                                                </div>
                                                                <div class="col-4">
                                                                    <input type="number" style="width:5em;" maxlength="2" id="qtym" name="quantity" min="0" max="<?php echo $pro['storehouse']; ?>" value="<?php echo $pro['quantity']; ?>" class="border-0 form-control text-center prd_quantity font-weight-bold" onkeypress="if ( isNaN(this.value + String.fromCharCode(event.keyCode) )) return false;" onchange="if(this.value == 0)this.value=1;">
                                                                </div>
                                                            </div>
                                                            <button name="CART" type="submit" style="min-width:12em; border: 0px;">
                                                                <input class="btn btn-warning btn-block" style="min-width:12em;" type="button" value="Thêm vào giỏ hàng" onclick="msg()">
                                                            <?php } else { ?>
                                                                <input class="btn btn-warning btn-block" style="min-width:12em;" type="button" value="Thêm vào giỏ hàng" onclick="msga()">
                                                            <?php } ?>
                                                            </button>
                                                            <div class="product-price font-weight-bold mt-2 mb-2 position-relative ">
                                                                <span class="cl_swatch f_price">Giá: </span>
                                                                <span class="special-price m-0 cl_swatch"><?php echo number_format($pro['pricesale']); ?></span>
                                                                <del class="old-price m-0 text-danger"> <?php echo number_format($pro['price']); ?></del>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <button name="DETAIL" type="submit" class="btn btn-dark btn-block"><i class="fas fa-eye"></i></button>
                                                                </div>
                                                                <!-- /.col -->
                                                                <div class="col-6">
                                                                    <button name="BUY" type="submit" class="btn btn-dark btn-block"><i class="fa-solid fa-cart-arrow-down"></i></button>
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                        </form>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            </section>
                            <!-- /.content -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<?php require_once('views/frontend/footer.php'); ?>