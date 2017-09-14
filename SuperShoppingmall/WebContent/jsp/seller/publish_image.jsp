<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布图片</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}
.goodsAttr {
	margin:0 auto;
	margin-top: 30px;
	width : 95%;
	}
.preview,.img,img {  
 	width:150px;  
 	height:150px;  
 }  
#preview  {  
	border:1px solid #000;  
}
#subImage {
text-align:center;
margin-top: 35px;
}
input[type="submit"]{
	border:none;
	width:50;
	height:30px;
	border-bottom-left-radius:0.2em;
	border-bottom-right-radius:0.2em;
	border-top-left-radius:0.2em;
	border-top-right-radius:0.2em;
	background-color: #EE82EE;
	color: #fff;
	margin:0 auto;
}
</style>
<script type="text/javascript" src="/SuperShoppingmall/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/SuperShoppingmall/JS/publish.js"></script>
</head>
<body>
	<form action = "/SuperShoppingmall/image?id=${goods.goodsId }" method="post" enctype="multipart/form-data">
		<div class="goodsAttr">
			<span>宝贝图片</span>
			<div>
				<div style="display: inline-block;">
					<input type="file" name="picfile" onchange="preview1(this)">
					<div class="preview" id="preview1">
						<img id="add1" src="${pageContext.request.contextPath }/images/imgadd.png">
					</div>
				</div>
				<div style="display: inline-block;">
					<input type="file" name="picfile" onchange="preview2(this)">
					<div class="preview" id="preview2">
						<img id="add2" src="${pageContext.request.contextPath }/images/imgadd.png">
					</div>
				</div>
				<div style="display: inline-block;">
					<input type="file" name="picfile" onchange="preview3(this)">
					<div class="preview" id="preview3">
						<img id="add3" src="${pageContext.request.contextPath }/images/imgadd.png">
					</div>
				</div>
				<div style="display: inline-block;">
					<input type="file" name="picfile" onchange="preview4(this)">
					<div class="preview" id="preview4">
						<img id="add4" src="${pageContext.request.contextPath }/images/imgadd.png">
					</div>
				</div>
				<div style="display: inline-block;">
					<input type="file" name="picfile" onchange="preview5(this)">
					<div class="preview" id="preview5">
						<img id="add5" src="${pageContext.request.contextPath }/images/imgadd.png">
					</div>
				</div>
			</div>
			<div id="subImage">
				<input type="submit" value="发布图片"> 
			</div>
		</div>
	</form>
	
</body>
</html>