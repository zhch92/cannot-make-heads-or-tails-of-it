 ;document.getElementById('uname').focus();
 $(document).ready(function() {
     document.onkeydown = function(event) {
         if (event.keyCode == 13)
             login();
     };
     showDialog();
 });

 function login() {
     $("#loginbtn").html("登录中");
     $("#loginbtn").attr("disabled", true);
     $.post("/ajax/login.htm", {
             username: $("#uname").val(),
             password: $("#pwd").val(),
             isYzm: 0,
             rememberMe: 0
         },
         function(data) {
             if (data.flag == 1) {
                 $("#loginbtn").attr("disabled", true);
                 window.location.href = data.msg;
             } else {
                 $("#loginbtn").html("登录");
                 setDialog('温馨提示', data.msg)
                     // alert('密码错误');
                 $("#loginbtn").removeAttr("disabled");
                 if (data.data > 2) {} else {}
             }
         },
         "json");
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
