$(function(){
	$(".content tbody tr:odd").addClass("bg");
	$(window).resize(function(){miyo()}); 
	setTimeout("miyo()");
});
function miyo() {
	$("#mq").css({"height":$(window).height()});
}