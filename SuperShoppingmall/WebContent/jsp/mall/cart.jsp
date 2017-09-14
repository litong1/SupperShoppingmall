<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
<style type="text/css">
* {
	margin: 0 auto;
}
	a {
 	text-decoration:none;	 
	}
	.header {
	
	margin:0 auto;
	vertical-align: middle;
	}
	.mainx {
	margin:0 auto;
	width : 80%;
	list-style: none;
	}
	
	#searcher {
	border:none;
	width: 400px;
	height: 30px;
	border-bottom:3px solid #EE82EE;
	border-top:3px solid #EE82EE;
	border-left:3px solid #EE82EE;
	border-right:3px solid #EE82EE;
	}
	#searcher-btn {
	border:none;
	background-color: #EE82EE;
	width: 150px;
	height: 37.5px;
	color: #fff;
	margin-left: -10px;
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
	button {
	width: 25px;
	height: 25px;
	background-color: #DCDCDC;
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;	
	}
	.opea {
	width:100px;
	margin: 35px 0 0 80px; 
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
    #balance{
    border: none;
    width: 150px;
    height: 45px;
    background-color: #FF00FF;
    }
    .fcolor{
    color:#FF4450;
    font-size: 1.2em;
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
		$(this).parents('.itemc').find(".totalprice").text((price*1.0*(nownum*1.0)).toFixed(1));
		var total = 0;
		$(".totalprice").each(function(){
			//console.log($(this).text());
			total = total*1 + $(this).text()*1;
		});
		
		$('#balanceTotal').text(total.toFixed(1));
		
		
		var cartid = $(this).parents('.itemnum').find(".cartid").val();		
		//赋值
		$("input[name='orderContent']").each(function(){		
			if($(this).val().indexOf(cartid)>=0){
				console.log("cartid" + cartid);
				var con = cartid + "/"+ nownum;				
				$(this).val(con);
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
		$(this).parents('.itemc').find(".totalprice").text((price*1.0*(nownum*1.0)).toFixed(1));
		var total = 0;
		$(".totalprice").each(function(){
			//console.log($(this).text());
			total = total*1 + $(this).text()*1;
		});
		$('#balanceTotal').text(total.toFixed(1));
		
		var cartid = $(this).parents('.itemnum').find(".cartid").val();
		//赋值
		$("input[name='orderContent']").each(function(){
			if(this.val().indexOf(cartid)>=0){
				var con = cartid + "/"+ nownum;
				this.val(con);
			}
		});
	});
	$('.numText').on('change',function(){
		var price = $(this).parents('.itemc').find(".price").val();
		console.log(price);
		var num = $(this).val();
		console.log(num);		
		$(this).parents('.itemc').find(".totalprice").text((price*1.0*(num*1.0)).toFixed(1));
		var total = 0;
		$(".totalprice").each(function(){
			//console.log($(this).text());
			total = total*1 + $(this).text()*1;
		});
		$('#balanceTotal').text(total.toFixed(1));
		
		var cartid = $(this).parents('.itemnum').find(".cartid").val();
		//赋值
		$("input[name='orderContent']").each(function(){
			if(this.val().indexOf(cartid)>=0){
				var con = cartid + "/"+ nownum;
				this.val(con);
			}
		});
	});
	var total = 0;
	$(".totalprice").each(function(){
		//console.log($(this).text());
		total = total*1 + $(this).text()*1;
	});
	$('#balanceTotal').text(total.toFixed(1));
	$('#balance').click(function(){
		$('#form1').submit();
	});
});
</script>
</head>
<body>
	
	<jsp:include page="/jsp/include/header1.jsp"></jsp:include> 
 	
	<div class="mainx">
		<div class="header">
			<a href="${pageContext.request.contextPath }/index"> 
				<font color="purple" size="6em"><b>猫儿衣娘</b></font>
			</a>
			<span>
				<font color="black" size="3em" style = "font-weight: bold;line-height: 100px; ">购物车</font>
			</span>
		</div>
		
		<div>
			<ul>
				<c:forEach var="item" items="${list}" varStatus="i">

					<li style="list-style: none;">
						<div>
							♔${item.shopname }
						</div>
						<div class="itemc">
							<div class="itemimg">
								<img alt=""
									src="${pageContext.request.contextPath }/${item.picPaths.get(0) }"
									width="80" height="80">
							</div>
							<div class="itemtitle"
								style="">
								${item.goodsTitle }</div>
							<div class="itemattr" >
								
								<div>颜色：${item.goodsColor }</div>
								<div>尺寸：${item.goodsSize }</div>
							</div>
							<div class="itemprice">
							<input type="hidden" class="price" value="${item.goodsPrice }" >
								￥${item.goodsPrice }
							</div>
							<div class="itemnum">
								<input type="hidden" class="cartid" value="${item.cartid }"/>
								<button class="reduceNum"  >
									<font size="4em"><b>-</b></font>
								</button>
								<input type="text" class="numText" value="${item.goodsNum }" />
								<button class="addNum" >
									<font size="4em"><b>+</b></font>
								</button>
							</div>
							<div class="itemtotal">
								<span class="fcolor">￥</span><span class="totalprice" style="color:#FF4450;font-size: 1.2em;">${item.goodsTotalPrice }</span>
							</div>
							<div class="opea">
								<a href="${pageContext.request.contextPath }/cart?type=intolove&goodsid=${item.goodsid}">移入收藏夹</a><br> 
								<a href="${pageContext.request.contextPath }/cart?type=delete&goodsid=${item.goodsid}">删除宝贝</a>
							</div>
						</div>

					</li>
				</c:forEach>
			</ul>
			<div align="right" style=" margin:15px 0 0 37px; background-color: #FFFAFA;">
				合计：<span id="balanceTotal" class="fcolor"></span>
				<input type="button" id="balance" value="结算">
			</div>
		</div>
		<form id="form1" action="${pageContext.request.contextPath }/order?type=cartbuy" method="post">
			<ul>
				<c:forEach var="item" items="${list}" varStatus="i">
					<input type="hidden" name="orderContent" value="${item.cartid }/${item.goodsNum}"/>
				</c:forEach>
			</ul>
			
		</form>
	</div>
</body>
</html>