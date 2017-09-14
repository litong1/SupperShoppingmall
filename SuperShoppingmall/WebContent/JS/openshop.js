$(function() {
		$('#btn').mouseover(function(){
			$('#hidden').css("display","inline");
		});
		$('#btn').mouseout(function(){
			$('#hidden').css("display","none");
		});
		$('#btn').click(function(){
			var userid = $('#userid').val();
			var username = $('#username').val();
			var url = "user?type=modifyrole"+"&userid="+userid+"&username="+username;
			console.log(url);
			location.href = "/SuperShoppingmall/"+url;
			
		});
	});	