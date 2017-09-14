<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a {
 		text-decoration:none;	 
	}
	body {
		background-color: #F0F0F0;
	}
	#header {
		margin: 0 auto;
		margin:20px;
		width: 80%;
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
	margin-left:200px;	
	text-align:center;
	background-color: #FF4500;
/* 	display: inline; */
	width: 80%;
	height: 50px;
	border-radius: 0.3em;
	vertical-align: middle;
	line-height: 50px;
	}
	#aside {
	margin-top:20px;
	width: 20%;
	background-color: #EBEBEB;
	height: auto;
	min-height: 600px;
	float: left;
	}
	#photo {	
	padding: 20px;
	}
	#title{
	padding-left: 20px;
	}
	
</style>
</head>
<body >
	<jsp:include page="header1.jsp"></jsp:include>
	<div class="mainx">
		<div id="header">	
			
			<a href=""><img alt="" src="${pageContext.request.contextPath }/images/logo2.png" style="vertical-align: middle;"></a>
			
			<div id = "right" >
				<a href="index.jsp" ><span>首页&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
				<select>
					<option value="">安全设置</option>
					<option value="">个人资料</option>
					<option value="">收获地址</option>
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
					<img alt="" src="${pageContext.request.contextPath }/images/logo.jpg" width="120px" height="120px">
				</div>
				<div id="title">
				<span><font style="font-weight: bold;text-align: center">账户管理</font></span>
				</div>	
				<div>
					<ul>
						<li><a href="">安全设置</a></li>
						<li><a href="">个人资料</a></li>
						<li><a href="">收获地址</a></li>				
					</ul>
				</div>
			</div>
		   <div>
		  </div>
			
		
	</div>
</body>
</html>