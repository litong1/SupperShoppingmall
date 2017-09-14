<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已卖出的宝贝</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin.css">
<style type="text/css">
.itemlist {	
	float: left;
	margin-left:15px;
	padding-right:15px;
	margin-top:15px;
	margin-bottom:10px;
	width: auto;
	height: 20px;
	text-align:center;
	line-height: 20px;
	border-right: 1px solid #DCDCDC;
}
#trItemlist{
	border:none;
	font-weight:100;
	border: 2px solid #C0C0C0;
	width: 100%;
	height: 30px;
	background-color: #FFFAF0;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/My97DatePicker/WdatePicker.js"></script> 
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
				<p id="asm">卖家管理</p>
				<ul id="ul2">
					<li>
						<p class="adtitle"><b>交易管理</b></p>
						<a href="${pageContext.request.contextPath }/seller?type=insale">出售中的宝贝</a>
						<a>评价管理</a>
						<hr style="margin:5px;FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="88%" color=#987cb9 size=1 align="center">
					</li>
					<li>
						<p class="adtitle"><b>宝贝管理</b></p>
						<a>发布宝贝</a>
						<a>出售中的宝贝</a>
						<a>仓库中的宝贝</a>
						<hr style="margin:5px; FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="88%" color=#987cb9 size=1 align="center">						
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
				<div  id="searchCondition">
					<form action="" method="post">
						<table width="100%">
							<tr>
								<td>
									<span>商品编号:&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<input type="text" style="width:200px;height:25px;" />
								</td>
							</tr>
							<tr>
								<td>
									<span>宝贝名称:&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<input type="text" style="width:200px;height:25px;" />
								</td>
								<td>
									<span>成交时间:&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<input type="text" id ="Begtime" name="Begtime"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  />
								</td>
							</tr>
							<tr>
								<td>
									<span>买家昵称:&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<input type="text" style="width:200px;height:25px;" />
								</td>
								<td>
									<span>评价状态:&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<input type="text" style="width:200px;height:25px;" />
								</td>
								
							</tr>
							<tr>
								<td>
									<span>订单编号:&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<input type="text" style="width:200px;height:25px;" />
								</td>
								<td>
									<span>订单状态:&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<input type="text" style="width:200px;height:25px;" />
								</td>
							</tr>
						</table>
						
						<button id="selectorder">搜索订单</button>
					</form>
				</div>
				<div id="divHide">
				<input id="btnHide" type="button" value="收起△" style="border: none;background-color: #fff;color:#C0C0C0">
				</div>
				<script type="text/javascript">
				window.onload = function() {
					
						var hide = document.getElementById("btnHide");
					    var flag = true;
						hide.onclick = function() {
							if(flag){
								document.getElementById('searchCondition').style.display = "none";
								document.getElementById("btnHide").value="展开搜索条件▽";
								flag=false;
							}else{
								document.getElementById('searchCondition').style.display = "block";
								document.getElementById("btnHide").value="收起△";
								flag=true;
							}
						}
						
				}
				</script>
				<hr style="margin:5px; FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#987cb9 size=1 align="center">
				<div >
					<div class="itemlist">
						<div><a>近一个月订单</a></div>
					</div>
					<div class="itemlist">
						<div><a>等待发货</a></div>
						
					</div>
					<div class="itemlist">
						<div><span>已发货</span></div>
						
					</div>
					<div class="itemlist">
						<div><a>需要评价</a></div>
						
					</div>
					<div class="itemlist">
						<div><a>一个月前订单</a></div>
						
					</div>
					<hr style="margin:5px; FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#DCDCDC,direction:145,strength:15)" width="100%" color=#DCDCDC size=2 align="center">
				</div>
				<div>
					<table width="100%" align="center">
						<tr id="trItemlist">
							<th width="30%">宝贝</th>
							<th>单价</th>
							<th>数量</th>							
							<th>买家</th>
							<th>交易状态</th>
							<th>实收款</th>
							<th>评价</th>
						</tr>
						<!-- 暂无例子 -->
					</table>
				</div>
			</div>
		</div>
</body>
</html>