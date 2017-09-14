<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>猫儿衣娘</title>
<style type="text/css">
	#nowmain{
	margin:0 auto;
	width: 80%;
	margin-top: 15px;
	}
	li{
	list-style: none;
	}
	.itemc {
	border:1px solid #EDEDED;
	width: 100%;
	height: 100px;
	}
	.itemimg {
	margin: 10px; 
	display: inline-block; 
	vertical-align: top;
	}
	.itemtitle{
	margin: 10px; 
	display: inline-block; 
	vertical-align: top; 
	width: 250px; 
	word-wrap: break-word;
	}
	
	.itemattr{
	
	width:120px;
	display: inline-block;
	}
	.itemprice{
	
	width:70px;
	display: inline-block;
	}
	.itemnum{
	margin: 10px; 
	width:150px;
	display: inline-block;
	}
	.itemtotal{
	 
	width:70px;
	display: inline-block;
	}
	.numText {
	border: none;
	width: 60px;
	height: 21px;
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;
	text-align: center;
	margin-left: -5px;	
	margin-right: -5px;
	vertical-align: top;
    }
	button {
	width: 25px;
	height: 25px;
	background-color: #DCDCDC;
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;	
	}
	#submitOrder{
	border: none;
	width: 180px;
	height: 40px;
	
	background-color: #EE82EE;
	color:#fff;
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;
	border-bottom-left-radius: 0.2em;
	border-bottom-right-radius: 0.2em;
	border-top-left-radius: 0.2em;
	border-top-right-radius: 0.2em;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>

<script type="text/javascript">
$(function() {
	//数量
	$('.addNum').click(function(){
		var num = $(this).parents('.itemnum').find(".numText").val();
		$(this).parents('.itemnum').find(".reduceNum").attr("disabled",false);				
		$(this).parents('.itemnum').find(".numText").val(num*1+1);
		var price = $(this).parents('.itemc').find(".price").val();
		var nownum = $(this).parents('.itemnum').find(".numText").val();
		$("input[name='goodsNum']").val(nownum);
		$(this).parents('.itemc').find(".totalprice").text((price*1.0*(nownum*1.0)).toFixed(1));		
		$("input[name='goodsTotalPrice']").val((price*1.0*(nownum*1.0)).toFixed(1));
		
		var total = 0;
		$(".totalprice").each(function(){
			//console.log($(this).text());
			total = total*1 + $(this).text()*1;
		});
		$('#balanceTotal').text(total.toFixed(1));
		
		var cartid = $(this).parents('.itemnum').find(".cartid").val();
		//赋值
		$("input[name='cartid']").each(function(){
			if(this.val()==cartid){
				$(this).parents("li").find("input[name='goodsNum']").val(nownum);
				$(this).parents("li").find("input[name='goodsTotalPrice']").val((price*1.0*(nownum*1.0)).toFixed(1));
			}
		});
	});
	$('.reduceNum').click(function(){
		
		var num = $(this).parents('.itemnum').find(".numText").val();
		if(num >1){
			$(this).parents('.itemnum').find(".numText").val(num*1-1);
		}else{
			$(this).parents('.itemnum').find(".reduceNum").attr("disabled",true);
		}	
		var price = $(this).parents('.itemc').find(".price").val();
		var nownum = $(this).parents('.itemnum').find(".numText").val();
		$("input[name='goodsNum']").val(nownum);
		$(this).parents('.itemc').find(".totalprice").text((price*1.0*(nownum*1.0)).toFixed(1));
		
		var total = 0;
		$(".totalprice").each(function(){
			total = total*1 + $(this).text()*1;
		});
		$('#balanceTotal').text(total.toFixed(1));
		
		var cartid = $(this).parents('.itemnum').find(".cartid").val();
		//赋值
		$("input[name='cartid']").each(function(){
			if(this.val()==cartid){
				$(this).parents("li").find("input[name='goodsNum']").val(nownum);
				$(this).parents("li").find("input[name='goodsTotalPrice']").val((price*1.0*(nownum*1.0)).toFixed(1));
			}
		});
	});
	$('.numText').on('change',function(){
		var price = $(this).parents('.itemc').find(".price").val();
		console.log(price);
		var num = $(this).val();
		$("input[name='goodsNum']").val(num);		
		$(this).parents('.itemc').find(".totalprice").text((price*1.0*(nownum*1.0)).toFixed(1));
		
		var total = 0;
		$(".totalprice").each(function(){
			//console.log($(this).text());
			total = total*1 + $(this).text()*1;
		});
		$('#balanceTotal').text(total.toFixed(1));
		
		var cartid = $(this).parents('.itemnum').find(".cartid").val();
		//赋值
		$("input[name='cartid']").each(function(){
			if(this.val()==cartid){
				$(this).parents("li").find("input[name='goodsNum']").val(num);
				$(this).parents("li").find("input[name='goodsTotalPrice']").val((price*1.0*(nownum*1.0)).toFixed(1));
			}
		});
	});
	$("input[name='address']").on('click',function(){
		var str = $("input[name='address']:checked").val().split("(");
		$('#spanAddress').text(str[0]);
		str = str[1].split(")收");		
		$('#spanMan').text(str[0]+str[1]);
	});
	var total = 0;
	$(".totalprice").each(function(){
		//console.log($(this).text());
		total = total*1 + $(this).text()*1;
	});
	$('#balanceTotal').text(total.toFixed(1));
	$('#submitOrder').click(function(){
		var address = $('#spanMan').text()+$('#spanAddress').text();
		$("input[name='address']").each(function(){
			$(this).val(address);
		});
		
		//console.log($("input[name='address']").val());
		$('#form1').submit();
	});
});
</script>
</head>
<body>

	<jsp:include page="/jsp/include/header1.jsp"></jsp:include> 
	<div id="nowmain">
		<div >
			<a href = "${pageContext.request.contextPath }/index"><font  color="purple" size="6em" ><b>猫儿衣娘</b></font></a>				
		</div>
		<div>
			<div>
				<div style="display: inline;text-align:left;">确认收货信息</div>
				<div style="display: inline;margin-left: 800px;">
					<a href="${pageContext.request.contextPath }/jsp/user/deliver_address.jsp?username=${user.username}">管理收货地址</a>
				</div>
			</div>
			<hr>
			  <div>
				<ul>
					<c:forEach var="item" items="${address}" varStatus="i">
						<li>
							<div>
								<input type="radio" name="address" value="${item.detailAddress }(${item.consigneeName })收${item.tel }">
								${item.detailAddress }(${item.consigneeName })收${item.tel }
							</div>							
						</li>
					</c:forEach>
				</ul>
			</div>	
				
		</div>
		<div>
			<div>
				<div style="display: inline;text-align:left;">确认订单 信息</div>
			</div>
			<hr>
			<div>
			<ul>
			<c:forEach var="item" items="${cartlist }">
				<li>
					<div>♔${item.shopname }</div>
						<div class="itemc">
							<div class="itemimg">
								<img alt=""
									src="${pageContext.request.contextPath }/${item.picPaths.get(0) }"
									width="80" height="80">
							</div>
							<div class="itemtitle" style="">${item.goodsTitle }</div>
							<div class="itemattr">
								<div>颜色：${item.goodsColor }</div>
								<div>尺寸：${item.goodsSize }</div>
							</div>
							<div class="itemprice">
								<input type="hidden" class="price" value="${item.goodsPrice }">
								￥${item.goodsPrice }
							</div>
							<div class="itemnum">
								<input type="hidden" class="cartid" value="${item.cartid }"/>
								<button class="reduceNum">
									<font size="4em"><b>-</b></font>
								</button>
								<input type="text" class="numText" value="${item.goodsNum }" />
								<button class="addNum">
									<font size="4em"><b>+</b></font>
								</button>
							</div>
							<div class="itemtotal">
								<span class="fcolor">￥</span><span class="totalprice"
									style="color: #FF4450; font-size: 1.2em;">${item.goodsTotalPrice }</span>
							</div>
						</div>
					</li>
				
			</c:forEach>
			</ul>	
				
			</div>			
		</div>

		<div style="width: 100%;  height: 100px;float: right;margin-top: 5px;">
			<div
				style="border: 1px solid red; 
				float: right;
				 display: block;
				 width: 200px; 
				 height: 100px;
				 line-height: 35px;">
				<div>
					实付款: <span class="fcolor">￥</span> <span id="balanceTotal"
						style="color: #FF4450; font-size: 1.2em;"></span><span></span>
				</div>
				<div>
					寄送至:<span id="spanAddress"></span>
				</div>
				<div>
					收货人：<span id="spanMan"></span>
				</div>
			</div>
		</div>
		<div style="width: 100%;height: 40px;float: right;">
			<div style="margin-top:10px; float: right;display: block;">
				<input type="button" id="submitOrder" value="提交订单">
			</div>
		</div>
		<form id="form1" action="${pageContext.request.contextPath }/submitOrder?type=cart" method="post">
			<ul>
			<c:forEach var="item" items="${cartlist }">
				<li>
					<input type="hidden" name="address" value=""/>
					<input type="hidden" name="cartid"  value="${item.cartid }"/>
					<input type="hidden" name="goodsNum" id="goodsNum" value="${item.goodsNum }"/>
					<input type="hidden" name="goodsTotalPrice" id="goodsTotalPrice" value="${item.goodsTotalPrice }"/>
				</li>
			</c:forEach>
			</ul>
		</form>
	</div>
	
</body>
</html>