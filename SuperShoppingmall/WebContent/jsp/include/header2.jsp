<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/header.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath }/JS/header.js" type="text/javascript"></script>

</head>
<body>
	<div class = "main">
			<div class = "left" >
				<a href = "${pageContext.request.contextPath }/jsp/regandlog/login.jsp" ><font color="purple">亲，请登录</font></a>
				<a href = "${pageContext.request.contextPath }/jsp/regandlog/register.jsp" ><font class="text">免费注册</font></a>
			</div>
			
		   	<div class = "right" >
		   <ul id="ul1">
		   			<li><a class = "title" href="${pageContext.request.contextPath }/index">猫儿衣娘首页</a>
		   				<div>
		   				</div>
		   			</li>
		   			<li><a class = "title" href="#"><font class="text"> 我的猫儿</font></a>
		   				<div id="my">
		   					<a href="#">已买到的宝贝</a>
		   					<a href="#">我的足迹</a>
		   				</div>
		   			</li>
		   			<li><a class = "title" href = "mycart.jsp">
			   				<img alt="" src="${pageContext.request.contextPath }/images/cart.png" width="30px" height="30px" style="vertical-align:middle"/>
			   				<font class="text"> 购物车</font>
			   			</a>
			   			<div id="cart">
			   				<p></p>
			   			</div>
		   			</li>
		   			<li><a class = "title" href = "#">
							<img alt="" src="${pageContext.request.contextPath }/images/favs.png" width="30px" height="30px" style="vertical-align:middle"/>
							<font class="text">收藏夹</font>
						</a>
		   				<div id="collection">
		   					<a href="#">收藏的宝贝</a>
		   					<a href="#">收藏的店铺</a>
		   				</div>
		   			</li>
		   			<li><a class = "title" href = "${pageContext.request.contextPath }/jsp/seller/admin.jsp"><font class="text">卖家中心</font></a>
		   				<div id="seller">
		   					<a href="#">我要开店</a>
		   					<a href="#">已卖出的宝贝</a>
		   					<a href="#">出售中的宝贝</a>
		   				</div>
		   			</li>
		   		</ul>
		   	</div>
		   
		
	</div>
</body>
</html>