<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ll.mall.dao.*" %>
<%@page import="com.ll.mall.vo.*" %>
<%@page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全设置</title>
<style type="text/css">
	a {
 		text-decoration:none;	 
	}
	#header {		
	width: 100%;
	}
	.mainx {
		margin: 0 auto;
		width:80%;	
	}
	#am-text {
	margin-left: 150px;
	padding-left:35px;
	height: 30px;
	}
	#am-btn {
	text-align:center;
	border: none;
	background-color: #EBEBEB;
	height: 35px;
	margin-left: -5px;
	padding-left: 30px;
	}
	#right {	
	background-color: #DDA0DD;
	width: 100%;
	height: 50px;
	border-radius: 0.2em;
	vertical-align: middle;
	line-height: 50px;
	}
	#aside {
	margin-top:20px;
	width: 17%;
	background-color: #FFFAFA;
	border: 1px solid purple;
	height: 500px;
	display:inline-block;
	border-top-left-radius: 0.3em;
	border-bottom-left-radius: 0.3em;
	vertical-align: middle;	
	}
	#section {
	margin-top:20px;
	border: 1px solid purple;
	width: 82%;
	background-color: #fff;
	height: 500px;
	vertical-align: middle;
	display:inline-block;
	border-top-right-radius: 0.3em;
	border-bottom-right-radius: 0.3em;	
	}
	#photo {	
	padding: 20px;
	}
	#title{
	padding-left: 20px;
	}
	#sec-con {
	margin: 0 auto; 
 	width: 90%; 
 	margin-top: 20px; 
	}
	
	.textlen {
	line-height: 24px;
 	display:block;
 	height:50px;
 	overflow:hidden;
 	width:500px;
	}
	.sec {		
	border-bottom:1px dashed #EBEBEB;	
	}
	.itemc {
	width: 152px;
	height: 200px;
	display: inline-block;
	background-color: #E6E6FA;
	margin-top: 8px;
	margin-bottom: 8px;
	}
	.goodstitle{
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	width: 130px;
	}
	.price{
	color:#FF4450;
	}
	.deletegoods {
	position: absolute;
	left:0;
	top:0;
	z-index: 1;
	display: none;
	}
	input[name=deletegoods] {
	border: none;
	width:30px;
	height:30px;
	background-color: #C0C0C0;
	filter: alpha(Opacity = 60);
	-moz-opacity: 0.60;
	opacity: 0.60;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function() {
	$(".itemc").mouseover(function(){
		$(this).find(".deletegoods").css("display","block");
	});
	$(".itemc").mouseout(function(){
		$(this).find(".deletegoods").css("display","none");
	});
	$(".itemcontent").click(function(){
		var goodsid = $(this).find(".gid").val();
		var shopid = $(this).find(".userid").val();
		location.href = "item?gid="+goodsid+"&shopid="+shopid;	
	});
	$(".deletegoods").click(function(){
		var goodsid = $(this).find(".gid").val();
		location.href = "love?type=deletegoods&goodsid=" + goodsid;
	});
	
});
</script>
</head>
<body >
	<%
		String username = request.getParameter("username");
		UserBaseInfo showUserBaseInfo = new UserBaseInfo();
		User u = showUserBaseInfo.getInfo(username);
		Account account = new Account();
		List<AccountInfo> list = account.getAccountInfo(username);
		int userid = list.get(0).getUserid();
	%>
	<jsp:include page="/jsp/include/header1.jsp"></jsp:include>
	<div class="mainx">
		<div id="header">	
			
			<a href="${pageContext.request.contextPath }/index"> 
				<font color="purple" size="6em"><b>猫儿衣娘</b></font>
			</a>
			<span>
				<font color="black" size="3em" style = "font-weight: bold;line-height: 100px; ">我的猫屋</font>
			</span>
			
			<div id = "right" >
				<a href="index.jsp" ><span>首页&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
				<select>
					<option value="">安全设置</option>
					<option value="">个人资料</option>
					<option value="">收货地址</option>
				</select>
				<a href="">&nbsp;&nbsp;&nbsp;消息</a>
				<form action="" method="post" style="display: inline;">
					<input id="am-text" type="text" name="">
					<input id="am-btn" type="button" name="" value="搜索">
				</form>
									
			</div>
		</div>
		
			<div id="aside">
				<div id="photo">
					<img alt="" src="${pageContext.request.contextPath }/<%=u.getAvatar() %>" width="120px" height="120px">
				</div>
				<div id="title">
					<span><font style="font-weight: bold;text-align: center">账户管理</font></span>
				</div>	
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/jsp/user/account_security.jsp?username=${user.username}">安全设置</a></li>
						<li><a href="${pageContext.request.contextPath }/jsp/user/baseInfoSet.jsp?username=${user.username}">个人资料</a></li>
						<li><a href="${pageContext.request.contextPath }/jsp/user/deliver_address.jsp?username=${user.username}">收货地址</a></li>				
					</ul>
				</div>
				<div id="title">
					<span><font style="font-weight: bold;text-align: center">收藏夹</font></span>
				</div>	
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath }/love?type=goodslist&username=${user.username}">收藏的宝贝</a></li>
						<li><a href="${pageContext.request.contextPath }/love?type=shoplist&username=${user.username}">收藏的店铺</a></li>						
					</ul>
				</div>
			</div>
		<div id="section">
			<div style="margin: 10px 0 5px 25px;">
				<span>宝贝收藏</span>
			</div>
			<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#EE82EE size=1>
			<div>
				<ul>
					<c:forEach var="item" items="${goodslist}" varStatus="i">

					<li class="itemc">
						<div style="position: relative;">
							<img alt=""
								 src="${pageContext.request.contextPath }/${item.picPaths.get(0) }"
								 width="150" height="150">
							<div class="deletegoods">
								<input type="hidden" class="gid" value="${item.goodsId }">
								<input type="hidden" class="userid" value="${item.userId }">
								<input type="button" name="deletegoods" value="✖">
							</div>
						</div>
						<div class="itemcontent">
								<input type="hidden" class="gid" value="${item.goodsId }">
								<input type="hidden" class="userid" value="${item.userId }">
							<div class="goodstitle">
								${item.goodsTitle }
							</div>
							<div>
								<span class="price">￥${item.pspecPrice }</span>
							</div>
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