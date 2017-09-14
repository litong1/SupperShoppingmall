<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-${shop.shopname }-猫儿衣娘</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.top {
	margin: 0 auto;
	margin-top: 12px;
	width: 85%;
}

#searcher {
	border: none;
	width: 350px;
	height: 30px;
	border-bottom: 3px solid #EE82EE;
	border-top: 3px solid #EE82EE;
	border-left: 3px solid #EE82EE;
	border-right: 3px solid #EE82EE;
}

#searcher-btnmall {
	border: none;
	background-color: #EE82EE;
	width: 100px;
	height: 34.9px;
	color: #fff;
	margin-left: -10px;
}

#searcher-btnself {
	border: none;
	background-color: #FFC0CB;
	width: 100px;
	height: 34.9px;
	color: red;
	border-bottom: 1px solid red;
	border-top: 1px solid red;
	border-left: 1px solid red;
	border-right: 1px solid red;
}

#sheader {
	margin: 0 auto;
	width: 80%;
	margin-top: 10px;
}

#headerLeft {
	display: inline;
	text-align: left;
}

#headerRight {
	display: inline;
	padding-left: 500px;
}

#entershop {
	border: none;
	width: 60px;
	height: 25px;
	background-color: #FF4500;
	color: #fff;
	border-radius: 0.2em;
}

#loveshop {
	border: none;
	width: 60px;
	height: 25px;
	background-color: #FA8072;
	color: #fff;
	border-radius: 0.2em;
}

#classify {
	display: none;
	float: left;
	width: 150px;
	height: 200px;
	background-color: #000000;
	border-bottom: 1px solid #FF4500;
	border-top: 1px solid #FF4500;
	border-left: 1px solid #FF4500;
	border-right: 1px solid #FF4500;
	color: #fff;
	filter: alpha(Opacity = 92);
	-moz-opacity: 0.92;
	opacity: 0.92;
	position: absolute;
	z-index: 2;
}

#classify li {
	list-style: square;
}

.nav {
	width: 100%;
	height: 40px;
	background-color: #DCDCDC;
	line-height: 40px;
	padding-left: 180px;
}

#all li {
	float: left;
	width: 100px;
}

#first a:HOVER {
	background-color: #EE82EE;
}

#classify ul li:HOVER {
	width: 150px;
	background-color: #696969;
}

#shopContent {
	margin: 0 auto;
	width: 80%;
	margin-top: 10px;
}

#toplist {
	display: inline-block;
	width: 20%;
	height: 450px;
	border: 1px solid #DCDCDC;
	vertical-align: top;
}

#toptitle {
	text-align: center;
	height: 25px;
	line-height: 25px;
	background-color: #800080;
	color: #fff;
}

#toptype {
	height: 35px;
	margin-left: 15px;
	margin-top: 10px;
}

.typeborder {
	border-top: 1px solid #DCDCDC;
	border-left: 1px solid #DCDCDC;
	border-right: 1px solid #DCDCDC;
}
#hDiv ul:LAST-CHILD{
	display: none;
}
#goodsList {
	width: 78%;
	height: atuo;
	min-height:1000px;
	border: 1px solid #DCDCDC;
	display: inline-block;
	vertical-align: middle;
}
.itemsc {
	margin: 10px ;
	border-bottom: 1px solid #DCDCDC;
}

.iteml {
	display: inline-block;
	vertical-align: middle;
}

.itemr {
	display: inline-block;
	vertical-align: middle;
}

.price {
	color: #FF4500;
}

.goodstitle {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	width: 130px;
}
#seainfo{
	margin: 10px;
}
input[name=price] {
	width: 60px;
}
#query {
	border:none;
	width:50px;
	height:20px;
	margin-left:20px;
	background-color: #fff;
	border: 1px solid #DCDCDC;
}	
#query:hover {
	background-color: #C0C0C0;
	color: #fff;
}
.tyorder {
	height:30px;
	line-height:30px;
	border-bottom:1px solid #DCDCDC;
}
input[name=order] {
	border:thin;
	background-color: #fff;
	width: 50px;
	height: 25px;
	border-right: 1px solid #DCDCDC;	
}
.ocolor{
	color:#FF4500;
}
.itemc {
	width: 270px;
	height: 371px;
	display: inline-block;
	background-color: #E6E6FA;
	margin: 8px 1px 8px 1px;	
}
.itemc:hover {
	border: 1px solid #EE82EE;
}
#ullist {
margin-left: 10px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/shop.js"></script>
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
	<div  class="top" >
		<span> 
			<a href="#"><font color="purple" size="6em"><b>猫儿衣娘</b></font></a>
		</span> 
		<span style="padding-left: 400px"> 
				<input id="searcher"type="text" />
				<button id="searcher-btnmall" name="" >搜猫儿</button>
				<button id="searcher-btnself">搜本店</button>
			</span>
	</div>
	<div id="sheader">
		<div id="headerLeft">
			<input type="hidden" id="shopid" value="${shop.shopid }">
			<span>店铺：${shop.shopname }</span>
			<input type="button" id="entershop" value="进入店铺">
			<span>[描述：<span class="price">${shop.descscore }</span>|
				       物流：<span class="price">${shop.logscore }</span>|
				       服务：<span class="price">${shop.servscore }</span>]</span>
		</div>
		<div id="headerRight">
			
			<input type="button" id="loveshop" value="收藏店铺">
		</div>
	</div>
	<div align="center">
		<!-- 此处图片为店铺logo  -->
		<img alt="" src="${pageContext.request.contextPath }/images/item_1.jpg">
	</div>
	<div class="nav">		
			<ul id="all">
				<li id="first">
					<a style="display: block;">所有宝贝</a>
					<div id="classify" >
						<ul>
							<li class="navOrder">按销量</li>
							<li class="navOrder">按新品</li>
							<li class="navOrder">按价格</li>
							<li class="navOrder">按收藏</li>
						</ul>
					</div>
				</li>			
				<li ><a>首页</a></li>
				<li ><a>热卖爆款专场</a></li>
			</ul>		
	</div> 
	<script type="text/javascript">
		$('#first').mouseover(function(){
			  $('#classify').css("display","block");				 
		});
		$('#first').mouseout(function(){
			  $('#classify').css("display","none");
		});
	</script>
	<div id="shopContent">
	
		<!-- 宝贝排行榜 -->
		<div id="toplist">
			<div id="toptitle">
				<span>宝贝排行榜</span>
			</div>
			<div id="toptype">
				<span id="salenum">销售量</span>
				<span id="lovenum">收藏数</span>
			</div>
			
			<div id="hDiv">
				<ul >
					<c:forEach var="item" items="${topSalenum}" varStatus="i" begin="0" end="4">
	
						<li class="itemsc">
							<div class ="iteml">
								<img alt="" src="${pageContext.request.contextPath }/${item.picPaths.get(0) }" width="50" height="50">
							</div>
							<div class ="itemr">
								<div class="goodstitle">
									${item.goodsTitle }
								</div>
								<input type="hidden" class="gid" value="${item.goodsId }">
								<div>
									<span class="price">￥${item.pspecPrice }</span>
								</div>
								<div>
									<span >已售出<span class="price">${item.salenum }</span>件</span>
									
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>										
				<ul>
					<c:forEach var="item" items="${topLovenum}" varStatus="i" begin="0" end="4">
	
						<li class="itemsc">
							<div class ="iteml">
								<img alt="" src="${pageContext.request.contextPath }/${item.picPaths.get(0) }" width="50" height="50">
							</div>
							<div class ="itemr">
								<div class="goodstitle">
									${item.goodsTitle }
								</div>
								<input type="hidden" class="gid" value="${item.goodsId }">
								<div>
									<span class="price">￥${item.pspecPrice }</span>
								</div>
								<div>
									<span >已收藏<span class="price">${item.lovenum }</span>笔</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 商品列表 -->
		<div id="goodsList">
			<div id="seainfo">
				<span>关键字：<input type="text" id="keyword" value="${kw }"></span>
				<span>价格：<input type="text" name="price" id="minPrice" width="30" placeholder="￥" value="${min }">-
						  <input type="text" name="price" id="maxPrice" width="30" placeholder="￥" value="${max}">
				</span>
				<input type="button" id="query" value="搜索" >
			</div>
			<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#EE82EE size=1>
			<div class="tyorder">
				<span>排序：</span>
				<input type="hidden" id="orderId" value="${order }">
				<input type="button" name="order"  id ="orderTotal" value="综合">
				<input type="button" name="order"  id ="orderDate" value="新品">
				<input type="button" name="order"  id ="orderSale" value="销量">
				<input type="button" name="order"  id ="orderPrice" value="价格">
				<input type="button" name="order"  id ="orderLove" value="收藏">
			</div>
			
			<div>
				<ul id="ullist">
				<c:forEach var="item" items="${goodsList}" varStatus="i">

					<li class="itemc"><img alt=""
						src="${pageContext.request.contextPath }/${item.picPaths.get(0) }"
						width="270" height="270">
						<div>
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
					</li>

				</c:forEach>
			</ul>
			</div>
		</div>
	</div> 
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>