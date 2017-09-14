<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>猫儿衣娘-卖家中心</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin.css">
<style type="text/css">

</style>
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
						<p class="adtitle"><b>交易管理</b></p>
						<a href="${pageContext.request.contextPath }/jsp/seller/list_sold_items.jsp">已卖出的宝贝</a>
						<a>评价管理</a>
						<hr style="width:88%;height:0.1px; "color=#F7F7F7></hr>
					</li>
					<li>
						<p class="adtitle"><b>宝贝管理</b></p>
						<a href="${pageContext.request.contextPath }/jsp/seller/publish.jsp">发布宝贝</a>
						<a href="${pageContext.request.contextPath }/seller?shopid=${user.userid}">出售中的宝贝</a>
						<a>仓库中的宝贝</a>
						<hr style="width:88%;height:0.1px; "color=#F7F7F7></hr>
					</li>
					<li>
						<p class="adtitle"><b>店铺管理</b></p>
						<a>查看猫儿店铺</a>
						<a>宝贝分类管理</a>	
						<a href="${pageContext.request.contextPath }/shop?type=query">店铺基本设置</a>					
					</li>
				</ul>
			</div>
			<div class="section">
				<div id="mallset">
					<div id="setleft">
						<div style="display: inline-block;margin: 20px;">
							<img src="${pageContext.request.contextPath }/images/getAvatar.jpg">
						</div>						
						<div style="display: inline-block;">
							<p>店铺名</p>
							<p><a>店铺设置</a>|<a>查看店铺</a></p>
							<p>我的支付宝：<span>15717415044</span></p>
						</div>
						
						
					</div>
					
					<div id="setright">
						
						<p style="margin: 10px;"><b>店铺动态评分</b></p>
						<table align="center" style="margin: 10px;"width="100%">
							<tr>
								<td>描述相符:</td>
								<td>服务态度:</td>
								<td>物流服务:</td>
								<td>售后态度:</td>
								<td>售后速度:</td>
							</tr>
							<tr>
								<td>暂无评分</td>
								<td>暂无评分</td>
								<td>暂无评分</td>
								<td>暂无评分</td>
								<td>暂无评分</td>
							</tr>
							
						</table>
					</div>
				<div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>