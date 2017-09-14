<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>时尚女装</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/list.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/list.js"></script> 
</head>
<body>
	<c:choose>
		<c:when test="${empty sessionScope.user }">		
			<jsp:include page="/jsp/include/header2.jsp"></jsp:include>
		</c:when>	
		<c:otherwise>
			<jsp:include page="/jsp/include/header1.jsp"></jsp:include> 
		</c:otherwise>		
	</c:choose>
	<div id="header">
		<span> 
			<a href="#"><font color="purple" size="6em"><b>猫儿衣娘</b></font></a>
		</span> 
		
		<span style="padding-left: 200px"> 
			<select id="select">
					<option value="goods">宝贝</option>
					<option value="shop">店铺</option>
			</select> <input id="searcher" type="text" />
			<button id="searcher-btn" name="">搜索</button>
		</span>
	</div>
	<hr style="margin-top:20px; FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#EE82EE,direction:145,strength:15)" 
								width="100%" color=#EE82EE size=2 align="center">
	<div class="">
		<div class="ulType">
				<div class="bType" >
					<span><a href="${pageContext.request.contextPath }/list?bt=男装&order=total">潮牌男装</a></span>
				</div>
				<div class="bType" >
					<span><a href="${pageContext.request.contextPath }/list?bt=流行男鞋&order=total">流行男鞋</a></span>
				</div>
				<div class="bType" id="current">
					<span><a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&order=total">时尚女装</a></span>
				</div>
				<div class="bType">
					<span><a href="${pageContext.request.contextPath }/list?bt=女鞋&order=total">精致女鞋</a></span>
				</div>
				<div class="bType" >
					<span><a href="${pageContext.request.contextPath }/list?bt=内衣&order=total">私密内衣</a></span>
				</div>
				<div class="bType" >
					<span><a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&order=total">巧雅配饰</a></span>
				</div>
			</div>
								
			<div class="sType">
				<div class="saType">
					<div class="sTypeImg">
					<img src="${pageContext.request.contextPath }/images/list/list3.jpg" width="68px" height="68px">
					</div>
					<div class="sTypea">
						<div>
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=半身裙&order=total">半身裙</a>|
			 				<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=背心吊带&order=total">背心吊带</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=衬衫&order=total">衬衫</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=短外套&order=total">短外套</a>|
						    <a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=大码女装&order=total">大码女装</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=风衣&order=total">风衣</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=婚纱/旗袍/礼服&order=total">婚纱/旗袍/礼服</a>|																				
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=裤子&order=total">裤子</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=连衣裙&order=total">连衣裙</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=蕾丝衫/雪纺衫&order=total">蕾丝衫/雪纺衫</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=马夹&order=total">马夹</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛针织衫&order=total">毛针织衫</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛衣&order=total">毛衣</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛呢外套&order=total">毛呢外套</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=棉衣/棉服&order=total">棉衣/棉服</a>|
						</div>
						<div>
						    <a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=抹胸&order=total">抹胸</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=牛仔裤&order=total">牛仔裤</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=皮衣&order=total">皮衣</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=皮草&order=total">皮草</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=T恤&order=total">T恤</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛衣&order=total">毛衣</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛呢外套&order=total">毛呢外套</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=套装/学生制服/工作制服&order=total">套装/学生制服/工作制服</a>|																					
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=唐装/民族服装/舞台服装&order=total">唐装/民族服装/舞台服装</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=卫衣/绒衫&order=total">卫衣/绒衫</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=西装&order=total">西装</a>|
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=羽绒服&order=total">羽绒服</a>|								
							<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=中老年女装&order=total">中老年女装</a>	
						</div>
					</div>					
				</div>						
			</div>
			<div class="lmain" >
			<div class="tyTitle" >
				<span>${name }</span>
				<input type="hidden" id="name" value="${name }">
				<input type="hidden" id="bt" value="${bt }">
				<input type="hidden" id="st" value="${st }"> 
			</div>
			
			<div class="tyorder">
				<input type="hidden" id="orderId" value="${order }">
				<input type="button" name="order"  id ="orderTotal" value="综合">
				<input type="button" name="order"  id ="orderDate" value="新品">
				<input type="button" name="order"  id ="orderSale" value="销量">
				<input type="button" name="order"  id ="orderPrice" value="价格">
				<input type="text" name="price" id="minPrice" value="${min }" placeholder="￥">-
				<input type="text" name="price" id="maxPrice" value="${max }" placeholder="￥">
				<input type="button"  id ="orderOk" value="确定">
			</div>
			<div>
			<ul>
				<c:forEach var="item" items="${type}" varStatus="i">

					<li class="itemc"><img alt=""
						src="${pageContext.request.contextPath }/${item.picPaths.get(0) }"
						width="233" height="234">
						<div>
							<div>
								<input type="hidden" class="gid" value="${item.goodsId }">
								<input type="hidden" class="userid" value="${item.userId }">
								<span>${item.goodsTitle }</span>
							</div>
							<div>
								<span class="price">￥${item.pspecPrice }</span> <span
									style="float: right;margin-right: 30px;">销量:${item.salenum }</span>
							</div>
						</div></li>

				</c:forEach>
			</ul>
			</div>
		</div>
	</div>						
</body>
</html>