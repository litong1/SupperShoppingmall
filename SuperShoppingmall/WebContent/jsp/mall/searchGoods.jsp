<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${keyword }-猫儿搜索</title>
<style type="text/css">
a {
	text-decoration: none;
}

#searcher {
	border: none;
	width: 500px;
	height: 33px;
	border-bottom: 3px solid #EE82EE;
	border-top: 3px solid #EE82EE;
	border-right: 3px solid #EE82EE;
}

#searcher-btn {
	border: none;
	background-color: #EE82EE;
	width: 150px;
	height: 40.5px;
	color: #fff;
	margin-left: -10px;
}

#select {
	border: none;
	width: 60px;
	height: 40.5px;
	margin-right: -5px;
	border-bottom: 3px solid #EE82EE;
	border-top: 3px solid #EE82EE;
	border-left: 3px solid #EE82EE;
	border-right: 1px solid #DCDCDC;
	background-color: #FFFAFA;
}

#main {
	width: 80%;
	margin: 0 auto;
}

.itemc {
	width: 235px;
	height: 336px;
	display: inline-block;
	background-color: #E6E6FA;
	margin-top: 8px;
	margin-bottom: 8px;
}

.itemc:hover {
	border: 1.2px solid #EE82EE;
}

.price {
	float: left;
	color: #FF4500;
	font-size: 1.2em;
}

#seainfo {
	margin: 10px 0 10px 40px;
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
	border: 1px solid #DCDCDC;
	margin-top:10px;
	margin-left: 40px;
	width: 88.2%;
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
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/search.js"></script> 
</head>
<body>
	<c:choose>
		<c:when test="${empty sessionScope.user }">		
			<jsp:include page="/jsp/include/header2.jsp"></jsp:include>
		</c:when>	
		<c:otherwise>
			<jsp:include page="/jsp/include/header1.jsp"></jsp:include> 
		</c:otherwise>		
	</c:choose>	

	<div style="margin: 10px;">
		<span> <a href="${pageContext.request.contextPath }/index"><font
				color="purple" size="6em"><b>猫儿衣娘</b></font></a>
		</span> 
		<span style="padding-left: 200px"> 
			<select id="select">
					<option value="goods">宝贝</option>
					<option value="shop">店铺</option>
			</select> 
			<input id="searcher" type="text" />
			<input type="hidden" id="input" value="${kw }">	
			<button id="searcher-btn" name="">搜索</button>
		</span>
	</div>	
	<hr>
	<div id="main">
		<div id="seainfo">
			
			<span>关键字：<input type="text" id="keyword" value="${kw }"></span>
			<span>价格：<input type="text" name="price" id="minPrice"
				width="30" placeholder="￥" value="${min }">- <input
				type="text" name="price" id="maxPrice" width="30" placeholder="￥"
				value="${max}">
			</span> <input type="button" id="query" value="搜索">
			
		</div>
		
		<div class="tyorder">
					<input type="hidden" id="orderId" value="${order }">
					<input type="button" name="order" id="orderTotal" value="综合">
					<input type="button" name="order" id="orderDate" value="新品">
					<input type="button" name="order" id="orderSale" value="销量">
					<input type="button" name="order" id="orderPrice" value="价格">
					<input type="button" name="order" id="orderLove" value="收藏">
		</div>
		<div>
			<ul>
				<c:forEach var="item" items="${goodslist}" varStatus="i">

					<li class="itemc"><img alt=""
						src="${pageContext.request.contextPath }/${item.picPaths.get(0) }"
						width="233" height="234">
						<div>
							<div>
								<input type="hidden" class="gid" value="${item.goodsId }">
								<input type="hidden" class="userid" value="${item.userId }">
								<span>${item.goodsTitle }</span>
							</div>
							<div>
								<span class="price">￥${item.pspecPrice }</span> <span
									style="float: right;margin-right: 30px;">销量:${item.salenum }</span>
							</div>
						</div></li>

				</c:forEach>
			</ul>
		</div>
	</div>
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>