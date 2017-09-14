<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>猫儿衣娘</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}
#searcher {
	border:none;
	width: 500px;
	height: 35px;
	border-bottom:3px solid #EE82EE;
	border-top:3px solid #EE82EE;
	border-left:3px solid #EE82EE;
	border-right:3px solid #EE82EE;
	}
#searcher-btn {
	border:none;
	background-color: #EE82EE;
	width: 150px;
	height: 42.5px;
	color: #fff;
	margin-left: -10px;
	}
.publishmain {
	margin:0 auto;
	margin-top: 30px;
	width : 80%;
	}
#pubTitle {
	margin-top:30px;
	width: 90%;
	height: 30px;
	line-height: 30px;
	background-color: #DDA0DD;
	color: #fff;
	padding-left: 12px;
}
#pubContent {
	width:91%;
	height:auto;
	min-height:600px;
	border: 1px solid #DDA0DD;
	line-height: 30px;
	
}
.goodsAttr {
	margin-top:5px;
	margin-left: 50px;
}
#titleError {
	display:none;
	margin-left: 75px;
}

.attr {
	margin-left: 76px;
	width:80%;
	background-color: #F5F5F5;
}
td {	
	
}
.egcolor {
	margin-left: 20px;
	padding-left:20px;
	margin-bottom: 10px;
}
.spec{
	background-color: #F5F5F5;
	width: 90%;
	height: auto;
	min-height: 350px;
}
.tdSize{
	padding-left: 35px;
}
.pubradio {
	margin-left:20px;
	padding-left: 10px;	
}
 
#specTable{
	margin-top:20px;
	margin-left: 20px;
	margin-right: 10px;
}
.specTable {
	background-color: #fff;
}
input[name="specPrice"],input[name="specNum"],
input[name="fixedPrice"],input[name="totalNum"] {
	border:none;
	width:100%;
	height:30px;
	text-align: center;
}
.release {
	position: fixed;
	text-align:center;
	bottom: 0;
	left: 0;
	height: 60px;
	width: 100%;
	background-color: #E6E6FA;
}
#btnrRlease{
	margin-top:10px;
	border:none;
	width: 100px;
	height: 40px;
	background-color: #FF00FF;
	color:#fff;
	border-bottom-left-radius: 0.2em;
	border-bottom-right-radius: 0.2em;
	border-top-left-radius: 0.2em;
	border-top-right-radius: 0.2em;
}
}	
</style>


<link rel="stylesheet" href="/SuperShoppingmall/css/upload.css"/>
<script type="text/javascript" src="/SuperShoppingmall/JS/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/SuperShoppingmall/JS/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/SuperShoppingmall/JS/publish.js"></script> 
<script type="text/javascript" src="/SuperShoppingmall/JS/layer-v3.0.3/layer/layer.js"></script>
<script type="text/javascript" src="/SuperShoppingmall/JS/T_upload.js"></script>

</head>
<body>
	

	<jsp:include page="/jsp/include/header1.jsp"></jsp:include>
	<div class="publishmain">
		<div>
			<span> 
				<a href="#"><font color="purple" size="6em"><b>猫儿衣娘</b></font></a>
			</span> 
			<span style="padding-left: 200px"> 
				<input id="searcher"type="text" />
				<button id="searcher-btn" name="" onclick="openwin()">搜索</button>
			</span>
		</div>
		<div class="publish">
			<div id="pubTitle">
				<span>宝贝发布</span>
			</div>
			<div id="pubContent">
				<form id="pubForm1" action="/SuperShoppingmall/publish?type=add"  method="post">
				
						<div class="goodsAttr">
							<span>宝贝类目</span>&nbsp;&nbsp;
							<span id="type"><input type="button" name="selectType" value="选择类目"/></span>
						</div>
						<div class="goodsAttr">
							<span id="titleMsg">宝贝标题</span>&nbsp;&nbsp;
							<span><input type="text" id="goodsTitle" name= "goodsTitle" style="width: 700px;height: 25px;"/><span id="titleLength" style="color:#FF4500;">0</span>/30</span>
						</div>
						
						<div class="goodsAttr">
							<span>宝贝属性&nbsp;&nbsp; 错误填写宝贝属性，可能会引起宝贝下架或搜索流量减少，影响您的正常销售，请认真准确填写！</span>
							<div class="attr">
								<table width="100%">
									<tr>
										<td>宝贝货号<input type="text" name="goodsNo"/></td>
										<td>宝贝材质
											<select name="goodsMaterial">
												<option>&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
												</option>
												<option value="羊毛">羊毛</option>
												<option value="腈纶">腈纶</option>
												<option value="蚕丝">蚕丝</option>
												<option value="麻">麻</option>
												<option value="马海毛">马海毛</option>
												<option value="棉">棉</option>
												<option value="蕾丝">蕾丝</option>
												<option value="布">布</option>
												<option value="羊绒">羊绒</option>
												<option value="涤纶">涤纶</option>
												<option value="锦纶">锦纶</option>
												<option value="兔毛">兔毛</option>
												<option value="动物皮">动物皮</option>
												<option value="人造革">人造革</option>
												<option value="塑胶">塑胶</option>
												<option value="PU">PU</option>
												<option value="混合">混合</option>
												<option value="其他">其他</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>宝贝品牌<input type="text" name="goodsBrand"/></td>
										<td>宝贝风格											
											<select name="goodsStyle">
												<option>&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
												</option>
												<option value="青春潮流">青春潮流</option>
												<option value="商务">商务</option>
												<option value="休闲">休闲</option>
												<option value="运动">运动</option>
												<option value="民族风">民族风</option>
												<option value="韩版">韩版</option>
												<option value="英伦">英伦</option>
												<option value="日系">日系</option>
												<option value="欧美">欧美</option>
												<option value="简约">简约</option>
												<option value="复古">复古</option>	
												<option value="性感">性感</option>												
											</select>
										</td>
									</tr>
									<tr>
										<td>适用场景
											<select name="goodsScene">
												<option>&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
												</option>
												<option value="运动休闲">运动休闲</option>
												<option value="日常">日常</option>
												<option value="办公室">办公室</option>
												<option value="约会">约会</option>
												<option value="宴会">宴会</option>
												<option value="结婚">结婚</option>
												<option value="沙滩">沙滩</option>
												<option value="居家">居家</option>											
											</select>
										</td>
										<td>适用季节											
											<select name="goodsSeason">
												<option>&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
												</option>
												<option value="春季">春季</option>
												<option value="春秋">春秋</option>
												<option value="春夏">春夏</option>
												<option value="夏季">夏季</option>
												<option value="秋季">秋季</option>
												<option value="冬季">冬季</option>
											</select>
										</td>
										
									</tr>
									<tr>
										<td>适用对象
											<select name="goodsTarget">
												<option>&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;
												</option>
												<option value="青年">青年</option>
												<option value="中年">中年</option>
												<option value="老年">老年</option>
												<option value="儿童">儿童</option>											
											</select>
										</td>
										<td>上市时间<input type="date" name="goodsComedate"/></td>
									</tr>
								</table>
							</div>							
						</div>
			
					
				
					<div class="goodsAttr">
						<div style="display:inline;">宝贝规格</div>
						<div class="spec">
							<div class="pubcolor">
								<span>颜色</span><br>
								<div class="egcolor">
									<input type="checkbox" name="checkbox" class="colorCheck" />
									<input type="color" name="selectColor" value="#ffffff" />
									<input type="text" placeholder="颜色名称（必填）" class="colorName" name="colorName"/>
									<input type="text"  placeholder="备注（如颜色深浅等）" class="colorRemarks" name="colorRemarks"/>
								</div>
								
							</div>
							<div>
							<hr style="margin-left:20px; FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#EE82EE,direction:145,strength:15)" 
								width="95%" color=#EE82EE size=2 align="center">
							</div>
							<div class="pubSize">
								<span>尺寸</span><br>
								<div style="margin-left: 10px;padding-left:10px;">
									<input type="checkbox" value="S" class="sizeCheck" name="sizeCheck">S
									<input type="checkbox" value="M" class="sizeCheck" name="sizeCheck">M								
									<input type="checkbox" value="L" class="sizeCheck" name="sizeCheck">L
									<input type="checkbox" value="XL" class="sizeCheck" name="sizeCheck">XL
									<input type="checkbox" value="2XL" class="sizeCheck" name="sizeCheck">2XL
									<input type="checkbox" value="3XL" class="sizeCheck" name="sizeCheck">3XL
								</div>
							</div>
							<div>
							<hr style="margin:10px 0px 10px 20px; FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#EE82EE,direction:145,strength:15)" 
								width="95%" color=#EE82EE size=2 align="center">
							</div>
							<div class="salesSpec">
								<p>宝贝销售规格</p>
								<div style="margin-left: 20px;">								
									<span>批量填充：</span>
									<input type="text" placeholder="价格" name="pspecPrice" />
									<input type="text" placeholder="数量" name="pspecNum"/>
									<input type="button" id = "salesOK" value="确定"/>
								</div>
								<div>
									<table id = "specTable" width="95%"  border="1" cellspacing="0" cellpadding="0" >
										<tr >
											<th>颜色</th>
											<th>尺码</th>
											<th>*价格（元）</th>
											<th>*数量（件）</th>											
										</tr>
										<tr class="specTable">
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</table>
								</div>
								<div style="width: 100%;height: 30px">
								</div>
							</div>
						</div>
						<div >
							<div>一口价及总库存</div>
							<div>
								<table width="60%"  border="1" cellspacing="0" cellpadding="0" >
									<tr>
										<th>*价格(元)</th>
										<th>*总数量(件)</th>										
									</tr>
									<tr >
										<td class="fixedPrice" align="center"><input type="text" name="fixedPrice"/></td>
										<td class="totalNum" align="center" ><input type="text" name="totalNum" readonly="readonly"/></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/jsp/include/footer.jsp"></jsp:include>
	<div style="width: 100%;height: 50px">
	</div>
	<div class="release" >
		<input type="button" id="btnrRlease" value="发    布"/>
	</div>
</body>

</html>