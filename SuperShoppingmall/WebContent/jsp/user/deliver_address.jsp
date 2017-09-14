
<%@page import="com.ll.mall.dao.*" %>
<%@page import="com.ll.mall.vo.*" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收货地址</title>
<style type="text/css">
	*{
	
	}
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
	#sec-con {
	margin: 0 auto; 
 	width: 90%; 
 	margin-top: 20px; 
	}
	#photo {	
	padding: 20px;
	}
	#title{
	padding-left: 20px;
	}
	#sec-title {
	background-color: #F0F8FF;
	width: 98.5%;
	height: 35px;
	line-height: 35px; 
	padding-left: 15px;
	}
	#def-add {
	margin-left: 70px;
	}
	#submit {
	border:none;
	background-color: #EEEE00;
	border-top-left-radius: 0.3em;
	border-bottom-left-radius: 0.3em;	
	border-top-right-radius: 0.3em;
	border-bottom-right-radius: 0.3em;	
	margin-left: 70px;
	margin-top:20px;
	width: 60px;
	height: 30px;
	}
	table {
	border-color: #EDEDED;
	border-style: solid;
	}
</style>
</head>
<body >
	<%
		String username = request.getParameter("username");
		UserBaseInfo showUserBaseInfo = new UserBaseInfo();
		User u = showUserBaseInfo.getInfo(username);
		DeliverAddress deliverAddress = new DeliverAddress();
		List<Address> list = deliverAddress.getDeliverAddress(username);
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
				<div id="sec-title">
					<label><b>收货地址</b></label>
					</div>
				<div id="sec-con">
					<div>
						<span><font color="#EE7600">新增收货地址</font>&nbsp;</span>
						<span>电话号码、手机号选填一项, 其余均为必填项</span>
					</div>
					<form action="${pageContext.request.contextPath }/AddressServlet?username=<%=username %>" method="post">
						<p>
							<label>所在地区<font color="#EE7600">*</font></label>
							<input type="text" id="" name="location" size=45/>
						</p>
						<p>
							<label>详细地址<font color="#EE7600">*</font></label>
							<textarea name="detailedaddress" style = "vertical-align:top" rows="5" cols="40"  placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息"></textarea>
						</p>
						<p>
							<label>邮政编码&nbsp;&nbsp;</label>
							<input type="text" id="" name="postalcode" size="40"placeholder="如您不清楚邮递区号，请填写000000"/>
						</p>
						<p>
							<label>收货人姓名<font color="#EE7600">*</font></label>
							<input type="text" id="" name="consigneename" placeholder="长度不超过25个字符"/>
						</p>
						<p>
							<label>手机号码<font color="#EE7600">*</font></label>
							<input type="text" id="" name="tel"/>
						</p>
						<div id="def-add">
							<input type="checkbox" id="" name="isdefault" /><label>设置为默认收货地址</label>
						</div>
						<input id = "submit" type="submit" value="保存"/>
					</form>
					<hr style="width:98%;height:0.1px; "color=#F7F7F7></hr>
					<div>
						<table  border="1px" width="100%" cellspacing="0" cellpadding="0">
							<tr>
								<th>收货人</th>
								<th>所在地区</th>
								<th>详细地址</th>
								<th>邮编</th>
								<th>手机号</th>
								<th>操作</th>
								<th>other</th>
							</tr>
							<%
								for (Address a : list) {
									out.println("<tr>");
									out.println("<td>"+ a.getConsigneeName() +"</td>");
									out.println("<td>"+ a.getLocation() +"</td>");
									out.println("<td>"+ a.getDetailAddress() +"</td>");
									out.println("<td>"+ a.getPostalCode() +"</td>");
									out.println("<td>"+ a.getTel() +"</td>");
									out.println("<td>"+ "<a href=''>修改</a>|<a href=''>删除</a>" +"</td>");
									String isdefaultAddress = a.getIsDefault() == 1 ? "默认地址" : "非默认";
									out.println("<td>"+ isdefaultAddress +"</td>");
									out.println("</tr>");
								}
							%>

						</table>
					</div>
			</div>
		</div>
	</div>
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>