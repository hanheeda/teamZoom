<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	var text;
	$(function(){
		$.ajax({
			type: "POST", //GET, POST
			async: true, //비동기화 true, 동기화 false
			url: "../action/jsonTest2.jsp",
			dataType: "html",
			data: { "board_no" : 1 },
			success: function(response, status, request) {
				text = response;
				var str = text.split('|'); 
				for(var i = 0; i < str.length; i++){
					console.log(str[i])
				}
			},
			error: function(response, status, request) {
			},
			complete: function() {
			},
			beforeSend: function() {
			}
		})
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>