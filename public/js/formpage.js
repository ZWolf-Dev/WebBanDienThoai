var nh_config = {
    url_current: window.location.pathname
}

nh_functions = {
    init: function () {
        var self = this

        // load item block by ajax
        self.getItemBlock();

        // datepicker bootstrap
        $('.datetime-form').datepicker({
            format: "dd/mm/yyyy",
            language: "vi",
        });

        // chosen select
        $('.chosen-select').chosen({width: '100%'});

        // not ignore validate chosen
        $.validator.setDefaults({ignore: ":hidden:not(.chosen-select)"})

        // set type view list when document already
        self.setDisplayViewOnLoad();

        // active class on main menu
        self.activeMainMenu();

        // event click button sort on list
        $(document).on('click', '.other-sort', function () {
            var item = $(this).next('input[name="other_sort"]').val();
            if (item != 'undefined') {
                self.getOtherSort(item);
            }
        });

        // event click button .btn-view -> change view style of item on list
        $(document).on('click', '.btn-view', function () {
            var key = $(this).attr('data-key-view');
            var display_view = $(this).attr('data-type');

            // set session type display view
            $.session.set(key, display_view);
            self.setDisplayView(display_view);
        });

        // add param url in url pagination
        $(document).on('click', '.pagination li:not(.disabled , .active) a', function () {
            if (typeof window.location.search != 'undefined') {
                $(this).attr('href', $(this).attr('href') + window.location.search);
            }
        });


    },
    chosenRegion: function (wrap_id) {
        // chosen select city change
        $(wrap_id + " select[name='city_id']").on("change", function () {
            var city_id = $(this).val();
            // check element exist
            if ($(wrap_id + " select[name='district_id']").length) {
                nh_member.getLocationRegister(city_id, 'district', function (json_respon) {
                    // empty option of  district select
                    $(wrap_id + " select[name='district_id']").empty();
                    // append new option to ward select
                    if (!$.isEmptyObject(json_respon)) {
                        nh_member.appendOptionSelect(wrap_id + " select[name='district_id']", json_respon);
                    }
                    // add option default
                    var default_option = "<option value=''>" + global_lang.select_district_option + "</option>";
                    $(wrap_id + " select[name='district_id']").prepend(default_option);
                    $(wrap_id + " select[name='district_id'] option[value='']").attr('selected', 'selected');
                    // update select by chosen
                    $(wrap_id + " select[name='district_id']").trigger('chosen:updated');
                });
            }

        });

        // chosen select district change
        $(wrap_id + " select[name='district_id']").on("change", function () {
            var district_id = $(this).val();
            // check element exist
            if ($(wrap_id + " select[name='ward_id']").length) {
                nh_member.getLocationRegister(district_id, 'ward', function (json_respon) {
                    // empty option of  ward select
                    $(wrap_id + " select[name='ward_id']").empty();
                    // append new option to ward select
                    if (!$.isEmptyObject(json_respon)) {
                        nh_member.appendOptionSelect(wrap_id + " select[name='ward_id']", json_respon);
                    }
                    // add option default
                    var default_option = "<option value=''>" + global_lang.select_ward_option + "</option>";
                    $(wrap_id + " select[name='ward_id']").prepend(default_option);
                    $(wrap_id + " select[name='ward_id'] option[value='']").attr('selected', 'selected');
                    // update select by chosen
                    $(wrap_id + " select[name='ward_id']").trigger('chosen:updated');
                });
            }

        });
    },
    routeUrl: function (url) {
        var regexp = /^(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/

        if (!regexp.test(url)) {
            url = window.location.protocol + '//' + window.location.hostname + '/' + url;
        }

        return url;
    },
    redirect: function (url) {
        window.location.href = url;
    },
    formatMoney: function (str_convert) {
        return str_convert.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    },
    activeMainMenu: function (coupon_code) {

        // get current url
        var page_url = window.location.href;

        // check current url has '/'
        var has_mark = false;
        if (page_url.substr(page_url.length - 1) == '/') {
            has_mark = true;
        }

        $(".main-menu .sub-menu").each(function () {
            var menu_url = $(this).find('> a').attr("href");
            if (!has_mark) {
                menu_url = menu_url.substring(0, menu_url.length - 1)
            }
            if (page_url == menu_url) {
                $(this).addClass('active');
            }
        })
    },
    goBack: function () {
        window.history.back();
    },
    removeTooltipError: function (obj_id) {

        //add class has-success
        $(obj_id).closest('.form-group').removeClass('has-error has-success');

        // remove old message
        $(obj_id).closest('.form-group').find('.result-validate').remove();

    },
    showTooltipSuccess: function (obj_id) {
        //add class has-error
        $(obj_id).closest('.form-group').addClass('has-success').removeClass('has-error');

        // hidden icon icon-required
        $(obj_id).closest('.form-group').find('.icon-required').remove();

        // remove old message error
        $(obj_id).closest('.form-group').find('.result-validate').remove();

    },
    showTooltipError: function (obj_id, message) {
        //add class has-error
        $(obj_id).closest('.form-group').addClass('has-error').removeClass('has-success');

        // hidden icon icon-required
        $(obj_id).closest('.form-group').find('.icon-required').remove();

        // remove old message error
        $(obj_id).closest('.form-group').find('.result-validate').remove();

        // append new message error
        var html_error = '<div class="result-validate"> ' +
            '<span class="help-block">' + message + '</span>' +
            '</div>';
        $(obj_id).parent('div').append(html_error);

    },
    showAlert: function (data, form_obj, type) {
        if (!$.isEmptyObject(data)) {
            var class_alert = 'alert-danger';
            if (type == 'success') {
                class_alert = 'alert-success';
            }
            var html = '<div class="alert ' + class_alert + ' nh-alert">';
            html += '<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>';
            html += data.messages;
            html += '</div>';
            if (form_obj.find('div').hasClass('nh-alert')) {
                form_obj.find('.nh-alert').remove();
            }
            form_obj.prepend(html);
        }
    },
    showAlertGritter: function (type, message, time) {
        var time = time ? time : 1000;
        var class_wrap = 'gritter-success';
        if (type == 'error') {
            class_wrap = 'gritter-error';
        }
        $.gritter.removeAll();
        // show notice by gritter
        $.gritter.add({
            title: '<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> ' + global_lang.title_notification,
            text: '<i>' + message + '</i>',
            class_name: class_wrap + ' gritter-center',
            time: time,
            position: 'center'
        });
    },
    getItemBlock: function () {
        $('.item_block').each(function () {
            var $this = $(this);
            var action = $this.data('action');
            var method = $this.data('method');
            if (action) {
                action = action.toString();
                if (action.indexOf('/') != 0) {
                    action = '/' + action
                }
                $.ajax({
                    url: action,
                    method: method ? method : 'get',
                    data: nh_config,
                    success: function (res) {
                        $this.html(res);
                        $this.fadeIn('slow');
                        $('.nav_title', $this).responsiveTabs();
                    }
                })
            }

        })
    },
    setDisplayView: function (display_view) {
        // add class active in button btn-view
        $('.btn-view').removeClass('active');
        $('.btn-view[data-type="' + display_view + '"]').addClass('active');
        //add class view-list in to div list-item
        if (display_view == 'list') {
            $(".list-item").addClass('view-list');
        } else {
            $(".list-item").removeClass('view-list');
        }
    },
    setDisplayViewOnLoad: function () {
        if ($('.btn-view').length) {
            var self = this
            var key = $('.btn-view').attr('data-key-view');
            var display_view = $.session.get(key);
            if (typeof key !== 'undefined' && typeof display_view !== 'undefined') {
                self.setDisplayView(display_view);
            }
        }
    },
    getOtherSort: function (item) {
        var url = window.location.hostname;
        var pathname = window.location.pathname;
        var param = pathname + '?other_sort=' + item;
        history.pushState({}, '', param);
        location.reload();
    },
    loadContentBlockTabs: function (url, data, id_load) {
        // show loading icon
        $(id_load).closest('.tabs-block').find('.warp-loading-block').removeClass('hidden');
        $.ajax({
            url: url,
            type: 'POST',
            async: true,
            data: data,
            dataType: 'html',
            success: function (response) {
                // render html of tabs
                $(id_load).html(response)
                // hidden loading icon
                setTimeout(function () {
                    $(id_load).closest('.tabs-block').find('.warp-loading-block').addClass('hidden');
                }, 500);

            },
            error: function (response, json, errorThrown) {
            }
        });
    },
    setCookie: function (name, value, days) {
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            var expires = "; expires=" + date.toGMTString();
        }
        else var expires = "";
        document.cookie = name + "=" + value + expires + "; path=/";
    },
    getCookie: function (cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
        }
        return '';
    },
    deleteCookie: function (cname) {
        var self = this
        self.setCookie(cname, "", -1);
    },
    getUrlVars: function () {
        var vars = {}, hash;
        var url_decode = decodeURIComponent(window.location.href);
        if (url_decode.indexOf('?') > 0) {
            var hashes = url_decode.slice(url_decode.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars[hash[0]] = hash[1];
            }
        }
        return vars;
    },
    showLoadingPage: function () {
        $('.warp-loading-all').removeClass('hidden');
    },
    hiddenLoadingPage: function () {
        $('.warp-loading-all').addClass('hidden');
    }
}

String.prototype.noUnicode = function () {
    var text = this;
    text = text.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẩ|ă|ằ|ắ|ẳ|ặ|ẵ/g, "a");
    text = text.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ă|Ằ|Ắ|Ặ|Ẵ|ẵ/g, "a");
    text = text.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ+/g, "e");
    text = text.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ+/g, "e");
    text = text.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    text = text.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "i");
    text = text.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ+/g, "o");
    text = text.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ+/g, "o");
    text = text.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    text = text.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "u");
    text = text.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    text = text.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "y");
    text = text.replace(/đ/g, "d");
    text = text.replace(/Đ/g, "d");
    return text.toLowerCase().trim();
};

//document ready
$(document).ready(function () {
    // init function
    nh_functions.init();
    nh_cart.init();
});

var btn_oke = 'Đồng ý';
var btn_cancel = 'Cancel';
function errorHandler(data) {
    if (typeof data.responseJSON == 'undefined') {
        if (typeof data.code != -1) {
            if (typeof data.messages != 'undefined') {
                var msg = data.messages;
            } else {
                if (typeof data.msg != 'undefined') {
                    var msg = data.msg;
                } else {
                    var msg = global_lang.msg_undefined;
                }
            }

        } else {
            var msg = global_lang.msg_undefined;
        }

    } else {
        var msg = data.responseJSON.message;
    }

    BootstrapDialog.show({
        type: BootstrapDialog.TYPE_DANGER,
        title: global_lang.title_notification,
        message: msg,
        buttons: [
            {
                label: global_lang.btn_oke,
                autospin: false,
                action: function (dialogRef) {
                    dialogRef.close();
                }
            }
        ]
    });

}
function successHandler(data, url_redirect) {
    if (typeof data.responseJSON == 'undefined') {
        if (typeof data.code != -1) {
            if (typeof data.messages != 'undefined') {
                var msg = data.messages;
            } else {
                if (typeof data.msg != 'undefined') {
                    var msg = data.msg;
                } else {
                    var msg = global_lang.msg_undefined;
                }
            }

        } else {
            var msg = global_lang.msg_undefined;
        }

    } else {
        var msg = data.responseJSON.message;
    }

    BootstrapDialog.show({
        type: BootstrapDialog.TYPE_SUCCESS,
        title: global_lang.title_notification,
        message: msg,
        buttons: [
            {
                label: global_lang.btn_oke,
                autospin: false,
                action: function (dialogRef) {
                    dialogRef.close();
                    if (typeof url_redirect !== "undefined") {
                        // reload page
                        if (url_redirect === 1) {
                            location.reload();
                        }
                        // redirect page
                        if (url_redirect.length > 1) {
                            window.location.href = url_redirect;
                        }
                    }
                }
            }
        ]
    });

}


setTimeout(function(){
    $(document).ready(function() {
        if($( window ).width() < 768) {
            $(".menu-ft h4.title-menu-ft").click(function() {
                $(this).next().toggle("slow");
            });
        }
    });    
}, 3000);
