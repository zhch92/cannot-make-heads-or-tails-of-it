<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>登录-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50:8080/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8080/statics/css/login.css">
    <script type="text/javascript"  src="http://192.168.2.50:8080/static/js/jquery-1.7.2.min.js"></script>
</head>

<body>
    <#include "common/head.ftl"/>
<div class="content">
    <div class="logo"><a href="/index.htm"><img src="http://192.168.2.50:8080/statics/images/logo_2.png" alt=""></a></div>
    <h1>登录</h1>
    <div class="table">
        <ul>
            <li class="user"><i></i><input type="text" id="uname" name="uname" placeholder="电话号码"></li>
            <li class="pwd"><i></i><input type="password" id="pwd"  name="pwd" placeholder="密码"></li>
            <li class="forget"><a href="/forgetpwd.htm">忘记密码?</a></li>
            <li class="btn"><button id="loginbtn" onclick="login();">登  录</button></li>
            <li class="register"><a href="register.htm">免费注册</a></li>
        </ul>
    </div>
</div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8080/statics/images/logo_1.png" alt="">© 2015 HUO68.COM   </p>
        </div>
    </div>
   <script type="text/javascript">
    function login(){
    	   $("#loginbtn").html("登录中");
    	   $("#loginbtn").attr("disabled", true); 
    	   $.post("/ajax/login.htm",{username:$("#uname").val(),password:$("#pwd").val(),isYzm:0,rememberMe:0},
					  function(data){
					  	if(data.flag==1){
					  		 $("#loginbtn").attr("disabled", true); 
					  		window.location.href=data.msg;   	
					  	}else{
					    	 $("#loginbtn").html("登录");
					    	 alert(data.msg);
					    	 $("#loginbtn").removeAttr("disabled");
					    	if(data.data>2){
					    		 //$("#loginbtn").html("登录");
					    	}else{
					    		// $("#loginbtn").html("登录1");
					    	}
					    }
					  },
					  "json");	
    }
   </script>
</body>

</html>

</#escape> </#compress>
