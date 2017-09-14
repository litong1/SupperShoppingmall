$(function() {
		$('#baseinfo').click(function(){			
			location.href = "/SuperShoppingmall/shop?type=query";		
		});
		$('#logo').click(function(){
			location.href = "/SuperShoppingmall/jsp/seller/shoplogoSet.jsp";
		});
	});
function preview(file) {
	$('#shoplogo').remove();
	var prevDiv = document.getElementById('preview');
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