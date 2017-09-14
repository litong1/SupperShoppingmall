
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人注册</title>
<style type="text/css">
	a{
	text-decoration:none;
	}
	a:HOVER{
	color: red;
	}
	input {
	border:none;
	width :65%;
	height: 35px;
	}
	.main{
	margin-left:200px;
	}
	.form-item {
	 
	width: 300px;
	height: 50px;
	line-height: 50px; 
	margin:10px;
	border-bottom:1px solid #EDEDED;
	border-top:1px solid #EDEDED;
	border-left:1px solid #EDEDED;
	border-right:1px solid #EDEDED;
	}
	label{
	margin-right:20px;
	}
	button {
	margin:10px;
	border:none;
	background-color: purple;
	width: 300px;
	height: 50px;
	border-bottom-left-radius: 0.5em;
	border-bottom-right-radius: 0.5em;
	border-top-left-radius: 0.5em;
	border-top-right-radius: 0.5em;
	color: #fff;
	font-size: 1em;
	}
	.msg {
	margin-left: 10px;
	}
</style>
</head>
<body>
	<div>
		<div align="left">
			<a href="${pageContext.request.contextPath }/jsp/mall/index.jsp">
				<font  color="purple" size="6em" ><b>猫儿衣娘</b></font>
			</a> 
			<span>
				  <font color="black" size="3em" style = "font-weight: bold;line-height: 100px; ">欢迎注册</font>
			</span>
		</div>
		<div align="right">
			<span><font color="black" >已有账号？</font></span>
			<a href = "login.jsp">请登录</a>
		</div>
	</div>
	<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#FFE7BA size=3>
	<br>
	<br>
	<div class = "main" id = "form-main">
		<form action="${pageContext.request.contextPath}/user?type=reg" method="post">
			<div class = "form-item">
				<label > 用   户   名&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="text" id="form-acount" name="regname" maxlength="20"  placeholder="您的账户名和登录名"/>
				
			</div>
			<div class="msg">
				<font color="red">${requestScope.msgn==""?"":requestScope.msgn}</font>
			</div>
			<div class = "form-item">
				<label> 设 置 密 码</label>
				<input type="password" id="form-pwd" name="pwd" maxlength="20"  placeholder="建议至少使用两种字符组合"/>
				<i class = "i-status"></i>
			</div>
			<div class="msg">
				<font color="red">${requestScope.msgp==""?"":requestScope.msgp}</font>
			</div>
			<div class = "form-item">
				<label> 确 认 密 码</label>
				<input type="password" id="form-equalTopwd" name="pwdRepeat" maxlength="20"  placeholder="请再次输入密码"/>
				<i class = "i-status"></i>
			</div>
			<div class="msg">
				<font color="red">${requestScope.msgr==""?"":requestScope.msgr}</font>
			</div>
			<div>
				<button type="submit" class="btn-register">立即注册</button>
			</div>
	    </form>
	</div>
	
	
</body>
</html>