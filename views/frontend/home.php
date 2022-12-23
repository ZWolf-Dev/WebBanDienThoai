<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\Category;
use App\Models\Brand;
use App\Models\User;
use App\Models\Product;

$category = new Category();
$brand = new Brand();
$user = new User();
$product = new Product();
$listcat = $category->category_parentid(0);

?>
<?php require_once('views/frontend/header.php'); ?>
<section id="home" class="maincontent">
  <div class="row-md-12">
    <div class="col-md-4 mt-4">
      <?php require_once('views/frontend/left-menu.php'); ?>
    </div>
    <div class="col-md-8" style="min-height:35em ;">
      <?php require_once('views/frontend/mod_slider.php'); ?>
    </div>
  </div>
  <a href="index.php?option=product/product&id=7&quantity=1&price=25009000&pricesale=20000000">
    <img class="button-slider" src="public/images/button-slider.png" alt="public/images/button-slider.png">
  </a>
  <div class="container">
    <!--end slider-->
    <div class="row product-home my-3">
      <?php foreach ($listcat as $cat) : ?>
        <?php
        $catlistid = array();
        $catlistid[] = $cat['id'];
        $listcat1 = $category->category_parentid($cat['id']);
        if (count($listcat1)) {
          foreach ($listcat1 as $cat1) {
            $catlistid[] = $cat1['id'];
            $listcat2 = $category->category_parentid($cat1['id']);
            if (count($listcat2)) {
              foreach ($listcat2 as $cat2) {
                $catlistid[] = $cat2['id'];
              }
            }
          }
        }
        //print_r($catlistid);

        $listproduct = $product->product_home($catlistid, 8);
        ?>
        <input name="userid" id="userid" value="<?php echo $_SESSION['userid']; ?>" type="hidden" />
        <input name="name" id="name" value="<?php echo $_SESSION['name']; ?>" type="hidden" />
        <div class="col-md-12">
          <div class="banchay">
            <a href="index.php?option=product&cat=<?php echo $cat['slug']; ?>" class="text-dark">
              <h3><?php echo $cat['name']; ?></h3>
            </a>
            <div class="row m-auto">
              <?php foreach ($listproduct as $pro) : ?>
                <div class="col-md-3">
                  <div style="height:28em;" id="card" class="card">
                    <a href="index.php?option=product/product&id=<?php echo $pro['id']; ?>&quantity=<?php echo $pro['quantity']; ?>&price=<?php echo $pro['price']; ?>&pricesale=<?php echo $pro['pricesale']; ?>">
                      <img style="height:11em;" id="imgcard" src="public/images/products/<?php echo $pro['image']; ?>" class="card-img-top" alt="<?php echo $pro['image']; ?>">
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
                            <a href="index.php?option=product/product&id=<?php echo $pro['id']; ?>&quantity=<?php echo $pro['quantity']; ?>&price=<?php echo $pro['price']; ?>&pricesale=<?php echo $pro['pricesale']; ?>">
                              <button class="btn btn-dark btn-block"><i class="fas fa-eye"></i></button>
                            </a>
                          </div>
                          <!-- /.col -->
                          <div class="col-6">
                            <button onclick="msgt()" class="btn btn-dark btn-block"><i class="fa-solid fa-cart-arrow-down"></i></button>
                          </div>
                        </div>
                      <?php } else { ?>
                        <?php if ($pro['storehouse'] == 0) { ?>
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
                          <input class="btn btn-warning btn-block" type="button" style="max-width:20em;" value="Thêm vào giỏ hàng" onclick="msgb()">
                          <div class="product-price font-weight-bold mt-2 mb-2 position-relative ">
                            <span class="cl_swatch f_price">Giá: </span>
                            <span class="special-price m-0 cl_swatch"><?php echo number_format($pro['pricesale']); ?></span>
                            <del class="old-price m-0 text-danger"> <?php echo number_format($pro['price']); ?></del>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <a href="index.php?option=product/product&id=<?php echo $pro['id']; ?>&quantity=<?php echo $pro['quantity']; ?>&price=<?php echo $pro['price']; ?>&pricesale=<?php echo $pro['pricesale']; ?>">
                                <button class="btn btn-dark btn-block"><i class="fas fa-eye"></i></button>
                              </a>
                            </div>
                            <!-- /.col -->
                            <div class="col-6">
                              <button onclick="msgb()" class="btn btn-dark btn-block"><i class="fa-solid fa-cart-arrow-down"></i></button>
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
                              <div class="product-info position-relative">
                                    <?php if ($pro['storehouse'] == 0) {  ?>
                                        <span class="inventory_quantity text-danger">Hết hàng</span>
                                    <?php } else { ?>
                                        <span class="inventory_quantity text-success">Còn hàng: <?php echo $pro['storehouse']; ?>sp</span>
                                    <?php } ?>
                                </div>
                              <div class="row">
                                <div class="col-6">
                                  <h5 style="text-align:right;">Số lượng: </h5>
                                </div>
                                <div class="col-4">
                                  <input type="number" style="width:5em;" style="width:5em;" maxlength="2" id="qtym" name="quantity" min="0" max="<?php echo $pro['storehouse']; ?>" value="<?php echo $pro['quantity']; ?>" class="border-0 form-control text-center prd_quantity font-weight-bold" onkeypress="if ( isNaN(this.value + String.fromCharCode(event.keyCode) )) return false;" onchange="if(this.value == 0)this.value=1;">
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
                          <?php } ?>
                    </div>
                  </div>
                </div>
              <?php endforeach; ?>
            </div>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>
<script>
  function msg() {
    alert("Thêm vào giỏ hàng thành công!");
  }

  function msgb() {
    alert("Sản phẩm này đã hết hàng!");
  }

  function msga() {
    alert("Sản phẩm đã có trong giỏ hàng của bạn nên số lượng sẻ được cộng thêm! ", 1000);
  }

  function msgt() {
    alert("Bạn chưa đăng nhập! ");
  }
</script>
<!--section maincontent-->
<?php require_once('views/frontend/footer.php'); ?>