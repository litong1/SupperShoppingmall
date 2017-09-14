<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
    <meta charset="UTF-8">
    <title>tab-JQ</title>
    <style>
        * {margin: 0; padding: 0; list-style: none;}
        #wrap {width: 600px; margin: 100px auto 0; overflow: hidden;}
        #tit {height: 30px;width: 600px;}
        #tit span {float: left; height: 30px; line-height: 30px; width: 200px; font-size: 20px; text-align: center; color: #ccc;background: green;}
        #con li{display: none; height: 200px; width: 600px; background: pink;font-size: 100px;line-height: 200px;text-align: center;}
        #tit span.select {background: red; color: #ccc;}
        #con li.show {display: block;}
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
</head>
<body>
    <div>
    	<img alt="" src="${pageContext.request.contextPath }/images/upload/726002.jpg" width="50px" height="50px">
    </div>
    <div>
    	<img alt="" src="${pageContext.request.contextPath }/images/upload/726002.jpg" width="400px" height="400px">
    </div>
    <div>
   		<img alt="" src="${pageContext.request.contextPath }/images/upload/726002.jpg" width="800px" height="800px">
    </div>
     <img alt="" src="/SuperShoppingmall/images/upload\726001.jpg">	
</body>
</html>