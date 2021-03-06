<#compress >
    <#escape x as x?html>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>新建货源-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/reset.css">
    <script type="text/javascript" src="http://192.168.2.50/statics/js/laydate.js"></script>
    <link rel="stylesheet" href="http://192.168.2.50/statics/css/info.css">
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
    <div class="content">
        <div class="logo">
            <a href="/index.htm"><img src="http://192.168.2.50/statics/images/logo.png" alt=""></a>
        </div>
        <div class="main">
            <h3>发布货源</h3>
            <div class="basic_info">
                <ul>
                    <li>货物类型
                        <input class="mold" type="text"  maxlength="4" name="cargoName" id="cargoName"  placeholder="1-4个字">
                    </li>
                    <li>货物价格
                          <input type="text" id="quote" name="quote" class="f_text" onblur="countTotal();"  onkeyup="this.value=this.value.replace(/\D/g,'');isMmoney(this);" 
                           onafterpaste="this.value=this.value.replace(/\D/g,'')" >元/吨</li>
                    <li>货物重量
                          <input type="text" id="weight" name="weight" class="f_text" onblur="countTotal();" onkeyup="istnum(this);"  onafterpaste="istnum(this);">吨
                         <input type="text" id="square" name="square" class="f_text" onblur="istnum(this);" onkeyup="istnum(this);"  onafterpaste="istnum(this);">立方</li>
                    <li class="introduce_color" style="padding-left:75px">总价：<span id="totalprice"></span>元</li>
                    <li>车长要求
                        <select name="carLength" id="carLength">
                            <option value="4">不限</option>
                            <option value="1">9.6m</option>
                            <option value="2">13m</option>
                            <option value="3">17.5m</option>
                            <option value="0">其它</option>
                        </select>
                    </li>
                    <li>车型要求
                        <select name="carType" id="carType">
                            <option value="4">不限</option>
                            <option value="7">箱式车</option>
                            <option value="11">高栏车</option>
                            <option value="1">平板车</option>
                            <option value="0">其它</option>
                        </select>
                    </li>
                </ul>
            </div>
            <div class="adress_info">
                <ul>
                    <li class="date id="start" ">接货日期
                         <input class="inline laydate-icon" id="start"    type="text" >
                    </li>
                    <input id="area1" name="area1" value="" type="hidden">
                    <input id="area" name="area" value="" type="hidden">
                    <li class="adress">接货地址
                        <select id="province" onchange="setCityGB2260(this.value);" name="province" ><option selected="selected" >==请选择省==</option></select>省
                        <select id="city" onchange="setCountyGB2260(this.value);" name="city"><option selected="selected" >==请选择市==</option></select>市
                        <select id="county" name="county"><option selected="selected">==请选择县==</option></select>区/县
                        <br>
                        <input type="text" class="l_text" id="startAdd" name="startAdd" maxlength="60">
                    </li>
                    <li class="date">到货日期
                         <input class="inline laydate-icon" id="end"    type="text" >
                    </li>
                    <li class="adress">到货地址
                        <select id="province1" onchange="setCityGB22601(this.value);" name="province1" ><option selected="selected"  >==请选择省==</option></select>省
                        <select id="city1" onchange="setCountyGB22601(this.value);" name="city1"><option selected="selected"  >==请选择市==</option></select>市
                        <select id="county1" name="county1"><option value="" selected="selected"  >==请选择县==</option></select>区/县
                        <br>
                       <input type="text" class="l_text" id="arrivalAdd" name="arrivalAdd" maxlength="60">
                    </li>
                </ul>
                <p class="bttn">
                    <button class="cancel" onclick="javascript:history.back(-1);">取消</button>
                    <button class="sure" style="margin-right:32px" onclick="saveCargo();">确定</button>
                </p>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50/statics/images/logo_1.png" alt="">© 2015 HUO68.COM   </p>
        </div>
    </div>
    <script type="text/javascript" src="http://192.168.2.50/static/js/dq.js"></script>
<script type="text/javascript" src="http://192.168.2.50/static/js/dqcopy.js"></script>
    <script>
    $(document).ready(function(){
           showDialog();
    })
    function saveCargo(){
        var cargoName=$.trim($("#cargoName").val());    
        var quote=$.trim($("#quote").val());    
        var weight=$.trim($("#weight").val());  
        var square=$.trim($("#square").val());  
        var carLength=$.trim($("#carLength").val());    
        var carType=$.trim($("#carType").val());    
        var start=$.trim($("#start").val());    
        var province=$.trim($("#province").val());  
        var city=$.trim($("#city").val());  
        var county=$.trim($("#county").val());  
        var startAdd=$.trim($("#startAdd").val());  
        var end=$.trim($("#end").val());    
        var province1=$.trim($("#province1").val());    
        var city1=$.trim($("#city1").val());    
        var county1=$.trim($("#county1").val());    
        var arrivalAdd=$.trim($("#arrivalAdd").val());  
        if(cargoName=="" || cargoName==0){
            setDialog('温馨提示', '货物类型不能为空或为0!')
            // alert("密码错误");
            return;
        }
        if(quote=="" || quote==0){
            setDialog('温馨提示', '货物价格不能为空或为0!')
            // alert("密码错误");
            return;
        }
        if(weight=="" || weight==0){
            setDialog('温馨提示', '货物重量不能为空或为0!')
            // alert("密码错误");
            return;
        }
        if(square=="" || square==0){
            setDialog('温馨提示', '货物方量不能为空或为0!')
            // alert("密码错误");
            return;
        }
        if(start=="" || start==0){
            setDialog('温馨提示', '接货日期不能为空!')
            // alert("密码错误");
            return;
        }
        if(province=="" || city=="" || county==""){
            setDialog('温馨提示', '接货地址不能为空!')
            // alert("密码错误");
            return;
        }
        if(end=="" || end==0){
            setDialog('温馨提示', '到货日期不能为空!')
            // alert("密码错误");
            return;
        }
        if(province1=="" || city1=="" || county1==""){
            setDialog('温馨提示', '到货地址不能为空!')
            // alert("密码错误");
            return;
        }
        if(!checkTwoDate( start,end )){
            return;
        }
        start=start+" 20:00:00";
        end=end+" 20:00:00";
        var paras={cargoName:cargoName,quote:quote,weight:weight,square:square,carLength:carLength,carType:carType,sendTime:start,arrivalTime:end,
                province:province,city:city,county:county,startAdd:startAdd,arrivalProvince:province1,arrivalCity:city1,arrivalCounty:county1,arrivalAdd:arrivalAdd,
                shelve:1,sendTimeStr:start,arrivalTimeStr:end};
        $.ajax({
            type: "POST",
            url: "/ajax/insertCargo.htm",
            data:paras,
            datatype:"json",
            success: function(data){
                  var obj=eval('('+data+')'); 
                if(obj.flag == 1){
                    setDialog('温馨提示', '发布成功!');
                    $('button').click(function(){
                        window.location.href="/orders/cargoerOrdersList.htm";  
                    });
                    // alert("密码错误");
                    
                }else{
                    setDialog('温馨提示', obj.msg)
                    // alert('密码错误');
                }
            }
            });
    }
    function quit(){
         window.location.href="/orders/cargoerOrdersList.htm";
    }
    
    //算总价
    function countTotal(){
        var wnum=$("#weight").val();
        var per=$("#quote").val();
        if(wnum!=""&&per!=""){
                $("#totalprice").html((wnum*per).toFixed(2));
        }
    }
        function isMmoney(obj){
        if(obj.value>9999){
            obj.value=obj.value.substr(0,obj.value.length-1);
        }
    }
        function istnum(obj){
        var reg =  /^\d{0,9}.\d{0,2}$/;
        if(!reg.test(obj.value)){
            obj.value=obj.value.substr(0,obj.value.length-1);
        }
        var values=obj.value.replace(/(.)(?=[^$])/g,"$1,").split(","); 
        for(var c=0;c<values.length;c++){
            var idReg=/^[0-9][0-9]*$/; 
             if (!idReg.test(values[c])&&values[c]!="."){
                obj.value=obj.value.substr(0,obj.value.length-1);
             }
             if(c>0&&values[0]==0&&values.indexOf(".") == -1){
                obj.value=obj.value.substr(0,0);
             }else if(values[0]==0&&values[1]==0){
                obj.value=obj.value.substr(0,0);
             }else if(values.indexOf(".") != -1 && values[0]=="."){
                obj.value="";
             }
        }
         if(obj.value>999999999.99){
            obj.value='';
        }
    }
    
        //日期比较
        function checkTwoDate( startDate,endDate ) {
        startDate = $.trim(startDate);
        endDate = $.trim(endDate);
        var now= new Date();
        var s=now;
        if(startDate<s){
            setDialog('温馨提示', '接货日期不能早于当前日期')
            // alert("密码错误","提示");
            return false;
        }
        if(endDate<s){
            setDialog('温馨提示', '到货日期不能小于当前日期!')
            // alert("密码错误");
            return false;
        }
        if( startDate > endDate ) {
            setDialog('温馨提示', '接货日期不能大于到货日期!')
            // alert("密码错误","提示");
            return false;
        }
        return true;
    } 
    
    
       var start = {
        elem: '#start', 
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: false,
        istoday: false,
        choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
       }

    };
      var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: false,
        istoday: false,
        choose: function(datas){
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }

    };
    laydate(start);
    laydate(end);
      function setDialog(title, info,fn) {
        document.getElementById('mydialogtitle').innerHTML = title;
        document.getElementById('mydialoginfo').innerHTML = info;

        $(".opacity-bg,.sure_box").show();
        $(".sure_box h3 b,.sure_box button").click(function(){
            $(".opacity-bg,.sure_box").hide();
        })
    }

    function showDialog() {
        
        light_box1 = " <div class=\"opacity-bg\" style=\" display:none;position: fixed;top: 0;left: 0;z-index: 999;width: 100%;height: 100%;background: #7c7c7c;opacity: .6;filter: alpha(opacity=60);\"></div><div class=\"sure_box\" style=\" display:none;width: 406px;height: 268px;border: 1px solid #cccccc;background: #ffffff;position: fixed;left: 50%;top: 50%;margin-left: -203px;margin-top: -134px;z-index: 10001;text-align: center;\"><h3 style=\" height: 49px;line-height: 50px;border-bottom: 1px solid #cccccc;padding-left: 15px;font-size: 18px;color: #585858;font-weight: normal;position: relative;text-align: left;\" ><span id=\"mydialogtitle\"></span><b style=\" width: 22px;height: 22px;display: block;background: url(http://192.168.2.50/statics/images/x.png) no-repeat;position: absolute;right: 15px;top: 17px;\"></b></h3><p style=\"text-align: center;padding-left: 40px;font-size: 20px;color: #575757;line-height: 142px;\"><img style=\" vertical-align: middle;margin-right: 20px;\" src=\"http://192.168.2.50/statics/images/lightbox.png\" alt=\"\"><span  id=\"mydialoginfo\" ></span></p><button class=\"confirm\" style=\"width: 118px;height: 29px;border: none;outline: none;cursor: pointer; color: #ffffff;background: url(http://192.168.2.50/statics/images/butn.png) no-repeat;\">确认</button></div>";
            $(".footer").after(light_box1);
    }
    </script>
</body>

</html>

    </#escape>
</#compress>