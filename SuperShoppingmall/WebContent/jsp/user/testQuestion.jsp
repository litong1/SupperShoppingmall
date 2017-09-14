<%@page import="com.ll.mall.vo.AccountInfo" %>
<%@page import="com.ll.mall.dao.Account" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证密保</title>
<style type="text/css">

a {
	text-decoration: none;
}

a:HOVER {
	color: red;
}

textarea {
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
			var username = $('#username').val();
			var q1 = $("#question1").val();
			var q2 = $("#question2").val();
			var q3 = $("#question3").val();
			if (q1 != "" && q2 != "" &&q3 != "") {
	            location.href="test?type=test&username="+username+"&input1="+q1+"&input2="+q2+"&input3="+q3;
			} else {
				alert("密保答案都不能为空");
			}
		});
		$("#cancle").on("click",function() {
			window.history.back();  //返回上一页
		});
	});
</script>
</head>

<body>
	 
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
			<input type="hidden" id="username" value="${username }">
			<div class="msg">
				<font color="red">${requestScope.msgn==""?"":requestScope.msgn}</font>
			</div>
			<label>密保一：你的第一任女朋友最爱吃什么？</label>
			<div class="form-item">
				<label>答案一：</label> 
				<textarea rows="1" cols="10" style="resize:none" id="question1" name="question1" ></textarea>
			</div>
			<label>密保二：你的第二任女朋友最爱什么颜色？</label>
			<div class="msg">
				<font color="red">${requestScope.msgp==""?"":requestScope.msgp}</font>
			</div>
			<div class="form-item">
				<label>答案二：</label> 
				<textarea rows="1" cols="10" style="resize:none" id="question2" name="question2" ></textarea>
			</div>
			<label>密保三：你的第三任女朋友叫什么？</label>
			<div class="form-item">
				<label>答案三：</label>
				<textarea rows="1" cols="10" style="resize:none" id="question3" name="question3" ></textarea>
			</div>
		<div><span style="color: red;">${error }</span></div>
		<div>
			<button id="submit">确认</button>
			<button id="cancle">取消</button>
		</div>
	</div>


</body>
</html>