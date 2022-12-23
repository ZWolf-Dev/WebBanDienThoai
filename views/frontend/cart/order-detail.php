<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');

use App\Models\Product;
use App\Models\Category;
use App\Models\Productdetail;
use App\Models\User;

$product = new Product();
$category = new Category();
$productdetail = new Productdetail();
$user = new User();

$id = $_REQUEST['id'];
$rowuser = $user->users_row($_SESSION['userid']);
$quantity = $_REQUEST['quantity'];
$pricesale = $_REQUEST['pricesale'] * $quantity + 40000;

$row = $product->product_row($id);
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

<!DOCTYPE html>
<html class="floating-labels">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="Template OnTech - Thanh toán đơn hàng" />
    <title>Template OnTech - Thanh toán đơn hàng</title>
    <!-- <link rel="stylesheet" href="public/css/FormOrder/flag-icons.min.css" /> -->
    <link rel="icon" href="public/images/Logo.png" type="image/x-icon" />
    <link rel="stylesheet" href="public/css/FormOrder/checkout.vendor.min.css?v=4fcd86c">
    <link rel="stylesheet" href="public/css/FormOrder/checkout.min.css?v=a876575">
    <!-- Begin checkout custom css -->
    <style>
    </style>
    <!-- End checkout custom css -->
    <script src="public/js/SelectAddressAndOrder/libphonenumber-v3.2.30.min.js?1666863044728"></script>
    <script src="public/js/SelectAddressAndOrder/checkout.vendor.min.js?v=11006c9"></script>
    <script src="public/js/SelectAddressAndOrder/checkout.min.js?v=ee358d5"></script>
    <script>
        var Bizweb = Bizweb || {};
        Bizweb.id = '465730';
        Bizweb.store = 'template-ontech.mysapo.net';
        Bizweb.template = 'checkout';
        Bizweb.Checkout = Bizweb.Checkout || {};
        Bizweb.Checkout.token = "07827da70d484e27be510bbf3316f9be"
        Bizweb.Checkout.apiHost = "template-ontech.mysapo.net"
    </script>
    <script>
        window.BizwebAnalytics = window.BizwebAnalytics || {};
        window.BizwebAnalytics.meta = window.BizwebAnalytics.meta || {};
        window.BizwebAnalytics.meta.currency = 'VND';
        window.BizwebAnalytics.tracking_url = '/s';
        var meta = {};
        for (var attr in meta) {
            window.BizwebAnalytics.meta[attr] = meta[attr];
        }
    </script>
    <script src="public/js/SelectAddressAndOrder/stats.min.js?v=69e02f0"></script>
</head>

<body data-no-turbolink>
    <header class="banner">
        <div class="wrap">
            <div class="logo logo--left ">
                <h1 class="shop__name">
                    <a href="/">
                        Template OnTech
                    </a>
                </h1>
            </div>
        </div>
    </header>
    <aside>
        <button class="order-summary-toggle" data-toggle="#order-summary" data-toggle-class="order-summary--is-collapsed">
            <span class="wrap">
                <span class="order-summary-toggle__inner">
                    <span class="order-summary-toggle__text expandable">
                        Đơn hàng (3 sản phẩm)
                    </span>
                    <span class="order-summary-toggle__total-recap" data-bind="getTextTotalPrice()"></span>
                </span>
            </span>
        </button>
    </aside>
    <div data-tg-refresh="checkout" id="checkout" class="content">
        <form id="checkoutForm" action="index.php?option=cart/process&addcat=<?php echo $id; ?>" method="post" data-define="{
				loadingShippingErrorMessage: 'Không thể load phí vận chuyển. Vui lòng thử lại',
				loadingReductionCodeErrorMessage: 'Có lỗi xảy ra khi áp dụng khuyến mãi. Vui lòng thử lại',
				submitingCheckoutErrorMessage: 'Có lỗi xảy ra khi xử lý. Vui lòng thử lại',
				requireShipping: true,
				requireDistrict: false,
				requireWard: false,
				shouldSaveCheckoutAbandon: true}">
            <input name="buydata[categoryid]" value="<?php echo $row['categoryid']; ?>" type="hidden" />
            <input name="buydata[brandid]" value="<?php echo $row['brandid']; ?>" type="hidden" />
            <input name="price" id="price" value="<?php echo $row['price']; ?>" type="hidden" />
            <input name="userid" value="<?php echo $_SESSION['userid']; ?>" type="hidden" />
            <input name="status" value="<?php echo $row['status']; ?>" type="hidden" />
            <input name="buydata[name]" id="name" value="<?php echo $row['name']; ?>" type="hidden">
            <input name="quantity" id="quantity" value="<?php echo $quantity; ?>" type="hidden" />
            <input id="pricesale" value="<?php echo $pricesale; ?>" type="hidden" />
            <input name="value[ship]" value="40000" type="hidden" />
            <input name="pricesale" id="price" value="<?php echo $pricesale; ?>" type="hidden" />
            <!-- <input id="COD" type="radio" value="COD" checked name="value[payment]" data-sub=""type="hidden" > -->
            <input type="hidden" name="_method" value="patch" />
            <div class="wrap">
                <main class="main">
                    <header class="main__header">
                        <div class="logo logo--left ">
                            <h1 class="shop__name">
                                <a href="/">
                                    HN STORE
                                </a>
                            </h1>
                        </div>
                    </header>
                    <div class="main__content">
                        <article class="animate-floating-labels row">
                            <div class="col col--two">
                                <section class="section">
                                    <div class="section__header">
                                        <div class="layout-flex">
                                            <h2 class="section__title layout-flex__item layout-flex__item--stretch">
                                                <i class="fa fa-id-card-o fa-lg section__title--icon hide-on-desktop"></i>
                                                Thông tin nhận hàng
                                            </h2>
                                            <a href="index.php?">
                                                <span>Trang chủ </span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="section__content">
                                        <div class="fieldset">
                                            <div class="field " data-bind-class="{'field--show-floating-label': email}">
                                                <div class="field__input-wrapper">
                                                    <label for="email" class="field__label">
                                                        Email
                                                    </label>
                                                    <input name="data[email]" id="email" type="email" class="field__input" data-bind="email" value="<?php echo $rowuser['email']; ?>">
                                                </div>
                                            </div>
                                            <div class="field " data-bind-class="{'field--show-floating-label': billing.name}">
                                                <div class="field__input-wrapper">
                                                    <label for="billingName" class="field__label">Họ và tên</label>
                                                    <input name="data[name]" id="billingName" type="text" class="field__input" data-bind="billing.name" value="<?php echo $rowuser['name']; ?>">
                                                </div>
                                            </div>
                                            <div class="field " data-bind-class="{'field--show-floating-label': billing.phone}">
                                                <div class="field__input-wrapper field__input-wrapper--connected" data-define="{phoneInput: new InputPhone(this)}">
                                                    <label for="billingPhone" class="field__label">
                                                        Số điện thoại (tùy chọn)
                                                    </label>
                                                    <input name="data[phone]" id="billingPhone" type="tel" class="field__input" data-bind="billing.phone" value="<?php echo $rowuser['phone']; ?>" required="">
                                                    <div class="field__input-phone-region-wrapper">
                                                        <select class="field__input select-phone-region" name="billingPhoneRegion" data-init-value="VN"></select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="field field--show-floating-label ">
                                                <div class="field__input-wrapper field__input-wrapper--select2">
                                                    <label for="billingProvince" class="field__label">Tỉnh / Thành phố</label>
                                                    <select id="city" name="Province" class="field__input field__input--select" data-bind="billing.province" data-address-type="" data-address-zone="billing" required="">
                                                        <option value="" selected></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="field field--show-floating-label ">
                                                <div class="field__input-wrapper field__input-wrapper--select2">
                                                    <label for="billingDistrict" class="field__label">
                                                        Quận / Huyện
                                                    </label>
                                                    <select id="district" name="District" class="field__input field__input--select" data-bind="billing.district" data-address-type="" data-address-zone="billing" required="">
                                                        <option value="" selected></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="field field--show-floating-label ">
                                                <div class="field__input-wrapper field__input-wrapper--select2">
                                                    <label for="billingWard" class="field__label">
                                                        Phường / Xã
                                                    </label>
                                                    <select id="ward" name="Ward" class="field__input field__input--select" data-bind="billing.ward" data-address-type="" data-address-zone="billing" required="">
                                                        <option value="" selected></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="field " data-bind-class="{'field--show-floating-label': billing.address}">
                                                <div class="field__input-wrapper">
                                                    <label for="billingAddress" class="field__label">
                                                    Địa chỉ cụ thể
                                                    </label>
                                                    <input name="Address" id="billingAddress" type="text" class="field__input" data-bind="billing.address" value="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                <div class="fieldset">
                                    <h3 class="visually-hidden">Ghi chú</h3>
                                    <div class="field " data-bind-class="{'field--show-floating-label': note}">
                                        <div class="field__input-wrapper">
                                            <label for="note" class="field__label">
                                                Ghi chú (tùy chọn)
                                            </label>
                                            <textarea name="note" id="note" type="text" class="field__input" data-bind="note"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col col--two">
                                <section class="section" data-define="{shippingMethod: '684363_0,40.000 VND'}">
                                    <div class="section__header">
                                        <div class="layout-flex">
                                            <h2 class="section__title layout-flex__item layout-flex__item--stretch">
                                                <i class="fa fa-truck fa-lg section__title--icon hide-on-desktop"></i>
                                                Vận chuyển
                                            </h2>
                                        </div>
                                    </div>
                                    <div class="section__content" data-tg-refresh="refreshShipping" id="shippingMethodList" data-define="{isAddressSelecting: false, shippingMethods: []}">
                                        <div class="alert alert--loader spinner spinner--active" data-bind-show="isLoadingShippingMethod">
                                            <svg xmlns="" class="spinner-loader">
                                                <use href="#spinner"></use>
                                            </svg>
                                        </div>
                                        <div class="alert alert-retry alert--danger hide" data-bind-event-click="handleShippingMethodErrorRetry()" data-bind-show="!isLoadingShippingMethod && !isAddressSelecting && isLoadingShippingError">
                                            <span data-bind="loadingShippingErrorMessage"></span> <i class="fa fa-refresh"></i>
                                        </div>
                                        <div class="content-box" data-bind-show="!isLoadingShippingMethod && !isAddressSelecting && !isLoadingShippingError">
                                            <div class="content-box__row" data-define-array="{shippingMethods: {name: '684363_0,40.000 VND', textPrice: '40.000₫', textDiscountPrice: '-', subtotalPriceWithShippingFee: '43.837.000₫'}}">
                                                <div class="radio-wrapper">
                                                    <div class="radio__input">
                                                        <input type="radio" class="input-radio" name="shippingMethod" id="shippingMethod-684363_0" value="684363_0,40.000 VND" data-bind="shippingMethod">
                                                    </div>
                                                    <label for="shippingMethod-684363_0" class="radio__label">
                                                        <span class="radio__label__primary">
                                                            <span>Giao hàng tận nơi</span>
                                                        </span>
                                                        <span class="radio__label__accessory">
                                                            <span class="content-box__emphasis price">
                                                                40.000₫
                                                            </span>
                                                        </span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="alert alert--info hide" data-bind-show="!isLoadingShippingMethod && isAddressSelecting">
                                            Vui lòng nhập thông tin giao hàng
                                        </div>
                                    </div>
                                </section>

                                <section class="section">
                                    <div class="section__header">
                                        <div class="layout-flex">
                                            <h2 class="section__title layout-flex__item layout-flex__item--stretch">
                                                <i class="fa fa-credit-card fa-lg section__title--icon hide-on-desktop"></i>
                                                Thanh toán
                                            </h2>
                                        </div>
                                    </div>
                                    <div class="section__content">
                                        <div class="content-box" data-define="{paymentMethod: undefined}">
                                            <div class="content-box__row">
                                                <div class="radio-wrapper">
                                                    <div class="radio__input">
                                                        <input checked name="value[payment]" id="paymentMethod-548266" type="radio" class="input-radio" data-bind="paymentMethod" value="COD">
                                                    </div>
                                                    <label for="paymentMethod-548266" class="radio__label">
                                                        <span class="radio__label__primary">Thanh toán khi giao hàng (COD)</span>
                                                    </label>
                                                </div>
                                                <div class="content-box__row__desc" data-bind-show="paymentMethod == 548266">
                                                    <p>Bạn chỉ phải thanh toán khi nhận được hàng</p>
                                                </div>
                                            </div>
                                            <div class="content-box__row">
                                                <div class="radio-wrapper">
                                                    <div class="radio__input">
                                                        <input  name="value[payment]" id="paymentMethod-548266" type="radio" class="input-radio" data-bind="paymentMethod" value="COD">
                                                    </div>
                                                    <label for="paymentMethod-548266" class="radio__label">
                                                        <span class="radio__label__primary">Thanh toán khi giao hàng (COD)</span>
                                                    </label>
                                                </div>
                                                <div class="content-box__row__desc" data-bind-show="paymentMethod == 548266">
                                                    <p>Bạn chỉ phải thanh toán khi nhận được hàng</p>
                                                </div>
                                            </div>
                                            <div class="content-box__row">
                                                <div class="radio-wrapper">
                                                    <div class="radio__input">
                                                        <input  name="value[payment]" id="paymentMethod-548266" type="radio" class="input-radio" data-bind="paymentMethod" value="COD">
                                                    </div>
                                                    <label for="paymentMethod-548266" class="radio__label">
                                                        <span class="radio__label__primary">Thanh toán khi giao hàng (COD)</span>
                                                    </label>
                                                </div>
                                                <div class="content-box__row__desc" data-bind-show="paymentMethod == 548266">
                                                    <p>Bạn chỉ phải thanh toán khi nhận được hàng</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </article>
                        <div class="field__input-btn-wrapper field__input-btn-wrapper--vertical hide-on-desktop">
                            <button name="ORDER" type="submit" class="btn btn-checkout spinner">
                                <span class="spinner-label">ĐẶT HÀNG</span>
                            </button>
                            <a href="index.php?option=cart/cart" class="previous-link">
                                <i class="previous-link__arrow">❮</i>
                                <span class="previous-link__content">Quay về giỏ hàng</span>
                            </a>
                        </div>
                        <div id="common-alert" data-tg-refresh="refreshError">
                            <div class="alert alert--danger hide-on-desktop" data-bind-show="!isSubmitingCheckout && isSubmitingCheckoutError" data-bind="submitingCheckoutErrorMessage">
                            </div>
                        </div>
                    </div>
                </main>
                <aside class="sidebar">
                    <div class="sidebar__header">
                        <h2 class="sidebar__title">
                            Đơn hàng (<?php echo $quantity; ?> sản phẩm)
                        </h2>
                    </div>
                    <div class="sidebar__content">
                        <div id="order-summary" class="order-summary order-summary--is-collapsed">
                            <div class="order-summary__sections">
                                <div class="order-summary__section order-summary__section--product-list order-summary__section--is-scrollable order-summary--collapse-element">
                                    <table class="product-table">
                                        <caption class="visually-hidden">Chi tiết đơn hàng</caption>
                                        <thead class="product-table__header">
                                            <tr>
                                                <th>
                                                    <span class="visually-hidden">Ảnh sản phẩm</span>
                                                </th>
                                                <th>
                                                    <span class="visually-hidden">Mô tả</span>
                                                </th>
                                                <th>
                                                    <span class="visually-hidden">Sổ lượng</span>
                                                </th>
                                                <th>
                                                    <span class="visually-hidden">Đơn giá</span>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="product">
                                                <td class="product__image">
                                                    <div class="product-thumbnail">
                                                        <div class="product-thumbnail__wrapper" data-tg-static>
                                                            <img src="public/images/products/<?php echo $row['image']; ?>" style="max-width:50px;" class="img-fluid" alt="<?php echo $row['image']; ?>">
                                                            <input name="image" value="<?php echo $row['image']; ?>" hidden />
                                                        </div>
                                                        <span class="product-thumbnail__quantity"><?php echo $quantity; ?></span>
                                                    </div>
                                                </td>
                                                <th class="product__description">
                                                    <span class="product__description__name">
                                                        <?php echo $row['name']; ?>
                                                    </span>
                                                </th>
                                                <td class="product__quantity visually-hidden"><em>Số lượng:</em> <?php echo $quantity; ?></td>
                                                <td class="product__price">
                                                    <?php echo $pricesale; ?>₫
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="order-summary__section order-summary__section--discount-code" data-tg-refresh="refreshDiscount" id="discountCode">
                                    <h3 class="visually-hidden">Mã khuyến mại</h3>
                                    <div class="edit_checkout animate-floating-labels">
                                        <div class="fieldset">
                                            <div class="field  ">
                                                <div class="field__input-btn-wrapper">
                                                    <div class="field__input-wrapper">
                                                        <label for="reductionCode" class="field__label">Nhập mã giảm giá</label>
                                                        <input name="reductionCode" id="reductionCode" type="text" class="field__input" autocomplete="off" data-bind-disabled="isLoadingReductionCode" data-bind-event-keypress="handleReductionCodeKeyPress(event)" data-define="{reductionCode: null}" data-bind="reductionCode">
                                                    </div>
                                                    <button class="field__input-btn btn spinner" type="button" data-bind-disabled="isLoadingReductionCode || !reductionCode" data-bind-class="{'spinner--active': isLoadingReductionCode, 'btn--disabled': !reductionCode}" data-bind-event-click="applyReductionCode()">
                                                        <span class="spinner-label">Áp dụng</span>
                                                        <svg xmlns="" class="spinner-loader">
                                                            <use href="#spinner"></use>
                                                        </svg>
                                                    </button>
                                                </div>
                                                <p class="field__message field__message--error field__message--error-always-show" data-bind-show="!isLoadingReductionCode && isLoadingReductionCodeError" data-bind="loadingReductionCodeErrorMessage">
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-summary__section order-summary__section--total-lines order-summary--collapse-element" data-define="{subTotalPriceText: '43.797.000₫'}" data-tg-refresh="refreshOrderTotalPrice" id="orderSummary">
                                    <table class="total-line-table">
                                        <caption class="visually-hidden">Tổng giá trị</caption>
                                        <thead>
                                            <tr>
                                                <td><span class="visually-hidden">Mô tả</span></td>
                                                <td><span class="visually-hidden">Giá tiền</span></td>
                                            </tr>
                                        </thead>
                                        <tbody class="total-line-table__tbody">
                                            <tr class="total-line total-line--subtotal">
                                                <th class="total-line__name">
                                                    Tạm tính
                                                </th>
                                                <td class="total-line__price"><?php echo $pricesale; ?>₫</td>
                                            </tr>
                                            <tr class="total-line total-line--shipping-fee">
                                                <th class="total-line__name">
                                                    Phí vận chuyển
                                                </th>
                                                <td class="total-line__price" data-bind="getTextShippingPrice()">
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot class="total-line-table__footer">
                                            <tr class="total-line payment-due">
                                                <th class="total-line__name">
                                                    <span class="payment-due__label-total">
                                                        Tổng cộng
                                                    </span>
                                                </th>
                                                <td class="total-line__price">
                                                    <span class="payment-due__price"><?php echo $pricesale; ?>₫</span>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="order-summary__nav field__input-btn-wrapper hide-on-mobile layout-flex--row-reverse">
                                    <button name="ORDER" type="submit" class="btn btn-checkout spinner">
                                        <span class="spinner-label">ĐẶT HÀNG</span>
                                    </button>
                                    <a href="index.php?option=cart/cart" class="previous-link">
                                        <i class="previous-link__arrow">❮</i>
                                        <span class="previous-link__content">Quay về giỏ hàng</span>
                                    </a>
                                </div>
                                <div id="common-alert-sidebar" data-tg-refresh="refreshError">
                                    <div class="alert alert--danger hide-on-mobile hide" data-bind-show="!isSubmitingCheckout && isSubmitingCheckoutError" data-bind="submitingCheckoutErrorMessage">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </form>
    </div>

    <script src="public/js/SelectAddressAndOrder/axios.min.js"></script>
    <script>
        var citis = document.getElementById("city");
        var districts = document.getElementById("district");
        var wards = document.getElementById("ward");
        var Parameter = {
            url: "public/js/SelectAddressAndOrder/data.json",
            method: "GET",
            responseType: "application/json",
        };
        var promise = axios(Parameter);
        promise.then(function(result) {
            renderCity(result.data);
        });

        function renderCity(data) {
            for (const x of data) {
                citis.options[citis.options.length] = new Option(x.Name, x.Id);
            }
            citis.onchange = function() {
                district.length = 1;
                ward.length = 1;
                if (this.value != "") {
                    const result = data.filter(n => n.Id === this.value);

                    for (const k of result[0].Districts) {
                        district.options[district.options.length] = new Option(k.Name, k.Id);
                    }
                }
            };
            district.onchange = function() {
                ward.length = 1;
                const dataCity = data.filter((n) => n.Id === citis.value);
                if (this.value != "") {
                    const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                    for (const w of dataWards) {
                        wards.options[wards.options.length] = new Option(w.Name);
                    }
                }
            };
        }
    </script>
</body>

</html>