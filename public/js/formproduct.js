var nh_advanced_filter = {
    urlSearch: '/',
    elementUpdate: null,
    loading: null,
    reLoad: false,
    config: {
        plugin_id: ''
    },
    init: function (config) {
        var self = this

        // set url search
        self.routerSearch();

        // disable event submit when press enter
        $('.advanced-filter .keyword-filter').on('keypress', function (e) {
            if (e.which == 13) {
                self.getData(this);
                return false;
            }
        });

        // filter data when change keyword
        $('.advanced-filter .keyword-filter').unbind('change').change(function (e) {
            self.getData(this);
        })

        // filter when click option on form
        $('.advanced-filter .btn-click-search').unbind('click').click(function () {
            if ($(this).hasClass('item-meta-product')) {
                $(this).toggleClass('active');
                $(this).closest('li').find('input:checkbox').prop('checked', $(this).hasClass('active'));
            }
            self.getData(this);
        })

        // filter when change price range
        var min_range_default = 0;
        var max_range_default = 39000000;
        $("#price-range").slider({
            range: true,
            min: min_range_default,
            max: max_range_default,
            step: 500000,
            values: [0, 35000000],
            slide: function (event, ui) {
                $('.advanced-filter .from-price').text(nh_functions.formatMoney(ui.values[0]));
                $('.advanced-filter .to-price').text(nh_functions.formatMoney(ui.values[1]));
                $('.advanced-filter .price-range-input').val(ui.values[0] + '-' + ui.values[1]);
            },
            stop: function (event, ui) {
                self.getData(this);
            }
        });

        // set price filter default
        $('.advanced-filter .price-range-input').val($("#price-range").slider("values", 0) + '-' + $("#price-range").slider("values", 1));
        $('.advanced-filter .from-price').text(nh_functions.formatMoney($("#price-range").slider("values", 0)));
        $('.advanced-filter .to-price').text(nh_functions.formatMoney($("#price-range").slider("values", 1)));


        // refresh filter
        $('.advanced-filter .refresh-filter').on('click', function (e) {
            $('.advanced-filter').find('input:text').val('');
            $('.advanced-filter').find('input:checkbox').prop('checked', false);
            $('.advanced-filter').find('.item-meta-product').removeClass('active');

            // refresh default value of price range
            $('.advanced-filter .from-price').text(nh_functions.formatMoney(min_range_default));
            $('.advanced-filter .to-price').text(nh_functions.formatMoney(max_range_default));
            $('.advanced-filter #price-range').slider("values", [min_range_default, max_range_default]);
            $('.advanced-filter .price-range-input').val(min_range_default + '-' + max_range_default);
            self.getData(this);
        });

        // set value default of element filter when refresh or redirect page
        var data_get = nh_functions.getUrlVars();

        if (!$.isEmptyObject(data_get)) {
            // keyword
            if (data_get.keyword) {
                $(".advanced-filter input[name='keyword']").val(data_get.keyword);
            }

            // price
            if (data_get.price_range) {
                var arr_price_range = data_get.price_range.split('-');
                $('.advanced-filter .from-price').text(nh_functions.formatMoney(arr_price_range[0]));
                $('.advanced-filter .to-price').text(nh_functions.formatMoney(arr_price_range[1]));
                $('.advanced-filter #price-range').slider("values", [arr_price_range[0], arr_price_range[1]]);
                $(".advanced-filter input[name='price_range']").val(data_get.price_range);
            }
            // checkbox
            $.each(data_get, function (index, value) {
                $(".advanced-filter input[name='" + index + "']").prop('checked', true);
                $(".advanced-filter input[name='" + index + "']").closest('li').find('.item-meta-product').addClass('active');
            });

        }
    },
    routerSearch: function () {
        this.urlSearch = window.location.pathname;
        if (nh_config['pageType'] == 'products') {
            this.urlSearch = window.location.pathname;
        } else {
            this.urlSearch = '/search/products/basic-search-product';
            // this.reLoad = true;
        }
    },
    getData: function (obj) {
        var self = this;
        if (self.loadding) return false;

        var arr_data = {};

        // get all parameter on url
        var another_param = nh_functions.getUrlVars()

        // all filter option on form search
        var all_filter = {};
        $('.advanced-filter input').each(function () {
            all_filter[$(this).attr('name')] = $(this).attr('name');
        })

        // remove parameters exist on form search
        $.each(another_param, function (index, value) {
            if (index in all_filter) {
                delete another_param[index];
            }
        });
        // extend parameter another
        if (!$.isEmptyObject(another_param)) {
            $.extend(arr_data, another_param);
        }


        // get parameters enable filter on form advanced search
        var arr_filter = {};
        $.map($(obj).closest('form').serializeArray(), function (n, i) {
            if (n['value'].length > 0) {
                arr_filter[n['name']] = $.trim(n['value']);
            }
        });

        // extend parameter enable filter
        $.extend(arr_data, arr_filter);
        self.loadding = true;
        // filter by ajax
        self.ajaxLoadSearch({
            url: self.urlSearch,
            reLoad: self.reLoad,
            data: arr_data,
        }, function () {
            self.loadding = false;
        });
    },
    ajaxLoadSearch: function (objData, fnCallback) {
        if (typeof (fnCallback) != 'function') fnCallback = function () {
        };
        nh_functions.showLoadingPage();
        $.ajax({
            type: "GET",
            url: objData.url,
            data: objData.data,
            dataType: 'html',
            success: function (result) {
                history.pushState({}, '', this.url);
                if (typeof objData.reLoad != 'undefined') {
                    if (!objData.reLoad) {
                        $('#load-list-data').html(result);
                    } else {
                        location.reload();
                    }
                }
                setTimeout(function () {
                    nh_functions.hiddenLoadingPage();
                }, 1000);

                fnCallback.apply()
            },
            error: function (response, json, errorThrown) {
                fnCallback.apply()
            }
        });
    }
};

var nh_search_suggestion = {
    config: {
        limit: 10
    },
    init: function () {
        var self = this

        //event change text input search-suggestion
        $(document).on("blur change keyup", ".search-suggestion", function (e) {
            var type = $(this).closest('form').attr('data-type');
            if (type == 'products') {
                // can't get full text with keyword is vietnamese -> settimeout after stop typing and get value it
                setTimeout(function () {
                    var param = {
                        keyword: $.trim($(".search-suggestion").val()),
                        type: 'products',
                        url: '/search/suggestion/search-by-suggestion'
                    };
                    $.extend(self.config, param);
                }, 10);
                self.suggestion($(this), self.config, function (a) {
                });
            }
        });

    },
    suggestion: function (obj, param, callback) {
        var self = this
        if (typeof(callback) != 'function') {
            callback = function () {
            }
        }

        obj.autocomplete({
            classes: {
                "ui-autocomplete": "highlight"
            },
            autoFocus: true,
            minLength: 3,
            source: function (request, response) {
                $.ajax({
                    url: param.url,
                    type: "POST",
                    async: false,
                    dataType: 'json',
                    data: {
                        param: param,
                    },
                    success: function (data) {
                        if (data.length === 0) {
                            var result = [
                                {
                                    label: 'Không tìm thấy sản phẩm phù hợp',
                                    value: 'Không tìm thấy sản phẩm phù hợp',
                                    data: {}
                                }
                            ];
                            response(result);
                        } else {
                            response($.map(data, function (el) {
                                return {
                                    label: el.name,
                                    value: el.name,
                                    data: el
                                };
                            }));
                        }
                    }
                });
            },
            select: function (event, ui) {
                obj.val('');
                if (!$.isEmptyObject(ui.item.data)) {
                    // call back function after select
                    callback(ui.item.data);
                    window.location.href = '/' + ui.item.data.url + '.html';
                }

                event.preventDefault();
            },
            change: function (event, ui) {
            },
            focus: function (event, ui) {
            },
            close: function (event, ui) {
            },
        }).autocomplete("instance")._renderItem = function (ul, item) {

            // add class wrap and remove class default of jquery ui
            ul.addClass('wrap-suggestion').removeClass('ui-widget-content ui-widget');

            // render html for item
            var item_html = '';
            if (!$.isEmptyObject(item.data)) {
                // html image
                if (item.data.url_img.length > 0) {
                    item_html += "<div class='warp-img-suggestion'><img src='/" + item.data.url_img + "' class='img-suggestion' /></div>";
                }
                //html price sale
                var price_sale = '';
                if (item.data.price_sale > 0) {
                    price_sale = '<span class="price-sale">' + nh_functions.formatMoney(item.data.price_sale) + '</span>';
                }

                item_html += '<div class="warp-right-suggestion">' +
                    '<p class="name-suggestion">' + self.addMarkToName(item.data.name) + '</p>' +
                    '<p class="price-suggestion"><span class="price-well">' + nh_functions.formatMoney(item.data.price) + '</span>' + price_sale + '</p>' +
                    '<div>';

            } else {
                item_html += '<p class="name-suggestion">' + item.label + '</p>'
            }


            return $("<li class='item-suggestion'>").append(item_html).appendTo(ul);
        };

        return false;
    },
    addMarkToName: function (str_name) {
        var self = this;
        var str_strip = str_name.noUnicode();
        var index = str_strip.indexOf(self.config.keyword.noUnicode());
        if (index > -1) {
            return str_name.substr(0, index) + '<strong class="mark">' + str_name.substr(index, self.config.keyword.length) + "</strong>" + str_name.substr(index + self.config.keyword.length, str_name.length)
        }
        else {
            return str_name;
        }
    }
}

var nh_product_detail = {
    url: '',
    init: function () {
        var self = this;

        self.url = window.location.pathname;
        var main_image = $('.img-main-detail');

        // event click select item product
        $(document).on('click', '.group-available .item-available', function (e) {

            var this_item = $(this);
            var parent = $(this).closest('.group-available');

            // remove all class active of item in group meta
            parent.find('.item-available').removeClass('active');
            this_item.addClass('active');
            var meta_click = {
                'meta_group': this_item.attr('meta-group'),
                'meta_code': this_item.attr('meta-code'),
            };
            self.selectProductItem(meta_click);
        });

        // event mouseover and mouseout item meta
        $(document).on('mouseover', '.item-available', function (e) {
            // change text meta product
            var meta_name = $(this).attr('meta-name');
            $(this).closest('.group-available').find('.selection').text(meta_name);

        }).on('mouseout', '.item-available', function (e) {
            // reset text to default
            var meta_name = $(this).closest('.group-available').find('.item-available.active ').attr('meta-name');
            $(this).closest('.group-available').find('.selection').text(meta_name);
        });

        //event mouseover and mouseout thumb item
        $(document).on('mouseover', '.slider-thumb .item', function (e) {
            main_image.attr('src', $(this).attr('data-original'));
        }).on('mouseout', '.slider-thumb .item', function (e) {
            main_image.attr('src', $('.slider-thumb .item.active').attr('data-original'));
        });
    },
    ajaxLoadItemDetail: function (objData, fnCallback) {
        if (typeof (fnCallback) != 'function') fnCallback = function () {
        };
        nh_functions.showLoadingPage();
        $.ajax({
            type: "GET",
            sync: true,
            url: objData.url,
            data: objData.data,
            dataType: 'html',
            success: function (result) {
                history.pushState({}, '', this.url);
                $('.top-detail-product').html(result);
                setTimeout(function () {
                    nh_functions.hiddenLoadingPage();
                }, 500);
                fnCallback.apply()
            },
            error: function (response, json, errorThrown) {
                fnCallback.apply()
            }
        });
    },
    selectProductItem: function (meta_click) {
        var self = this;
        var arr_data = {};
        arr_data[meta_click['meta_group']] = meta_click['meta_code'];
        $('.product-available .group-available').each(function (index) {
            var group_code = $(this).find('.item-available.active').attr('meta-group');
            var meta_code = $(this).find('.item-available.active').attr('meta-code');
            if (typeof group_code != 'undefined' || typeof meta_code != 'undefined' && group_code != meta_click['meta_group']) {
                arr_data[group_code] = meta_code;
            }

        });

        if (!$.isEmptyObject(arr_data)) {
            self.ajaxLoadItemDetail({
                url: self.url,
                data: arr_data
            }, function (a) {

            });
        }
    },
}


//event click button compare product
$(document).on('click', '.btn-compare', function () {
    var id = $(this).attr('product-id');
    rids = []; // store array id
    pids = nh_functions.getCookie('pids');

    if (pids == null) {
        nh_functions.setCookie('pids', '', 1) //save cookie 1 day.
        pids = '';
    }

    if (pids == '') {
        rids.push(id);
        nh_functions.setCookie('pids', rids.toString(), 1);//
    } else {
        rids = pids.split(',');
        flag = true;
        //remove duplicate
        for (var i = 0; i < rids.length; i++) {
            if (id == rids[i]) {
                flag = false;
            }
        }
        if (flag == true) {
            rids.push(id);
            nh_functions.setCookie('pids', rids.toString(), 1);//
        }
    }
    // change number item compare on view
    if (!$.isEmptyObject(rids)) {
        var count = rids.length;
        $('.compare-product .number').text(count);
    }

    nh_functions.showAlertGritter('success', global_lang.messages_compare_success)
});

//delete compare product
$(document).on('click', '.btn-delete-compare', function () {
    rids = []; // store array id
    pids = nh_functions.getCookie('pids');
    var id = $(this).attr('data-product-id');
    if (pids != null || pids != '') {
        pids = nh_functions.getCookie('pids');
        a = pids.split(',');
        // function xoa 1 phan tu trong mang
        for (var i in a) {
            if (a[i] == id) {
                a.splice(i, 1);
            }
        }
        nh_functions.setCookie('pids', a.toString(), 1);
        window.location = "http://" + window.location.hostname + "/products/compare/compare-products";
    }
});
