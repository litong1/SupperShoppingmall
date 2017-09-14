
$(function() {
	//添加类目
	$("input[name='selectType']").click(
			function() {
				$('#type').append(
						"<select name='bigtype'><option>"
								+ "大类</option></select>");
				// 避免重复点击该按钮添加重复的下拉列表框
				$(this).attr("disabled", "disabled");
				var bigs = [ "男装", "流行男鞋", "女装/女士精品", "女鞋", "内衣", "皮带/帽子/围巾" ];
				$.each(bigs, function(index, value) {
					$("[name='bigtype']").append(
							"<option value='" + value + "'>" + value
									+ "</option>");
				});
				$('#type').append(
						"<select name='smalltype'><option>"
								+ "小类</option></select>");
			});
	


	$('#type').on(
			'change',
			"[name='bigtype']",
			function(event) {

				var selectBig = $("[name='bigtype']").val();
				console.log(selectBig);
				var m_clo = [ "衬衫", "风衣", "夹克", "棉裤", "毛呢大衣", "棉衣", "民族服装",
						"牛仔裤", "Polo衫", "皮裤", "皮衣", "T恤", "套装", "卫衣", "休闲裤",
						"西服", "西裤", "西服套装", "羽绒裤", "羽绒服", "针织衫/毛衣" ];
				var m_sho = [ "低帮鞋", "帆布鞋","网鞋","高帮鞋", "凉鞋", "拖鞋","皮鞋","靴子", "雨鞋" ];
				var w_clo = [ "半身裙", "背心吊带", "衬衫", "短外套", "大码女装", "风衣",
						"婚纱/旗袍/礼服", "裤子", "连衣裙", "蕾丝衫/雪纺衫", "马夹", "毛针织衫", "毛衣",
						"毛呢外套", "棉衣/棉服", "抹胸", "牛仔裤", "皮衣", "皮草", "T恤",
						"套装/学生制服/工作制服", "唐装/民族服装/舞台服装", "卫衣/绒衫", "西装", "羽绒服",
						"中老年女装" ];
				var w_sho = [ "低帮鞋", "帆布鞋","高帮鞋", "高跟鞋","凉鞋", "拖鞋", "靴子",
						"雨鞋" ];
				var u_clo = [ "保暖上装", "保暖裤", "保暖套装", "插片/胸垫", "短袜/打底袜/丝袜/美腿袜",
						"吊带/背心/T恤", "肚兜", "吊袜带", "搭扣", "肩带", "抹胸", "内裤", "乳贴",
						"塑身上衣", "塑身美体裤", "塑身连体衣", "睡衣上装", "睡裤/家居裤", "睡裙", "睡袍",
						"文胸", "文胸套装" ];
				var d_clo = [ "耳套", "婚纱礼服配件", "口袋巾", "领带夹", "帽子", "手套", "手帕",
						"围巾/丝巾/披肩", "袖扣", "鞋/皮带 配件", "腰带/皮带/腰链" ];
				var smalls = [];

				if (selectBig == "男装") {
					smalls = $.extend([], m_clo);
				} else if (selectBig == "流行男鞋") {
					smalls = $.extend([], m_sho);
				} else if (selectBig == "女装/女士精品") {
					smalls = $.extend([], w_clo);
				} else if (selectBig == "女鞋") {
					smalls = $.extend([], w_sho);
				} else if (selectBig == "内衣") {
					smalls = $.extend([], u_clo);
				} else if (selectBig == "皮带/帽子/围巾") {
					smalls = $.extend([], d_clo);
				}
				console.log(smalls);

				// 清除小类框里中任何之前的值
				$("[name='smalltype']").empty();

				$.each(smalls, function(index, value) {
					$("[name='smalltype']").append(
							"<option value='" + value + "'>" + value
									+ "</option>");
				});
				
			});
	//限制宝贝标题输入框
	$('#goodsTitle').on('keyup',function () {
		if($(this).val().length==0){
			
			layer.tips('必填项不能为空！', '#titleMsg');
		}else if($(this).val().length<=30){
        $('#titleLength').text($(this).val().length);
        
		}else{
			
			layer.tips('不能超过30个字符!', '#titleMsg');
		}
      });
	//添加颜色
		
	$('.pubcolor').on('click',"input[name='selectColor']:last",function(){	
				
		$(".colorCheck").attr("checked",true);//全选		
		$('<div class="egcolor"></div>').html($('.egcolor').html()).appendTo($('.pubcolor'));
		$(".colorCheck:last").attr("checked",false);//全选
	    $(".colorCheck").unbind().click(function(){
			 $(this).parent().remove(); 
		})	
		//添加颜色时也需要动态生成，但是需要先定好尺码
		$('.colorName:last').on('change',function () {			
			$('.sizeCheck').each(function(){				
			if($(this).prop("checked")){
					console.log("aaa");
					addSpec();
					console.log("bbb");
					return false;
					}
				});
		      });		
	});
	
	
	//动态生成销售规格表格	
	$('.pubSize').on('click',".sizeCheck",function(){		
		addSpec();		
	});
	
	function addSpec() {
		//尺码
		var sizeChecks = new Array();		
		
			$(".sizeCheck").each(function(key,value){
				//console.log($(this).prop("checked"));
				
				if($(this).prop("checked")){
					console.log($(this).val());
				sizeChecks[key]=$(this).val();
				}
			});
			
		
		//console.log(sizeChecks);
		//颜色名称
		var colorNames = new Array();
		
		//颜色备注
		var colorRemarks = new Array();
		$('.colorRemarks').each(function(key,value){		
				colorRemarks[key]=$(this).val();						
		});
		$('.colorName').each(function(key,value){
			if($(this).val()!=""){
				if(colorRemarks[key]==""){
				colorNames[key]=$(this).val() ;
				}else{
					colorNames[key]=$(this).val() +"("+colorRemarks[key]+")";
				}
			}			
		});
		//console.log(colorNames);
		$(".specTable").remove();
		$.each(colorNames,function(key,value){
			
			$('#specTable').append("<tr class='specTable'>"+
					"<td rowspan=" + sizeChecks.length+">"+ colorNames[key]+"</td>"+
					"<td>"+ "<span class='tdSize'>"+sizeChecks[0]+"</span>"+"</td>"+
					"<td >"+"<input type='text' name='specPrice' />"+"</td>"+
					"<td >"+"<input type='text' name='specNum' />"+"</td>"+
					"</tr>");

			for (var i=1;i<sizeChecks.length;i++)
			{
				$('#specTable').append("<tr class='specTable'>"+
				"<td>"+ "<span class='tdSize'>"+sizeChecks[i]+"</span>"+"</td>"+
				"<td >"+"<input type='text' name='specPrice' />"+"</td>"+
				"<td >"+"<input type='text' name='specNum' />"+"</td>"+
				"</tr>");
			}
			
		});
	};

	//批量填充
	//定义总库存
	
	$('#salesOK').click(function(){
		var totalNum = 0;
		var price = $("input[name='pspecPrice']").val();
		var num = $("input[name='pspecNum']").val();
		
		//给td价格赋值		
		$("input[name='specPrice']").each(function(){
			$(this).val(price) ;			
		});
		//给td数量赋值
		$("input[name='specNum']").each(function(){
			$(this).val(num) ;
			totalNum = totalNum + num *1;;
		});
		//给一口价价格赋值
		$("input[name='fixedPrice']").val(price);
		$("input[name='totalNum']").val(totalNum);
		//$(".fixedPrice").text(price);
		//$(".totalNum").text(totalNum);
	});
	//input监听
	$('#specTable').on('input propertychange',"input[name='specPrice']",function(){
		var min = $("input[name='specPrice']").val();
		$("input[name='specPrice']").each(function(){
			console.log($(this).val());
			if($(this).val()*1<min*1){
				min = $(this).val();
			}			
		});
		//console.log(min);
		$("input[name='fixedPrice']").val(price);
		
	});
	
	$('#specTable').on('input propertychange',"input[name='specNum']",function(){
		
		var totalNum = 0;
		$("input[name='specNum']").each(function(){
			
			totalNum = totalNum + $(this).val()*1;
		});
		//给一口价库存赋值
		$("input[name='totalNum']").val(totalNum);
	
	});
	//提交表单
	$('#btnrRlease').click(function(){
	
		
		$('#pubForm1').submit();
		
	});

	
	
	
	
	
});
function preview1(file) {
	$('#add1').remove();
	var prevDiv = document.getElementById('preview1');
	next(file,prevDiv);
	
}
function preview2(file) {
	$('#add2').remove();
	var prevDiv = document.getElementById('preview2');
	next(file,prevDiv);
	
}
function preview3(file) {
	$('#add3').remove();
	var prevDiv = document.getElementById('preview3');
	next(file,prevDiv);
	
}
function preview4(file) {
	$('#add4').remove();
	var prevDiv = document.getElementById('preview4');
	next(file,prevDiv);
	
}
function preview5(file) {
	$('#add5').remove();
	var prevDiv = document.getElementById('preview5');
	next(file,prevDiv);
	
}
function next(file,prevDiv) {
	
	if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
			prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
		}
		reader.readAsDataURL(file.files[0]);
	} else {
		prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
	}
}