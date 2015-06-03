<#compress >
    <#escape x as x?html>
  <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>404报错</title>
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/info.css">
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
       <div class="run">
           <h1>出错啦 !</h1>
           <p class="runing">您访问的页面逃走了！</p>
           <p class="runing">您长时间未操作请重新登录</p>
           <p class="bttn">           <a  class="home" href="/index.htm">返回首页</a><a class="pgup" href="javascript:history.back(-1)">返回上一页</a></p>

       </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50/statics/images/logo_1.png" alt="">© 2015 HUO68.COM   </p>
        </div>
    </div>
</body>

</html>

    </#escape>
</#compress>