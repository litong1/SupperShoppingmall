
$(function() {
	$('#salenum').mouseover(function(){
		$(this).addClass('typeborder');
	});
	$('#salenum').mouseout(function(){
		$(this).removeClass('typeborder');
	});
	$('#lovenum').mouseover(function(){
		$(this).addClass('typeborder');
	});
	$('#lovenum').mouseout(function(){
		$(this).removeClass('typeborder');
	});
	 $('#toptype span').mouseover(function() {
            var i = $(this).index();//下标第一种写法
            //var i = $('tit').index(this);//下标第二种写法	
            $(this).addClass('typeborder').siblings().removeClass('typeborder');
           
            $('#hDiv ul').eq(i).show().siblings().hide();
            //console.log(i);
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
			location.href = "shop?shopid="+shopid+"&order="+order;
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
			location.href = "shop?shopid="+shopid+"&order="+order+"&kw=" + kw +"&min="+min + "&max=" + max;
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
		location.href = "shop?shopid="+shopid+"&order="+order+"&kw=" + kw +"&min="+min + "&max=" + max;
	});
	//点击商品
	$(".itemc,.itemsc").click(function(){
		console.log("ccc");
		var goodsid = $(this).find(".gid").val();
		var shopid = $('#shopid').val();
		console.log(goodsid);
		location.href = "item?gid="+goodsid+"&shopid="+shopid;		
	});
	//收藏店铺
	$('#loveshop').click(function(){
		var shopid = $('#shopid').val();
		location.href = "love?type=shop&shopid=" + shopid;	
	});
	
});
