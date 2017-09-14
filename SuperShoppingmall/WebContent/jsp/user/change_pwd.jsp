
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改密码</title>
<style type="text/css">

a {
	text-decoration: none;
}

a:HOVER {
	color: red;
}

input {
	border: none;
	width: 65%;
	height: 35px;
}

.main {
	margin-left: 200px;
}

.form-item {
	width: 300px;
	height: 50px;
	line-height: 50px;
	margin: 10px;
	border-bottom: 1px solid #EDEDED;
	border-top: 1px solid #EDEDED;
	border-left: 1px solid #EDEDED;
	border-right: 1px solid #EDEDED;
}

label {
	margin-right: 20px;
}

button {
	margin: 10px;
	border: none;
	background-color: purple;
	width: 130px;
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#submit").on("click",function() {
			var pwd1 = $("#form-pwd").val();
			var pwd2 = $("#form-equalTopwd").val();
			if (pwd1!=""&&pwd2!=""&&pwd1==pwd2) {
	            var form=document.getElementById("form");
	            form.submit();
			} else {
				alert("请输入相同密码");
			}
		});
		$("#cancle").on("click",function() {
			window.history.back();  //返回上一页
		});
	});
</script>
</head>
<body>
	
	<div style="margin-top: 20px;">
		<div>
		<div align="left">
			<a href="${pageContext.request.contextPath }/jsp/mall/index.jsp">
				<font color="purple" size="6em"><b>猫儿衣娘</b></font>
			</a>
		</div>
	</div>
	<hr style="filter: alpha(opacity = 0, finishopacity = 100, style = 1)"
		width="100%" color=#FFE7BA size=3>
	<br>
	<br>
	<div class="main" id="form-main">
		<form id="form"
			action="${pageContext.request.contextPath}/changePasswordServlet?username=<%=request.getParameter("username") %>"
			method="post">
			<div class="msg">
				<font color="red">${requestScope.msgn==""?"":requestScope.msgn}</font>
			</div>
			<div class="form-item">
				<label> 新 密 码</label> <input type="password" id="form-pwd"
					name="pwd" maxlength="20" placeholder="建议至少使用两种字符组合" /> <i
					class="i-status"></i>
			</div>
			<div class="msg">
				<font color="red">${requestScope.msgp==""?"":requestScope.msgp}</font>
			</div>
			<div class="form-item">
				<label> 确 认 密 码</label> <input type="password" id="form-equalTopwd"
					name="pwdRepeat" maxlength="20" placeholder="请再次输入密码" /> <i
					class="i-status"></i>
			</div>

		</form>
		<div>
			<button id="submit">确认</button>
			<button id="cancle">取消</button>
		</div>
	</div>
	</div> 
	


</body>
</html>