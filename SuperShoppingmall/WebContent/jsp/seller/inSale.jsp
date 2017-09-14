<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出售中的宝贝</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#asm {
	padding-left: 30px;
}

.admin {
	margin: 0 auto;
	width: 85%;
}

.navigation {
	width: 100%;
	height: 50px;
	line-height: 50px;
	background-color: #DDA0DD;
}

.navigation a {
	padding-left: 20px;
}

#ul2 li a {
	text-decoration: none;
	display: block;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 15px;
	color: #000;
}

.aside {
	width: 13%;
	height: 380px;
	margin-top: 20px;
	display: inline-block;
	border: 1px solid purple;
	padding-top: 10px;
	background-color: #FFFAFA;
	border-top-left-radius: 0.3em;
	border-bottom-left-radius: 0.3em;
	vertical-align: top;
}

.section {
	width: 85.5%;
	height: auto;
	min-height: 500px;
	margin-top: 20px;
	display: inline-block;
	border: 1px solid purple;
	border-top-right-radius: 0.3em;
	border-bottom-right-radius: 0.3em;
	vertical-align: middle;
}

.section div {
	
}

#seainfo {
	margin: 10px;
}

input[name=price] {
	width: 60px;
}

#query {
	border: none;
	width: 50px;
	height: 20px;
	margin-left: 20px;
	background-color: #fff;
	border: 1px solid #DCDCDC;
}

#query:hover {
	background-color: #C0C0C0;
	color: #fff;
}

.tyorder {
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid #DCDCDC;
}

input[name=order] {
	border: thin;
	background-color: #fff;
	width: 50px;
	height: 25px;
	border-right: 1px solid #DCDCDC;
}

.ocolor {
	color: #FF4500;
}


.itemc {
	width: 219px;
	height: 355px;
	display: inline-block;
	background-color: #E6E6FA;
	margin: 8px 1px 1px 8px;
	vertical-align: top;
}

.itemc:hover {
	border: 1px solid #EE82EE;
}

.price {
	color: #FF4500;
}

#ullist {
	margin-left: 10px;
}

.deletegoods {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 1;
	display: none;
}

input[name=deletegoods] {
	border: none;
	width: 30px;
	height: 30px;
	background-color: #C0C0C0;
	filter: alpha(Opacity = 60);
	-moz-opacity: 0.60;
	opacity: 0.60;
}
</style>
<script type="text/javascript" src="/SuperShoppingmall/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/SuperShoppingmall/JS/insale.js">	</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty sessionScope.user }">
			<jsp:forward page="/jsp/regandlog/login.jsp"></jsp:forward>
		</c:when>
		<c:otherwise>
			<jsp:include page="/jsp/include/header1.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
		<div class="admin">
			<div>
				<a href="${pageContext.request.contextPath }/jsp/mall/index.jsp">
					<font  color="purple" size="6em" ><b>猫儿衣娘</b></font>
				</a> 
				<span>
					<font color="black" size="3em" style = "font-weight: bold;line-height: 100px; ">卖家中心</font>
				</span>

			</div>
			<div class="navigation">
				<div style="display:inline;">
					<a>首页</a>
					<a>发布宝贝</a>
					<a href="${pageContext.request.contextPath }/shop?type=query">基本设置</a>
				</div>
				<div style="display:inline;padding-left: 700px;">
				    <a>问题反馈</a>
				</div>
			</div>
			<div class="aside">
				<span><b>卖家管理</b></span>
				<ul id="ul2">
					<li>
						<p ><b>交易管理</b></p>
						<a href="${pageContext.request.contextPath }/jsp/seller/list_sold_items.jsp">已卖出的宝贝</a>
						<a>评价管理</a>
						<hr style="width:88%;height:0.1px; "color=#F7F7F7></hr>
					</li>
					<li>
						<p ><b>宝贝管理</b></p>
						<a href="${pageContext.request.contextPath }/jsp/seller/publish.jsp">发布宝贝</a>
						<a href="${pageContext.request.contextPath }/seller?type=insale">出售中的宝贝</a>
						<a>仓库中的宝贝</a>
						<hr style="width:88%;height:0.1px; "color=#F7F7F7></hr>
					</li>
					<li>
						<p ><b>店铺管理</b></p>
						<a>查看猫儿店铺</a>
						<a>宝贝分类管理</a>	
						<a>店铺基本设置</a>					
					</li>
				</ul>
			</div>
			<div class="section">
				<input type="hidden" id="shopid" value="${shop.shopid }">
				<div id="seainfo">
					<span>关键字：<input type="text" id="keyword" value="${kw }"></span>
					<span>价格：<input type="text" name="price" id="minPrice"
						width="30" placeholder="￥" value="${min }">- <input
						type="text" name="price" id="maxPrice" width="30" placeholder="￥"
						value="${max}">
					</span> <input type="button" id="query" value="搜索">
				</div>
				<hr
					style="filter: alpha(opacity = 0, finishopacity = 100, style = 1)"
					width="100%" color=#EE82EE size=1>
				<div class="tyorder">
					<span>排序：</span> <input type="hidden" id="orderId" value="${order }">
					<input type="button" name="order" id="orderTotal" value="综合">
					<input type="button" name="order" id="orderDate" value="新品">
					<input type="button" name="order" id="orderSale" value="销量">
					<input type="button" name="order" id="orderPrice" value="价格">
					<input type="button" name="order" id="orderLove" value="收藏">
				</div>
				<div>
					<ul id="ullist">
					<c:forEach var="item" items="${goodsList}" varStatus="i">
	
						<li class="itemc">
						<div style="position: relative;">
							<img alt=""
								 src="${pageContext.request.contextPath }/${item.picPaths.get(0) }"
								 width="219" height="219">
							<div class="deletegoods">
								<input type="hidden" class="gid" value="${item.goodsId }">
								<input type="hidden" class="userid" value="${item.userId }">
								<input type="button" name="deletegoods" value="✖">
							</div>
						</div>
						<div class="itemcontent">
							<div >
								<div>
									<input type="hidden" class="gid" value="${item.goodsId }">
									<span>${item.goodsTitle }</span>
								</div>
								<div>
									<span class="price">￥${item.pspecPrice }</span> 
									<span style="float: right;margin-right: 30px;">已售出:${item.salenum }</span>
								</div>
							</div>
							<div>
								<span>
									<a href="${pageContext.request.contextPath }/shop?shopid=${shop.shopid}" style="text-decoration: underline;"><span class="price">♔</span>${shop.shopname }</a>
								</span>
								<span style="float: right;margin-right: 30px;">${shop.shopaddress }</span>
							</div>
						</div>
						</li>
	
					</c:forEach>
				</ul>	
			</div>
			</div>
		</div>		
</body>
</html>