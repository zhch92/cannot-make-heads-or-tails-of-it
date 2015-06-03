<#compress >
    <#escape x as x?html>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>修改企业个人信息</title>
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
            <h3>设置</h3>
            <p class="title">我的资料</p>
            <div class="info" >
                <div class="basic_set">
                   <p s>企业名称 :
                   <!-- &nbsp&nbsp&nbsp&nbsp${allCompanyInfo.companyInfo.companyName} -->
                  <input class="name" id="compName" type="text" value="${allCompanyInfo.companyInfo.companyName}" > 手机：<input class="tel" id="compMobile" type="text"  value="${allCompanyInfo.companyInfo.linkMobile}" disabled="disabled">
                   <p class="change_pws"> <a href="/updatepwd.htm">修改密码</a></p>
                </div>
                <h4>我的认证</h4>
                <div class="text">
                    <p>1“点击上传 ”找到电脑中的相关证件照片 。</p>
                    <p class="number"></p>
                </div>
                <div class="paper">
                    <ul class="ul_2 clearfix">
                        <li>
                        <form id="yyzzImgImgform"  action="/ajax/uploadYyzzImg.htm"  method="post" enctype="multipart/form-data" >
                            <#if allCompanyInfo.companyInfo.yyzzsfrz?? && allCompanyInfo.companyInfo.yyzzsfrz !=""&& allCompanyInfo.companyInfo.yyzzsfrz !="0">

                                                    <#if allCompanyInfo.companyInfo.yyzzsfrz == 10>
                                                          <p>已认证</p>
                                                          
                                                          <p class="img"><img src="http://192.168.2.50/statics/images/papers_6.png" alt=""></p>
                                                             <p> 营业执照副本</p>
                                                    <#elseif allCompanyInfo.companyInfo.yyzzsfrz == 1>
                                                        <p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击重新上传
                                                        <p class="img"><img src="http://192.168.2.50/statics/images/papers_6.png" alt=""></p>
                                                        </a></p>
                                                           <p> 营业执照副本</p>
                                                      <p style="position: relative;top: 15px;color:#6f6f6f">审核中...</p>
                                                    <#elseif allCompanyInfo.companyInfo.yyzzsfrz == 2>
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
                                                <#else>
                                                    <p><a style="position: relative;" href="javascript:void(0)" onClick="yyzzclick();">点击上传
                                                        <p class="img"><img src="http://192.168.2.50/statics/images/papers_6.png" alt=""></p>
                                                        </a></p>
                                                           <p> 营业执照副本</p>
                            </#if>
                            <input type="file" name="yyzzfile" id="yyzzImgSelect" class="file" style="display: none;">
                            <input type="hidden" name="companyId" id="companyId" value="${allCompanyInfo.companyInfo.id}"/>
                        </form>
                         <div class="loading" id="yyzzloading"><img alt="" src="http://192.168.2.50/statics/images/loading.gif"></div>
                        </li>
                    </ul>
                    <p class="bttn">
                        <button class="cancel"  onclick="returnperson();">取消</button>
                        <button class="sure"id="checkfr" onclick="savecomp();">确定</button>
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
      $("#checkfr").addClass("sure1");
     $("#checkfr").attr("disabled", true);
    var tempname='${allCompanyInfo.companyInfo.companyName}';
    function yyzzclick(){
        document.getElementById("yyzzImgSelect").click(); 
    }
    $(document).ready(function(){
      showDialog();
     if(${allCompanyInfo.companyInfo.yyzzsfrz} !=""&& ${allCompanyInfo.companyInfo.yyzzsfrz} !="0"){
            if(${allCompanyInfo.companyInfo.yyzzsfrz} == 10){
                    $("#checkfr").addClass("sure1");
                    $("#checkfr").attr("disabled", true);
                    $("#compName").attr("disabled", true);
            }
            // else{
            //       $("#checkfr").removeClass("sure1");
            //         $("#checkfr").attr("disabled",false);
            // }
     }

        $("#compName").bind("keyup",function(){
           if($("#compName").val()==tempname){
              $("#checkfr").addClass("sure1");
            $("#checkfr").attr("disabled", true);
           }else{
             $("#checkfr").removeAttr("disabled");
               $("#checkfr").removeClass("sure1");
           }
         });
        
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
                $("#yyzzImgImgform").ajaxSubmit({  
                    url:"/ajax/uploadYyzzImg.htm",  
                    type:"post",  
                    enctype:'multipart/form-data',  
                    dataType:'json',
                    success:function(data) { 
                        if (data.flag == 1) {
                             $("#yyzzloading").hide();
                              setDialog('温馨提示', '上传成功');
                               $("#checkfr").removeClass("sure1");
                               $("#checkfr").removeAttr("disabled");
                             //  $("button").click(function(){
                             //     window.location.href="/companyInfo/toCompanyInfo.htm";
                             // });
                            // alert("操作成功!");
                            
                        }  else if(data.flag == -2){
                             $("#yyzzloading").hide();
                              setDialog('温馨提示', '上传失败,格式错误或大小超过2M！');
                            // alert("操作成功!");
                        } else {
                             $("#yyzzloading").hide();
                             $.showErrorAlert('上传失败！');
                        }
                        imgLock = true;
                    },error:function(data) {  
                     $("#yyzzloading").hide();
                      setDialog('温馨提示', '系统或网络出错！');
                        // alert('操作成功!');
                        imgLock = true;
                    }  
                });
            }
        });
        
    });
    function returnperson(){
     window.location.href="/orders/cargoerOrdersList.htm";
     }
    
   function savecomp(){
       if($("#compName").val()==null || ($("#compName").val()).trim()==""){
                      setDialog('温馨提示', '企业名称不能为空!');

           // alert("系统或网络出错！");
       }
       $("#checkfr").addClass("sure1");
       $("#checkfr").attr("disabled", true);
        $.post("/ajax/updateCompanyInfo.htm",{id:'${allCompanyInfo.companyInfo.id}',companyName:$("#compName").val()},
                  function(data){
                    if(data.flag == 1){
                         setDialog('温馨提示', data.msg);

                         $("button").click(function(){
                         window.location.href="/orders/cargoerOrdersList.htm";
                       });

                        // alert('操作成功!');
                        $("#checkfr").on("click",function(){
                          window.location.href="/orders/cargoerOrdersList.htm";  
                        })
                    }else{
                         setDialog('温馨提示', data.msg);
                        // alert('操作成功!');
                        // $("#checkfr").addClass("sure1");
                        //  $("#checkfr").removeAttr("disabled");
                    }
                  },
                  "json");
   }
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

    </#escape>
</#compress>