<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/JS/webuploader/webuploader.css">

<!--引入JS-->

<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
	font-size: 12px;
}

#ul1 {
	width: 800px;
	margin: 0 auto;
	height: 30px;
	line-height: 30px;
	list-style: none;
	background: #CCC;
}

#ul1 li {
	float: left;
	width: 100px;
	text-align: center;
}

#ul1 li a {
	text-decoration: none;
	display: block;
}

#ul1 li a:hover {
	background: #FCC;
}

#ul1 li div {
	display: none;
	background: #FCC;
	height: 0;
}
</style>


<script type="text/javascript">
	window.onload = function() {
		var lis = document.getElementsByTagName("li");
		for (var i = 0; i < lis.length; i++) {
			lis[i].onmouseover = function() {
				this.getElementsByTagName("div")[0].style.display = "block";
			};
			lis[i].onmouseout = function() {
				this.getElementsByTagName("div")[0].style.display = "none";
			}
		}

	}
	
</script>

</head>
<body>
	<ul id="ul1">
		<li><a href="#">1</a>
			<div>
				<a href="#">111111111</a><a href="#">22222222</a><a href="#">3333333</a>
			</div></li>
		<li><a href="#">2</a>
			<div>
				<a href="#">111111111</a><a href="#">22222222</a><a href="#">3333333</a>
			</div></li>
		<li><a href="#">3</a>
			<div>
				<a href="#">111111111</a><a href="#">22222222</a><a href="#">3333333</a>
			</div></li>
		<li><a href="#">4</a>
			<div>
				<a href="#">111111111</a><a href="#">22222222</a><a href="#">3333333</a>
			</div></li>

	</ul>
	
</body>
</html>