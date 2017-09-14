<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>店铺设置</title>
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
	border-radius: 0.2em;
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
	color:#000;
}

.aside {
	width: 13%;
	height: 380px;
	margin-top:20px;
	display:inline-block;
	border: 1px solid purple;
	padding-top: 10px;
	background-color: #FFFAFA;
	border-top-left-radius: 0.3em;
	border-bottom-left-radius: 0.3em;
	vertical-align: middle;
}
.section {
	width: 85.5%;
	height: 390px;
	margin-top:20px;
	display:inline-block;
	border: 1px solid purple;
	border-top-right-radius: 0.3em;
	border-bottom-right-radius: 0.3em;	
	vertical-align: middle;
}

.section div {
	margin: 8px 8px 0 8px;
}
#shoplogo,#shopintro {
	vertical-align: top;
}
#preview {
	margin-top:0;
	margin-bottom:0;
	margin-left: 80px;
}
#shoplogo,#preview,.img,#preview img {  
 	width:120px;  
 	height:120px;  
 }  

#save {
	margin-left: 88px;
	margin-top:10px;
	border: none;
	border:1px solid #EE82EE;
	width: 60px;
	height: 28px;
	background-color: #FFFAFA;
}
#baseinfo {
	border:none;
	margin:5px 20px 8px 20px;
	background-color:#fff;
	font-size: 1.1em;
	font-weight: 500;
}
#logo {
	border:none;
	background-color:#fff;
	font-size: 1.1em;
	color: #778899;
}
#logo:hover {
	border:1px solid #DCDCDC;
}
#editlogo {
	position: absolute;
	left:0;
	top:0;
}
</style>
<script type="text/javascript" src="/SuperShoppingmall/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/SuperShoppingmall/JS/shopset.js">	</script>
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
				<a href="${pageContext.request.contextPath }/index">
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
					<a>基本设置</a>
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
						<a href="${pageContext.request.contextPath }/shop?type=query">店铺基本设置</a>					
					</li>
				</ul>
			</div>
			<div class="section">

					<div>
						<input type="button" id="baseinfo" value="基本信息">
					 	<input type="button" id="logo" value="上传logo">
					</div>
					 <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#EE82EE,direction:145,strength:15)" width="100%" color="#EE82EE" size="1" >
					 <form action="${pageContext.request.contextPath }/shop?type=comp" method="post" >
					 	<div>					 	
					 	猫儿店名：<input type="text" id="shopname" name="shopname" value="${shop.shopname }">	
					 		    <input type="hidden" name="userid" value="${user.userid }">		 	
					 	</div>
					 	<div >
					 	当前图标：
					 		<div style="position: relative;display: inline;margin-left: -5px;">
						 		 <img  id="shoplogo" src="${pageContext.request.contextPath }/${shop.shoplogo}" >
						 		 <input type="hidden" id="hlogo" value="${shop.shoplogo }">
						 		<div id="editlogo" >
						 				<a  href="${pageContext.request.contextPath }/jsp/seller/shoplogoSet.jsp">编辑logo</a>					 	
						 		</div>	
					 		</div>
					 						 							 		  						 		 					 		   
					 	</div>
					 
					 	<div>
					 	店铺地址：<input type="text" id="shopaddress" name="shopaddress" value="${shop.shopaddress }">
					 	</div>
					 	<div>
					 	店铺介绍：<textarea id="shopintro" name="shopintro" rows="6" cols="22" ></textarea>
					 			<input type="hidden" id="intro" value="${shop.shopintro }">
					 	</div>
					 	<input type="submit" id="save" value="保存">
					 	<script type="text/javascript">
					 	var path = "/SuperShoppingmall/" + $('#hlogo').val();
					 	console.log(path);
					 	document.getElementById("shoplogo").src= path;
					 	var text = $('#intro').val();
					 	$('#shopintro').val(text);	
					 	
					 	</script>
					 </form>					 	
			</div>
		</div>		
		<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>