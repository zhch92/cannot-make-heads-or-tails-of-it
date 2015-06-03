$(document).ready(function() {
    showDialog();
});

function saveCargo() {
    var cargoName = $.trim($("#cargoName").val());
    var quote = $.trim($("#quote").val());
    var weight = $.trim($("#weight").val());
    var square = $.trim($("#square").val());
    var carLength = $.trim($("#carLength").val());
    var carType = $.trim($("#carType").val());
    var start = $.trim($("#start").val());
    var province = $.trim($("#province").val());
    var city = $.trim($("#city").val());
    var county = $.trim($("#county").val());
    var startAdd = $.trim($("#startAdd").val());
    var end = $.trim($("#end").val());
    var province1 = $.trim($("#province1").val());
    var city1 = $.trim($("#city1").val());
    var county1 = $.trim($("#county1").val());
    var arrivalAdd = $.trim($("#arrivalAdd").val());
    if (cargoName == "" || cargoName == 0) {
        setDialog('温馨提示', '货物类型不能为空或为0!')
            // alert("密码错误");
        return;
    }
    if (quote == "" || quote == 0) {
        setDialog('温馨提示', '货物价格不能为空或为0!')
            // alert("密码错误");
        return;
    }
    if (weight == "" || weight == 0) {
        setDialog('温馨提示', '货物重量不能为空或为0!')
            // alert("密码错误");
        return;
    }
    if (square == "" || square == 0) {
        setDialog('温馨提示', '货物方量不能为空或为0!')
            // alert("密码错误");
        return;
    }
    if (start == "" || start == 0) {
        setDialog('温馨提示', '接货日期不能为空!')
            // alert("密码错误");
        return;
    }
    if (province == "" || city == "" || county == "") {
        setDialog('温馨提示', '接货地址不能为空!')
            // alert("密码错误");
        return;
    }
    if (end == "" || end == 0) {
        setDialog('温馨提示', '到货日期不能为空!')
            // alert("密码错误");
        return;
    }
    if (province1 == "" || city1 == "" || county1 == "") {
        setDialog('温馨提示', '到货地址不能为空!')
            // alert("密码错误");
        return;
    }
    if (!checkTwoDate(start, end)) {
        return;
    }
    start = start + " 20:00:00";
    end = end + " 20:00:00";
    var paras = {
        cargoName: cargoName,
        quote: quote,
        weight: weight,
        square: square,
        carLength: carLength,
        carType: carType,
        sendTime: start,
        arrivalTime: end,
        province: province,
        city: city,
        county: county,
        startAdd: startAdd,
        arrivalProvince: province1,
        arrivalCity: city1,
        arrivalCounty: county1,
        arrivalAdd: arrivalAdd,
        shelve: 1,
        sendTimeStr: start,
        arrivalTimeStr: end
    };
    $.ajax({
        type: "POST",
        url: "/ajax/insertCargo.htm",
        data: paras,
        datatype: "json",
        success: function(data) {
            var obj = eval('(' + data + ')');
            if (obj.flag == 1) {
                setDialog('温馨提示', '发布成功!');
                $('button').click(function() {
                    window.location.href = "/orders/cargoerOrdersList.htm";
                });
                // alert("密码错误");

            } else {
                setDialog('温馨提示', obj.msg)
                    // alert('密码错误');
            }
        }
    });
};

function quit() {
    window.location.href = "/orders/cargoerOrdersList.htm";
};

//算总价
function countTotal() {
    var wnum = $("#weight").val();
    var per = $("#quote").val();
    if (wnum != "" && per != "") {
        $("#totalprice").html((wnum * per).toFixed(2));
    }
};

function isMmoney(obj) {
    if (obj.value > 9999) {
        obj.value = obj.value.substr(0, obj.value.length - 1);
    }
};

function istnum(obj) {
    var reg = /^\d{0,9}.\d{0,2}$/;
    if (!reg.test(obj.value)) {
        obj.value = obj.value.substr(0, obj.value.length - 1);
    }
    var values = obj.value.replace(/(.)(?=[^$])/g, "$1,").split(",");
    for (var c = 0; c < values.length; c++) {
        var idReg = /^[0-9][0-9]*$/;
        if (!idReg.test(values[c]) && values[c] != ".") {
            obj.value = obj.value.substr(0, obj.value.length - 1);
        }
        if (c > 0 && values[0] == 0 && values.indexOf(".") == -1) {
            obj.value = obj.value.substr(0, 0);
        } else if (values[0] == 0 && values[1] == 0) {
            obj.value = obj.value.substr(0, 0);
        } else if (values.indexOf(".") != -1 && values[0] == ".") {
            obj.value = "";
        }
    }
    if (obj.value > 999999999.99) {
        obj.value = '';
    }
};

//日期比较
function checkTwoDate(startDate, endDate) {
    startDate = $.trim(startDate);
    endDate = $.trim(endDate);
    var now = new Date();
    var s = now;
    if (startDate < s) {
        setDialog('温馨提示', '接货日期不能早于当前日期')
            // alert("密码错误","提示");
        return false;
    }
    if (endDate < s) {
        setDialog('温馨提示', '到货日期不能小于当前日期!')
            // alert("密码错误");
        return false;
    }
    if (startDate > endDate) {
        setDialog('温馨提示', '接货日期不能大于到货日期!')
            // alert("密码错误","提示");
        return false;
    }
    return true;
};


var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2099-06-16',
    istime: false,
    istoday: false,
    choose: function(datas) {
        end.min = datas; //开始日选好后，重置结束日的最小日期
        end.start = datas //将结束日的初始值设定为开始日
    }

};
var end = {
    elem: '#end',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2099-06-16',
    istime: false,
    istoday: false,
    choose: function(datas) {
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }

};
laydate(start);
laydate(end);

function setDialog(title, info, fn) {
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
