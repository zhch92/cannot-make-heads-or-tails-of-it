    var canSend = true;
    var i = 60;
    var intervalid;
    $(document).ready(function() {
        document.getElementById('personchosee').style.display = "none";
        document.getElementById('companychosee').style.display = "none";
        showDialog();
        //点击选框切换背景
        $("input").on("click", function() {
                $(".main_1").addClass("main_2")
            })
            //显示司机注册
        $("h1 .driver").on("click", function() {
            $(".company").removeClass("register_active");
            $(".person").addClass("register_active")
        });
        //显示货方注册
        $("h1 .comp").on("click", function() {
            $(".person").removeClass("register_active");
            $(".company").addClass("register_active")
        });
        //验证手机号码和车牌格式是否正确


        //验证码货主
        $("#yzm").click(function() {
            if (!canSend) {
                return false;
            }
            var phone = $('#companymoblie').val();
            if (!isPhoneNumber(phone)) {
                setDialog('温馨提示', '请输入正确的手机号！')
                    // alert("密码错误");
                return;
            }
            canSend = false;
            $("#yzm").attr("disabled", "disabled");
            $("#yzm").addClass("msg1");
            intervalid = setInterval("countdown(1)", 1000);
            $.post("/ajax/sendRegisterSmsCode.htm", {
                    phoneNumber: $('#companymoblie').val()
                },
                function(data) {
                    // alert(data.msg);
                    if (data.flag == 1) {
                        //todo
                    } else {
                        setDialog('温馨提示', '发送验证码失败！')
                            // alert('密码错误');
                        i = 1;
                    }
                },
                "json");

        });
        //验证码司机
        $("#drvyzm").click(function() {
            if (!canSend) {
                return false;
            }
            var phone = $('#drviermoblie').val();
            if (!isPhoneNumber(phone)) {
                setDialog('温馨提示', '请输入正确的手机号！')
                    // alert("密码错误");
                return;
            }
            canSend = false;
            $("#drvyzm").attr("disabled", "disabled");
            $("#drvyzm").addClass("msg1");
            intervalid = setInterval("countdown(0)", 1000);
            $.post("/ajax/sendRegisterSmsCode.htm", {
                    phoneNumber: $('#drviermoblie').val()
                },
                function(data) {
                    if (data.flag == 1) {
                        //todo
                    } else {
                        setDialog('温馨提示', '发送验证码失败！')
                            // alert('密码错误');
                        i = 1;
                    }
                },
                "json");
        });
    });
    //注册方式
    function registertype(val) {
        if (val === "1") {
            document.getElementById('personchosee').style.display = "";
            document.getElementById('companychosee').style.display = "none";
        } else {
            document.getElementById('companychosee').style.display = "";
            document.getElementById('personchosee').style.display = "none";
        }
    };

    //验证电话号码
    function checkCar(phoneNumber) {
        var sPhone = document.getElementById("carnum").value;
        var re = /^[\u4e00-\u9fa5]{1}[A-Z_a-z]{1}[A-Z_0-9_a-z]{5}$/
        if (!re.test(sPhone)) {
            $("#carnum").css("border-color", "red");
            $("#art").css("display", "block");
            // alert("请输入正确的车牌号！");
            return false;

        } else {
            $("#carnum").css("border-color", "#d9d9d9");
            $("#art").css("display", "none");
        }

    };

    function carBlank() {
        $("#carnum").css("border-color", "#d9d9d9");
        $("#art").css("display", "none");

    };

    function phoneBlank() {
        $("#drviermoblie").css("border-color", "#d9d9d9");
        $("#art1").css("display", "none");


    };

    function phoneBlank1() {
        $("#companymoblie").css("border-color", "#d9d9d9");
        $("#art2").css("display", "none");


    };

    function checkPhone(phoneNumber) {

        var phoneNumber = document.getElementById("companymoblie").value;

        var re = /^((\(\d{3}\))|(\d{3}\-))?13\d{9}|14[57]\d{8}|15\d{9}|18\d{9}$/
        if (!re.test(phoneNumber)) {
            $("#companymoblie").css("border-color", "red");
            $("#art2").css("display", "block")

        } else {
            $("#companymoblie").css("border-color", "#d9d9d9");
            $("#art2").css("display", "none");
        };
    };

    function checkPhone1(phoneNumber) {
        var phoneNumber = document.getElementById("drviermoblie").value;
        var re = /^((\(\d{3}\))|(\d{3}\-))?13\d{9}|14[57]\d{8}|15\d{9}|18\d{9}$/
        if (!re.test(phoneNumber)) {
            $("#drviermoblie").css("border-color", "red");
            $("#art1").css("display", "block")

        } else {
            $("#drviermoblie").css("border-color", "#d9d9d9");
            $("#art1").css("display", "none");
        };
    };

    function isPhoneNumber(phoneNumber) {
            var re = /^[\d]+$/
            if (!re.test(phoneNumber)) {
                return false;
            }
            if (phoneNumber.length != 11) {
                return false;
            } else {
                return true;
            }
        };
        //倒计时
    function countdown(type) {
        if (type == 0) {
            $("#drvyzm").val(i + "秒后重发");
        } else {
            $("#yzm").val(i + "秒后重发");
        }
        i--;
        if (i == -1) {
            canSend = true;
            clearInterval(intervalid);
            $("#drvyzm").val("发送验证码");
            $("#yzm").val("发送验证码");
            $("#yzm").removeAttr("disabled");
            $("#yzm").removeClass("msg1");
            $("#drvyzm").removeClass("msg1");
            $("#drvyzm").removeAttr("disabled");
            i = 60;
        }
    };

    //验证电话号码是否已经注册
    function checkIsExits(obj) {
            if (obj.value != "") {
                $.post("/ajax/checkUserNameIsExits.htm", {
                        userName: obj.value
                    },
                    function(data) {
                        if (data.flag == 1) {} else {
                            setDialog('温馨提示', data.msg)
                                // alert('密码错误');
                            obj.value = "";
                        }
                    },
                    "json");
            }
        };
        //货主提交
    $("#comreg").click(function() {
        var phone = $('#companymoblie').val();
        if ($.trim($("#companyname").val()) === "") {
            setDialog('温馨提示', '请输入企业名称！')
                // alert("密码错误");
            return;
        }
        phone = $.trim(phone);
        if (!isPhoneNumber(phone)) {
            setDialog('温馨提示', '请输入正确的手机号！')
                // alert("密码错误");
            return;
        }
        var password = $('#compassword').val();
        password = $.trim(password);
        if (password.length < 6 || password.length > 12) {
            setDialog('温馨提示', '请输入6到12位密码！')
                // alert("请输入6到12位密码！");
            return;
        }
        var zcYzm = 0;

        var yzm = $('#companyYzm').val();
        yzm = $.trim(yzm);
        $.post("/ajax/registerUser.htm", {
                userName: phone,
                password: password,
                usertype: 2,
                yzm: yzm,
                zcYzm: zcYzm,
                comName: $("#companyname").val()
            },
            function(data) {
                if (data.flag == 1) {
                    window.location.href = "/user/registersuccess.htm?type=2";
                } else {
                    //$('#companyLoginZcSrc').attr("src", "/ajax/creatVerificationCode.htm?d="+new Date()*1+1);
                    setDialog('温馨提示', data.msg)
                        // alert('密码错误');
                }
            },
            "json");
    });

    //司机提交
    $("#drireg").click(function() {
        //车厂
        var carLong = -1;
        var checkzone1 = document.all("car_long");
        for (var i = 0; i < checkzone1.length; i++) {
            if (checkzone1[i].checked) {
                carLong = checkzone1[i].value;
            }
        }
        //车型
        var carType = -1;
        var checkzone = document.all("cartype");
        for (var i = 0; i < checkzone.length; i++) {
            if (checkzone[i].checked) {
                carType = checkzone[i].value;
            }
        }
        if (carType == -1) {
            setDialog('温馨提示', '请选择车型！')
                // alert("密码错误");
            return;
        }
        if (carLong == -1) {
            setDialog('温馨提示', '请选择车长！')
                // alert("密码错误");
            return;
        }
        if ($.trim($("#drvname").val()) === "") {
            setDialog('温馨提示', '请输入您的名字！')
                // alert("密码错误");
            return;
        }
        if ($.trim($("#carnum").val()) === "") {
            setDialog('温馨提示', '请输入车牌号！')
                // alert("密码错误");
            return;
        }
        if ($.trim($("#drvname").val()) === "") {
            setDialog('温馨提示', '请输入姓名！')
                // alert("密码错误");
            return;
        }
        var phone = $('#drviermoblie').val();
        phone = $.trim(phone);
        if (!isPhoneNumber(phone)) {
            setDialog('温馨提示', '请输入正确的手机号！')
                // alert("密码错误");
            return;
        }

        var password = $('#driverpassword').val();
        password = $.trim(password);
        if (password.length < 6 || password.length > 12) {
            setDialog('温馨提示', '请输入6到12位密码！')
                // alert("密码错误");
            return;
        }
        var zcYzm = 0;
        var yzm = $('#drtiverYzm').val();
        yzm = $.trim(yzm);
        $.post("/ajax/registerUser.htm", {
                userName: phone,
                password: password,
                usertype: 1,
                yzm: yzm,
                zcYzm: zcYzm,
                comName: $("#drvname").val(),
                carType: carType,
                carLength: carLong,
                carnum: $("#carnum").val()
            },
            function(data) {
                if (data.flag == 1) {
                    window.location.href = "/user/registersuccess.htm?type=1";
                } else {
                    setDialog('温馨提示', data.msg)
                        // alert('密码错误');
                }
            },
            "json");
    });

    function setDialog(title, info, fn) {
        document.getElementById('mydialogtitle').innerHTML = title;
        document.getElementById('mydialoginfo').innerHTML = info;

        $(".opacity-bg,.sure_box").show();
        $(".sure_box h3 b,.sure_box button").click(function() {
            $(".opacity-bg,.sure_box").hide();
        })
    };

    function showDialog() {
        light_box = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;padding-left: 40px;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span  id=\"mydialoginfo\" ></span></p><button class=\"cel\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer;color: #feae4f;outline: none;background: url(http://192.168.2.50/statics/images/btn_3.png) no-repeat;margin-right: 37px;\">取消</button><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
        light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;padding-left: 40px;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span  id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
        $(".footer").after(light_box1);
    } ;
