$(function() {
	
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
	
	$(".itemc").click(function(){
		console.log("ccc");
		var goodsid = $(this).find(".gid").val();
		var shopid = $(this).find(".userid").val();
		console.log(goodsid);
		location.href = "item?gid="+goodsid+"&shopid="+shopid;		
	});
	//给当前排序类型描红
	var orderval = $('#orderId').val();
	$("input[name='order']").each(function(){
		if($(this).val()===orderval){
			 $(this).addClass('ocolor').siblings().removeClass('ocolor');
		}
	});
	//给当前小类型描红
	var stval = $('#st').val();
	$(".sTypea a").each(function(){	
		if($(this).text()===stval){
			 $(this).addClass('ocolor').siblings().removeClass('ocolor');
		}
	});
	//按综合排序
	$('#orderTotal').click(function(){		
		var name = $('#name').val();
		var bt = $('#bt').val();		
		//如果相等则是大类型分类
		if(name === bt){		
			location.href = "list?bt="+bt+"&order=total";	
		}else{
			location.href = "list?bt="+bt+"&st="+name+"&order=total";	
		}
	});
	
	//按新品排序
	$('#orderDate').click(function(){		
		var name = $('#name').val();
		var bt = $('#bt').val();		
		//如果相等则是大类型分类
		if(name === bt){		
			location.href = "list?bt="+bt+"&order=date";	
		}else{
			location.href = "list?bt="+bt+"&st="+name+"&order=date";	
		}
	});
	//按销量排序
	$('#orderSale').click(function(){		
		var name = $('#name').val();
		var bt = $('#bt').val();		
		//如果相等则是大类型分类
		if(name === bt){		
			location.href = "list?bt="+bt+"&order=salenum";	
		}else{
			location.href = "list?bt="+bt+"&st="+name+"&order=salenum";	
		}
	});
	//按价格排序
	$('#orderPrice').click(function(){		
		var name = $('#name').val();
		var bt = $('#bt').val();		
		//如果相等则是大类型分类
		if(name === bt){		
			location.href = "list?bt="+bt+"&order=price";	
		}else{
			location.href = "list?bt="+bt+"&st="+name+"&order=price";	
		}
	});
	//按价格筛选
	$('#orderOk').click(function(){
		
		var name = $('#name').val();
		var bt = $('#bt').val();
		var order = $('#orderId').val();
		var min = $('#minPrice').val();
		var max = $('#maxPrice').val();
		//如果相等则是大类型分类
		if(name === bt){
			console.log(111);
			location.href = "list?bt="+bt+"&order="+order+"&min="+min+"&max="+max;	
		}else{
			location.href = "list?bt="+bt+"&st="+name+"&order="+order+"&min="+min+"&max="+max;	
		}
	});
	
});