<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모달 Test</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
/*모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기*/
#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
}
#my-dialog {
    display: none;
    position: fixed;
    left: calc( 50% - 160px ); top: calc( 50% - 70px );
    width: 320px; height: 140px; 
    background: #fff;
    z-index: 11;
    padding: 10px;
}
</style>

<script type="text/javascript">
$(function() {
	//모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기
	$("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
		$("#my-dialog,#dialog-background").toggle();
	});
	
});
</script>
</head>
<body>
	<h1>모달 Test</h1>
	<hr>
	<!--모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기-->
	<input type="button" id="btn-open-dialog" value="확인">
	<div id="my-dialog">
    	결제완료 ^^
    	<br>
    	<a href="http://localhost/main"><button id="btn-close-dialog">메인 페이지</button></a> 
    	<button id="btn-close-dialog">닫기</button>
	</div>
	<div id="dialog-background"></div>
</body>
</html>