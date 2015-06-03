<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>登录-货管家</title>
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

<body style="background:#f5f5f5">
    <#include "common/head.ftl"/>
<div class="content">
    <div class="logo"><a href="/index.htm"><img src="http://192.168.2.50/statics/images/logo_2.png" alt=""></a></div>
    <h1>登录</h1>
    <div class="table">
        <ul>
            <li class="user"><i></i><input type="text" id="uname" name="uname" placeholder="电话号码" maxlength='11'></li>
            <li class="pwd"><i></i><input type="password" id="pwd"  name="pwd" placeholder="密码"></li>
            <li class="forget"><a href="/forgetpwd.htm">忘记密码?</a></li>
            <li class="btn"><button id="loginbtn" onclick="login();">登  录</button></li>
            <li class="register"><a href="register.htm">免费注册</a></li>
        </ul>
    </div>
</div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50/statics/images/logo_1.png" alt="">© 2015 HUO68.COM   </p>
        </div>
    </div>
  <script type="text/javascript"  src="http://192.168.2.50/statics/js/login.js"></script>
</body>

</html>

</#escape> </#compress>
