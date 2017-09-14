<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
 <html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>Add And Close Div</title> 
<script type="text/javascript" src="${pageContext.request.contextPath }/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" > 
$(document).ready(function(){ 
    bindListener();
})
function addimg(){ 
    $("#mdiv").append('<div class="iptdiv" ><input type="file" name="img[]" class="ipt" /><a href="#" name="rmlink">X</a></div>'); 
     
    // 为新元素节点添加事件侦听器
    bindListener();
}
// 用来绑定事件(使用unbind避免重复绑定)
function bindListener(){
    $("a[name=rmlink]").unbind().click(function(){
        $(this).parent().remove(); 
    })
}
</script>
  
</head> 
 <body> 
<form action="" method="post" enctype="multipart/form-data"> 
 <label>请选择上传的图片</label> 
  <a href="javascript:addimg()" id="addImg">增加图片</a> 
  <div class="mdiv" id="mdiv"> 
    <div class="iptdiv" ><input type="file" name="img[]" class="ipt" /><a href="#" name="rmlink">X</a></div> 
   </div> 
  <input type="submit" name="submit" value="上传图片" /> 
 </form> 
 </body> 
 </html>