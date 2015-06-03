<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>注册成功-上传认证资料-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/info.css">
     <script type="text/javascript" src="http://192.168.2.50/statics/js/jquery.js"></script>
         <script type="text/javascript" src="http://192.168.2.50/static/js/jquery.form.js"></script>
         <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?39f1eef3f577e574e809dcb29d873fd2";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
         
</head>

<body>
   <#include "common/head.ftl"/>
    <div class="content">
        <div class="logo">
           <a href="/index.htm"> <img src="http://192.168.2.50/statics/images/logo.png" alt=""></a>
        </div>
        <div class="main">
                <p class="success" >恭喜！注册成功！</p>
                <h1>最后一步：上传证件，开始免费
         <#if usertypes ==1>
              拉货啦
         <#else>
             调车啦
         </#if>       
               </h1>
            <div class="info">
                <h4 style="margin-top:85px;">我的认证</h4>
                <div class="text">
                    <p>1“点击上传 ”找到电脑中的相关证件照片 。</p>
                    <p class="number"></p>
                </div>
                <div class="paper">
                
                 <#if usertypes ==1>
                                   <ul class="clearfix">
                        <li>
                          <form id="sfzform"  action="/ajax/uploadSfzImg.htm"  method="post" enctype="multipart/form-data" target="if">
                                                    <#if driver.sfzsfrz == 10>
                                                    <p>已认证</p>
                                                    <p class="img"><img src="http://192.168.2.50/statics/images/papers_11.png" alt=""></p>
                                                    <#elseif driver.sfzsfrz == 1>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="sfzclick();">点击重新上传
                                                      <p class="img"><img src="http://192.168.2.50/statics/images/papers_1.png" alt=""></p>
                                                    </a></p>
                                                     <p> 身份证 </p>
                                                      <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
                                                    <#elseif driver.sfzsfrz == 2>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="sfzclick();">点击重新上传
                                                     <p class="img"><img src="http://192.168.2.50/statics/images/papers_1.png" alt=""></p>
                                                    </a></p>
                                                    <p> 身份证 </p>
                                                     <p style="position: relative;top: 15px;color:#6f6f6f">审核未通过</p>
                                                    <#else>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="sfzclick();">点击上传
                                                     <p class="img"><img src="http://192.168.2.50/statics/images/papers_1.png" alt=""></p>
                                                    </a></p>
                                                    <p> 身份证 </p>
                                                    </#if>                                              
                              <input type="file" class="file" name="sfzfile" id="sfzImgSelect" style="display: none;"/>
                              <input type="hidden" name="sfzid" id="driverId" value="${driver.id}"/>
                      </form>
                             <div class="loading" id="sfzloading"><img alt="" src="http://192.168.2.50/statics/images/loading.gif"></div>
                        </li>
                      
                        <li>
                         <form id="jszform"  action="/ajax/uploadJszImg.htm"  method="post" enctype="multipart/form-data" target="if">
                                                    <#if driver.jszsfrz == 10>
                                                        <p>已认证</p>
                                                        <p class="img"><img src="http://192.168.2.50/statics/images/papers_2.png" alt=""></p>
                                                    <#elseif driver.jszsfrz == 1>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="jszclick();">点击重新上传
                                                    <p class="img"><img src="http://192.168.2.50/statics/images/papers_21.png" alt=""></p>
                                                    </a></p>
                                                     <p>驾驶证</p>
                                                      <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
                                                    <#elseif driver.jszsfrz == 2>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="jszclick();">点击重新上传
                                                    <p class="img"><img src="http://192.168.2.50/statics/images/papers_21.png" alt=""></p>
                                                    </a></p>
                                                     <p>驾驶证</p>
                                                    <p style="position: relative;top: 15px;color:#6f6f6f">审核未通过</p>
                                                    <#else>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="jszclick();">点击上传
                                                    <p class="img"><img src="http://192.168.2.50/statics/images/papers_21.png" alt=""></p>
                                                    </a></p>
                                                     <p>驾驶证</p>
                                                    </#if>
                                <input type="file" name="jszfile" id="jszImgSelect" class="file" style="display: none;">
                                <input type="hidden" name="sfzid" id="driverId" value="${driver.id}"/>
                        </form>
                             <div class="loading" id="jszloading"><img alt="" src="http://192.168.2.50/statics/images/loading.gif"></div>
                        </li>
                        <li>
                          <form id="xszform"  action="/ajax/uploadXszImg.htm"  method="post" enctype="multipart/form-data" target="if">
                                                    <#if driver.xszsfrz == 10>
                                                    <p>已认证</p>
                                                    <p class="img"><img src="http://192.168.2.50/statics/images/papers_31.png" alt=""></p>
                                                    <#elseif driver.xszsfrz == 1>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="xszclick();">点击重新上传
                                                     <p class="img"><img src="http://192.168.2.50/statics/images/papers_3.png" alt=""></p>
                                                    </a></p>
                                                     <p>行驶证</p>
                                                     <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
                                                    <#elseif driver.xszsfrz == 2>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="xszclick();">点击重新上传
                                                    <p class="img"><img src="http://192.168.2.50/statics/images/papers_3.png" alt=""></p>
                                                    </a></p>
                                                     <p>行驶证</p>
                                                     <p style="position: relative;top: 15px;color:#6f6f6f">审核未通过</p>
                                                    <#else>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="xszclick();">点击上传
                                                    <p class="img"><img src="http://192.168.2.50/statics/images/papers_3.png" alt=""></p>
                                                    </a></p>
                                                     <p>行驶证</p>
                                                    </#if>
                            <input type="file" name="xszfile" id="xszImgSelect" class="file" style="display: none;">
                            <input type="hidden" name="sfzid" id="driverId" value="${driver.id}"/>
                        </form>
                         <div class="loading" id="xszloading"><img alt="" src="http://192.168.2.50/statics/images/loading.gif"></div>
                        </li>
                    </ul>

         <#else>
                      <ul class="ul_2 clearfix">
                        <li>
                             <form id="yyzzImgImgform"  action="/ajax/uploadYyzzImg.htm"  method="post" enctype="multipart/form-data" >
                                                    <#if headallCompanyInfo.yyzzsfrz == 10>
                                                          <p>已认证</p>
                                                          
                                                          <p class="img"><img src="http://192.168.2.50/statics/images/papers_6.png" alt=""></p>
                                                             <p> 营业执照副本</p>
                                                    <#elseif headallCompanyInfo.yyzzsfrz == 1>
                                                        <p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击重新上传
                                                        <p class="img"><img src="http://192.168.2.50/statics/images/papers_6.png" alt=""></p>
                                                        </a></p>
                                                           <p> 营业执照副本</p>
                                                      <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
                                                    <#elseif headallCompanyInfo.yyzzsfrz == 2>
                                                        <p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击重新上传
                                                        <p class="img"><img src="http://192.168.2.50/statics/images/papers_6.png" alt=""></p>
                                                        </a></p>
                                                           <p> 营业执照副本</p>
                                                            <p style="position: relative;top: 15px;color:#6f6f6f">审核未通过</p>
                                                    <#else>
                                                        <p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击上传
                                                        <p class="img"><img src="http://192.168.2.50/statics/images/papers_6.png" alt=""></p>
                                                        </a></p>
                                                           <p> 营业执照副本</p>
                                                    </#if>
                            <input type="file" name="yyzzfile" id="yyzzImgSelect" class="file" style="display: none;">
                            <input type="hidden" name="companyId" id="companyId" value="${headallCompanyInfo.id}"/>
                        </form>
                         <div class="loading" id="yyzzloading"><img alt="" src="http://192.168.2.50/statics/images/loading.gif"></div>
                        </li>
                    </ul>
         </#if>    
                    
                    <p class="bttn" style="text-align:center">

                        <button class="sure" onclick="gopersonpage();">确定</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50/statics/images/logo_1.png" alt="">© 2015 HUO68.COM   </p>
        </div>
    </div>
    <script type="text/javascript">
     function gopersonpage(){
         if('${usertypes}'==1){
             window.location.href="/orders/driverOrdersList.htm";
         }else if('${usertypes}'==2){
             window.location.href="/orders/cargoerOrdersList.htm";
         }
        
     }
     function sfzclick(){
        document.getElementById("sfzImgSelect").click(); 
     }
     function jszclick(){
        document.getElementById("jszImgSelect").click(); 
     }
     function xszclick(){
        document.getElementById("xszImgSelect").click(); 
     }
     function yyzzclick(){
        document.getElementById("yyzzImgSelect").click(); 
     }
     
     $(document).ready(function () {
        
        showDialog()
        var imgLock = true; 
        
        if('${usertypes}'==1){
              $('#sfzImgSelect,#xszImgSelect,#jszImgSelect').bind("click",function(e){
                if (!imgLock) {
                    var event = window.event || e;
                    event.preventDefault();
                }
          });
              $('#sfzImgSelect').change(function(){
                  if (imgLock && $(this).val() != "") {
                    imgLock = false;
                    //$("#jhc").css("display", "block");
                  //    $('#sfzImg').attr('src','http://www.easyicon.net/api/resize_png_new.php?id=1183547&size=64');   
                    $("#sfzloading").show();
                    $("#sfzform").ajaxSubmit({  
                        url:"/ajax/uploadSfzImg.htm",  
                        type:"post",  
                        enctype:'multipart/form-data',  
                        dataType:'json',
                        success:function(data) { 
                            if (data.flag == 1) {
                               $("#sfzloading").hide();
                                 setDialog('温馨提示', '上传成功');
                                 $("button").click(function(){window.location.href="/user/registersuccess.htm?type=1";});
                                // alert("取消交易成功");
                                 
                                var path = data.msg;
                               // $('#sfzImg').attr('src','http://www.easyicon.net/api/resize_png_new.php?id=1183433&size=48');     
                                 //$("#jhc").css("display", "none");                        
                            }else if(data.flag == -2){
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
                        },error:function(data) {  
                              $("#sfzloading").hide();
                                setDialog('温馨提示', '系统或网络出错!');
                            // alert("取消交易成功");
                           //  $("#jhc").css("display", "none");    
                             imgLock = true;
                        }  
                    });  
                }
              });
              $('#jszImgSelect').change(function(){
                  if (imgLock && $(this).val() != "") {
                    imgLock = false;
                    //$("#jhccc").css("display", "block");
                  //    $('#jszImg').attr('src','http://192.168.2.50/static/images/zt1.jpg');
                    $("#jszloading").show();
                    $("#jszform").ajaxSubmit({  
                        url:"/ajax/uploadJszImg.htm",  
                        type:"post",  
                        enctype:'multipart/form-data',  
                        dataType:'json',
                        success:function(data) { 
                            if (data.flag == 1) {
                               $("#jszloading").hide();
                                  setDialog('温馨提示', '上传成功');
                                  $("button").click(function(){
                                    window.location.href="/user/registersuccess.htm?type=1";
                                });
                                // alert("上传失败");
                                 
                                var path = data.msg;
                                //$('#jszImg').attr('src','/driver/downImg.htm?path='+path); 
                               // $('#jszImg').attr('src','http://192.168.2.50/static/images/zt2.jpg'); 
                               //  $("#jhccc").css("display", "none");
                            }else if(data.flag == -2){
                                $("#jszloading").hide();
                                  setDialog('温馨提示', '上传失败,格式错误或大小超过2M！');
                                // alert("取消交易成功");
                                // $("#jhccc").css("display", "none");
                            }  else {
                                $("#jszloading").hide();
                                  setDialog('温馨提示', '上传失败');
                                // alert("取消交易成功");
                                // $("#jhccc").css("display", "none");
                            }
                            imgLock = true;
                        },error:function(data) {
                            $("#jszloading").hide();
                              setDialog('温馨提示', '系统或网络出错!');
                            // alert("取消交易成功"); 
                          // $("#jhccc").css("display", "none");  
                           imgLock = true;
                        }  
                    });
                }
              });
              $('#xszImgSelect').change(function(){
                  if (imgLock && $(this).val() != "") {
                    imgLock = false;
                   $("#xszloading").show();
                    $("#xszform").ajaxSubmit({  
                        url:"/ajax/uploadXszImg.htm",  
                        type:"post",  
                        enctype:'multipart/form-data',  
                        dataType:'json',
                        success:function(data) { 
                            if (data.flag == 1) {
                                $("#xszloading").hide();
                                   setDialog('温馨提示', '上传成功');
                                // alert("上传失败");
                                $("button").click(function(){
                                    window.location.href="/user/registersuccess.htm?type=1";
                                });
                                 
                                var path = data.msg;
                                //$('#xszImg').attr('src','/driver/downImg.htm?path='+path); 
                               // $('#xszImg').attr('src','http://192.168.2.50/static/images/zt2.jpg'); 
                               // $("#jhcc").css("display", "none");
                            } else if(data.flag == -2){
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
                        },error:function(data) { 
                        $("#xszloading").hide();
                          setDialog('温馨提示', '系统或网络出错!')
                            // alert("取消交易成功");   
                           // $("#jhcc").css("display", "none");
                            imgLock = true;
                        }  
                    });          
                }
              });
        }else{
            var imgLock = true;
            $('#yyzzImgSelect').bind("click",function(e){
                    if (!imgLock) {
                        var event = window.event || e;
                        event.preventDefault();
                    }
              });
                $('#yyzzImgSelect').change(function(){
                      if (imgLock && $(this).val() != "") {
                        imgLock = false;
                        $("#yyzzloading").show();
                      //    $("#jhcc").css("display", "block");
                      //    $('#yyzzImg').attr('src','http://192.168.2.50/static/images/zt1.jpg');
                        $("#yyzzImgImgform").ajaxSubmit({  
                            url:"/ajax/uploadYyzzImg.htm",  
                            type:"post",  
                            enctype:'multipart/form-data',  
                            dataType:'json',
                            success:function(data) { 
                                if (data.flag == 1) {
                                    $("#yyzzloading").hide();
                                      setDialog('温馨提示', '上传成功');
                                      $("button").click(function(){window.location.href="/user/registersuccess.htm?type=1";});
                                    // alert("取消交易成功");          
                                     
                                 //   $('#yyzzImg').attr('src','http://192.168.2.50/static/images/zt2.jpg');
                                 //   $("#jhcc").css("display", "none");                                                    
                                }  else if(data.flag == -2){
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
                            },error:function(data) {  
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
            }

            function showDialog() {
                light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span  id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
                $(".footer").after(light_box1);
            }
     
    </script>
</body>

</html>


</#escape> </#compress>