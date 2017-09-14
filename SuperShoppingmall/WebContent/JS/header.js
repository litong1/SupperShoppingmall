//window.onload = function() {
//		var lis = document.getElementsByTagName("li");
//		for (var i = 0; i < lis.length; i++) {
//			lis[i].onmouseover = function() {
//				this.getElementsByTagName("div")[0].style.display = "block";
//			};
//			lis[i].onmouseout = function() {
//				this.getElementsByTagName("div")[0].style.display = "none";
//			}
//		}
//
//	}
$(function() {
	$("#ul1 li").each(function(){
		$(this).mouseover(function() {
			$(this).children().last().css("display","block");
		});		
		$(this).mouseout(function() {
			$(this).children().last().css("display","none");
		});	
	});	
	

});
