<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\Cart;
use App\Models\User;

$cart = new Cart();
$user = new User();

$list = $cart->cart_list(['status' => 'index']);
?>
<?php require_once('views/frontend/header.php'); ?>
<html>
<section class="page margin-top-30 margin-bottom-30">
    <ul class="breadcrumb align-items-center pl-0 pr-0 m-0">
        <li class="font-weight-bold">
            <a href="index.php?option=account/index" title="HN Store">Trang chủ</a>
        </li>
        <li class="font-weight-bold"> Giỏ hàng</li>
    </ul>
</section>
<div class="container">
    <div class="m-auto">
        <h1>Giỏ hàng của bạn</h1>
        <tbody>
            <?php foreach ($list as $row) :
                if ($_SESSION['userid'] == $row['userid']) { ?>

                    <div id="card" style="margin:1em; padding:1em;" class="col-lg-4">
                        <a href="index.php?option=product/product&id=<?php echo $row['id']; ?>&quantity=<?php echo $row['quantity']; ?>&price=<?php echo $row['price']; ?>&pricesale=<?php echo $row['pricesale']; ?>">
                            <img src="public/images/carts/<?php echo $row['image']; ?>" class="img-fluid" alt="<?php echo $row['image']; ?>">
                        </a>
                        <div class="item-info mt-1 text-center ">
                            <a href="index.php?option=cart/&id=<?php echo $row['id']; ?>" title="">
                                <?php echo $row['name']; ?>
                            </a>
                            <form accept-charset="utf-8" action="index.php?option=cart/process&addcat=<?php echo $row['id']; ?>" id="customer_cart" method="post">
                                <input name="data[id]" value="<?php echo $row['id']; ?>" type="hidden" />
                                <input name="newid" value="<?php echo $row['id']; ?>" type="hidden" />
                                <input name="data[categoryid]" value="<?php echo $row['categoryid']; ?>" type="hidden" />
                                <input name="data[brandid]" value="<?php echo $row['brandid']; ?>" type="hidden" />
                                <input name="data[userid]" value="<?php echo $_SESSION['userid']; ?>" type="hidden" />
                                <input name="data[name]" id="name" value="<?php echo $row['name']; ?>" type="hidden" />
                                <input name="data[detail]" id="detail" value="<?php echo $row['detail']; ?>" type="hidden" />
                                <input name="price" id="price" value="<?php echo $row['price']; ?>" type="hidden" />
                                <input name="pricesale" id="pricesale" value="<?php echo $row['pricesale']; ?>" type="hidden" />
                                <input name="image" value="<?php echo $row['image']; ?>" hidden />
                                <input name="data[status]" id="status" value="<?php echo $row['status']; ?>" type="hidden" />
                                <input name="userid" id="userid" value="1" type="hidden" />
                                <input name="data[metakey]" id="metakey" value="<?php echo $row['metakey']; ?>" type="hidden" />
                                <input name="data[metadesc]" id="metadesc" value="<?php echo $row['metadesc']; ?>" type="hidden" />
                                <h5>Số lượng:
                                    <button name="EDITCART" type="submit" style="max-width:5em; max-height:6em; border: 0px;">
                                        <input style="height:1.5em;" type="number" style="width:5em;" maxlength="2" id="qtym" name="qt" min="0" max="<?php echo $pro['storehouse']; ?>" value="<?php echo $row['quantity']; ?>" class="border-0 form-control text-center prd_quantity font-weight-bold">
                                    </button>
                                </h5>
                                <button name="DELETECART" type="submit" style="min-width:12em; border: 0px;">
                                    <input class="btn btn-warning btn-block" type="button" value="Xóa khỏi giỏ hàng" onclick="msg()">
                                </button>
                            </form>
                            <div class="item-price mb-1 ">
                                <span class="special-price font-weight-bold"><?php echo  number_format($row['pricesale']); ?>₫</span>
                                <del class="old-price pl-1"> <?php echo  number_format($row['price']); ?>₫</del>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <a href="index.php?option=product/&id=<?php echo $row['id']; ?>&quantity=<?php echo $row['quantity']; ?>&pricesale=<?php echo $row['pricesale']; ?>"><button type="submit" class="btn btn-dark btn-block"><i class="fas fa-eye"></i></button></a>
                                </div>
                                <!-- /.col -->
                                <div class="col-6">
                                    <a href="index.php?option=cart/order&id=<?php echo $row['id']; ?>&quantity=<?php echo $row['quantity']; ?>&pricesale=<?php echo $row['pricesale']; ?>"><button type="submit" class="btn btn-dark btn-block"><i class="fa-solid fa-cart-arrow-down"></i></button></a>
                                </div>
                            </div>
                        </div>
                    </div>
            <?php } endforeach; ?>
        </tbody>
    </div>
</div>
</html>
<script>
    function msg() {
        alert("Sản phẩm đã được xóa khỏi giỏ hàng của bạn!");
    }
</script>
<?php require_once('views/frontend/footer.php'); ?>