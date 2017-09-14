$(function() {
	
	//给当前排序类型描红
	var orderval = $('#orderId').val();
	$("input[name='order']").each(function(){
		if($(this).val()===orderval){
			 $(this).addClass('ocolor').siblings().removeClass('ocolor');
		}
	});
	
	$("#searcher-btn").click(function(){
		var select =   $("#select option:selected").val();
		var input = $('#searcher').val();		 			 
		location.href = "search?type="+select+"&kw="+input;		
	});
	$('#searcher').val($('#input').val());
	$(".itemc").click(function(){
		var goodsid = $(this).find(".gid").val();
		var shopid = $(this).find(".userid").val();
		console.log(goodsid);
		location.href = "item?gid="+goodsid+"&shopid="+shopid;		
	});
	$("input[name='order']").each(function(){
		$(this).click(function(){
			console.log()
			var order = "";
			var shopid = $('#shopid').val();
			var kw = $('#keyword').val();
			var min = $('#minPrice').val();
			var max = $('#maxPrice').val();
			if($(this).val()==="综合"){
				order = "total";
			}else if($(this).val()==="销量"){
				order = "salenum";
			}else if($(this).val()==="新品"){
				order = "date";
			}else if($(this).val()==="价格"){
				order = "price";
			}else if($(this).val()==="收藏"){
				order = "lovenum";
			}
			location.href = "search?type=goods&order="+order+"&kw=" + kw +"&min="+min + "&max=" + max;
		});		
	});
	
	//按条件筛选
	$('#query').click(function(){
		var val = $('#orderId').val();
		var kw = $('#keyword').val();
		var min = $('#minPrice').val();
		var max = $('#maxPrice').val();
		var order = "";
		if(val==="综合"){
			order = "total";
		}else if(val==="销量"){
			order = "salenum";
		}else if(val==="新品"){
			order = "date";
		}else if(val==="价格"){
			order = "price";
		}else if(val==="收藏"){
			order = "lovenum";
		}
		location.href = "search?type=goods&order="+order+"&kw=" + kw +"&min="+min + "&max=" + max;
	});
	$(".items").click(function(){
		var shopid = $(this).find(".shopid").val();
		console.log(shopid);
		location.href = "shop?shopid="+shopid;		
	});
	
});
