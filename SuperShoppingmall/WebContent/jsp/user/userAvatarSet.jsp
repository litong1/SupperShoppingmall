<%@page import="com.ll.mall.dao.UserBaseInfo"%>
<%@page import="com.ll.mall.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人资料</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/My97DatePicker/WdatePicker.js"></script>
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
	padding-top: 0px;
	}
	#right {	
	background-color: #DDA0DD;
	width: 100%;
	height: 50px;
	border-radius: 0.2em;
	vertical-align: middle;
	line-height: 50px;
	}
	#right a{
	margin-left: 30px;
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
	#section div {
	margin:8px 0 8px 8px;

	}
	#photo {	
	padding: 20px;
	}
	#title{
	padding-left: 20px;
	}
	#submit {
	border:none;
	background-color: #EEEE00;
	border-top-left-radius: 0.3em;
	border-bottom-left-radius: 0.3em;	
	border-top-right-radius: 0.3em;
	border-bottom-right-radius: 0.3em;	
	margin-left: 80px;
	width: 60px;
	height: 30px;
	}
	hr {
	FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#EE82EE,direction:145,strength:15);
	width:100%;
	}
	.section div {
	margin: 8px 8px 0 8px;
}
#shoplogo,#preview img {
vertical-align: top;
}
#preview {
	display: inline;
	
}
#preview,.img,#preview img {  
 	width:120px;  
 	height:120px;  
 }  

#save {
	margin-left: 105px;
	margin-top:15px;
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
	color: #778899;
	
}
#logo {
	border:none;
	
	background-color:#fff;
	font-size: 1.1em;
	font-weight: 500;
}
#baseinfo:hover {
	border:1px solid #DCDCDC;
}
#file {
margin-left: 88px;
}
</style>
<script type="text/javascript" src="/SuperShoppingmall/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/SuperShoppingmall/JS/userset.js">	</script>
</head>
<body >
	<%
		String username = request.getParameter("username");
		UserBaseInfo showUserBaseInfo = new UserBaseInfo();
		User u = showUserBaseInfo.getInfo(username);
		
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
				<a href="${pageContext.request.contextPath }/index" ><span>首页&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
				<select>
					<option value="">安全设置</option>
					<option value="">个人资料</option>
					<option value="">收货地址</option>
				</select>
				<a href="">&nbsp;&nbsp;&nbsp;消息</a>
				<form action="" method="post" style="display: inline;margin-left: 70px;">
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
				<div>
						<input type="button" id="baseinfo" value="基本信息">
					 	<input type="button" id="logo" value="上传头像">
					 	<input id="username" name="username" type="hidden" value="<%=u.getUsername()%>" />
					</div>
					 <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#EE82EE,direction:145,strength:15)" width="100%" color="#EE82EE" size="1" >
					 <form action="${pageContext.request.contextPath }/base?type=uploadavatar" method="post" enctype="multipart/form-data">
					 	
					 	<div>
					 	上传头像：<div id="preview">
					 				<img  id="shoplogo" src="${pageContext.request.contextPath }/<%=u.getAvatar() %>" width="100px" height="100px">
					 		    </div>	
					 		    <div>
					 		     <input type="file" id="file" name="file" value="上传logo" onchange="preview(this)" />				 		  						 		 					 		   				 			
					 		    </div>					 		    
					 	</div>					 					 	
					 	<input type="submit" id="save" value="上传">
					 </form>
					
			</div>	
	</div>
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>