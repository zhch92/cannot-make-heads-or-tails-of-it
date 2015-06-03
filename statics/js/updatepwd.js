;function phoneBlank() {
       $("#phnenum").css("border-color", "#d9d9d9");
       $("#art1").css("display", "none");


   };

   function checkPhone1(phoneNumber) {
       var phoneNumber = document.getElementById("phnenum").value;
       var re = /^((\(\d{3}\))|(\d{3}\-))?13\d{9}|14[57]\d{8}|15\d{9}|18\d{9}$/
       if (!re.test(phoneNumber)) {
           $("#phnenum").css("border-color", "red");
           $("#art1").css("display", "block")

       } else {
           $("#phnenum").css("border-color", "#d9d9d9");
           $("#art1").css("display", "none");
       };
   };

   function checksteps(val) {
       if (val === '1') {


           var $mobileNo = $('#phnenum').val() ? $.trim($('#phnenum').val()) : '';
           var $checkCode = $('#phonecode').val() ? $.trim($('#phonecode').val()) : '';
           if (!$mobileNo || !$checkCode) {
               setDialog('温馨提示', '请输入手机号和验证码')
                   // alert("密码错误");
               return false;
           }
           if (!isPhoneNumber($mobileNo)) {
               setDialog('温馨提示', '请输入正确的手机号')
                   // alert("密码错误");
               return false;
           }
           if ($checkCode.length != 6) {
               setDialog('温馨提示', '请输入正确的验证码')
                   // alert("密码错误");
               return false;
           }
           $.post("/ajax/user/confirmUser.htm", {
                   checkCode: $('#phonecode').val(),
                   mobile: $('#phnenum').val()
               },
               function(data) {
                   if (data.flag == 1) {
                       $('#tempId').val(data.data);
       document.getElementById('step1').className = "img";
           document.getElementById('step2').className = 'img img_active';
           document.getElementById('b1').className = "b_no";
           document.getElementById('b2').className = 'b_active';
           document.getElementById('ul1').className = "next_1";
           document.getElementById('ul2').className = 'next_2 next_active';
                       //$('#toForgetPwd3').attr("userId",);
                   } else {
                       setDialog('温馨提示', data.msg)
                           // alert('密码错误');
                   }
               }, "json");
       } else if (val === '2') {
           var newPwd = $('#newpwd').val() ? $.trim($('#newpwd').val()) : '';
           var rePwd = $('#newpwd2').val() ? $.trim($('#newpwd2').val()) : '';
           if (newPwd != "" && rePwd != "" && (newPwd == rePwd)) {
               $.ajax({
                   type: "POST",
                   url: "/ajax/user/resetPwd.htm",
                   data: {
                       userId: $('#tempId').val(),
                       newPwd: newPwd,
                       rePwd: rePwd
                   },
                   datatype: "json",
                   success: function(data) {
                       var obj = eval('(' + data + ')');
                       if (obj.flag == 1) {
                           document.getElementById('step2').className = "img";
                           document.getElementById('step3').className = 'img img_active';
                           document.getElementById('b2').className = "b_no";
                           document.getElementById('b3').className = 'b_active';
                           document.getElementById('ul2').className = "next_1";
                           document.getElementById('ul3').className = 'next_3 next_active';
                           $(".next_3").show();

                       } else {
                           setDialog('温馨提示', obj.msg)
                               // alert('密码错误'); 
                       }
                   }
               });

           } else {
               setDialog('温馨提示', '两次输入密码不一致!')
                   // alert("密码错误");
           }
       }
   };

  
   var isSendSMSValid = true;

   function sendWjSMSValid(url, mobileNo, sendBtn) {
       if (!isSendSMSValid) {
           return false;
       }
       if (!isPhoneNumber(mobileNo)) {
           setDialog('温馨提示', '请输入正确的手机号！')
               // alert("密码错误");
           return false;
       }

       sendBtn.attr("disabled", "disabled");
       $.post(url, {
               mobileNo: mobileNo
           },
           function(data) {
               if (data.flag == 1) {
                   setDialog('温馨提示', '短信发送成功')
                       // alert("密码错误");
                   isSendSMSValid = false;
                   intervalid1 = setInterval(function() {
                       countSecond(sendBtn);
                   }, 1000);
               } else {
                   sendBtn.removeAttr("disabled");
                   setDialog('温馨提示', data.msg)
                       // alert('密码错误');
               }
           }, "json");
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
   var i_fp = 60;
   var isRestart = false;

   function countSecond(sendBtn, isRestart) {
       $("#yzm").addClass("msg1");
       $("#yzm").val(+i_fp + "秒后重发");
       i_fp--;
       if (i_fp == -1) {
           isSendSMSValid = true;
           clearInterval(intervalid1);
           sendBtn.val("发送验证码");
           sendBtn.removeAttr("disabled");
           $("#yzm").removeClass("msg1");
           i_fp = 60;
       }
   };

   function banBackSpace(e) {
       var ev = e || window.event;
       var obj = ev.target || ev.srcElement;

       var t = obj.type || obj.getAttribute('type');

       var vReadOnly = obj.getAttribute('readonly');
       var vEnabled = obj.getAttribute('enabled');
       vReadOnly = (vReadOnly == null) ? false : vReadOnly;
       vEnabled = (vEnabled == null) ? true : vEnabled;

       var flag1 = (ev.keyCode == 8 && (t == "password" || t == "text" || t == "textarea") && (vReadOnly == true || vEnabled != true)) ? true : false;

       var flag2 = (ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea") ? true : false;

       if (flag2) {
           return false;
       }
       if (flag1) {
           return false;
       }
   };
   document.onkeypress = banBackSpace;
   document.onkeydown = banBackSpace;


   function setDialog(title, info) {
       document.getElementById('mydialogtitle').innerHTML = title;
       document.getElementById('mydialoginfo').innerHTML = info;

       $(".opacity-bg,.sure_box").show();
       $(".sure_box h3 b,.sure_box button").click(function() {
           $(".opacity-bg,.sure_box").hide();
       })
   };

   function showDialog() {
       light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://www.huo68.com/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;padding-left: 40px;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://www.huo68.com/statics/images/lightbox.png\" alt=\"\"><span  id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://www.huo68.com/statics/images/butn.png) no-repeat;\">确认</button></div>";
       $(".footer").after(light_box1);
   };
