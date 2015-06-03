<#compress >
    <#escape x as x?html>
﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>货管家</title>

<link href="http://192.168.2.50/static/css/common.css" rel="stylesheet" media="screen" type="text/css">
<link href="http://192.168.2.50/static/css/common.css" rel="stylesheet" media="screen" type="text/css">
<link href="http://192.168.2.50/static/css/style.css" rel="stylesheet" media="screen" type="text/css">
<link href="http://192.168.2.50/static/css/bootstrap.min.css" rel="stylesheet" media="screen" type="text/css">
<link href="http://192.168.2.50/static/css/jock-citypicker-2.0.min.css" rel="stylesheet" media="screen" type="text/css">
<link href="http://192.168.2.50/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="http://192.168.2.50/static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://192.168.2.50/static/js/jquery-xzqh.js"></script>
<script type="text/javascript" src="http://192.168.2.50/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://192.168.2.50/static/js/bootstrap-datetimepicker.js"></script>
<style type="text/css">
body{ font-size:14px;}
input{ vertical-align:middle; margin:0; padding:0}
.file-box{ position:relative;width:340px}
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px }
</style>
<!--[if IE 6]>
<script type="text/javascript" src="http://192.168.2.50/static/js/DD_belatedPNG_0.0.8a.js"></script>
<script>
DD_belatedPNG.fix('.icon,.login_ttmr div.login_tisImg,.reg_titleBg,.search_box_hd');
</script>
<![endif]-->
</head>
<body>

<div class="wh">
	<div class="wh_mar hd">
	<!------------ head start ------------>
		<#include "common/head.ftl"/>
	<!------------ head end ------------>
		<div class="wh mt20">
			<#include "common/driverNavigationMenu.ftl"/>
			<!------------ 个人中心内容详情 start ------------>
			<div class="user_rightBox fr zcInptS1">
				<div class="user_order_title mt12 wh">
					<a href="javascript:void(0)" id="displayApkUpload" class="order_search">上传apk</a>
					<a href="javascript:void(0)" id="lastApkDownload" class="order_search">下载</a>
				</div>
				<div id="msgDiv" class="order_content wh ${msg!"none"}">
					<font color="red">${msg!""}</font>
				</div>
				<div id="apkUploadDiv" class="order_content none">
					<div class="wh">
						<div class="order_account"><div><span>基本信息</span></div></div>
						<div class="order_contentmr">
							<div class="wh">
								
								<ul class="orderList">
									<li class="account bdnone">
										<div class="account_user account_width">
											<form id="uploadForm" action="/sysapk/apkUpload.htm" method="post" enctype="multipart/form-data" >
												<input id="sessionsubmit" type="hidden" value="" />
												<div class="cx">强制更新：
													&nbsp;
													<input type = "radio" name="isforce" value="1" checked />是
													&nbsp;&nbsp;&nbsp;
													<input type = "radio" name="isforce" value="2"/>否
												</div>
												<div class="pd">版本：<input type ="text" name="version"  class='txt' />
												<div class="pd file-box">
														上传 :&nbsp;
													 	<input type='text' name='txtApkfile' id='textfield' class='txt' />  
													 	<input type='button' value='浏览...' />
													    <input type="file" name="apkfile" class="file" id="fileField" size="28" onchange="document.getElementById('textfield').value=this.value" />
													 	
												</div>
												
												
												<div class="cx">
													<input id="submitBtn" type="button" name="button" class="btn" value="上传" />
													<!--<input id="submitUpdateBtn" type="button" name="button" class="btn" value="更新" />-->
													<input type="button" id="cancelUpload" name="cancel" class="btn" value="取消" />
												</div>
											</form>
										</div>
										
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="apkListDiv" class="wh mt20">
					<ul class="fl news_list" id="news_list">
						
						<li class="first">
						<a href="javascript:void(0)">
							<font style="width:75px">日期</font><!-- <font class="name">成乌鲁木齐成乌鲁木齐</font> -->
							<font style="padding-left: 25px;width:65px;">版本</font>
							<font style="width:365px;">路径</font>
							<font style="width:90px;">下载</font>
							<font>强制更新 </font>
						</a>
						</li>
						
						<#list apks as apk>
		                	<li>
		                	<a href="javascript:void(0)">
		                		<font style="padding-left: 25px;width:85px">${apk.operateTime}</font><!-- <font class="name">成乌鲁木齐成乌鲁木齐</font> -->
		                		<font style="padding-left: 15px;width:60px;">${apk.fileVersion}</font>
		                		<font style="width:370px;">${apk.realPath}</font>
		                		<font style="width:90px;">${apk.num}</span></font>
								<font>${(apk.isforce==1)?string("是","否")} </font>
		                	</a>
		                	</li>
		                	
		                	
		                </#list>
		                
					</ul>
				</div>
			</div>
			<!------------ 个人中心内容详情 end ------------>
		</div>
	</div>
</div>
<!------------ footer start ------------>
<#include "common/foot.ftl"/>
<!------------ footer end ------------>

<script type="text/javascript">

</script>
<script type="text/javascript">

 $(document).ready(function(){
 	$("#sessionsubmit").val("");
 	
 	
	$('#displayApkUpload').click(function(){
		$("#apkUploadDiv").attr("class","order_content");
	});
	$('#lastApkDownload').click(function(){
		window.location.href="/apkdown.htm";
	});
	
	setTimeout(noneMsgDiv,3000);
	
	
	$('#submitBtn').click(function(){
		if(!$("#sessionsubmit").val()){
			$("#sessionsubmit").val("submited");
			$("#uploadForm").submit();
		}else{
			$.showMsgAlert("已提交!正在处理..");
		}
	});
	$('#submitUpdateBtn').click(function(){
		if(!$("#sessionsubmit").val()){
			$("#sessionsubmit").val("submited");
			$("#uploadForm").attr("action","/sysapk/apkUploadUpdate.htm").submit();
		}else{
			$.showMsgAlert("已提交!正在处理..");
		}
	});
	$('#cancelUpload').click(function(){
		$("#apkUploadDiv").attr("class","order_content none");
	});
	
	
	
 });
 function noneMsgDiv(){
 	$("#msgDiv").hide(800);
 }
</script>

				
</body>
</html>

    </#escape>
</#compress>