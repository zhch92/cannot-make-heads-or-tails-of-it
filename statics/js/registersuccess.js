     ;function gopersonpage() {
         if ('${usertypes}' == 1) {
             window.location.href = "/orders/driverOrdersList.htm";
         } else if ('${usertypes}' == 2) {
             window.location.href = "/orders/cargoerOrdersList.htm";
         }

     };

     function sfzclick() {
         document.getElementById("sfzImgSelect").click();
     };

     function jszclick() {
         document.getElementById("jszImgSelect").click();
     };

     function xszclick() {
         document.getElementById("xszImgSelect").click();
     };

     function yyzzclick() {
         document.getElementById("yyzzImgSelect").click();
     };

     $(document).ready(function() {

         showDialog()
         var imgLock = true;

         if ('${usertypes}' == 1) {
             $('#sfzImgSelect,#xszImgSelect,#jszImgSelect').bind("click", function(e) {
                 if (!imgLock) {
                     var event = window.event || e;
                     event.preventDefault();
                 }
             });
             $('#sfzImgSelect').change(function() {
                 if (imgLock && $(this).val() != "") {
                     imgLock = false;
                     //$("#jhc").css("display", "block");
                     //    $('#sfzImg').attr('src','http://www.easyicon.net/api/resize_png_new.php?id=1183547&size=64');   
                     $("#sfzloading").show();
                     $("#sfzform").ajaxSubmit({
                         url: "/ajax/uploadSfzImg.htm",
                         type: "post",
                         enctype: 'multipart/form-data',
                         dataType: 'json',
                         success: function(data) {
                             if (data.flag == 1) {
                                 $("#sfzloading").hide();
                                 setDialog('温馨提示', '上传成功');
                                 $("button").click(function() {
                                     window.location.href = "/user/registersuccess.htm?type=1";
                                 });
                                 // alert("取消交易成功");

                                 var path = data.msg;
                                 // $('#sfzImg').attr('src','http://www.easyicon.net/api/resize_png_new.php?id=1183433&size=48');     
                                 //$("#jhc").css("display", "none");                        
                             } else if (data.flag == -2) {
                                 $("#sfzloading").hide();
                                 setDialog('温馨提示', '上传失败,格式错误或大小超过2M！');
                                 // alert("取消交易成功");
                                 // $("#jhc").css("display", "none");
                             } else {
                                 $("#sfzloading").hide();
                                 setDialog('温馨提示', '上传失败');
                                 // alert("取消交易成功");
                                 // $("#jhc").css("display", "none");
                             }
                             imgLock = true;
                         },
                         error: function(data) {
                             $("#sfzloading").hide();
                             setDialog('温馨提示', '系统或网络出错!');
                             // alert("取消交易成功");
                             //  $("#jhc").css("display", "none");    
                             imgLock = true;
                         }
                     });
                 }
             });
             $('#jszImgSelect').change(function() {
                 if (imgLock && $(this).val() != "") {
                     imgLock = false;
                     //$("#jhccc").css("display", "block");
                     //    $('#jszImg').attr('src','http://192.168.2.50/static/images/zt1.jpg');
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
                                 $("button").click(function() {
                                     window.location.href = "/user/registersuccess.htm?type=1";
                                 });
                                 // alert("上传失败");

                                 var path = data.msg;
                                 //$('#jszImg').attr('src','/driver/downImg.htm?path='+path); 
                                 // $('#jszImg').attr('src','http://192.168.2.50/static/images/zt2.jpg'); 
                                 //  $("#jhccc").css("display", "none");
                             } else if (data.flag == -2) {
                                 $("#jszloading").hide();
                                 setDialog('温馨提示', '上传失败,格式错误或大小超过2M！');
                                 // alert("取消交易成功");
                                 // $("#jhccc").css("display", "none");
                             } else {
                                 $("#jszloading").hide();
                                 setDialog('温馨提示', '上传失败');
                                 // alert("取消交易成功");
                                 // $("#jhccc").css("display", "none");
                             }
                             imgLock = true;
                         },
                         error: function(data) {
                             $("#jszloading").hide();
                             setDialog('温馨提示', '系统或网络出错!');
                             // alert("取消交易成功"); 
                             // $("#jhccc").css("display", "none");  
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
                                 setDialog('温馨提示', '上传成功');
                                 // alert("上传失败");
                                 $("button").click(function() {
                                     window.location.href = "/user/registersuccess.htm?type=1";
                                 });

                                 var path = data.msg;
                                 //$('#xszImg').attr('src','/driver/downImg.htm?path='+path); 
                                 // $('#xszImg').attr('src','http://192.168.2.50/static/images/zt2.jpg'); 
                                 // $("#jhcc").css("display", "none");
                             } else if (data.flag == -2) {
                                 $("#xszloading").hide();
                                 setDialog('温馨提示', '上传失败,格式错误或大小超过2M！');
                                 // alert("取消交易成功");
                                 // $("#jhcc").css("display", "none");
                             } else {
                                 $("#xszloading").hide();
                                 setDialog('温馨提示', '上传失败')
                                     // alert("取消交易成功","提示");
                                     // $("#jhcc").css("display", "none");
                             }
                             imgLock = true;
                         },
                         error: function(data) {
                             $("#xszloading").hide();
                             setDialog('温馨提示', '系统或网络出错!')
                                 // alert("取消交易成功");   
                                 // $("#jhcc").css("display", "none");
                             imgLock = true;
                         }
                     });
                 }
             });
         } else {
             var imgLock = true;
             $('#yyzzImgSelect').bind("click", function(e) {
                 if (!imgLock) {
                     var event = window.event || e;
                     event.preventDefault();
                 }
             });
             $('#yyzzImgSelect').change(function() {
                 if (imgLock && $(this).val() != "") {
                     imgLock = false;
                     $("#yyzzloading").show();
                     //    $("#jhcc").css("display", "block");
                     //    $('#yyzzImg').attr('src','http://192.168.2.50/static/images/zt1.jpg');
                     $("#yyzzImgImgform").ajaxSubmit({
                         url: "/ajax/uploadYyzzImg.htm",
                         type: "post",
                         enctype: 'multipart/form-data',
                         dataType: 'json',
                         success: function(data) {
                             if (data.flag == 1) {
                                 $("#yyzzloading").hide();
                                 setDialog('温馨提示', '上传成功');
                                 $("button").click(function() {
                                     window.location.href = "/user/registersuccess.htm?type=1";
                                 });
                                 // alert("取消交易成功");          

                                 //   $('#yyzzImg').attr('src','http://192.168.2.50/static/images/zt2.jpg');
                                 //   $("#jhcc").css("display", "none");                                                    
                             } else if (data.flag == -2) {
                                 $("#yyzzloading").hide();
                                 setDialog('温馨提示', '上传失败,格式错误或大小超过2M！');
                                 // alert("取消交易成功");
                                 //  $("#jhcc").css("display", "none");
                             } else {
                                 $("#yyzzloading").hide();
                                 $.showErrorAlert('上传失败！');
                                 // $("#jhcc").css("display", "none");
                             }
                             imgLock = true;
                         },
                         error: function(data) {
                             $("#yyzzloading").hide();
                             setDialog('温馨提示', '系统或网络出错！');

                             // alert('取消交易成功');
                             // $("#jhcc").css("display", "none");
                             imgLock = true;
                         }
                     });
                 }
             });
         }


     });

     function setDialog(title, info) {
         document.getElementById('mydialogtitle').innerHTML = title;
         document.getElementById('mydialoginfo').innerHTML = info;

         $(".opacity-bg,.sure_box").show();
         $(".sure_box h3 b,.sure_box button").click(function() {
             $(".opacity-bg,.sure_box").hide();
         })
     };

     function showDialog() {
         light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span  id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
         $(".footer").after(light_box1);
     };
