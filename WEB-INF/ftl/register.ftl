<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>账户注册-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50//statics/css/driver_resgister.css">
    <script type="text/javascript" src="http://192.168.2.50//statics/js/jquery.js"></script>
    <script type="text/javascript" src="http://192.168.2.50//statics/js/register.js"></script>
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

<body style="background: #f3f3F3">
    <#include "common/head.ftl"/>
    <div class="content">
        <div class="logo">
            <a href="/index.htm"><img src="http://192.168.2.50//statics/images/logo.png" alt=""></a>
        </div>
        <div class="main_1">
             <!--    <h1>免费注册 <input class="driver" type="radio" name="register" onclick="registertype('1');" >
                <span>司机</span><input type="radio" class="comp" name="register"  onclick="registertype('2');"><span>货方</span></h1> -->
                           
                     <h1>免费注册</h1>
            <ul class="change clearfix">
                <li>
                 <a href="javascript:;"><img  class="driver driver_img" src="http://192.168.2.50//statics/images/driver.png" alt=""></a>
                    <p> <input class="driver" id="driverbtn" type="radio" name="register"  onclick="registertype('1');" ><span>司机</span></p>
                </li>
                <li>
                <a href="javascript:;"><img  class="comp" src="http://192.168.2.50//statics/images/comp.png" alt=""></a>
                    <p><input class="comp" id="compbtn"  type="radio" name="register" onclick="registertype('2');"><span>货方</span></p>
                </li>
            </ul>          
                           
                                <!-- 司机  -->
                 <div id="personchosee" class="person chosee ">
                  <p class="me_car">我的货车</p>
            <div class="info_1">
                <ul class="car_info clearfix">
                    <li class="li_1">
                        <div class="img img_1"></div>
                       <input type="radio" name="cartype"  value="7">箱式车
                    </li>
                    <li class="li_1">
                        <div class="img img_2"></div>
                          <input type="radio" name="cartype"   value="11">高栏车
                    </li>
                    <li class="li_1">
                        <div class="img img_3"></div>
                        <input type="radio" name="cartype"  value="1">平板车
                    </li>
                    <li class="li_1">
                        <div class="img img_4"></div>
                         <input type="radio" name="cartype"  value="0">其它
                    </li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  value="1">9.6 m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  value="2">&nbsp13 m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  value="3">17.5m</li>
                    <li class="li_2">
                        <input type="radio" name="car_long"  value="0">其它</li>
                </ul>
                <div class="table" style="width:505px;">
                    <ul class="clearfix">
                        <li>姓名
                         <input type="text" id="drvname" maxlength="20" name="drvname">
                        </li>

                        <li style="margin-left:40px;position:relative;">车牌<span id="art">请输入正确的车牌号</span>
                            <input type="text" id="carnum"  onblur="if(this.value !=''){checkCar()}" onfocus="carBlank()"  maxlength="7" name="carnum" >
                        </li>

                    </ul>
                </div>
                <div class="verify">
                    <ul>
                        <li class="li_1" style="position:relative;">手机<span id="art1" style="color:red;position: absolute;top:-22px;right:260px;display:none;">请输入正确的手机号</span>
                             <input type="text" id="drviermoblie" maxlength="11" name="drviermoblie" value="请输入手机号" 
                            onkeyup="checkIsExits(this);"
                            onblur="if(this.value==''){value='请输入手机号';this.style.color='#999'}else{checkPhone1()}" 
                            onfocus=" if(this.value=='请输入手机号'){this.style.color='#000';value=''}else{this.style.color='#000';select();phoneBlank()}"/>
                            <input class="msg" type="submit" id="drvyzm" value="获取验证码">
                        </li>
                        <li class="li_2">验证码
                           <input type="text" id="drtiverYzm" name="drtiverYzm" value="输入六位数验证码"
                            onblur="if(this.value==''){this.style.color='#ccc';value='输入六位数验证码'}"
                            onfocus="if(this.value=='输入六位数验证码'){this.style.color='#000';value=''}else{this.style.color='#000';select();}" 
                            class="login_yzm" />
                        </li>
                        <li class="li_1">密码
                            <input type="password" id="driverpassword">
                        </li>
                    </ul>
                    <p style="text-align:center;margin-top:30px;" class="bttn">
                       <button class="sure" id="drireg">注册</button>
                    </p>
                </div>
                 </div>
            </div>
                <div id="companychosee" class="company chosee">
                  <div class="info">
                <p style="padding-left:277px;margin-top:87px;">企业名称
                    <input style="width:147px;" type="text"  maxlength="20" id="companyname">
                </p>
                <div class="verify">
                    <ul>
                        <li class="li_1" style="position:relative;">手机<span id="art2" style="color:red;position: absolute;top:-22px;right:260px;display:none;">请输入正确的手机号</span>
                        <input type="text" id="companymoblie"   maxlength="11" name="companymoblie" value="请输入手机号" 
                            onkeyup="checkIsExits(this);"
                            onblur="if(this.value==''){value='请输入手机号';this.style.color='#999'}else{checkPhone()}" 
                            onfocus="if(this.value=='请输入手机号'){this.style.color='#000';value=''}else{this.style.color='#000';select();phoneBlank1()}"/>
                            <input class="msg" type="submit" id="yzm" value="获取验证码">
                        </li>
                        <li class="li_2">验证码
                         <input type="text" id="companyYzm" name="companyYzm" value="输入六位数验证码"
                            onblur="if(this.value==''){this.style.color='#ccc';value='输入六位数验证码'}"
                            onfocus="if(this.value=='输入六位数验证码'){this.style.color='#000';value=''}else{this.style.color='#000';select();}" 
                            class="login_yzm" />
                        </li>
                        <li class="li_1">密码
                            <input type="password" id="compassword">
                        </li>
                    </ul>
                    <p style="text-align:center;margin-top:50px;" class="bttn"><button class="sure" id="comreg">注册</button></p>
                </div>
                </div>
                 </div>
    </div>
    </div>

    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50//statics/images/logo_1.png" alt="">© 2015 HUO68.COM   </p>
        </div>
    </div>
    <script type="text/javascript" src="http://192.168.2.50//statics/js/register1.js"></script>
  
</body>

</html>

</#escape> </#compress>