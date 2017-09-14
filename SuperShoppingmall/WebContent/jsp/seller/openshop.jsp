<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	* {
	margin: 0 auto;
	}
	#p {
	text-align: center;
	margin-top: 40px;
	font-size: 1.2em;
	font-weight: 500;
	}
	#btn {
	border: none;
	width:80px;
	height:30px;
	background-color: #FFFFF0;
	border: 1px solid orangered;
	border-bottom-left-radius: 0.1em;
	margin-top: 25px;
	}
	
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/layer-v3.0.3/layer/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/openshop.js"></script>
<title>申请卖家</title>
</head>
<body>
	<p id="p">您正在申请成为卖家...</p>
	<div align="center">
		<input type="button" id="btn" value="确定继续">
		<input type="hidden" id="userid" value="${user.userid }">
		<input type="hidden" id="username" value="${user.username }">		
	</div>	
</body>
</html>