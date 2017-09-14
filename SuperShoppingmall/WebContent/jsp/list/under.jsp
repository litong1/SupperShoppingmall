<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>私密内衣</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/list.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/list.js"></script> 
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
	<div id="header">
		<span> 
			<a href="#"><font color="purple" size="6em"><b>猫儿衣娘</b></font></a>
		</span> 
		
		<span style="padding-left: 200px"> 
			<select id="select">
					<option value="goods">宝贝</option>
					<option value="shop">店铺</option>
			</select> <input id="searcher" type="text" />
			<button id="searcher-btn" name="">搜索</button>
		</span>
	</div>
	<hr style="margin-top:20px; FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#EE82EE,direction:145,strength:15)" 
								width="100%" color=#EE82EE size=2 align="center">
	<div class="">
		<div class="ulType">
				<div class="bType" >
					<span><a href="${pageContext.request.contextPath }/list?bt=男装&order=total">潮牌男装</a></span>
				</div>
				<div class="bType" >
					<span><a href="${pageContext.request.contextPath }/list?bt=流行男鞋&order=total">流行男鞋</a></span>
				</div>
				<div class="bType">
					<span><a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&order=total">时尚女装</a></span>
				</div>
				<div class="bType">
					<span><a href="${pageContext.request.contextPath }/list?bt=女鞋&order=total">精致女鞋</a></span>
				</div>
				<div class="bType" id="current">
					<span><a href="${pageContext.request.contextPath }/list?bt=内衣&order=total">私密内衣</a></span>
				</div>
				<div class="bType" >
					<span><a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&order=total">巧雅配饰</a></span>
				</div>
			</div>
			
			<div class="sType">
				<div class="saType">
					<div class="sTypeImg">
					<img src="${pageContext.request.contextPath }/images/list/list5.jpg" width="68px" height="68px">
					</div>
					<div class="sTypea">
						<div>
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=保暖上装&order=total">保暖上装</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=保暖裤&order=total">保暖裤</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=保暖套装&order=total">保暖套装</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=插片/胸垫&order=total">插片/胸垫</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=短袜/打底袜/丝袜/美腿袜&order=total">短袜/打底袜/丝袜/美腿袜</a>|
						    <a href="${pageContext.request.contextPath }/list?bt=内衣&st=吊带/背心/T恤&order=total">吊带/背心/T恤</a>|																									
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=肚兜&order=total">肚兜</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=吊袜带&order=total">吊袜带</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=搭扣&order=total">搭扣</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=肩带&order=total">肩带</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=抹胸&order=total">抹胸</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=内裤&order=total">内裤</a>|	
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=乳贴&order=total">乳贴</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=塑身上衣&order=total">塑身上衣</a>|		
						</div>
						<div>				
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=塑身美体裤&order=total">塑身美体裤</a>|	
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=塑身连体衣&order=total">塑身连体衣</a>|																										
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=睡衣上装&order=total">睡衣上装</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=睡裤/家居裤&order=total">睡裤/家居裤</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=睡裙&order=total">睡裙</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=睡袍&order=total">睡袍</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=文胸&order=total">文胸</a>|
							<a href="${pageContext.request.contextPath }/list?bt=内衣&st=文胸套装&order=total">文胸套装</a>													
						</div>					
					</div>
				</div>
			</div>
			<div class="lmain" >
			<div class="tyTitle" >
				<span>${name }</span>
				<input type="hidden" id="name" value="${name }">
				<input type="hidden" id="bt" value="${bt }">
				<input type="hidden" id="st" value="${st }"> 
			</div>
			
			<div class="tyorder">
				<input type="hidden" id="orderId" value="${order }">
				<input type="button" name="order"  id ="orderTotal" value="综合">
				<input type="button" name="order"  id ="orderDate" value="新品">
				<input type="button" name="order"  id ="orderSale" value="销量">
				<input type="button" name="order"  id ="orderPrice" value="价格">
				<input type="text" name="price" id="minPrice" value="${min }" placeholder="￥">-
				<input type="text" name="price" id="maxPrice" value="${max }" placeholder="￥">
				<input type="button"  id ="orderOk" value="确定">
			</div>
			<div>
			<ul>
				<c:forEach var="item" items="${type}" varStatus="i">

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
	</div>							
</body>
</html>