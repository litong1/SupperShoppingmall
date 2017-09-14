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
 	text-decoration:none;	 
	}
	#searcher {
	border:none;
	width: 500px;
	height: 33px; 
	border-bottom:3px solid #EE82EE;
	border-top:3px solid #EE82EE;
	border-right:3px solid #EE82EE;
	}
	#searcher-btn {
	border:none;
	background-color: #EE82EE;
	width: 150px;
	height: 40.5px;
	color: #fff;
	margin-left: -10px;
	}
	#select {
	border:none;
	width:60px;
	height: 40.5px;
	margin-right:-5px;
	border-bottom:3px solid #EE82EE;
	border-top:3px solid #EE82EE;
	border-left:3px solid #EE82EE;
	border-right:1px solid #DCDCDC;
	background-color: #FFFAFA;
	}
	#main {
	width: 80%;
	margin: 0 auto;
	}
	.items {
	width: 235px;
	height: 336px;
	display: inline-block;
	background-color: #FFFAFA;
	margin-top: 8px;
	margin-bottom: 8px;
	}
	.items:hover {
	border: 1.2px solid #EE82EE;
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
			<input type="hidden" id="input" value="${keyword }">	
			<button id="searcher-btn" name="">搜索</button>
		</span>
	</div>
	<hr>
	<div id="main">
		<div>
			<ul>
				<c:forEach var="item" items="${shoplist}" varStatus="i">

					<li class="items"><img alt=""
						src="${pageContext.request.contextPath }/${item.shoplogo }"
						width="233" height="234">
						<div>
							<div style="margin: 7px;">
								<input type="hidden" class="shopid" value="${item.shopid }">
								♔${item.shopname }
								<span style="margin-left: 50px;">${item.shopaddress }</span>
							</div>
							<div style="margin: 7px;">
								掌柜名：${item.mastername } 
								
							</div>
							<div style="margin: 7px;">
								好评率:${item.favorcomment }%
							</div>
						</div></li>

				</c:forEach>
			</ul>
		</div>
	</div>
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>