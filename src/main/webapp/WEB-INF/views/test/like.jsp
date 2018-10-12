<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function likeClick(){ //좋아요 업데이트, 좋아요 갯수 나타내기
	var board_no = $('input[name=board_no]').val();
	console.log('board_no>>>'+board_no);
	//alert('클릭');
	$.ajax({
		url:'/board/like',
		type:'post',
		data:{
			board_no: board_no
		},
		success:function(result){
			console.log('result>>>'+result);
			$('#like').html(+result);
		}
	});
}
</script>
</head>
<body>
<button type="button" id="like">좋아요</button>
[<span id="like">${board_like }</span>]

</body>
</html>