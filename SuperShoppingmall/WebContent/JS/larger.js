$(function(){
	var ione = $(".one"),
		ithe = $(".the"),
		itwo = $(".two img"),
		tthe = $(".the img");
	var h1 = $('#hpic1').val();
	//获取数据库传来的图片地址 50*50
	var h2 = $('#hpic2').val();
	var h3 = $('#hpic3').val();
	var h4 = $('#hpic4').val();
	var h5 = $('#hpic5').val();
	var arr = new Array(5);
	arr[0] = h1;
	arr[1] = h2;
	arr[2] = h3;
	arr[3] = h4;
	arr[4] = h5;
	//获取数据库传来的图片地址 800*800
	var hb1 = $('#hbpic1').val();	
	var hb2 = $('#hbpic2').val();
	var hb3 = $('#hbpic3').val();
	var hb4 = $('#hbpic4').val();
	var hb5 = $('#hbpic5').val();	
	var oarr = new Array(5);
	oarr[0] = hb1;
	oarr[1] = hb2;
	oarr[2] = hb3;
	oarr[3] = hb4;
	oarr[4] = hb5;
	
	var hs = $('#hSize').val();
	hs = hs.substring(1,hs.length-1);
	hs = hs.split(", ");
	console.log(hs);
	$.each(hs, function(index, value) {
		$('#lSize').append("<span class='itemsize'>"+value+"</span>");
		//console.log(value);
	});
	
	var hc = $('#hColor').val();
	hc = hc.substring(1,hc.length-1);
	hc = hc.split(",");
	console.log(hc);
	$.each(hc, function(index, value) {
		$('#lColor').append("<span class='itemcolor'>"+value+"</span>");
		//console.log(value);
	});
	
	
	itwo.each(function(i){
		$(this).mouseover(function(){
			$(".one img").attr("src",arr[i])
			tthe.attr("src",oarr[i])
			itwo.removeClass("active")
			$(this).addClass("active")
		})
		//放大镜
		ione.mousemove(function(a){
			var evt = a || window.event
			ithe.css('display','block')
			var ot = evt.clientY-($(".one").offset().top- $(document).scrollTop())-87;
			var ol = evt.clientX-($(".one").offset().left- $(document).scrollLeft())-87;
			if(ol<=0){
				ol = 0;
			}
			if(ot<=0){
				ot = 0;
			}
			if(ol>=175){
				ol=175
			}
			if(ot>=175){
				ot=175
			}
			$("span").css({'left':ol,'top':ot})
			var ott = ot/350*800
			var oll = ol/350*800
			tthe.css({'left':-oll,'top':-ott})
		})
		ione.mouseout(function(){
			ithe.css('display','none')
		})
		
	});
	
	$('#first').mouseover(function(){
		  $('#classify').css("display","block");				 
	});
	$('#first').mouseout(function(){
		  $('#classify').css("display","none");
	});
	
	
	//收藏商品
	$('#lovegoods').click(function(){
		var goodsid = $('#goodsid').val();
		location.href = "love?type=goods&goodsid=" + goodsid;	
	});
	
	//加入购物车
	$('#addCart').click(function(){
		var goodsid = $('#goodsid').val();		
		var size = $(".itemsize.addSizecss").text();
		
		$('#goodsSize').val(size);
		var color = $(".itemcolor.addColorcss").text();			
		$('#goodsColor').val(color);
	
		var num = $('#numText').val();
		$('#goodsNum').val(num);
		
		var price = $('#goodsPrice').val();
		var totalPrice = num*1*(price*1);
		$('#goodsTotalPrice').val(totalPrice);
		
		$('#form1').submit();
	});
	
	//购买商品
	
	$('#secBuy').click(function(){
		var goodsid = $('#goodsid').val();		
		var size = $(".itemsize.addSizecss").text();
		
		$('#goodsSize1').val(size);
		var color = $(".itemcolor.addColorcss").text();	
		console.log(color);
		$('#goodsColor1').val(color);
	
		var num = $('#numText').val();
		$('#goodsNum1').val(num);
		
		var price = $('#goodsPrice').val();
		var totalPrice = num*1*(price*1);
		$('#goodsTotalPrice1').val(totalPrice);
		
		$('#form2').submit();
	});
	
})
