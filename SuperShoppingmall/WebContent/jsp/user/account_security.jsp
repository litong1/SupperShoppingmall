<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ll.mall.dao.*" %>
<%@page import="com.ll.mall.vo.*" %>
<%@page import="java.util.List" %>
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
</style>
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
						<li><a href="${pageContext.request.contextPath }/love?type=goodslist">收藏的宝贝</a></li>
						<li><a href="${pageContext.request.contextPath }/love?type=shoplist">收藏的店铺</a></li>						
					</ul>
				</div>
			</div>
		<div id="section">
			<div id="sec-con">
				<div>
					<span><font style="font-weight: bold">您的基本信息</font></span>
					<table>
						<tr>
							<td>会员名：</td>
							<td>${user.username }</td>
						</tr>
						<tr>
							<td>签到天数：</td>
							<td><%=list.get(0).getSignDays() %>天</td>
						</tr>
						<tr>
							<td>积分总数：</td>
							<td><%=list.get(0).getScore() %>分</td>
						</tr>
					</table>
				</div>
				<hr style="width:95%;height:1px; "color=#F7F7F7></hr>
				<div>
						<span><font style="font-weight: bold">您的安全服务</font></span>
						<table  width=87% cellspacing="0" cellpadding="0" align="center" style="border-collapse: collapse;">
							<tr class="sec">
								<td>已设置</td>
								<td>登录密码</td>
								<td><span class="textlen">安全性高的密码可以使账号更安全。建议您定期更换密码，且设置一个包含数字和字母，并长度超过6位以上的密码。</span></td>
								<td><a href="${pageContext.request.contextPath }/jsp/user/change_pwd.jsp?username=<%=request.getParameter("username")%>">修改</a></td>
							</tr>
							<tr class="sec">
							    <!-- 这里设置应该是一个字段，有已设置和未设置两种 -->
							    <%
							    	if (list.get(0).getIsQuestion() == 0) {
							    		out.println("<td>未设置</td>");
							    	} else {
							    		out.println("<td>已设置</td>");
							    	}
							    %>
								<td>密保问题</td>
								<td><span class="textlen">是您找回登录密码的方式之一。建议您设置一个容易记住，且最不容易被他人获取的问题及答案，更有效保障您的密码安全。</span></td>
								<td><a href="${pageContext.request.contextPath }/jsp/user/change_questions.jsp?username=${user.username}">设置</a></td>
							</tr>
						</table>
				</div>
			</div>
		</div>		
	</div>
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>