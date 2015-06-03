<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>货管家</title>
    <link rel="stylesheet" href="http://127.0.0.1:8080/statics/css/reset.css">
    <link rel="stylesheet" href="http://127.0.0.1:8080/statics/css/style.css">
    <script type="text/javascript"  src="http://127.0.0.1:8080/static/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="http://127.0.0.1:8080/statics/js/laydate.js"></script>
</head>
<body>
    <div class="header">
        <div class="head clearfix">
            <div class="tel">
                欢迎您！客服电话： 400-600-6666
            </div>
            <ul>
                <li class="user">您好！<a href="#"><span>成都星期五科技有限公司</span></a></li>
                <li class="login"><a class="active" href="#">登陆</a> &nbsp|&nbsp <a class="active" href="#">注册</a> </li>
                <li class="test"><a class="active" href="#">马上免费调车</a></li>
            </ul>
        </div>
    </div>
    <div class="arrived">
        <div class="arrive clearfix">
            <div class="logo">
                <a href="#"><img src="http://127.0.0.1:8080/statics/images/logo.png" alt=""></a>
            </div>
            <div class="site">
                <table>
                    <thead>
                        <tr>
                            <td width="41">出发</td>
                            <td width="123">
                             <select>
                             <option value="510100">四川</option>
                             </select>
                             </td>
                            <td width="135">
                                 <select id="outhead">
                             <option value="510100">成都</option>
                             </select>
                                </td>
                            <td>
                                <input class="inline laydate-icon" id="start"    type="text" value="2015-04-29"><i></i></td>
                        </tr>
                        <tr>
                            <td width="41">到达</td>
                            <td width="123">
                                <select>
                             <option value="310000">上海</option>
                             </select>
                             </td>
                            <td width="135">
                             <td width="135">
                                 <select id="arrivehead">
                             <option value="310000">上海市</option>
                             </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td width="41">运量</td>
                            <td width="123">
                                <input type="text" id="weighthead" value="0">
                            </td>
                            <td width="135">
                                <select id="weightheadtype">
                                    <option value="2">吨</option>
                                    <option value="1">立方</option>
                                </select><!-- <b class="b_2"></b> --></td>
                            <td>
                                <input class="btn" type="button" onClick="searchhead();"  value="搜 索">
                            </td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    <script>
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2099-06-16', 
    istime: true,
    istoday: false,

};
laydate(start);

    </script>
    <div class="screen_b">
        <div class="screen">
            <h3>快速筛选</h3>
            <div class="screen_item clearfix">
                <dl>
                    <dt><b class="b_1">	</b>目的地</dt>
                    <dd>
                        <a class="tap" href="javascript:;" onClick="searcharrivecity(this,'0');return false;">不限</a>
                        <a href="javascript:;" onClick="searcharrivecity(this,'510100');return false;">成都</a>
                        <a href="javascript:;" onClick="searcharrivecity(this,'330100');return false;">杭州</a>
                        <a href="javascript:;" onClick="searcharrivecity(this,'310000');return false;">上海</a></dd>
                </dl>
                <dl>
                    <dt><b class="b_2">	</b>车型</dt>
                    <dd>
                        <a class="tap" href="javascript:;" onClick="searchcarlen(this,'0');return false;">不限车长</a>
                        <a href="javascript:;" onClick="searchcarlen(this,'1');return false;">9.6米</a>
                        <a href="javascript:;" onClick="searchcarlen(this,'3');return false;">13米</a>
                        <a href="javascript:;" onClick="searchcarlen(this,'4');return false;">17.5米</a>
                        <a href="javascript:;" onClick="searchcarlen(this,'-1');return false;">其它</a>
                    </dd>
                    <dd>
                        <a class="tap"  href="javascript:;" onClick="searchcarstyle(this,'0');return false;">不限车型</a>
                        <a  href="javascript:;" onClick="searchcarstyle(this,'7');return false;">箱式</a>
                        <a  href="javascript:;" onClick="searchcarstyle(this,'11');return false;">高栏</a>
                        <a  href="javascript:;" onClick="searchcarstyle(this,'1');return false;">平板</a>
                        <a  href="javascript:;" onClick="searchcarstyle(this,'-1');return false;">其它</a>
                    </dd>
                </dl>
                <dl>
                    <dt><b class="b_3">	</b>运量</dt>
                    <dd>
                        <a class="tap" href="javascript:;" onClick="searchcarweight(this,'0');return false;">不限</a> 
                        <a href="javascript:;" onClick="searchcarweight(this,'10');return false;">10吨以下</a>
                        <a href="javascript:;" onClick="searchcarweight(this,'10-20');return false;">10-20吨</a>
                        <a href="javascript:;" onClick="searchcarweight(this,'20-999999');return false;">20吨以上</a>
                    </dd>
                    <dd>
                        <a class="tap" href="javascript:;" onClick="searchcarsquare(this,'0');return false;">不限</a> 
                        <a href="javascript:;" onClick="searchcarsquare(this,'10-30');return false;">10-30立方</a>
                        <a href="javascript:;" onClick="searchcarsquare(this,'30-80');return false;">30-80立方</a>
                        <a href="javascript:;" onClick="searchcarsquare(this,'80-999999');return false;">80立方以上</a>
                    </dd>
                </dl>
                <dl class="dl_r">
                    <dt><b class="b_4">	</b>其他</dt>
                    <dd>
                        <input type="checkbox">装货可靠&nbsp&nbsp
                        <input type="checkbox">结款准时 </dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="main_b">
        <div class="main">
            <h3><a class="mr active" href="#">推荐货源</a><a href="#">最新货源</a></h3>
            <div id="content">
          </div>
            <div class="page" id="pagebar">
                <ul>
                	<li class="home"><a href="javascript:;" onClick="pagechange(this,'0','-4');return false;"></a></li>
                	<li class="pgup"><a href="javascript:;" onClick="pagechange(this,'-1','-1');return false;"></a></li>
                	<li class="active"><a href="javascript:;" onClick="pagechange(this,'0','0');return false;">1</a></li>
                	<li><a href="javascript:;" onClick="pagechange(this,'1','1');return false;">2</a></li>
                	<li><a href="javascript:;" onClick="pagechange(this,'2','2');return false;">3</a></li>
                	<li><a href="javascript:;" onClick="pagechange(this,'3','3');return false;">4</a></li>
                	<li class="excessive"></li>
                	<li><a href="javascript:;" onClick="pagechange(this,'9','4');return false;">10</a></li>
                	<li class="end" ><a href="javascript:;" onClick="pagechange(this,'-2','-2');return false;"></a></li>
                	<li class="pgdn"><a  href="javascript:;" onClick="pagechange(this,'-3','-3');return false;"></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://127.0.0.1:8080/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 川B2-140912-1</p>
        </div>
    </div>
    <script type="text/javascript">		
      var outstr=0;
      var arrivestr=0;
      var whichstr=0;
      var whichNostr=0;
      var charlengthstr=0;
      var cartypestr=0;
      var orderstr=0;
      var attributestr=0;
      var sendtimestr=0;
      var chargeModestr=0;
      var pagevar=0;
      var sizeval=-6;
     
      $(document).ready(function () {
      getCargo();
      $(".screen_item dd a").click(function() {
          $(this).addClass("chose").siblings().removeClass("chose");
      })
      });
      //首页搜索
      function searchhead(){//outhead"start"arrivehead  weighthead
    	  outstr=$("#outhead").val()!=""?$("#outhead").val():0;
     	  arrivestr=$("#arrivehead").val()!=""?$("#arrivehead").val():0;
     	  sendtimestr=$("#start").val()!=""?$("#start").val():0;
     	whichNostr=$("#weighthead").val()!=""?$("#weighthead").val():0;
     	whichstr=$("#weightheadtype").val()!=""?$("#weightheadtype").val():0;
     	alert($("#weighthead").val()!="");
     	getCargo();
      }
      
      //get货物
      function getCargo(){
    	  var paras= {go:outstr, to:arrivestr, which:whichstr, whichNo:whichNostr, carlength:charlengthstr, cartype:cartypestr,
    			      order:orderstr, attribute:attributestr,sendTime:sendtimestr,chargeMode:chargeModestr,page:pagevar};
    	  $.ajax({
              type: "POST",
              url: "/ajax/cagolist.htm",
              timeout: 20000,
              error: function(){alert('系统繁忙,请稍后重试!');},
              data:paras,
              datatype:"json",
              success: function(msg)
              {
            	  var obj=eval('('+msg+')'); 
            	  getCargoList(obj.data);
            	  getPageList(obj.msg);
              }
              });
      }
      //货物单
      function getCargoList(obj) {
          if (obj) {
             $('#content').empty();
              if (obj.length > 0) {
            	  var addhtml="";
                  for (var i = 0; i < obj.length; i++) {
                     var cargo = obj[i];
                     var citystr=cargo.cityStr.substr(0,5);
                     var arrivalcitystr=cargo.arrivalCityStr.substr(0,5);
                     var countrystr=cargo.countyStr.substr(0,7);
                     var arrivalcountrystr=cargo.arrivalCountyStr.substr(0,7);
                     var sendtime=cargo.sendTimeStr;
                     var arrivaltime=cargo.arrivalTimeStr;
                     var contentvar="<div class=\"table clearfix\"><table><tr><td  class=\"title\">"+citystr+"</td>"
               	  +"<td width=\"55\"><img src=\"http://127.0.0.1:8080/statics/images/r1.png\" alt=\"\"></td><td  class=\"title\">"+arrivalcitystr+"</td></tr><tr>"
               	  +"<td>"+countrystr+"</td><td></td><td>"+arrivalcountrystr+"</td></tr><tr><td>"+sendtime+"</td><td></td><td>"+arrivaltime+"</td></tr></table>"
               	  +"<div class=\"rside\"><p class=\"price\">RMB&nbsp;&nbsp;"+(cargo.quote/100)+"/<b>"+cargo.quoteCompanyStr+"</b></p><p class=\"introduce\">"
               	  +(cargo.cargoName?(cargo.cargoName).substr(0,2):"&nbsp;")+"/"+cargo.weight+"吨/"+cargo.square+"立方</p>"
               	  +"<a id='bt_"+cargo.id +"'href='javascript:void(0);' href='javascript:void(0);return false;'>申   请</a></div>"
               	  +"</div><div class=\"text\"><p>车型要求："+ ((cargo.carTypeStr=='不限车型'&&cargo.carLengthStr=='不限')?'不限车型&nbsp;不限车长': (cargo.carTypeStr+' '+(cargo.carLengthStr=='不限'?'不限车长':(cargo.carLengthStr+'米')))) 
               	  + "</p><p>发货32笔 装货率93% 结款率78%</p></div></li>";
                  //   alert(chk(i)+cargo.cargoName);
                      if(chk(i)==="1"){
                    	  if(i+2< obj.length==false){
                    		  addhtml+="<ul class=\"floor clearfix\" style=\"border-bottom:none;\"><li class=\"padd_r\">"+contentvar;
                    	  }else{
                    		  addhtml+="<ul class=\"floor clearfix\"><li class=\"padd_r\">"+contentvar; 
                    	  }
                      }else if(chk(i)==="2"){
                    	  addhtml+="<li class=\"padd_l\">"+contentvar+"</ul>";
                      }
                      if(i+1< obj.length==false && chk(i)==="1"){
                    	  addhtml+="</ul>";
                      }
                  	}
                  $("#content").append(addhtml);
              } else {
                  //todo 没数据
              }
          } else {
              //todo 没数据
          }
      }
      //奇偶结果
      function chk(num){ 
    	  return num?num%2?"2":"1":"1" 
    	} 
      //车长选择
     function searchcarlen(obj,val){
    	  sizeval=0;
    	 charlengthstr=val;
    	 getCargo();
      }
      //车型选择
     function searchcarstyle(obj,val){
    	  sizeval=0;
    	 cartypestr=val;
         getCargo();
      }
      //选择载重量
     function searchcarweight(obj,val){
    	  sizeval=0;
    	 whichstr="2";
    	 whichNostr=val;
         getCargo();
      } 
     //选择方量
     function searchcarsquare(obj,val){
    	  sizeval=0;
    	 whichstr="1";
    	 whichNostr=val;
         getCargo();
      } 
     //选择城市
     function searcharrivecity(obj,val){
    	  sizeval=0;
    	 arrivestr=val;
         getCargo();
     }
     //翻页
     function pagechange(obj,val,sizevals){
    	 pagevar=val;
    	 sizeval=sizevals;
         getCargo();
     }
     //pagediv
     function getPageList(pagesizemy){
    	 $('#pagebar').empty();
    	 //-4:首页;-1:上一页；-2：下一页；-3：尾页
    	 var addhtmlpage="";
    	 var pagevarInt=Number(pagevar);
    	 if(pagesizemy>5){
    	  // if(sizeval==-1){}else 
    		/*if(sizeval==3){//准备换页数字
    			 if()
    		 }else if(sizeval==4){//省略号后面的..
    			 
    		 }*/
    		 if(pagevarInt!=1){
     		    addhtmlpage+="<ul><li class=\"home p_active\"><a href=\"javascript:;\" ></a></li><li class=\"pgup p_active\"><a href=\"javascript:;\" ></a></li>";//黑色todo:还未做
     			}else{
     		    addhtmlpage+="<ul><li class=\"home\"><a href=\"javascript:;\" ></a></li><li class=\"pgup\"><a href=\"javascript:;\" ></a></li>";//不是黑色	
     			}

    		 if(pagevarInt>=3 && (pagevarInt+2)<pagesizemy){
    			//中部
    			for (var i = 0; i <5; i++) {
    				 if(i==0){
    					  addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-2)+"\',\'"+(pagevarInt-2)+"\');return false;\">"+(pagevarInt-1)+"</a></li>";   
    				 }else if(i==1){
    						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-1)+"\',\'"+(pagevarInt-1)+"\');return false;\">"+(pagevarInt)+"</a></li>";  
    				 }else if(i==2){
    						 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+pagevarInt+"\',\'"+pagevarInt+"\');return false;\">"+(pagevarInt+1)+"</a></li>";  
    				 }else if(i==3){
    						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+1)+"\',\'"+(pagevarInt+1)+"\');return false;\">"+(pagevarInt+2)
    						      +"</a></li><li class=\"excessive\"></li>";
    				 }else{
    					 if(pagesizemy>pagevarInt+7){
    						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+6)+"\',\'"+(pagevarInt+6)+"\');return false;\">"+(pagevarInt+7)+"</a></li>";  
    					 }else{
    						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(Number(pagesizemy)-1)+"\',\'"+(Number(pagesizemy)-1)+"\');return false;\">"+pagesizemy+"</a></li>"; 
    					 }
    				 }
    			}
    			}else if(pagevarInt<3){
    				for (var i = 0; i <5; i++) {
    					 if(i==4){
    						 if(pagesizemy>10){
        						 addhtmlpage+="<li class=\"excessive\"></li><li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+10+"\',\'"+10+"\');return false;\">"+10+"</a></li>";  
        					 }else{
        						 addhtmlpage+="<li class=\"excessive\"></li><li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+pagesizemy+"\',\'"+pagesizemy+"\');return false;\">"+pagesizemy+"</a></li>"; 
        					 } 
    					 }else{
    					 if(i==sizeval || sizeval==-6){
    	    				 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>"; 
    	    				 sizeval=-1;
    	    			 }else{
    	    				 addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>";
    	    			 }
    					 }
       			}
    			}else{//尾页
    				addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-6)+"\',\'"+(pagevarInt-6)+"\');return false;\">"+(pagevarInt-7)+"</a></li>"+"<li class=\"excessive\"></li>"; 	
    				addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-4)+"\',\'"+(pagesizemy-4)+"\');return false;\">"+(pagesizemy-3)+"</a></li>"; 	
    				addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-3)+"\',\'"+(pagesizemy-3)+"\');return false;\">"+(pagesizemy-2)+"</a></li>"; 	
    			    if((pagevarInt+1)==Number(pagesizemy)){
    			    	addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-2)+"\',\'"+(pagesizemy-2)+"\');return false;\">"+(pagesizemy-1)+"</a></li>";
    			    	addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+pagevarInt+"\',\'"+pagevarInt+"\');return false;\">"+pagesizemy+"</a></li>"; 	
    			    }else{
    			    	addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-2)+"\',\'"+(pagesizemy-2)+"\');return false;\">"+(pagesizemy-1)+"</a></li>";
    			    	addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">"+pagesizemy+"</a></li>"; 	
    			    }
    			}
    		 if(pagesizemy!=1){
				 addhtmlpage+="<li class=\"end p_active\" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn p_active\"><a  href=\"javascript:;\"></a></li></ul>";//黑色todo:还未做
    			}else{
    		     addhtmlpage+="<li class=\"end\" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn\"><a  href=\"javascript:;\"></a></li></ul>";//不是黑色	
    			}
    	 }else{//少于5页
    		 addhtmlpage+="<ul><li class=\"home\"><a href=\"javascript:;\" ></a></li><li class=\"pgup\"><a href=\"javascript:;\" ></a></li>";
    		 for (var i = 0; i < pagesizemy; i++) {
    			 if(i==sizeval || sizeval==-6){
    				 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>"; 
    				 sizeval=-1;
    			 }else{
    				 addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>";
    			 }
			}
    		 addhtmlpage+="<li class=\"end\" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn\"><a  href=\"javascript:;\"></a></li></ul>";
    	 }
    	 $("#pagebar").append(addhtmlpage);
    	 
     }
     
     
      
</script>
    
</body>
</html>


</#escape> </#compress>
