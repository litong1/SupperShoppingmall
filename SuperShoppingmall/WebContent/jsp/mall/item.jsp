<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${goods.goodsTitle }</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;	
}
.top {
	margin:0 auto;
	margin-top: 12px;
	width : 85%;
}
#searcher {
	border:none;
	width: 350px;
	height: 30px;
	border-bottom:3px solid #EE82EE;
	border-top:3px solid #EE82EE;
	border-left:3px solid #EE82EE;
	border-right:3px solid #EE82EE;
	}
#searcher-btnmall {
	border:none;
	background-color: #EE82EE;
	width: 100px;
	height: 34.9px;
	color: #fff;
	margin-left: -10px;
	}
#searcher-btnself {
	border:none;
	background-color: #FFC0CB;
	width: 100px;
	height: 34.9px;
	color: red;
	border-bottom:1px solid red;
	border-top:1px solid red;
	border-left:1px solid red;
	border-right:1px solid red;
	
	}
#classify {
	display:none;
	float: left;
	width: 150px;
	height: 200px;
	background-color: #FFF5EE;
	border-bottom:1px solid #FF4500;
	border-top:1px solid #FF4500;
	border-left:1px solid #FF4500;
	border-right:1px solid #FF4500;
	color: #000;
	filter:alpha(Opacity=60);
	-moz-opacity:0.6;
	opacity: 0.6;
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
#first a:HOVER{
	background-color: #EE82EE;
}
#classify ul li:HOVER {
	width:150px;
	background-color: #EE82EE;
}
.itemMain {
	margin: 0 auto;
	margin-top:15px;
	width: 80%;
	height: auto;
	min-height: 500px;
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;
}
.itemMain div {
	margin-bottom: 18px;
}
.label {
	margin-right: 20px;
}
.itemPic {
	
	position: absolute;
}
.itemDetail {
	
	margin-left: 400px;
	margin-top: 20px;
	width: 45%;
}
.shop {	
	position:absolute;
	width:12%;
	height:300px;
	margin-left:900px;
	margin-top:-480px;
	border-bottom:1px solid #FFD700;
	border-top:1px solid #FFD700;
	border-left:1px solid #FFD700;
	border-right:1px solid #FFD700;
	vertical-align: top;
}
.itemPrice {
	width:100%;
	background-color: #FFE4E1;
}
.itemPrice div {
	display: inline-block;
}
.itemsize ,.itemcolor  {
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;	
	padding: 5px;
	margin-right: 8px;
}
.itemsize {
	width: 40px;
	height: 40px;
}
.btnNum {
	width: 25px;
	height: 25px;
	background-color: #DCDCDC;
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;	
}
#numText {
	border: none;
	width: 60px;
	height: 25px;
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;
	text-align: center;
	margin-left: -5px;	
	margin-right: -5px;
}
#secBuy {
	border: none;
	width: 135px;
	height: 40px;
	background-color:#FFE4E1;
	color:#FF4500;
	border-bottom:1px solid #C0C0C0;
	border-top:1px solid #C0C0C0;
	border-left:1px solid #C0C0C0;
	border-right:1px solid #C0C0C0;
	border-bottom-left-radius: 0.2em;
	border-bottom-right-radius: 0.2em;
	border-top-left-radius: 0.2em;
	border-top-right-radius: 0.2em;
}
#addCart {
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
.score{
	color:red;
}
#lovegoods{
	
	border: none;
	width: 130px;
	height: 35px;
	background-color:#fff;
	color: #C0C0C0;
	position: absolute;
	left:70px;
	top:455px;
}
.addSizecss {
	border: 2px solid red;
}
.addColorcss {
	border: 2px solid red;
}
th{
	font-weight: normal;
	font-size:0.920em;
	text-align: left;
}
#goodsdetail{
	width:135px;
	height:30px;
	float:left;
	line-height:30px;
	border-radius:0.3em;	
	font-weight: lighter;
	background-color: purple;
	color:#fff;
	text-align: center;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/larger.css" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath }/JS/larger.js"></script>
<script type="text/javascript">
		$(function() {			
			$('#first').mouseover(function(){
				  $('#classify').css("display","block");				 
			});
			$('#first').mouseout(function(){
				  $('#classify').css("display","none");
			});
			
			
			$(".itemsize").click(function(){
				 $(this).addClass('addSizecss').siblings().removeClass('addSizecss');		
			});
			$(".itemcolor").click(function(){
				 $(this).addClass('addColorcss').siblings().removeClass('addColorcss');		
			});
			//数量
			$('#addNum').click(function(){
				var num = $('#numText').val();
				$('#reduceNum').attr("disabled",false);				
				$('#numText').val(num*1+1);
				
			});
			$('#reduceNum').click(function(){
				
				var num = $('#numText').val();
				if(num >1){
					$('#numText').val(num*1-1);
				}else{
					$('#reduceNum').attr("disabled",true);
				}				
			});
		});		
		</script>
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
	<div align="center">
		<!-- 此处图片为店铺logo  -->
		<img alt="" src="${pageContext.request.contextPath }/images/item_1.jpg">
	</div>
	<!-- 店铺导航栏 -->
	<div class="nav">		
			<ul id="all">
				<li id="first">
					<a style="display: block;">所有宝贝</a>
					<div id="classify" >
						<ul>
							<li>按销量</li>
							<li>按新品</li>
							<li>按价格</li>
						</ul>
					</div>
				</li>			
				<li ><a>首页</a></li>
				<li ><a>热卖爆款专场</a></li>
			</ul>		
	</div>
	<!-- 商品展示部分 -->
	<div class="itemMain">
		<!-- 图片展示部分，具有放大镜功能 -->
		<div class="itemPic">
			<div class="wai">
				<div class="one">
					<img src="${pageContext.request.contextPath }/${goods.picPaths.get(0)} " width="350px" height="350px"/>
					<input type="hidden" id="hpic1" value="${pageContext.request.contextPath }/${goods.picPaths.get(0)}">
					<input type="hidden" id="hpic2" value="${pageContext.request.contextPath }/${goods.picPaths.get(1)}">
					<input type="hidden" id="hpic3" value="${pageContext.request.contextPath }/${goods.picPaths.get(2)}">
					<input type="hidden" id="hpic4" value="${pageContext.request.contextPath }/${goods.picPaths.get(3)}">
					<input type="hidden" id="hpic5" value="${pageContext.request.contextPath }/${goods.picPaths.get(4)}">	
					 <span></span>
				</div>
				<div class="two">
					<c:forEach var="path" items="${goods.picPaths}" varStatus="i">
							<img  src="${pageContext.request.contextPath }/${path}" width="50px" height="50px"/> 
					</c:forEach>
					
					
				</div>
			</div>
			<div class="the">
				<img src="${pageContext.request.contextPath }/${goods.picPaths.get(0)}" width="800px" height="800px"/>
				<input type="hidden" id="hpic1" value="${pageContext.request.contextPath }/${goods.picPaths.get(0)}">
					<input type="hidden" id="hbpic2" value="${pageContext.request.contextPath }/${goods.picPaths.get(1)}">
					<input type="hidden" id="hbpic3" value="${pageContext.request.contextPath }/${goods.picPaths.get(2)}">
					<input type="hidden" id="hbpic4" value="${pageContext.request.contextPath }/${goods.picPaths.get(3)}">
					<input type="hidden" id="hbpic5" value="${pageContext.request.contextPath }/${goods.picPaths.get(4)}">	
			</div>
			<div>
				
				<input type="button" id="lovegoods" value="☆收藏宝贝(${goods.lovenum }人气)">
			</div>
			
		</div>
		<!-- 商品详情部分 -->
		<div class="itemDetail">
			<!-- 商品标题 -->
			<div style="margin-top: 20px;">
				<span><b>${goods.goodsTitle }</b></span>
			</div>
			<!-- 商品价格 -->
			<div class="itemPrice">
				
					<span class="label">价格</span>
					<span style="color:#FF4500;font-size: 1.6em;">
						<b>￥${goods.pspecPrice}</b>
					</span>		
							
				<div style="margin-left: 150px;">
					<p>678</p>
					<p>累计评论</p>
				</div>
				<div style="margin-left: 15px;">
					<p>123</p>
					<p>交易成功</p>
				</div>
			</div>
			<!-- 配送 -->
			<div>
				<span class="label">配送</span>
				<span> ${shop.shopaddress }至  买家地址</span>
				<span>包邮</span>
			</div>
			<!-- 尺码 根据数据库中的数据 -->
			<div id="lSize">
				<span class="label" >尺码</span>
				<input type="hidden" id="hSize" value="${goods.sizeCheck }">

			</div>
			<!-- 颜色分类 -->
			<div id="lColor">
				<span class="label">颜色分类</span>
				<input type="hidden" id="hColor" value="${goods.colorName }">
			</div>
			<!-- 数量 -->
			<div>
				<span class="label">数量</span>
				<span>
					<button id = "reduceNum"class="btnNum" disabled="true"  >
						<font size="4em" ><b>-</b></font>
					</button>
					<input type="text" id="numText" value="1"/>
					<button id="addNum" class="btnNum"  >
						<font size="4em"><b>+</b></font>
					</button>
				</span>
				
			</div>
			<!-- 购买 -->
			<div>
				<button id="secBuy">立即购买</button>
				<button id="addCart">加入购物车</button>
			</div>
			<div>
				<div id="goodsdetail">宝贝详情</div>
				<table width="100%" >
					<tr>
						<th>宝贝货号：${goods.goodsNo }</th>
						<th>宝贝材质：${goods.goodsMaterial }</th>
						<th>宝贝品牌：${goods.goodsBrand }</th>
						
					</tr>
					<tr>
						<th>宝贝风格：${goods.goodsStyle }</th>
						<th>适用场景：${goods.goodsScene }</th>
						<th>适用季节：${goods.goodsSeason }</th>
					</tr>
					<tr>
						<th>适用对象：${goods.goodsTarget }</th>
						<th>上市时间：${goods.goodsComedate }</th>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- 关于店家 -->
		<div class="shop">
			<div>
				<span><b>金牌卖家</b></span>
			</div>
			<div>
				<p><a href="${pageContext.request.contextPath }/shop?shopid=${goods.userId}">${shop.shopname }</a></p>
				<p>好评率：<span>${shop.favorcomment }%</span></p>
				<p>掌柜：<span>${shop.mastername }</span></p>
			</div>
			<div>
				<div style="display: inline-block;">
					<p>描述</p>
					<p class="score">${shop.descscore }</p>
				</div>
				<div style="display: inline-block;">
					<p>服务</p>
					<p class="score">${shop.servscore }</p>
				</div>
				<div style="display: inline-block;">
					<p>物流</p>
					<p class="score">${shop.logscore }</p>
				</div>
			</div>
			<div>
			</div>
		</div>
	</div>
	<form id="form1" action="${pageContext.request.contextPath }/cart?type=add" method="post">
				<input type="hidden" name="goodsid" id="goodsid" value="${goods.goodsId }">
				<input type="hidden" name="userid" id="userid" value="${user.userid }">
				<input type="hidden" name="shopid" id="shopid" value="${shop.shopid }">
				<input type="hidden" name="shopname" id="shopname" value="${shop.shopname }">
				<input type="hidden" name="goodsPrice" id="goodsPrice" value="${goods.pspecPrice }">
				<input type="hidden" name="goodsColor" id="goodsColor" value="">
				<input type="hidden" name="goodsSize" id="goodsSize" value="">
				<input type="hidden" name="goodsNum" id="goodsNum" value="">
				<input type="hidden" name="goodsTotalPrice" id="goodsTotalPrice" value="">
	</form>
	<form id="form2" action="${pageContext.request.contextPath }/order?type=rightbuy" method="post">
				<input type="hidden" name="goodsid"  value="${goods.goodsId }">
				<input type="hidden" name="userid"  value="${user.userid }">
				<input type="hidden" name="shopid"  value="${shop.shopid }">
				<input type="hidden" name="shopname"  value="${shop.shopname }">
				<input type="hidden" name="goodsPrice" id="goodsPrice" value="${goods.pspecPrice }">
				<input type="hidden" name="goodsColor" id="goodsColor1" value="">
				<input type="hidden" name="goodsSize" id="goodsSize1" value="">
				<input type="hidden" name="goodsNum" id="goodsNum1" value="">
				<input type="hidden" name="goodsTotalPrice" id="goodsTotalPrice1" value="">
	</form>
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>