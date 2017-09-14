<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加入购物车成功</title>
<style type="text/css">
	a {
 	text-decoration:none;	 
	}
	.header {
	
	margin:0 auto;
	vertical-align: middle;
	}
	.mainx {
	margin-top:10px;
	margin:0 auto;
	width : 80%;
	
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
	#backDetail {
	border: none;
	width: 130px;
	height:40px;
	background-color: #FFE4E1;
	}
	#gotoCart {
	border: none;
	width: 130px;
	height:40px;
	background-color: #FF4450;
	}
	.fcolor {
	color:#FF4450;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function(){
	$('#backDetail,img').click(function(){
		var goodsid = $('#goodsid').val();
		var shopid = $('#shopid').val();
		location.href="item?gid=" + goodsid + "&shopid=" + shopid;
	});
	$('#gotoCart').click(function(){
		var userid = $('#userid').val();
		location.href="cart?type=list&userid="+userid;
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
		<input type="hidden" id="userid" value="${cart.userid }">
		<input type="hidden" id="goodsid" value="${cart.goodsid }">
		<input type="hidden" id="shopid" value="${cart.shopid }">
		<div style="margin-top: 15px;">
			<div style="display: inline-block;vertical-align:top ;">
				<img alt="" src="${pageContext.request.contextPath }/${cart.picPaths.get(0) }"
									 width="150" height="150">
			</div>
				<div style="display: inline-block;vertical-align:top ; ">
					<div >
						<a href="${pageContext.request.contextPath }/shop?shopid=${cart.shopid}">♔${cart.shopname }</a>
					</div>
					<div >
						已添加商品：&nbsp;&nbsp;
						&nbsp;
					</div>
					<div class="fcolor" style="width:270px;word-wrap:break-word;">${cart.goodsTitle}</div>
					<p >颜色分类：<span class="fcolor">${cart.goodsColor }</span></p>
					<p >尺码：<span class="fcolor">${cart.goodsSize }</span></p>
					<p >数量：<span class="fcolor">${cart.goodsNum }</span></p>
				</div>
				<div style="display: inline-block;margin-left: 300px;width: 300px;">
					<div >
						<div style="margin-left: 150px;">
							已成功加入购物车
						</div>
						<div style="margin: 47px 0 20px 150px;">
							<span class="fcolor" >小计:￥${cart.goodsTotalPrice }</span>
						</div>
					</div>
					<div style="margin-left: 10px;">
						<input type="button" id="backDetail" value="<返回商品详情">
						<input type="button" id="gotoCart" value="去购物车结算">
					</div>
				</div>
			
			<div>
			</div>
		</div>
		
		
	</div>
</body>
</html>