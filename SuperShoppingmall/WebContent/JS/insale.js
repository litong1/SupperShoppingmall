
$(function() {
	
	$(".itemc").mouseover(function(){
		$(this).find(".deletegoods").css("display","block");
		console.log("111");
	});
	$(".itemc").mouseout(function(){
		$(this).find(".deletegoods").css("display","none");
	});
	
	//给当前排序类型描红
	var orderval = $('#orderId').val();
	$("input[name='order']").each(function(){
		if($(this).val()===orderval){
			 $(this).addClass('ocolor').siblings().removeClass('ocolor');
		}
	});
	
	$(".navOrder").each(function(){
		$(this).click(function(){
			console.log()
			var order = "";
			var shopid = $('#shopid').val();
			if($(this).text()==="按销量"){
				order = "salenum";
			}else if($(this).text()==="按新品"){
				order = "date";
			}else if($(this).text()==="按价格"){
				order = "price";
			}else if($(this).text()==="按收藏"){
				order = "lovenum";
			}
			location.href = "seller?shopid="+shopid+"&order="+order;
		});		
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
			location.href = "seller?shopid="+shopid+"&order="+order+"&kw=" + kw +"&min="+min + "&max=" + max;
		});		
	});
	
	//按条件筛选
	$('#query').click(function(){
		var shopid = $('#shopid').val();
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
		location.href = "seller?shopid="+shopid+"&order="+order+"&kw=" + kw +"&min="+min + "&max=" + max;
	});
	//点击商品
	$(".itemcontent").click(function(){
		console.log("ccc");
		var goodsid = $(this).find(".gid").val();
		var shopid = $('#shopid').val();
		console.log(goodsid);
		location.href = "item?gid="+goodsid+"&shopid="+shopid;		
	});
	
	$(".deletegoods").click(function(){
		var goodsid = $(this).find(".gid").val();
		location.href = "shop?type=delete&goodsid=" + goodsid;
	});
});
