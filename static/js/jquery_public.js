$(function(){
	
	
	$(window).scroll(function(){citeBoxStyle()});
	if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style){
		$(window).resize(function(){citeBoxStyle(),jquery_public1()}); 
		setTimeout("citeBoxStyle(),jquery_public1()");
		$(window).scroll(function(){citeBoxStyle(),jquery_public1()});
	}else{
		$(window).resize(function(){citeBoxStyle(),jquery_public()}); 
		setTimeout("citeBoxStyle(),jquery_public()");
		$(window).scroll(function(){citeBoxStyle(),jquery_public3()});
	};
	
	var topI=370;
	var topp=-50;
	var topp1=1000;
	var topTime=800;
	$("#news_list li,#orderpull").each(function(){
		$(this).hover(function(){
			$(this).addClass("select");
		},function(){
			$(this).removeClass("select");
		});
	});
	
	$("#news_list li:even").addClass("even");
	$(".carrL .carrnum:even").addClass("even");
	$(".starttm div:odd").addClass("odd");
	$(".informaList li:odd").addClass("odd");
	
	$(".select_jiage").hover(function(){
		$(this).addClass("select1");
		$(".select_jiage font").show();
	},function(){
		$(".select_jiage font").hide();
		$(this).removeClass("select1");
	});
	
	$("#tab_div div:eq(1)").hide();
	$("#Tabdiv font").each(function(i){
		$(this).click(function(){
			$(this).addClass("select").siblings().removeClass("select");
			$("#tab_div div:eq("+i+")").show().siblings().hide();
		});
	});
	
	$(".loginTb1 .loginTb:eq(1),.bannerBox .login_tis1:eq(1)").hide();
	$(".loginTbbox a").each(function(i){
		$(this).click(function(){
			$(this).addClass("select").siblings().removeClass("select");
			$(".loginTb1 .loginTb:eq("+i+")").show().siblings().hide();
			$(".bannerBox .login_tis1:eq("+i+")").show().siblings().hide();
		});
	});
	
	
	$(".divTab1 a").each(function(i){
		$(this).click(function(){
			$(this).addClass("select").siblings().removeClass("select");
			$(".rechcurrent .rechTab:eq("+i+")").removeClass("none").siblings().addClass("none");
		});
	});
	
	
	
	$(".loginTb1_1 .loginTb_1:eq(1)").hide();
	$(".loginTbbox_1 a").each(function(i){
		$(this).click(function(){
			$(this).addClass("select").siblings().removeClass("select");
			$(".loginTb1_1 .loginTb_1:eq("+i+")").show().siblings().hide();
		});
	});
	
	/*----------- 首页list start ------------*/
	$("#container .pub_list").live("mouseover",function(){
      	$(this).css({"border-top":"5px solid #FF8600"});
	}).live("mouseout",function(){
		$(this).css({"border-top":"5px solid #359adb"});
	});
	/*----------- 首页list end ------------*/
	/*----------- 点击切换Html start ------------*/
	$("#bankList a").each(function(){
		$(this).click(function(){
			$("#gradeList").html($(this).html());
		});
	});
	$("#bankList1 a").each(function(){
		$(this).click(function(){
			$("#gradeList1").html($(this).html());
		});
	});
	$("#bankList2 a").each(function(){
		$(this).click(function(){
			$("#gradeList2").html($(this).html());
		});
	});
	$("#bankList3 a").each(function(){
		$(this).click(function(){
			$("#gradeList3").html($(this).html());
		});
	});
	
	
	
	/*----------- 焦点 start ------------*/
	var inputClass=$(".zcInptS");
	var msgClass=$(".zcInptS");
	inputClass.each(function(i){
	   $(this).find("input").focus(function(){
		msgClass.eq(i).addClass("inptS"); 
	   }).focusout(function(){
		msgClass.eq(i).removeClass("inptS");
	   });   
	}); 
	
	
	var inputClass1=$(".zcInptS1");
	var msgClass1=$(".zcInptS1");
	inputClass1.each(function(i){
	   $(this).find("input,textarea").focus(function(){
		$(this).addClass("inptS1"); 
	   }).focusout(function(){
		$(this).removeClass("inptS1");
	   });   
	}); 
	
	
	$(".user_rightBox .order_content").each(function(){
		$(this).hover(function(){
			$(this).addClass("order_contenthv"); 
		},function(){
			$(this).removeClass("order_contenthv");
		});
	});
	
	/*----------- 焦点 end ------------*/
	
	
	/*----------- 弹出层 start ------------*/
	$(".divBoxButton").each(function(i){
		$(this).click(function(){
			$("#divBox").show();
			$("html").addClass("hd");
			$("#divBox .divBoxText:eq("+i+")").show().siblings().hide();
		});
	});
	
	$(".topBoxbanner").click(function(){
		$(".divBoxb1").show();
	});
	
	$(".deabxboxBt").each(function(){
		$(this).click(function(){
			$(".deabxbox").show();
			$("html").addClass("hd");
		});
	});
	/*9.29 add*/
	$(".xgButtonBoxBt").each(function(){
		$(this).click(function(){
			$(".xgButtonBox").show();
			$("html").addClass("hd");
		});
	});
	$(".xgButtonClose").each(function(){
		$(this).click(function(){
			$(".xgButtonBox").hide();
			$("html").removeClass("hd");
		});
	});
	
	$(".hyBoxBt").each(function(){
		$(this).click(function(){
			$(".divBoxb1").show();
			$("html").addClass("hd");
		});
	});
	$(".hyClose").each(function(){
		$(this).click(function(){
			$(".divBoxb1").hide();
			$("html").removeClass("hd");
		});
	});
	/*财务弹窗*/
	$(".fboxbt").each(function(){
		$(this).click(function(){
			$(".fbox").show();
			$("html").addClass("hd");
		});
	});
	$(".fboxclose").each(function(){
		$(this).click(function(){
			$(".fbox").hide();
			$("html").removeClass("hd");
		});
	});
	/*9.29 add all*/
	$(".deaClose,.deabxbg").each(function(){
		$(this).click(function(){
			$(".deabxbox").hide();
			$("html").removeClass("hd");
		});
	});
	
	
	$(".divBox_Button").click(function(){
		$(".divBox_Text1").show();
	});
	$(".divBoxTxtclose").click(function(){
		$(".divBox_Text1").hide();
	});
	
	
	$(".bsButton").click(function(){
		$(".bsButtonBox").show();
		$("html").addClass("hd");
	});
	$(".bsButtonClose,.bsButtonBg").click(function(){
		$(".bsButtonBox").hide();
		$("html").removeClass("hd");
	});
	
	
	
	
	$(".divBoxb1t1").click(function(){
		$(".divBoxb1").show();
		$("html").addClass("hd");
	});
	$(".divBoxb1t2").click(function(){
		$(".divBoxb2").show();
		$("html").addClass("hd");
	});
	$(".divBoxb1t3").click(function(){
		$(".divBoxb3").show();
		$("html").addClass("hd");
	});
	$(".divBoxb1t4").click(function(){
		$(".divBoxb4").show();
		$("html").addClass("hd");
	});
	$(".divBoxcl1,.divBoxcl2,.divBoxcl3,.divBoxcl4,.divBoxcl5").click(function(){
		$(".divBoxb1,.divBoxb2,.divBoxb3,.divBoxb4").hide();
		$("html").removeClass("hd");
	});
	
	
	
	
	
	
	
	/*  通用提示框 start  */
	$(".publicbtbox").each(function(){
		$(this).click(function(){
			$(".publicbox").show();
		});
	});
	$(".publicclose").each(function(){
		$(this).click(function(){
			$(".publicbox").addClass("none");
		});
	});
	/*  通用提示框 end  */
	
	$(".informaList1 a").each(function(){
		$(this).click(function(){
			$(".divBoxb1").show();
			$("html").addClass("hd");
		});
	});
	
	$(".informaList2 a").each(function(){
		$(this).click(function(){
			$(".divBoxb1").show();
		});
	});
	
	
	$(".bsButton1").click(function(){
		$(".bsButtonBox1").show();
		$("html").addClass("hd");
	});
	$(".bsButtonClose1,.bsButtonBg1").click(function(){
		$(".bsButtonBox1").hide();
		$("html").removeClass("hd");
	});
	
	
	
	$(".divBoxButton1").each(function(i){
		$(this).click(function(){
			$("#divBox").show();
			$("html").addClass("hd");
			$("#divBox .divBoxText1").show();
		});
	});
	
	$(".divBtColse").click(function(){
		$("#divBox").hide();
		$("html").removeClass("hd");
	});
	
	$(".divBt_Colse").click(function(){
		$(".divBox_Text").hide();
		$("html").removeClass("hd");
	});
	
	/*----------- 弹出层 end ------------*/
		
	$("#tab_div1 div:eq(1)").hide();
	$("#Tabdiv1 font").each(function(i){
		$(this).click(function(){
			$(this).addClass("select").siblings().removeClass("select");
			$("#tab_div1 div:eq("+i+")").show().siblings().hide();
		});
	});

	$("#ordeaa1").click(function(){
		ordeaa.innerHTML="已出发";
		$("#orderpull").removeClass("select");
	});
	$("#ordeaa2").click(function(){
		ordeaa.innerHTML="已到达";
		$("#orderpull").removeClass("select");
	});
	
	$(".downBt").hover(function(){
		$(this).addClass("select");
	},function(){
		$(this).removeClass("select");
	});
	$(".downBt a").click(function(){$(".downBt").removeClass("select");});
	
	

/*----------- 城市 ------------*/
	$(".citybt").each(function(){
		$(this).click(function(){
			$(this).find(".citybox").show();
			$(this).find(".citypicker").addClass("select");
		});
	});
	$(document).bind("click",function(e){
		var target = $(e.target);
		if(target.closest(".citybt").length == 0){
			$(".citybox").hide();
			$(this).find(".citypicker").removeClass("select");
		}
	});


	
	/*----------- 日期 ------------*/
	$('.form_datetime').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2
		//startDate:new Date()
		//forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
});

function jquery_public3(){
	$(".divBoxb1 .order_xzbox2").css({"top":20-$(window).scrollTop()});
}
function jquery_public(){
	$(".divboxStyle").css({"left":($(window).width()-$(".divboxStyle").width())/2,"top":($(window).height()-$(".divboxStyle").height())/2});
	$(".divboxStyle1").css({"left":($(window).width()-$(".divboxStyle1").width())/2,"top":($(window).height()-$(".divboxStyle1").height())/2});
	$("#divBox").css({"top":($(window).height()-$("#divBox").height())/2});
	$(".bsButtonBox").css({"left":($(window).width()-$(".bsButtonBox").width())/2,"top":($(window).height()-$(".bsButtonBox").height())/2});
	$(".bsButtonBox1").css({"left":($(window).width()-$(".bsButtonBox1").width())/2,"top":($(window).height()-$(".bsButtonBox1").height())/2});
	$(".divBoxb1").css({"left":($(window).width()-$(".divBoxb1").width())/2,"top":($(window).height()-$(".divBoxb1").height())/2});
	$(".divBoxb2").css({"left":($(window).width()-$(".divBoxb2").width())/2,"top":($(window).height()-$(".divBoxb2").height())/2});
	$(".divBoxb3").css({"left":($(window).width()-$(".divBoxb3").width())/2,"top":($(window).height()-$(".divBoxb3").height())/2});
	$(".divBoxb4").css({"left":($(window).width()-$(".divBoxb4").width())/2,"top":($(window).height()-$(".divBoxb4").height())/2});
	$(".divBoxbt1").css({"left":($(window).width()-$(".divBoxbt1").width())/2,"top":($(window).height()-$(".divBoxbt1").height())/2});
	$(".divBoxbt2").css({"left":($(window).width()-$(".divBoxbt2").width())/2,"top":($(window).height()-$(".divBoxbt2").height())/2});
	$(".divBoxbt3").css({"left":($(window).width()-$(".divBoxbt3").width())/2,"top":($(window).height()-$(".divBoxbt3").height())/2});
	$(".divBoxbt4").css({"left":($(window).width()-$(".divBoxbt4").width())/2,"top":($(window).height()-$(".divBoxbt4").height())/2});
	$(".xgButtonBox").css({"top":0});
	$(".order_xzbox1").css({"top":($(window).height()-$(".order_xzbox1").height())/2});
	$(".order_xzbox3").css({"top":($(window).height()-$(".order_xzbox3").height())/2});
	$(".publicbox,.deabxbox").css({"top":0});
	$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
	$(".order_xzbox2").css({"top":20});
	$("#city_clbt1").css({"top":0});
	$(".current404Height").css({"height":$(window).height()-$(".headerHeight").height()});
}



function jquery_public1(){
	$(".divboxStyle").css({"left":($(window).width()-$(".divboxStyle").width())/2,"top":($(window).height()-$(".divboxStyle").height())/2});
	$(".divboxStyle1").css({"left":($(window).width()-$(".divboxStyle1").width())/2,"top":($(window).height()-$(".divboxStyle1").height())/2});
	$("#divBox").css({"top":($(window).height()-$("#divBox").height())/2+$(window).scrollTop()});
	$(".bsButtonBox").css({"left":($(window).width()-$(".bsButtonBox").width())/2,"top":($(window).height()-$(".bsButtonBox").height())/2+$(window).scrollTop()});
	$(".bsButtonBox1").css({"left":($(window).width()-$(".bsButtonBox1").width())/2,"top":($(window).height()-$(".bsButtonBox1").height())/2+$(window).scrollTop()});
	$(".divBoxb1").css({"left":($(window).width()-$(".divBoxb1").width())/2,"top":($(window).height()-$(".divBoxb1").height())/2+$(window).scrollTop()});
	$(".divBoxb2").css({"left":($(window).width()-$(".divBoxb2").width())/2,"top":($(window).height()-$(".divBoxb2").height())/2+$(window).scrollTop()});
	$(".divBoxb3").css({"left":($(window).width()-$(".divBoxb3").width())/2,"top":($(window).height()-$(".divBoxb3").height())/2+$(window).scrollTop()});
	$(".divBoxb4").css({"left":($(window).width()-$(".divBoxb4").width())/2,"top":($(window).height()-$(".divBoxb4").height())/2+$(window).scrollTop()});
	$(".divBoxbt1").css({"left":($(window).width()-$(".divBoxbt1").width())/2,"top":($(window).height()-$(".divBoxbt1").height())/2});
	$(".divBoxbt2").css({"left":($(window).width()-$(".divBoxbt2").width())/2,"top":($(window).height()-$(".divBoxbt2").height())/2});
	$(".divBoxbt3").css({"left":($(window).width()-$(".divBoxbt3").width())/2,"top":($(window).height()-$(".divBoxbt3").height())/2});
	$(".divBoxbt4").css({"left":($(window).width()-$(".divBoxbt4").width())/2,"top":($(window).height()-$(".divBoxbt4").height())/2});
	$(".xgButtonBox").css({"top":$(window).scrollTop()});
	$(".order_xzbox1").css({"top":($(window).height()-$(".order_xzbox1").height())/2});
	$(".order_xzbox3").css({"top":($(window).height()-$(".order_xzbox3").height())/2});
	$(".publicbox,.deabxbox").css({"top":$(window).scrollTop()});
	$(".publiccurrent").css({"left":($(window).width()-$(".publiccurrent").width())/2,"top":($(window).height()-$(".publiccurrent").height())/2});
	$(".order_xzbox2").css({"top":20-$(window).scrollTop()});
	$("#city_clbt1").css({"top":$(window).scrollTop()});
	$(".current404Height").css({"height":$(window).height()-$(".headerHeight").height()});
}


