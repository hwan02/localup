<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	iframe{
		width: 0px;
		height: 0px;
		border: 0px;
	}
	
	.fileDrop {
		width: 100%;
		height: 200px;
		border: 1px dotted blue;
	}
	
	small{
		margin-left: 3px;
		font-weight: bold;
		color: gray;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(".fileDrop").on("drangenter dragover",function(event){
		event.preventDefault();
	});
	$(".fileDrop").on("drop",function(event){
		event.preventDefault();
		//var files = event.originalEvent.dataTransfer.files;
		//var file = files[0];
		
		console.log(file);
		/* var formData = new FormData();
		formData.append("file",file);
		
		$.ajax({
			url: 'testWrite',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success:function(data){
				alert(data);
			}
		}); */
	});
</script>
</head>
<body>
	<form name="write" method="post" enctype="multipart/form-data">
		이미지: <input type="file" name="file"><br>
		<button type="submit">등록</button>
	</form>
	
	<iframe name="iframe">
		<script>
			function addFilePath(msg){
				alert(msg);
				document.getElementerById('write').reset();
			}
		</script>
	</iframe>
	
	<!-- <div class="fileDrop"></div>
	<div class="uploadedList"></div> -->
</body>
</html>