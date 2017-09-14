$(function() {
	
	
	$(".itemc").click(function(){
		var goodsid = $(this).find(".gid").val();
		var shopid = $(this).find(".userid").val();
		console.log(goodsid);
		location.href = "item?gid="+goodsid+"&shopid="+shopid;		
	});
	
});
