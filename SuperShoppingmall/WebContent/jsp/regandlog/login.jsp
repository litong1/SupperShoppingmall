<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script> 
<style type="text/css">
	.head{
	vertical-align:middle;
	}
	.main {
	width: 100%;
	height: 520px;
	background: url(${pageContext.request.contextPath }/images/bg3.jpg) no-repeat ;
	 
	}
	.login {
	float: right;
	margin-right: 200px;
	margin-top:35px;
	width:300px;
	height:300px;
	background-color: #FFFAFA;
	line-height: 50px;
	padding-left: 15px; 
	}
	input {
	border:none;
	width: 250px;
	height: 30px;
	border-bottom:1px solid #EDEDED;
	border-top:1px solid #EDEDED;
	border-left:1px solid #EDEDED;
	border-right:1px solid #EDEDED;
	}
	button {
	margin:10px;
	border:none;
	background-color: purple;
	width: 280px;
	height: 35px;
	border-bottom-left-radius: 0.5em;
	border-bottom-right-radius: 0.5em;
	border-top-left-radius: 0.5em;
	border-top-right-radius: 0.5em;
	color: #fff;
	}
	a {
	text-decoration:none;
	}
	.msg {
		margin-left:35px;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/layer-v3.0.3/layer/layer.js"></script>
<script type="text/javascript">

$(function() {
	
	$('#forgetPassword').click(function(){
		var name = $('#form-name').val();
		location.href = "${pageContext.request.contextPath }/test?type=forget&username="+name;
		
	});
	
	
});
</script>
	
	
</head>
<body>
	
	<div class = "head" align="left">
			<a href="index.jsp">
				<font  color="purple" size="6em" ><b>猫儿衣娘</b></font>
			</a> 
			<span>
				  <font color="black" size="3em" style = "font-weight: bold;line-height: 100px; ">欢迎登录</font>
			</span>
	</div>
	<div class="main">
		<div class = "login">
			<form action="${pageContext.request.contextPath}/user?type=login" method="post">
				<div align="center">
					<span ><font color="purple" style = "font-weight: bold">账户登录</font></span>
				</div>
				<div>
				</div>
				<div class = "msg">
					<font color="red">${requestScope.msgrs==""?"":requestScope.msgrs}</font>
				</div>
				<div >
					<img alt="" src="${pageContext.request.contextPath }/images/username.png" width="30px" height="30px" style="vertical-align:middle">
					<input type = "text" name = "username" id = "form-name" placeholder="用户名" />
				</div>
				<div class = "msg">
					<font color="red">${requestScope.msgn==""?"":requestScope.msgn}</font>
				</div>
				<div>
					<img alt="" src="${pageContext.request.contextPath }/images/password.png" width="30px" height="30px" style="vertical-align:middle">
					<input type = "password" name = "password" id = "form-pwd" placeholder="密码" />
				</div>
				<div class = "msg">
					<font color="red">${requestScope.msgp==""?"":requestScope.msgp}</font>
				</div>
				<div align="right" style = "padding-right: 15px; ">
				<a id="forgetPassword"><font color="purple">忘记密码</font></a>
				</div>
				<div class = "msg">
					<font color="red">${requestScope.forget==""?"":requestScope.forget}</font>
				</div>
				<div>
				<button type="submit" class="btn-login">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
				</div>	
			</form>
			
			<div align="right" style = "padding-right: 15px; ">
				<a href="register.jsp"><font color="purple">立即注册</font></a>
			</div>
		</div>
	</div>
</body>
</html>