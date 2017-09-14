<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.ll.mall.vo.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超级商城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/app.css">
<style type="text/css">
	
	a {
 	text-decoration:none;	 
	}	
	.header {
 	text-align:center; 
	margin:20px;
	/* margin:0 auto; */
	}
	#searcher {
	border:none;
	width: 500px;
	height: 35px;
	border-bottom:3px solid #EE82EE;
	border-top:3px solid #EE82EE;
	border-right:3px solid #EE82EE;
	}
	#searcher-btn {
	border:none;
	background-color: #EE82EE;
	width: 150px;
	height: 40.5px;
	color: #fff;
	margin-left: -10px;
	}
	#select {
	border:none;
	width:60px;
	height: 40.5px;
	margin-right:-5px;
	border-bottom:3px solid #EE82EE;
	border-top:3px solid #EE82EE;
	border-left:3px solid #EE82EE;
	border-right:1px solid #DCDCDC;
	background-color: #FFFAFA;
	}
	
	.model{
	margin:0 auto;
	margin-top: 30px;
	width : 90%;
	}
	.sweet {	
		
  	border-bottom:1px solid #EDEDED;
	border-top:1px solid #EDEDED;
	border-left:1px solid #EDEDED;
	border-right:1px solid #EDEDED; 
	margin:10px;
	padding: 15px;
	}
	#h_right {
	width: 305px;
	height: 350px;
	float: left;
	background: #FFDAB9;
	display: inline-block;
	vertical-align:top;	
	text-align: center;
	margin-left: 5px;
	}
	#toh {	
	margin-top: 20px;
	margin-bottom: 30px;	
	}
	.btn {
	text-align:center;
	border:none;
	width: 75px;
	height: 35px;
	background-color:#FF8C00;
	color: #fff;
	margin: 10px;	
	}
	.avatar {
	margin: 20px;
	}
	.dai {
	display: inline-block;
	padding: 10px;		
	}
	#sort{
	background-color: #EE82EE;
	color: #fff;
	width:150px;
	height: 350px;
	float: left;
	margin-right: 5px;
	}
	#sort a {
	color: #000;
	}
	#sort div:FIRST-CHILD{
	margin-top: 5px;
	}
	#sort div{
	height:30px;
	line-height:30px;
	padding-left: 15px;
	}
	.hTitle {
	margin-top: 20px;
	margin-left: 15px;
	}
	.hCona a{
	text-decoration: underline;
	margin-left: 5px;
	margin-right: 5px;
	}
	.tab {		
	background-color: #FFFAFA;
	border-left: 2px solid #EE82EE;
	}
	#hDiv li{
	float: left;
	display:none;
	width:750px;
	height:346px;
	background-color:#FFFAFA;
	position: absolute;
	left :215px;	
	z-index: 2;
	border-right: 2px solid #EE82EE;
	border-top: 2px solid #EE82EE;
	border-bottom: 2px solid #EE82EE;
	}
	#hDiv a {
	color: #000;
	}
	.cancelNav {
	border:none;
	width:20px;
	height:20px;
	background-color: #FF4500;
	border-bottom-left-radius: 50%;
	border-bottom-right-radius: 50%;
	border-top-left-radius: 50%;
	border-top-right-radius: 50%;
	}
	.itemc {
	width: 235px;
	height: 336px;
	display: inline-block;
	background-color: #E6E6FA;
	}
	.itemc:hover {
	border-left: 1.2px solid #EE82EE;
	border-right: 1.2px solid #EE82EE;
	border-top: 1.2px solid #EE82EE;
	border-bottom: 1.2px solid #EE82EE;
	}
	.price {
	float:left;
	color: #FF4500;
	font-size: 1.2em;
	}
	.btTitle {
	margin-top:10px;
	margin-bottom:8px;
	font-size: 1.2em;
	text-align: center;
	}
	
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/layer-v3.0.3/layer/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/index.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/search.js"></script> 
<script type="text/javascript">
	function openwin() {
		layer.open({
			  type: 2,
			  area: ['600px', '360px'],
			  shadeClose: true, //点击遮罩关闭
			  content: '${pageContext.request.contextPath }/jsp/mall/page.jsp'
			  });
		//layer.tips('Hello tips!', '#searcher-btn');
	}
</script>

</head>
<body >
	<c:choose>
		<c:when test="${empty sessionScope.user }">		
			<jsp:include page="/jsp/include/header2.jsp"></jsp:include>
		</c:when>	
		<c:otherwise>
			<jsp:include page="/jsp/include/header1.jsp"></jsp:include> 
		</c:otherwise>		
	</c:choose>	
	<div class="model">
			<div>
				<span >
					<a href = "${pageContext.request.contextPath }/index"><font  color="purple" size="6em" ><b>猫儿衣娘</b></font></a>				
				</span>			
				
 				<span style="padding-left: 200px">
	 				<select id="select">
						<option value="goods">宝贝</option>
						<option value="shop">店铺</option>
					</select>
 					<input id = "searcher" type = "text"/>
 					<button id="searcher-btn" name="" >搜索</button>
 				</span>
 			</div>	
 		  <div id="toh">
 		  <div class="nav">
				<div id="sort">
					<div  id="man">
						<a href="${pageContext.request.contextPath }/list?bt=男装&order=total">男装</a>/ 
						<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&order=total">男鞋</a>					
						&nbsp;&nbsp;&nbsp;>
					</div>
					<div  id="woman">
						<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&order=total">女装</a>/ 
						<a href="${pageContext.request.contextPath }/list?bt=女鞋&order=total">女鞋</a>
						&nbsp;&nbsp;&nbsp;>
					</div>
					<div  id="other">
						<a href="${pageContext.request.contextPath }/list?bt=内衣&order=total">内衣</a>/ 
						<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&order=total">配饰</a>
						&nbsp;&nbsp;&nbsp;>
					</div>
				</div>

				<ul id="hDiv">
					<li class="show">
						<div class="hFirst">
							<div class="hTitle">
								<span><a href="${pageContext.request.contextPath }/list?bt=男装&order=total">男装</a></span>								
							</div>
							<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#FFE7BA size=2>
							<div class="hContent">					
								<div class="hCona">
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=衬衫&order=total">衬衫</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=夹克&order=total">夹克</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=毛呢大衣&order=total">毛呢大衣</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=棉衣&order=total">棉衣</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=民族服装&order=total">民族服装</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=牛仔裤&order=total">牛仔裤</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=Polo衫&order=total">Polo衫</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=皮裤&order=total">皮裤</a>
								</div>
								<div class="hCona">
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=皮衣&order=total">皮衣</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=T恤&order=total">T恤</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=套装&order=total">套装</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=卫衣&order=total">卫衣</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=休闲裤&order=total">休闲裤</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=西服&order=total">西服</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=西裤&order=total">西裤</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=西服套装&order=total">西服套装</a>
								</div>
								<div class="hCona">
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=羽绒裤&order=total">羽绒裤</a>
									<a href="${pageContext.request.contextPath }/list?bt=男装&st=针织衫/毛衣&order=total">针织衫/毛衣</a>									
								</div>									
							</div>
						</div>
						<div class="hSecond">
							<div class="hTitle">
								<span><a href="${pageContext.request.contextPath }/list?bt=流行男鞋&order=total">男鞋</a></span>								
							</div>
							<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#FFE7BA size=2>
							<div class="hContent">
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=低帮鞋&order=total">低帮鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=帆布鞋&order=total">帆布鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=网鞋&order=total">网鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=高帮鞋&order=total">高帮鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=凉鞋&order=total">凉鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=拖鞋&order=total">拖鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=皮鞋&order=total">皮鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=靴子&order=total">靴子</a>
									<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&st=雨鞋&order=total">雨鞋</a>								
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="hFirst">
							<div class="hTitle">
								<span><a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&order=total">女装</a></span>
							</div>
							<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#FFE7BA size=2>											
							<div class="hContent">							
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=半身裙&order=total">半身裙</a>
			 						<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=背心吊带&order=total">背心吊带</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=衬衫&order=total">衬衫</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=短外套&order=total">短外套</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=大码女装&order=total">大码女装</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=风衣&order=total">风衣</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=婚纱/旗袍/礼服&order=total">婚纱/旗袍/礼服</a>								
								</div>
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=裤子&order=total">裤子</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=连衣裙&order=total">连衣裙</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=蕾丝衫/雪纺衫&order=total">蕾丝衫/雪纺衫</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=马夹&order=total">马夹</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛针织衫&order=total">毛针织衫</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛衣&order=total">毛衣</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛呢外套&order=total">毛呢外套</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=棉衣/棉服&order=total">棉衣/棉服</a>								
								</div>
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=抹胸&order=total">抹胸</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=牛仔裤&order=total">牛仔裤</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=皮衣&order=total">皮衣</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=皮草&order=total">皮草</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=T恤&order=total">T恤</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛衣&order=total">毛衣</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=毛呢外套&order=total">毛呢外套</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=套装/学生制服/工作制服&order=total">套装/学生制服/工作制服</a>								
								</div>
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=唐装/民族服装/舞台服装&order=total">唐装/民族服装/舞台服装</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=卫衣/绒衫&order=total">卫衣/绒衫</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=西装&order=total">西装</a>
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=羽绒服&order=total">羽绒服</a>									
									<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&st=中老年女装&order=total">中老年女装</a>																
								</div>
							</div>
						</div>
						<div class="hSecond">
							<div class="hTitle">
								<span><a href="${pageContext.request.contextPath }/list?bt=女鞋&order=total">女鞋</a></span>
							</div>								
							<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#FFE7BA size=2>
							<div class="hContent">							
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=女鞋&st=低帮鞋&order=total">低帮鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=女鞋&st=帆布鞋&order=total">帆布鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=女鞋&st=高帮鞋&order=total">高帮鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=女鞋&st=高跟鞋&order=total">高跟鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=女鞋&st=凉鞋&order=total">凉鞋</a>
									<a href="${pageContext.request.contextPath }/list?bt=女鞋&st=靴子&order=total">靴子</a>
									<a href="${pageContext.request.contextPath }/list?bt=女鞋&st=雨鞋&order=total">雨鞋</a>												
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="hFirst">
							<div class="hTitle">
								<span><a href="${pageContext.request.contextPath }/list?bt=内衣&order=total">内衣</a></span>
							</div>
							<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#FFE7BA size=2>
							<div class="hContent">							
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=保暖上装&order=total">保暖上装</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=保暖裤&order=total">保暖裤</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=保暖套装&order=total">保暖套装</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=插片/胸垫&order=total">插片/胸垫</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=短袜/打底袜/丝袜/美腿袜&order=total">短袜/打底袜/丝袜/美腿袜</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=吊带/背心/T恤&order=total">吊带/背心/T恤</a>																
								</div>
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=肚兜&order=total">肚兜</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=吊袜带&order=total">吊袜带</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=搭扣&order=total">搭扣</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=肩带&order=total">肩带</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=抹胸&order=total">抹胸</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=内裤&order=total">内裤</a>	
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=乳贴&order=total">乳贴</a>	
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=塑身上衣&order=total">塑身上衣</a>		
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=塑身美体裤&order=total">塑身美体裤</a>	
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=塑身连体衣&order=total">塑身连体衣</a>													
								</div>
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=睡衣上装&order=total">睡衣上装</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=睡裤/家居裤&order=total">睡裤/家居裤</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=睡裙&order=total">睡裙</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=睡袍&order=total">睡袍</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=文胸&order=total">文胸</a>
									<a href="${pageContext.request.contextPath }/list?bt=内衣&st=文胸套装&order=total">文胸套装</a>																						
								</div>
							</div>
						</div>
						<div class="hSecond">
							<div class="hTitle">
								<span><a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&order=total">配饰</a></span>
							</div>
							<hr style="filter: alpha(opacity=0,finishopacity=100,style=1)" width="100%" color=#FFE7BA size=2>
							<div class="hContent">							
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=耳套&order=total">耳套</a>
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=婚纱礼服配件&order=total&order=total">婚纱礼服配件</a>
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=口袋巾&order=total">口袋巾</a>
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=领带夹&order=total">领带夹</a>
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=帽子&order=total">帽子</a>
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=手套&order=total">手套</a>	
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=手帕&order=total">手帕</a>																					
								</div>
								<div class="hCona">							
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=围巾/丝巾/披肩&order=total">围巾/丝巾/披肩</a>
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=袖扣&order=total">袖扣</a>
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=鞋/皮带 配件&order=total">鞋/皮带 配件</a>
									<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&st=腰带/皮带/腰链&order=total">腰带/皮带/腰链</a>																												
								</div>
							</div>
						</div>
					</li>
					
				</ul>
			</div>
 		   <script>
	        $('#sort div').mouseover(function() {
	            var i = $(this).index();//下标第一种写法
	            //var i = $('tit').index(this);//下标第二种写法	
	            $(this).addClass('tab').siblings().removeClass('tab');
	            $('#hDiv li').eq(i).show().siblings().hide();
	            
	        });
	        $(".nav").mouseleave(function() {
	        	 console.log("bbb");
	        	 $('#hDiv li').hide();
		    	 $('#sort div').removeClass('tab');
	             
	        });
	      
   		 </script>
 		  <div class="slider">
				<div class="slider-img">
					<ul class="slider-img-ul">
						<li><img
							src="${pageContext.request.contextPath }/images/nav/navpic05.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath }/images/nav/navpic01.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath }/images/nav/navpic02.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath }/images/nav/navpic03.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath }/images/nav/navpic04.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath }/images/nav/navpic05.jpg"></li>
						<li><img
							src="${pageContext.request.contextPath }/images/nav/navpic01.jpg"></li>
					</ul>
				</div>
				<script type="text/javascript" src="${pageContext.request.contextPath }/JS/xSlider.js"></script> 
			</div>
			
			<div id="h_right">
				<c:choose>
					<c:when test="${empty sessionScope.user }">
						<div class="avatar">
							<img src="${pageContext.request.contextPath }/images/getAvatar.jpg">
							<p>Hi,你好！</p>
						</div>
						
						<div>
							<button class="btn">登录</button>
							<button class="btn">注册</button>
							<button class="btn">开店</button>
						</div>
					</c:when>
				    <c:otherwise>
				    	<div class="avatar">
				    		<img src="${pageContext.request.contextPath }/${user.avatar}" width="100px;" height="100px">
							<p>${user.username }</p>
				    	</div>
						
						<div >
							<div class="dai">
								<p><font color="#EE82EE">1</font></p>
								<p><font color="#000">待收货</font></p>
							</div>
							<div class="dai">
								<p><font color="#EE82EE">0</font></p>
								<p><font color="#000">待发货</font></p>
							</div>
							<div class="dai">
								<p><font color="#EE82EE">0</font></p>
								<p><font color="#000">待付款</font></p>
							</div>
							<div class="dai">
								<p><font color="#EE82EE">4</font></p>
								<p><font color="#000">待评价</font></p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>				
 			<div id="divGt">
				<div>
													
					<!-- 类型 -->
					<div class="btTitle">
					
						-----☛<a href="${pageContext.request.contextPath }/list?bt=男装&order=total">潮牌男装</a>☚-----
					</div>
					<!-- 商品 -->
					<ul>
						<c:forEach var="item" 
							items="${listman}" varStatus="i">
	
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
			<div>
					<!-- 类型 -->
					<div class="btTitle">
						-----☛<a href="${pageContext.request.contextPath }/list?bt=流行男鞋&order=total">流行男鞋</a>☚-----
					</div>
					<!-- 商品 -->
					<ul>
						<c:forEach var="item" 
							items="${listmshoes}" varStatus="i">
	
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
			<div>
				<!-- 类型 -->
				<div class="btTitle">
					-----☛<a href="${pageContext.request.contextPath }/list?bt=女装/女士精品&order=total">时尚女装</a>☚-----
				</div>
				<!-- 商品 -->
				<ul>
					<c:forEach var="item" begin="1" end="5" step="1"
						items="${listwoman}" varStatus="i">

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
			<div>
					<!-- 类型 -->
					<div class="btTitle">
						-----☛<a href="${pageContext.request.contextPath }/list?bt=女鞋&order=total">精致女鞋</a>☚-----
					</div>
					<!-- 商品 -->
					<ul>
						<c:forEach var="item" 
							items="${listwshoes}" varStatus="i">
	
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
			<div>
					<!-- 类型 -->
					<div class="btTitle">
						-----☛<a href="${pageContext.request.contextPath }/list?bt=内衣&order=total">私密内衣</a>☚-----
					</div>
					<!-- 商品 -->
					<ul>
						<c:forEach var="item" 
							items="${listunder}" varStatus="i">
	
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
			<div>
					<!-- 类型 -->
					<div class="btTitle">
						-----☛<a href="${pageContext.request.contextPath }/list?bt=皮带/帽子/围巾&order=total">巧雅配饰</a>☚-----
					</div>
					<!-- 商品 -->
					<ul>
						<c:forEach var="item" 
							items="${listorna}" varStatus="i">
	
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
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
</body>
</html>