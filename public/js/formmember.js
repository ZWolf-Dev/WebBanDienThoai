nh_member = {
    hideForm: function (form_id) {
        $(form_id).hide();
    },
    showIconLoading: function () {
        $('.warp-loading-block').removeClass('hidden');
    },
    removeIconLoading: function () {
        $('.warp-loading-block').addClass('hidden');
    },
    submitForm: function (form, callback) {
        var self = this;
        if (typeof(callback) != 'function') callback = function () {
        };
        //show loading icon
        self.showIconLoading();

        // ajax register
        $.ajax({
            url: form.action,
            type: form.method,
            async: true,
            contentType: false,
            processData: false,
            data: new FormData($(form).get(0)),
            dataType: 'json',
            success: function (response) {
                self.removeIconLoading();
                callback(response)
            },
            error: function (response, json, errorThrown) {
            }
        });
    },
    checkMemberExist: function (param,callback) {
        if (typeof(callback) != 'function') callback = function () {
        };
        $.ajax({
            url: '/member/manager-account/check-member-exists',
            type: 'POST',
            async: false,
            data: {
                id: param.id,
                username: param.username,
                email: param.email
            },
            dataType: 'json',
            success: function (response) {
                callback(response);
            },
            error: function (response, json, errorThrown) {
            }
        });
    },
    getLocationRegister: function (id_location, type, callback) {
        if (typeof(callback) != 'function') callback = function () {
        };
        $.ajax({
            async: false,
            url: '/location/ajax-get-location',
            type: 'post',
            dataType: 'json',
            data: {
                id: id_location,
                type: type,
            },
            success: function (response) {
                callback(response)
            },
            error: function (response, json, errorThrown) {

            }
        });
    },
    appendOptionSelect: function (id_object, json_options) {
        var list_option = '';
        $.each(json_options, function (key, value) {
            list_option += '<option value=' + key + '>' + value + '</option>';
        });
        $(id_object).empty().trigger('change');
        $(id_object).append(list_option);
    },
    GOOGLE_login: function (form_obj, type) {
        var self = this;
        if (typeof auth2 !== 'undefined') {
            auth2.signIn({
                cookiepolicy: "single_host_origin",
                requestvisibleactions: "http://schema.org/AddAction",
                scope: "https://www.googleapis.com/auth/plus.login email"
            }).then(function (response) {

                var data = {
                    id: response.getBasicProfile().getId(),
                    type: 'google',
                    full_name: response.getBasicProfile().getName(),
                    email: response.getBasicProfile().getEmail(),
                    picture:response.getBasicProfile().getImageUrl()+'?sz=2048'
                }
                $.ajax({
                    type: "POST",
                    url: "/member/manager-account/social-login",
                    async: false,
                    data: data,
                    dataType: 'json',
                    success: function (response) {
                        self.removeIconLoading();
                        if (response.code == 'success') {
                            // alert success
                            nh_functions.showAlertGritter('success', response.messages);
                            // reload page
                            setTimeout(function () {
                                if (type == 'page') {
                                    nh_functions.goBack();
                                } else {
                                    location.reload();
                                }
                            }, 500);
                        } else {
                            nh_functions.showAlertGritter('error', response.messages);
                        }
                    },
                    error: function (response, json, errorThrown) {
                        self.removeIconLoading();
                        nh_functions.showAlertGritter('error', response.messages);
                    },
                });

            });
        }else{
            console.log('Chưa nhập thông tin Google client ID');
        }
    },
    FB_login: function (form_obj, type) {
        var self = this;
        if (typeof FB !== 'undefined') {
            FB.login(function (response) {
                if (response.authResponse) {

                    FB.api('/me', {fields: 'email, name, picture.width(2048), gender,location,locale,age_range'}, function (response) {

                        var data = {
                            id: response.id,
                            type: 'facebook',
                            full_name: response.name,
                            email: response.email,
                            gender: response.gender,
                            picture:response.picture.data.url
                        }

                        $.ajax({
                            type: "POST",
                            url: "/member/manager-account/social-login",
                            async: false,
                            data: data,
                            dataType: 'json',
                            success: function (response) {
                                self.removeIconLoading();
                                if (response.code == 'success') {
                                    // alert success
                                    nh_functions.showAlertGritter('success', response.messages);
                                    // reload page
                                    setTimeout(function () {
                                        if (type == 'page') {
                                            nh_functions.goBack();
                                        } else {
                                            location.reload();
                                        }
                                    }, 500);
                                } else {
                                    nh_functions.showAlertGritter('error', response.messages);
                                }
                            },
                            error: function (response, json, errorThrown) {
                                self.removeIconLoading();
                                nh_functions.showAlertGritter('error', response.messages);
                            },
                        });
                    });
                } else {
                    console.log('Người dùng chưa đăng nhập hoặc không ủy quyền đầy đủ.');
                }
            });
        }else{
            console.log('Chưa nhập thông tin Facebook App ID');
        }
    },
    reloadCaptcha: function (obj) {
        var mySrc = obj.prev().attr('src');
        var glue = '?';
        if (mySrc.indexOf('?') != -1) {
            glue = '&';
        }
        obj.prev().attr('src', mySrc + glue + new Date().getTime());
        return false;
    }
}
