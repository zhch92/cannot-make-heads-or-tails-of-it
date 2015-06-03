    var tempname = '${driver.driverName}';
    var temptype = '${driver.carType}';
    var templength = '${driver.carLength}';
    var tempphone = '${driver.mobile}';
    var tempcarnum = '${driver.carNumber}';

    function sfzclick() {
        document.getElementById("sfzImgSelect").click();
    }

    function jszclick() {
        document.getElementById("jszImgSelect").click();
    }

    function xszclick() {
        document.getElementById("xszImgSelect").click();
    }

    $(document).ready(function() {
        showDialog();
        $("#checkfr").addClass("sure1");
        $("#checkfr").attr("disabled", true);
        if ('${driver.sfzsfrz}' !== 10) {
            $('#carnum').val();
            $('#mobile').val();
            $('#name').val();
        }
        if ($ {
                driver.sfzsfrz
            } != "" && $ {
                driver.sfzsfrz
            } != "0" && $ {
                driver.jszsfrz
            } != "" && $ {
                driver.jszsfrz
            } != "0" && $ {
                driver.xszsfrz
            } != "" && $ {
                driver.xszsfrz
            } != "0") {
            if ($ {
                    driver.sfzsfrz
                } == 10 && $ {
                    driver.jszsfrz
                } == 10 && $ {
                    driver.xszsfrz
                } == 10) {
                $("#checkfr").addClass("sure1");
                $("#checkfr").attr("disabled", true);
                $(".car_info li input").attr("disabled", true);

            }
            // else{
            //       $("#checkfr").removeClass("sure1");
            //         $("#checkfr").attr("disabled",false);
            // }
        }
        var imgLock = true;
        $('#sfzImgSelect,#xszImgSelect,#jszImgSelect').bind("click", function(e) {
            if (!imgLock) {
                var event = window.event || e;
                event.preventDefault();
            }
        });
        $('#sfzImgSelect').change(function() {
            if (imgLock && $(this).val() != "") {
                imgLock = false;
                $("#sfzloading").show();
                $("#sfzform").ajaxSubmit({
                    url: "/ajax/uploadSfzImg.htm",
                    type: "post",
                    enctype: 'multipart/form-data',
                    dataType: 'json',
                    success: function(data) {
                        if (data.flag == 1) {
                            $("#sfzloading").hide();
                            setDialog('温馨提示', '上传成功')
                            $("#checkfr").removeClass("sure1");
                            $("#checkfr").removeAttr("disabled", true);
                            $("#checkfr").click(function() {
                                    window.location.href = "/orders/driverOrdersList.htm";
                                })
                                // alert("密码错误");
                                // $("button").click(function(){
                                //     window.location.href="/driver/getDriverInfo.htm"; 
                                // })

                            var path = data.msg;
                        } else if (data.flag == -2) {
                            $("#sfzloading").hide();
                            setDialog('温馨提示', '上传失败,格式错误或大小超过2M！')
                                // alert("密码错误");
                        } else {
                            $("#sfzloading").hide();
                            setDialog('温馨提示', '上传失败')
                                // alert("密码错误");
                        }
                        imgLock = true;
                    },
                    error: function(data) {
                        $("#sfzloading").hide();
                        setDialog('温馨提示', '系统或网络出错')
                            // alert("密码错误!");
                        imgLock = true;
                    }
                });
            }
        });
        $('#jszImgSelect').change(function() {
            if (imgLock && $(this).val() != "") {
                imgLock = false;
                $("#jszloading").show();
                $("#jszform").ajaxSubmit({
                    url: "/ajax/uploadJszImg.htm",
                    type: "post",
                    enctype: 'multipart/form-data',
                    dataType: 'json',
                    success: function(data) {
                        if (data.flag == 1) {
                            $("#jszloading").hide();
                            setDialog('温馨提示', '上传成功');
                            $("#checkfr").removeClass("sure1");
                            $("#checkfr").removeAttr("disabled", true);
                            skip();
                            // alert("上密码错误");
                            // window.location.href="/driver/getDriverInfo.htm";
                            var path = data.msg;
                        } else if (data.flag == -2) {
                            $("#jszloading").hide();
                            setDialog('温馨提示', '上传失败,格式错误或大小超过2M！')
                                // alert("密码错误");
                        } else {
                            $("#jszloading").hide();
                            setDialog('温馨提示', '上传失败')
                                // alert("密码错误");
                        }
                        imgLock = true;
                    },
                    error: function(data) {
                        $("#jszloading").hide();
                        setDialog('温馨提示', '系统或网络出错!')
                            // alert("密码错误"); 
                        imgLock = true;
                    }
                });
            }
        });
        $('#xszImgSelect').change(function() {
            if (imgLock && $(this).val() != "") {
                imgLock = false;
                $("#xszloading").show();
                $("#xszform").ajaxSubmit({
                    url: "/ajax/uploadXszImg.htm",
                    type: "post",
                    enctype: 'multipart/form-data',
                    dataType: 'json',
                    success: function(data) {
                        if (data.flag == 1) {
                            $("#xszloading").hide();
                            setDialog('温馨提示', '上传成功')
                            $("#checkfr").removeClass("sure1");
                            $("#checkfr").removeAttr("disabled", true);
                            // alert("密码错误");
                            skip();
                            // window.location.href="/driver/getDriverInfo.htm"; 
                            var path = data.msg;
                        } else if (data.flag == -2) {
                            $("#xszloading").hide();
                            setDialog('温馨提示', '上传失败,格式错误或大小超过2M！')
                                // alert("密码错误","提示",{fontSize:18});
                        } else {
                            $("#xszloading").hide();
                            setDialog('温馨提示', '上传失败')
                                // alert("密码错误","提示",{fontSize:18});
                        }
                        imgLock = true;
                    },
                    error: function(data) {
                        $("#xszloading").hide();
                        setDialog('温馨提示', '系统或网络出错!')
                            // alert("密码错误","错误");   
                        imgLock = true;
                    }
                });
            }
        });


        $("#name").bind("keyup", function() {
            if ($("#name").val() == tempname) {
                $("#checkfr").addClass("sure1");
                $("#checkfr").attr("disabled", true);
            } else {
                $("#checkfr").removeClass("sure1");
                $("#checkfr").removeAttr("disabled");
                skip();
            }
        });
        $("#mobile").bind("keyup", function() {
            if ($("#mobile").val() == tempname) {
                $("#checkfr").addClass("sure1");
                $("#checkfr").attr("disabled", true);
                $("#checkfr").attr("disabled", "no-allowed");
            } else {
                $("#checkfr").removeClass("sure1");
                $("#checkfr").removeAttr("disabled");
                skip();
            }
        });
        $("#carnum").bind("keyup", function() {
            if ($("#carnum").val() == tempname) {
                $("#checkfr").addClass("sure1");
                $("#checkfr").attr("disabled", true);
            } else {
                $("#checkfr").removeClass("sure1");
                $("#checkfr").removeAttr("disabled");
                skip();
            }
        });

        //车长
        var checkzone = document.all("car_long");
        for (var i = 0; i < checkzone.length; i++) {
            if (checkzone[i].value == '${driver.carLength}') {
                checkzone[i].checked = true;
                break;
            }
        }
        //车形
        var checkzone = document.all("cartype");
        for (var i = 0; i < checkzone.length; i++) {
            if (checkzone[i].value == '${driver.carType}') {
                checkzone[i].checked = true;
                break;
            }
        }

    });

    function boxdivs(val) {
        if (val === "1") {
            $("#sfzrzboxdiv").show();
        } else if (val === "2") {
            $("#jszrzboxdiv").show();
        } else if (val === "3") {
            $("#xszrzboxdiv").show();
        }
    };

    function boxdivhide(val) {
        if (val === "1") {
            $("#sfzrzboxdiv").hide();
        } else if (val === "2") {
            $("#jszrzboxdiv").hide();
        } else if (val === "3") {
            $("#xszrzboxdiv").hide();
        }
    };

    function ontype(val) {
        if (val === temptype) {
            $("#checkfr").addClass("sure1");
            $("#checkfr").attr("disabled", true);

        } else {
            $("#checkfr").removeAttr("disabled");
            $("#checkfr").removeClass("sure1");
            skip();

        }
    };

    function returnperson() {
        window.location.href = "/orders/driverOrdersList.htm";
    };

    function onlong(val) {
        if (val === templength) {
            $("#checkfr").addClass("sure1");
            $("#checkfr").attr("disabled", true);

        } else {
            $("#checkfr").removeAttr("disabled");
            $("#checkfr").removeClass("sure1");
            skip();
        }
    };

    //车型
    function checkfrom() {
        var carType = 0;
        var checkzone1 = document.all("cartype");
        for (var i = 0; i < checkzone1.length; i++) {
            if (checkzone1[i].checked) {
                carType = checkzone1[i].value;
            }
        };
        var car_long = 0;
        var checkzone = document.all("car_long");
        for (var i = 0; i < checkzone.length; i++) {
            if (checkzone[i].checked) {
                car_long = checkzone[i].value;
            }
        };
        var paras = {
            driverId: '${driver.id}',
            driverName: $('#name').val(),
            carNumber: $('#carnum').val(),
            carType: carType,
            carLength: car_long,
            mobile: $('#mobile').val(),
            sex: 1
        };
        $.ajax({
            type: "POST",
            url: "/ajax/updateDriverInfo.htm",
            data: paras,
            datatype: "json",
            success: function(data) {
                var obj = eval('(' + data + ')');
                if (obj.flag == 1) {
                    setDialog('温馨提示', '修改成功')
                        // alert("密码错误！");
                } else {
                    setDialog('温馨提示', obj.msg)
                        // alert('密码错误');
                }
            }
        });

    };

    function setDialog(title, info) {
        document.getElementById('mydialogtitle').innerHTML = title;
        document.getElementById('mydialoginfo').innerHTML = info;
        $(".opacity-bg,.sure_box").show();
        $(".sure_box h3 b,.sure_box button").click(function() {
            $(".opacity-bg,.sure_box").hide();
        })
    };

    function showDialog() {
        light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;padding-left: 40px;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span  id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
        $(".footer").after(light_box1);
    };

    function carBlank() {
        $("#carnum").css("border-color", "#d9d9d9");
        $("#art").css("display", "none");

    };

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

    function skip() {
        $("#checkfr").click(function() {
            window.location.href = "/orders/driverOrdersList.htm";
        });
    }
