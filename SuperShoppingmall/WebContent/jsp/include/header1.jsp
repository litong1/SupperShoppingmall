<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/header.css">
<style type="text/css">

</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/layer-v3.0.3/layer/layer.js"></script>
<script src="${pageContext.request.contextPath }/JS/header.js" type="text/javascript" charset="utf-8" ></script>
<script type="text/javascript" charset="utf-8">
$(function() {
	
	$('#cartlist').mouseover(function(){
		
		$.getJSON("${pageContext.request.contextPath }/cart?type=listjson", function(data) {
		 $(".list").html("");//清空内容
		 
		 
	       $.each(data.list, function(i, item) {
	    	  
	        	if(i<=3){
	        		 var url = "${pageContext.request.contextPath }/"+item.picPaths[0];
	        		 var delurl = "${pageContext.request.contextPath }/cart?type=indexdelete&goodsid="+item.goodsid;
	        		 var goodsurl = "${pageContext.request.contextPath }/item?gid="+item.goodsid+"&shopid="+item.shopid;
	        		 $(".list").append(	        				
	 	            		"<div  style='display:block;'>"+
	 	            			
	 	            			"<div  style='display:inline-block;'>"+
			  						"<div  >"+"<img class='pic' src='' width='40px' height='40px'></div >"+
			  	 	 			"</div >"+
	 	            			"<div  style='display:inline-block;'>"+
	    					  		 	"<div  class='carttitle' style='display:block;'>"+"<a class='goodstitle' href=''>"+item.goodsTitle+"</a>"+"</div >"+
	   					  		 		"<div >颜色："+item.goodsColor+";尺寸："+item.goodsSize+"</div >"+
	    					  	 "</div >"+
	    					  	"<div class='opeadel' style='display:inline-block;'>"+
	    					  			"<input type='hidden' class='goodsid' value=''> "+
   					  					"<div >"+"<font color='red'>￥"+item.goodsPrice+"</font>"+"</div >"+
  					  		 			"<div >"+"<a  class='deletecart' href='' >删除"+"</a>"+"</div >"+
   					  	 	 	"</div >"+
	    					  "</div >");
	        		 $(".pic").eq(i).attr("src",url);
	        		 $(".goodsid").eq(i).attr("value",item.goodsid);
	        		 $(".deletecart").eq(i).attr("href",delurl);
	        		 $(".goodstitle").eq(i).attr("href",goodsurl);
	        	}           
	        });
	       
	        });
		 

		
	}); 
	$(".lookcart").click(function(){
		location.href="cart?type=list";
	});
	
});

function sellerCenter(){
	//href = "${pageContext.request.contextPath }/jsp/seller/admin.jsp"
	var role = $('#role').val();
	if(role==='卖家'){
		location.href = "${pageContext.request.contextPath }/jsp/seller/admin.jsp";
	}else if(role==='买家'){
		openshop();
	}
	
}
function openshop() {
	var role = $('#role').val();
	if(role==='卖家'){
		alert("您已经是卖家了0.0");
	}else if(role==='买家'){
		location.href = '${pageContext.request.contextPath }/jsp/seller/openshop.jsp';
	}
}
</script>
</head>
<body>
	<div class = "main">
			<input type="hidden" id="userid" value="${user.userid }">
			<div class = "left" >
				<a href = "${pageContext.request.contextPath }/jsp/user/baseInfoSet.jsp?username=${user.username}" ><font class="text">${user.username }</font></a>
				<a href = "${pageContext.request.contextPath }/user?type=logout" ><font class="text">退出</font></a>			
			</div>	
			
			<font ></font>	
		   	<div class = "right" >
		   		<ul id="ul1">
		   			<li ><a class = "title" href="${pageContext.request.contextPath }/index">猫儿衣娘首页</a>
		   				<div>
		   				</div>
		   			</li>
		   			<li><a class = "title" href = "${pageContext.request.contextPath }/jsp/user/baseInfoSet.jsp?username=${user.username}"><font class="text"> 我的猫儿</font></a>
		   				<div id="my">
		   					<a href="#">已买到的宝贝</a>
		   					<a href="#">我的足迹</a>
		   				</div>
		   			</li>
		   			<li><a class = "title" href = "${pageContext.request.contextPath }/cart?type=list" id="cartlist">
			   				<img alt="" src="${pageContext.request.contextPath }/images/cart.png" width="30px" height="30px" style="vertical-align:middle"/>
			   				<font class="text"> 购物车</font>
			   			</a>
			   			<div id="cart">
			   				<p><b>最近加入的宝贝：</b></p>
			   				<!-- 查询购物车表，列出物品 -->
			   				<span class="list">
			   				</span>
			   				<hr>
			   				<button class="lookcart">查看我的购物车</button>
			   			</div>
		   			</li>
		   			<li><a class = "title" href = "#">
							<img alt="" src="${pageContext.request.contextPath }/images/favs.png" width="30px" height="30px" style="vertical-align:middle"/>
							<font class="text">收藏夹</font>
						</a>
		   				<div id="collection">
		   					<a href="${pageContext.request.contextPath }/love?type=goodslist">收藏的宝贝</a>
						<a href="${pageContext.request.contextPath }/love?type=shoplist">收藏的店铺</a>
		   				</div>
		   			</li>
		   			<li><a class = "title"  onclick="sellerCenter()"><font class="text">卖家中心</font></a>
		   				<input type="hidden" id="role" value="${user.role}">
		   				<div id="seller">
		   					<a  onclick="openshop()">我要开店</a>
		   					<a href="#">已卖出的宝贝</a>
		   					<a href="#">出售中的宝贝</a>
		   				</div>
		   				
		   			</li>
		   		</ul>
			   	
		   	</div>
		
	</div>
</body>
</html>