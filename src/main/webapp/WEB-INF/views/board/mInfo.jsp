<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 페이지</title>
<link rel= "stylesheet" type="text/css" href="/resources/login/index.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
	body{
		margin: 70px 50px;
	}
	input[type="text"]{
		display: inline-block;
		/* border: 1px solid #ccc; */
		border-left: thin;
		border-right: thin;
		border-top: thin;
		border-radius: 4px;
		box-sizing: border-box;
    	-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
    	resize: vertical;
    	size: 50px;
		height: 37px;
		width: 300px;
	}
	input[type="button"]{
		background-color: #00ff80;
	}
	table{
		width:80%;
		margin:20px 30px;
		border:1;
		border-radius: 5px;
		border: 1px solid #00ff80;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		 $("#myButtons1").click(function(){
	           alert('AJAX로 처리하고 정상 응답이면.. hide 해 준다.');
	     $('#myModal').modal('hide')
	        });

		$('#addSub').click(function(){
			var member_email_guide = $('input[name=member_email]').val();
			var member_email_sub = $('#login_email').val();
			//var member_email_sub = 'localup@gmail.com';
			//alert(member_email_guide);
			$.ajax({
				url:'/member/addSub',
				type:'post',
				data:{
					member_email_guide:member_email_guide
					,member_email_sub:member_email_sub
				},
				success:function(result){
					console.log('result>>>'+result);
					$('#countSub').html(result);
				}
			});
			location.reload();
		});//팔로우 버튼
		
		$('#minusSub').click(function(){
			var member_email_guide = $('input[name=member_email]').val();
			var member_email_sub = $('#login_email').val();
			//var member_email_sub = 'localup@gmail.com';
			//alert(member_email_guide);
			$.ajax({
				url:'/member/minusSub',
				type:'post',
				data:{
					member_email_guide:member_email_guide,
					member_email_sub:member_email_sub
				},
				success:function(result){
					console.log('result>>>'+result);
					$('#countSub').html(result);
				}
			});
			location.reload();
		});//팔로우 취소 버튼
		
	});
</script>
</head>
<body>
	<br><br>
	<input type="hidden" name="login_email" id="login_email" value="${member_email }">
	<h3>사용자정보</h3>
	<hr size="100px" width="300px" align="left" style="border: solid 2px #00ff80;">
	<!--회원아이디-->
	이메일: <input type="text" name="member_email" readonly value="${memberVO.member_email }">
	<br>
	<!--랭킹-->
	랭킹(레벨/경험치) : <input type="text" name="levels_name" value="${myLevel }" readonly style="width: 220px">
	<br>
	
	<!--팔로워-->
	팔로워 : 
		<!--팔로워 클릭시 팔로우로 변경하기-->
		<%-- 로그인한 아이디가 팔로우한 테이블에 있으면 팔로워 취소버튼을 보이고
		없으면 팔로우 버튼을 보이게 할 것 --%>
		
		<!-- 팔로우 수 -->
		[<span id="countSub">${countSub }</span>]
		
		<c:if test="${subInfo eq 'enable'}">
			<input type="button" name="addSub" value="팔로워" id="addSub" class="btn">
		</c:if>
		<c:if test="${subInfo eq 'disable'}">
			<input type="button" name="minusSub" value="팔로워취소" id="minusSub" class="btn">
		</c:if>
		<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
   			모달창 열기
		</button>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog"><!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">
              채팅방
            </h4>
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">x
            </button>
         </div>
         <div class="modal-body">
            내용.
         </div>
         <div class="modal-footer">
          
            <button type="button" class="btn btn-primary" id="myButtons1">
               저장
            </button>
            <button type="button" class="btn btn-default" data-dismiss="modal">
               닫기
            </button>
         </div>
      </div> 
   </div> 
</div>
		
		<!-- 팔로워한 사용자 목록 -->
		<br>팔로우한 사용자<br>
		<div id="subPeople">
			<c:forEach items="${member_email_sub }" var="subVO">
				<div id="member_email_sub">${subVO.member_email_sub }</div>
			</c:forEach>
		</div>
		<br><br>
	
	<!--업로드한 게시글 가져오기-->
	<table border="1" cellpadding="3">
		<c:forEach items="${boardList }" var="boardVO">
		<tr>
			<td>${boardVO.board_no }</td>
			<td><img src="/resources/img/${boardVO.board_img }" height="80" width="80"></td>
			<td><a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.board_date }"/></td>
		</tr>
		</c:forEach>
	</table>
	
</body>
</html>