nh_cart = {
    show_modal: true,
    init: function () {
        var self = this;

        // event add to cart on list
        $(document).on('click', '.btn-shop-cart', function () {
            var item_id = $(this).attr('item-id');
            if (item_id == null) item_id = 0;
            var data_post = {
                item_id: item_id,
                quantity: 1,
            };

            self.addToCart(data_post);
        })

        // event add to cart in detail page
        $(document).on('click', '.btn-add-cart-two', function (event) {
            var item_id = $(this).attr('item-id');
            if (item_id == null) item_id = 0;
            var quantity = parseInt($.trim($('.num-quantity').val()));

            if (quantity > 0) {
                var data_post = {
                    item_id: item_id,
                    quantity: quantity,
                };
                self.addToCart(data_post);
            } else {
                var message = global_lang.messages_please_select_quantity;
                nh_functions.showAlertGritter('error', message);
                return false;
            }
        });

        // event change quantity in order
        $(document).on('change', '.input-cart', function () {
            var item_id = $(this).attr('item-id');
            if (item_id == null) item_id = 0;

            var quantity = parseInt($.trim($(this).val()));
            // check quantity
            if (!quantity > 0) {
                var message = global_lang.messages_please_select_quantity;
                nh_functions.showAlertGritter('error', message);
                return false;
            }

            var data_post = {
                item_id: item_id,
                quantity: quantity,
                change_quantity: true,
            }
            // not show modal
            self.show_modal = false;

            self.addToCart(data_post);
        });


        // delete item in order
        $(document).on('click', '.delete-order', function (event) {
            self.deleteOrder({
                product_id: $(this).attr('product-id'),
                item_id: $(this).attr('item-id')
            })
        });
    },
    addToCart: function (data_post) {
        var self = this;
        nh_functions.showLoadingPage();
        $.ajax({
            async: false,
            url: '/orders/Orders/addCart',
            type: 'POST',
            dataType: 'json',
            data: {data: data_post},
            success: function (response) {
                if (response.code == 0) {                    
                    $('.mini-cart-order .number').text(response.count_product)
                    // add new item to mini cart
                    if (!$.isEmptyObject(response.data) && $('.shoppingcart-box').length > 0) {
                        var data = $.parseJSON(response.data);
                        var product_id = data['item_add']['product_id'];
                        var item_id = data['item_add']['item_id'];
                        // check product exist in cart
                        var exist_element = false;
                        $('.shoppingcart-box .item').each(function (index) {
                            var element_product_id = $(this).find('.delete-order').attr('product-id');
                            var element_item_id = $(this).find('.delete-order').attr('item-id');
                            if (product_id == element_product_id && item_id == element_item_id) {
                                exist_element = true;
                                var this_number = $(this).find('.number-item').text();
                                $(this).find('.number-item').text(parseInt(this_number) + 1);
                            }
                        });

                        if (!exist_element) {
                            //refresh list product in mini cart
                            nh_functions.loadContentBlockTabs('orders/Orders/miniCart', {}, '.shoppingcart-box');
                        }
                    }
                    // show modal add to cart
                    if (self.show_modal) {
                        nh_functions.hiddenLoadingPage();
                        self.showModalAddToCart(response.data);
                    } else {
                        window.location = window.location.href;
                    }
                } else {
                    nh_functions.showAlertGritter('error', response.messages)
                }
            },
            error: function (response, json, errorThrown) {

            }
        });
    },
    showModalAddToCart: function (data_json) {
        var data = {};
        var self = this;
        var modal = $('#add-cart-modal')
        if (typeof data_json != 'undefined') {
            data = $.parseJSON(data_json);
        }
        // show info add to cart
        if (!$.isEmptyObject(data.item_add)) {
            var item_add = data.item_add;
            modal.find('.product-name-modal').text(item_add.name);
            modal.find('.price-modal').text(nh_functions.formatMoney(item_add.price));
            modal.find('.price-sale-modal').toggleClass('hidden', item_add.price_sale == 0 ? true : false).text(nh_functions.formatMoney(item_add.price_sale));
            modal.find('.image-cart-modal a').attr('href', '/' + item_add.url);
            modal.find('.image-cart-modal img').attr('src', '/' + item_add.url_img);
        }

        // show modal
        modal.modal('show');

    },
    deleteOrder: function (dataPost) {
        nh_functions.showLoadingPage();
        $.ajax({
            url: '/orders/Orders/ajaxDeleteOrder',
            type: 'POST',
            async: false,
            data: dataPost,
            dataType: 'json',
            success: function (response) {
                location.reload();
            },
            error: function (response, json, errorThrown) {
                errorHandler(response);
            }
        });
    },
}

promotion_functions = {
    checkCouponCode: function (coupon_code,arr_product_id) {
        nh_functions.showLoadingPage();
        $.ajax({
            url: '/orders/Orders/checkCouponCode',
            type: 'POST',
            async: false,
            data: {
                coupon_code: coupon_code,
                arr_product_id: arr_product_id
            },
            dataType: 'json',
            success: function (response) {

                if (response.code == 'success') {
                    setTimeout(function () {
                        promotion_functions.reloadPage();
                    }, 500);

                } else {
                    nh_functions.hiddenLoadingPage();
                    nh_functions.showAlertGritter('error', response.messages);
                }
            },
            error: function (response, json, errorThrown) {
                nh_functions.hiddenLoadingPage();
            }
        });
    },
    deleteCouponCode: function () {
        nh_functions.showLoadingPage();
        $.ajax({
            url: '/orders/Orders/deleteCouponCode',
            type: 'POST',
            async: false,
            data: {},
            dataType: 'html',
            success: function (response) {
                setTimeout(function () {
                    promotion_functions.reloadPage();
                }, 500);
            },
            error: function (response, json, errorThrown) {
                nh_functions.hiddenLoadingPage();
            }
        });
    },
    reloadPage: function () {
        location.reload();
    },
    goBack: function () {
        window.history.back();
    }
}