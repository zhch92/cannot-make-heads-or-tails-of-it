<#compress > <#escape x as x?html>
<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/login.css">
    <script type="text/javascript"  src="http://192.168.2.50/static/js/jquery-1.7.2.min.js"></script>
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
<div class="main_f">
  <div class="main">
    <div class="logo"><a href="/index.htm"><img src="http://192.168.2.50/statics/images/logo.png" alt=""></a></div>
    <div class="step">
      <h3>修改密码</h3>
      <div class="step_show">
        <ul class="clearfix">
          <li>
            <div class="img img_active" id="step1">第一步</div>
          <b class="b_active" id="b1"></b>
            <p>身份验证</p>
          </li>
          <li>
            <div class="img" id="step2">第二步</div>
          <b id="b2"></b>
            <p>重置密码</p>
          </li>
          <li>
            <div class="img" id="step3">第三步</div>
          <b id="b3"></b>
            <p>完成</p>
          </li>
        </ul>
      </div>
      <div class="table">
        <ul id="ul1" class="next_1 next_active">
          <li style="position:relative;">手 机<span id="art1" style=" color:red; position: absolute;top: -20px;left: 49px;display:none;">请输入正确的手机号码</span>
          <input id="phnenum" type="text" class="tel" maxlength="11" name="drviermoblie" value="${userMobile}"
                          
                            onblur="if(this.value==''){value='请输入手机号';this.style.color='#999'}else{checkPhone1()}" 
                            onfocus=" if(this.value=='请输入手机号'){this.style.color='#000';value=''}else{this.style.color='#000';select();phoneBlank()}"  disabled="disabled"/>
          <input class="msg" type="submit" id="yzm" value="发送验证码" >
          </li>
          <li>验证码
                    <input class="code" id="phonecode" maxlength="6" type="text" value="请输入6位短信验证码" 
          onblur="if(this.value==''){this.style.color='#ccc';value='请输入6位短信验证码'}"
          onfocus="if(this.value=='请输入6位短信验证码'){this.style.color='#000';value=''}else{this.style.color='#000';select();}" />
          <input type="hidden" id="tempId">
          <input class="next" type="submit" onclick="checksteps('1');" value="下一步"></li>
        </ul>
        <ul id="ul2" class="next_2 ">
          <li style="padding-left:25px;">新密码
          <input class="code" id="newpwd" type="password" />
          </li>
          <li>确认新密码
          <input class="code" id="newpwd2" type="password" />
          <input class="next" type="submit" onclick="checksteps('2');" value="下一步"></li>
        </ul>
        <ul id="ul3" class="next_3">
          <li>密码修改成功！请妥善保管！</li>
          <li><button class="next" onclick="repwdok();">完成</button></li>
        </ul>
      </div>
    </div>
  </div>
</div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 蜀ICP备15006511号-1</p>
        </div>
    </div>
<script type="text/javascript"  src="http://192.168.2.50/statics/js/updatepwd.js"></script>
<script>  $(document).ready(function() {
           $('#yzm').click(function() {
               sendWjSMSValid("/ajax/user/sendToMobile.htm", $('#phnenum').val(), $(this));
               return false;
           });
           showDialog();
       });
 function repwdok() {
       window.location.href = '${reurl}';
   };

</script>
</body>

</html>

</#escape> </#compress>

</#escape> </#compress>