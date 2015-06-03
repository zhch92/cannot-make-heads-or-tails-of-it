 
/***************************提示框*********************/
var msgIndex = 0;
jQuery.extend(jQuery, {
		initMsg:function(){
			$("#msgTitle").html('系统提示');
			$("#msgContent").html('网络异常');
			$("#okBtnMsg").html('确定');
			$("#cancelBtnMsg").html('取消');
			$("#okBtnMsg").show();
			$("#cancelBtnMsg").show();
			$("#msgDivContent").css({"width":'405px'});
			$("#msgContent").css({"font-size":'20px'});
			$("#msgContent").css({"max-width":"360px"});
			$("#msgIcon").attr("class",'icon iconPts');//提示图标
			$("#msgIconDiv").css("display",'inline-block');
			$("#okBtnMsg").unbind();
			$("#cancelBtnMsg").unbind();
			$("msgCoreDiv").css({"margin-top":'50px'});
			$("#msgIcon").css({"vertical-align":"middle"});
		
		},
		//内部使用
		openMsg:function(){
			$("#msgDiv").attr("class","publicbox");
			return false;
		},
		//内部使用
		closeMsg:function(){
			$("#msgDiv").attr("class","publicbox none");
			return false;
		},
		
	    // UI alert弹出提示
		//okBtnText ：按钮文字
	    showMsgAlert: function (text, title,option) {
			if(msgIndex<=0){
				msgIndex = 0;
			}
			$.initMsg();

			$("#msgContent").html(text?text:'网络异常');
			$("#msgTitle").html(title?title:'系统提示');

			$("#cancelBtnMsg").hide();
			
			if(text.length>15){
				//$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgDivContent").css({"width":'400px'});
			}
			if(text.length>30){
				//$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgCoreDiv").css("margin-top",'30px');
			}
			if(option){
				if(option.okBtnText){
					$("#okBtnMsg").html(option.okBtnText);
				}
				if(option.icon){
					if(option.icon=='none'){
						$("#msgIconDiv").hide();
					}else{
						var iconClassStr = (option.icon)=='e' ? 'icon iconPcw'  : (option.icon=='w' ? 'icon iconPjg' : 'icon iconPts');
						$("#msgIcon").attr("class",iconClassStr);
						$("#msgIconDiv").show();
					}
				}
				if(option.width){
					$("#msgDivContent").css({"width":option.width});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.fontSize){
					$("#msgContent").css({"font-size":option.fontSize});
				}
				if(option.langText){
					$("#msgIcon").css({"vertical-align":"bottom"});
					$("#msgContent").css({"max-width":"295px"});
				}
				if(option.maxlength){
					$("#msgContent").css({"max-width":option.maxlength});
				}
			}
			
			
			$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
			$.openMsg();
			msgIndex++;
			return $("#okBtnMsg").click(function(){
					$.closeMsg();
				});
	    },

		//UI error alert弹出错误提示
		//okBtnText ：按钮文字
	    showErrorAlert: function (text, title,option) {
			$.initMsg();
			
			$("#msgContent").html(text?text:'网络异常');
			$("#msgTitle").html(title?title:'系统提示');

			$("#cancelBtnMsg").hide();
			$("#msgIcon").attr("class",'icon iconPcw');//错误图标
			

			if(text.length>25){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgDivContent").css({"width":'400px'});
			}
			if(text.length>50){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgCoreDiv").css("margin-top",'30px');
			}
			if(option){
				if(option.okBtnText){
					$("#okBtnMsg").html(option.okBtnText);
				}
				if(option.icon){
					if(option.icon=='none'){
						$("#msgIconDiv").hide();
					}else{
						var iconClassStr = (option.icon)=='e' ? 'icon iconPcw'  : (option.icon=='w' ? 'icon iconPjg' : 'icon iconPts');
						$("#msgIcon").attr("class",iconClassStr);
						$("#msgIconDiv").show();
					}
				}
				if(option.width){
					$("#msgDivContent").css({"width":option.width});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.fontSize){
					$("#msgContent").css({"font-size":option.fontSize});
				}
				if(option.langText){
					$("#msgIcon").css({"vertical-align":"bottom"});
					$("#msgContent").css({"max-width":"295px"});
				}
				if(option.maxlength){
					$("#msgContent").css({"max-width":option.maxlength});
				}
			}

			$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
			$.openMsg();
		
			return $("#okBtnMsg").click(function(){
					$.closeMsg();
				});
	    },
		//UI warning alert弹出错误提示
		//okBtnText ：按钮文字
	    showWarnAlert: function (text, title,option) {
			$.initMsg();
			
			$("#msgContent").html(text?text:'网络异常');
			$("#msgTitle").html(title?title:'系统提示');

			$("#cancelBtnMsg").hide();
			$("#msgIcon").attr("class",'icon iconPjg');//!警告图标
			
			if(text.length>25){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgDivContent").css({"width":'400px'});
			}
			if(text.length>50){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgCoreDiv").css("margin-top",'30px');
			}
			if(option){
				if(option.okBtnText){
					$("#okBtnMsg").html(option.okBtnText);
				}
				if(option.icon){
					if(option.icon=='none'){
						$("#msgIconDiv").hide();
					}else{
						var iconClassStr = (option.icon)=='e' ? 'icon iconPcw'  : (option.icon=='w' ? 'icon iconPjg' : 'icon iconPts');
						$("#msgIcon").attr("class",iconClassStr);
						$("#msgIconDiv").show();
					}
				}
				if(option.width){
					$("#msgDivContent").css({"width":option.width});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.fontSize){
					$("#msgContent").css({"font-size":option.fontSize});
				}
				if(option.langText){
					if(text.length>=15){
						$("#msgIcon").css({"vertical-align":"bottom"});
						$("#msgContent").css({"max-width":"295px"});
					}					
				}
				if(option.maxlength){
					$("#msgContent").css({"max-width":option.maxlength});
				}
			}
			
			$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
			$.openMsg();
		
			return $("#okBtnMsg").click(function(){
					$.closeMsg();
				});
	    },
		//UI error alert弹出错误提示
		//okBtnText ：按钮文字
	    showNonIconAlert: function (text, title,option) {
			$.initMsg();
			
			$("#msgContent").html(text?text:'网络异常');
			$("#msgTitle").html(title?title:'系统提示');

			$("#cancelBtnMsg").hide();
			$("#msgIconDiv").hide();//无图标


			if(text.length>25){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgDivContent").css({"width":'400px'});
			}
			if(text.length>50){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgCoreDiv").css("margin-top",'30px');
			}
			if(option){
				if(option.okBtnText){
					$("#okBtnMsg").html(option.okBtnText);
				}
				if(option.icon){
					if(option.icon=='none'){
						$("#msgIconDiv").hide();
					}else{
						var iconClassStr = (option.icon)=='e' ? 'icon iconPcw'  : (option.icon=='w' ? 'icon iconPjg' : 'icon iconPts');
						$("#msgIcon").attr("class",iconClassStr);
						$("#msgIconDiv").show();
					}
				}
				if(option.width){
					$("#msgDivContent").css({"width":option.width});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.fontSize){
					$("#msgContent").css({"font-size":option.fontSize});
				}
				if(option.langText){
					$("#msgIcon").css({"vertical-align":"bottom"});
					$("#msgContent").css({"max-width":"295px"});
				}
				if(option.maxlength){
					$("#msgContent").css({"max-width":option.maxlength});
				}
			}

			$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
			$.openMsg();
		
			return $("#okBtnMsg").click(function(){
					$.closeMsg();
				});
	    },
	    // UI alert,一定间隔之后自动关闭
		//okBtnText ：按钮文字,cancelBtnText
	    showTimerAlert: function (text, title, timerMax,callbackfn,option) {
			$.initMsg();
			
			$("#msgContent").html(text?text:'网络异常');
			$("#msgTitle").html(title?title:'系统提示');
			$("#cancelBtnMsg").hide();

			if(text.length>25){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgDivContent").css({"width":'400px'});
			}
			if(text.length>50){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgCoreDiv").css("margin-top",'30px');
			}
			if(option){
				if(option.okBtnText){
					$("#okBtnMsg").html(option.okBtnText);
				}
				if(option.cancelBtnText){
					$("#cancelBtnMsg").html(option.cancelBtnText);
				}
				if(option.icon){
					if(option.icon=='none'){
						$("#msgIconDiv").hide();
					}else{
						var iconClassStr = (option.icon)=='e' ? 'icon iconPcw'  : (option.icon=='w' ? 'icon iconPjg' : 'icon iconPts');
						$("#msgIcon").attr("class",iconClassStr);
						$("#msgIconDiv").show();
					}
				}
				if(option.width){
					$("#msgDivContent").css({"width":option.width});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.fontSize){
					$("#msgContent").css({"font-size":option.fontSize});
				}
				if(option.cancelBtnDisplay && option.cancelBtnDisplay=='none'){
					$("#cancelBtnMsg").hide();
				}
				if(option.langText){
					$("#msgIcon").css({"vertical-align":"bottom"});
					$("#msgContent").css({"max-width":"295px"});
				}
				if(option.maxlength){
					$("#msgContent").css({"max-width":option.maxlength});
				}
			}

			if(text.length>25){
				$("#msgIconDiv").hide();
				$("#msgContent").css({'font-size':'16px'});
				$("#msgContent").attr({'class':'ft16'});
				$("#msgDivContent").css({"width":'400px'});
			}
			$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
			$.openMsg();
			timerMax = timerMax ? timerMax : 1000;
			window.setTimeout(function () {
	                    if (timerMax >= 500) {
	                        $.closeMsg();
	                        callbackfn && callbackfn.call();
	                    }
	                }, timerMax);
	    },
	 
	    // jQuery UI confirm弹出确认提示
	    showConfirm: function (text, title, okCallbackFn, cancelCallbackFn,fnData,option) {
			$.initMsg();
			
			$("#msgContent").html(text?text:'网络异常');
			$("#msgTitle").html(title?title:'系统提示');

			if(text.length>25){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgDivContent").css({"width":'400px'});
			}
			if(text.length>50){
				$("#msgIconDiv").hide();
				$("#msgContent").attr({'class':'ft16'});
				$("#msgCoreDiv").css("margin-top",'30px');
			}
			if(option){
				if(option.okBtnText){
					$("#okBtnMsg").html(option.okBtnText);
				}
				if(option.cancelBtnText){
					$("#cancelBtnMsg").html(option.cancelBtnText);
				}
				if(option.icon){
					if(option.icon=='none'){
						$("#msgIconDiv").hide();
					}else{
						var iconClassStr = (option.icon)=='e' ? 'icon iconPcw'  : (option.icon=='w' ? 'icon iconPjg' : 'icon iconPts');
						$("#msgIcon").attr("class",iconClassStr);
						$("#msgIconDiv").show();
					}
				}
				if(option.width){
					$("#msgDivContent").css({"width":option.width});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.fontSize){
					$("#msgContent").css({"font-size":option.fontSize});
				}
				if(option.cancelBtnDisplay && option.cancelBtnDisplay=='none'){
					$("#cancelBtnMsg").hide();
				}
				if(option.langText){
					$("#msgIcon").css({"vertical-align":"bottom"});
					$("#msgContent").css({"max-width":"295px"});
				}
				if(option.maxlength){
					$("#msgContent").css({"max-width":option.maxlength});
				}
			}

			
			$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
			$("#okBtnMsg").addClass("msgbtnclass");
			$("#cancelBtnMsg").addClass("msgbtnclass");
			$(".msgbtnclass").unbind();
			$.openMsg();
	        return $(".msgbtnclass").click(function(){
					$.closeMsg();
					if($(this).attr('id')=="okBtnMsg"){
						okCallbackFn && okCallbackFn(fnData);
					}else{
						cancelCallbackFn && cancelCallbackFn(fnData);
					}
					$(".msgbtnclass").unbind();
					$("#okBtnMsg").removeClass("msgbtnclass");
					$("#cancelBtnMsg").removeClass("msgbtnclass");
					return false;
				});
	    },
		// jQuery UI confirm弹出确认提示，函数自带参数
	    showFnDataConfirm: function (text, title, okCallbackFn, cancelCallbackFn,option) {
			$.initMsg();
			
			$("#msgContent").html(text?text:'网络异常');
			$("#msgTitle").html(title?title:'系统提示');

			if(option){
				if(option.okBtnText){
					$("#okBtnMsg").html(option.okBtnText);
				}
				if(option.cancelBtnText){
					$("#cancelBtnMsg").html(option.cancelBtnText);
				}
				if(option.icon){
					if(option.icon=='none'){
						$("#msgIconDiv").hide();
					}else{
						var iconClassStr = (option.icon)=='e' ? 'icon iconPcw'  : (option.icon=='w' ? 'icon iconPjg' : 'icon iconPts');
						$("#msgIcon").attr("class",iconClassStr);
						$("#msgIconDiv").show();
					}
				}
				if(option.width){
					$("#msgDivContent").css({"width":option.width});
				}
				if(option.height){
					$("#msgDivContent").css({"height":option.height});
				}
				if(option.fontSize){
					$("#msgContent").css({"font-size":option.fontSize});
				}
				if(option.cancelBtnDisplay && option.cancelBtnDisplay=='none'){
					$("#cancelBtnMsg").hide();
				}
				if(option.langText){
					$("#msgIcon").css({"vertical-align":"bottom"});
					$("#msgContent").css({"max-width":"295px"});
				}
				if(option.maxlength){
					$("#msgContent").css({"max-width":option.maxlength});
				}
			}

			if(text.length>25){
				$("#msgIconDiv").hide();
				$("#msgContent").css({'font-size':'16px'});
				$("#msgContent").attr({'class':'ft16'});
				$("#msgDivContent").css({"width":'400px'});
			}
			$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
			$("#okBtnMsg").addClass("msgbtnclass");
			$("#cancelBtnMsg").addClass("msgbtnclass");
			$(".msgbtnclass").unbind();
			$.openMsg();
	        return $(".msgbtnclass").click(function(){
					$.closeMsg();
					if($(this).attr('id')=="okBtnMsg"){
						okCallbackFn && okCallbackFn(opts);
					}else{
						cancelCallbackFn && cancelCallbackFn(opts);
					}
					$(".msgbtnclass").unbind();
					$("#okBtnMsg").removeClass("msgbtnclass");
					$("#cancelBtnMsg").removeClass("msgbtnclass");
					return false;
				});
	    }
	});
window.alert= $.showMsgAlert;
//提示框使用:(图标：默认提示,icon:'w'警告，icon:'e'错误);
//提示内容有数字的样式包装<span class="num">45.88</span>
//$.showMsgAlert('执行成功',"xx提示",{okBtnText:'ok',icon:'w',width:800,fontSize:18});
//$.showErrorAlert('执行成功',"提示");
//$.showNonIconAlert('执行成功',"提示");
//$.showBigLengthAlert('内容','标题');

//$.showTimerAlert('执行成功',"提示",1000);
//$.showConfirm('执行成功',"提示",okCallbackFn, cancelCallbackFn,fnData,option);
//$.showFnDataConfirm('执行成功',"提示",okCallbackFn(data), cancelCallbackFn(data),option);