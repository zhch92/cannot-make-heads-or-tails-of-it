//dateStr,传入2014-07-01 17:11:06格式的字符串
//id,html元素id
var lhbCountDown = function(dateStr,endDateStr,id) {
	var countDownTime = getDate19(endDateStr).getTime() - getDate(dateStr).getTime();
	if (countDownTime <= 0) {
		//TODO 过时处理
	} else {
		//填充页面倒计时内容
		fillCountDownContent(countDownTime,id);		
 	
 		//开起倒计时			
		startCountDown(id);
	}
}

var getDate = function(dateStr) {
	var dateTime = dateStr.split(" ");
	if (dateTime.length == 2) {
		var dates = dateTime[0].split("-");
		var times = dateTime[1].split(":");
		return new Date(dates[0],dates[1]-1,dates[2],times[0],times[1],times[2]);
	} else {
		var dates = dateTime[0].split("-");
		return new Date(dates[0],dates[1]-1,dates[2]);
	}
}

//时间是晚上7点前
var getDate19 = function(dateStr) {
	var dateTime = dateStr.split(" ");
	if (dateTime.length == 2) {
		var dates = dateTime[0].split("-");
		var times = dateTime[1].split(":");
		if (Number(times[0]) > 0) {
			return new Date(dates[0],dates[1]-1,dates[2],times[0],times[1],times[2]);
		} else {
			return new Date(dates[0],dates[1]-1,dates[2],19,0,0);
		}
	} else {
		var dates = dateTime[0].split("-");
		return new Date(dates[0],dates[1]-1,dates[2],19,0,0);
	}
}

var fillCountDownContent = function(countDownTime,id) {
	var hour = parseInt(countDownTime / (60 * 60 * 1000));
	var minute = parseInt(countDownTime / (60 * 1000) % 60);
	var second = parseInt(countDownTime / 1000 % 60);

	var content = '<i class="icon icon_djs"></i>';
	content += '<font>倒计时';
	content += '<strong class="hour">'+hour+'</strong>小时';
	content += '<strong class="minute">'+minute+'</strong>分钟';
	content += '<strong class="second">'+second+'</strong>秒';
	content += '</font>';
	
	$("#"+id).append(content);	
}

var updateCountDownContent = function(id) {
	var result = true;
	
	var second = $("#"+id+" .second").text();
	if (second > 0) {
		$("#"+id+" .second").text(--second);
	} else {
		var minute = $("#"+id+" .minute").text();
		if (minute > 0) {
			$("#"+id+" .minute").text(--minute);
			$("#"+id+" .second").text(59);
		} else {
			var hour = $("#"+id+" .hour").text();
			if (hour > 0) {
				$("#"+id+" .hour").text(--hour);
				$("#"+id+" .minute").text(59);
				$("#"+id+" .second").text(59);
			} else {
				$("#"+id+" .second").text(0);
				result = false;
			}
		}
	}

	return result;
}

var startCountDown = function(id) {
	
	var intervalId = setInterval(function(){
		if (!updateCountDownContent(id)) {
		clearInterval(intervalId);
		}
	},1000);
}