<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로컬업</title>
<style type="text/css">
	#modDiv {
		background-color: gray;
		width: 300px;
		height: 100px;
		padding: 30px;
		position: absolute;
		top: 80%;
		left: 70%;
		bottom: 100%;
		margin-top: -50px;
		margin-left: -150px;
		z-index: 1000;
	}
	
	.pagination {
		display: inline-block;
		padding-left: 0;
		margin: 20px 0;
		border-radius: 4px;
	}
	.pagination>li {
		display: inline;
	}
	.pagination>li>a {
		position: relative;
		float: left;
		padding: 6px 12px;
		margin-left: -1px;
		line-height: 1.42857143;
		color: #337ab7;
		text-decoration: none;
		background-color: #fff;
		border: 1px solid #ddd;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	//var board_no=2;
	function replylist(){ //전체 댓글
		var board_no = $('input[name=board_no]').val();
		$.ajax({
			url:'/reply/all/'+board_no,
			success:function(result){ //result --> List데이터
				console.log(result.length);
				console.log(result);
				var str='';
				$(result).each(function(){
					str += '<li data-rno="'+ this.reply_no +'" data-rstar="'+ this.reply_star +'" data-rcont="'
						+ this.reply_cont +'" data-remail="'+ this.member_email +'" data-rdate="'+ this.reply_date +'" class="replyLi">'
							+ this.reply_no +":"+ this.reply_star +":"+ this.reply_cont +":"+ this.member_email +":"+ this.reply_date +'<button>수정</button></li>';
				});
				$('#replies').html(str);
			}
		});
	}//replylist
	
	// reply/120/2 ===> 120:글번호, 2:2페이지
	function replylistPage(page){ //전체 댓글 중 특정 페이지의 댓글(예: 1페이지의 댓글 10개)
		var board_no = $('input[name=board_no]').val();
		
		$.ajax({
			url:'/reply/'+board_no+'/'+page,
			success:function(result){ //result ---> Map{List("list"), PageMaker("pageMaker")}
				var str='';
				$(result.list).each(function(){
					str += '<li data-rno="'+ this.reply_no +'" data-rstar="'+ this.reply_star +'" data-rcont="'
					+ this.reply_cont +'" data-remail="'+ this.member_email +'" class="replyLi">'
							+ this.reply_no +" 평점:"+ this.reply_star +":"+ this.reply_cont +" 이메일:"+ this.member_email + '<button>수정</button></li>';
				});
				$('#replies').html(str);
				printPaging(result.pageMaker);
			}
		}); 
		
	}//replylistPage
	
	function printPaging(pageMaker){ //하단 페이지 번호출력
		var board_no = $('input[name=board_no]').val();
		var str='';
		/* for(var i=pageMaker.startPage; i<=pageMaker.endPage; i++){
			str += '<li><a>'+i+'</a></li>';
			//str += '<li><a href="http://localhost/board/read?board_no='+board_no+'&page='+i+'">'+i+'</a></li>';
		}
		$('.pagination').html(str);  */
		
		if(pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
			//str += "<li><a href='/reply/"+board_no+"/"+(pageMaker.startPage - 1) + "'> << </a></li>";
		}
		
		for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
			//str += "<li "+strClass+"><a href='/reply/"+board_no+"/"+i+"'>" + i + "</a></li>";			
		}
		
		if(pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
			//str += "<li><a href='/reply/"+board_no+"/"+(pageMaker.endPage + 1) + "'> >> </a></li>";
		}
		$('.pagination').html(str);
	} //printPaging
	
	$(function(){//window ready
		var board_no = $('input[name=board_no]').val();
		var replyPage = $(this).attr("href");
		console.log(replyPage);
		
		//replylist();
		replylistPage(1);
		
		$('#addReply').click(function(){//입력요청
			var member_email = $('input[name=member_email]').val();
			var reply_cont = $('#reply_cont').val();
			var reply_star = $('input[name=reply_star]').val();
			
			$.ajax({
				url:'/reply',
				type:'post',
				data: JSON.stringify({ //파라미터 데이터 ---> JSON으로 변환
					//컨트롤러의 메소드 파라미터에 @RequestBody가 정의되어있을때 사용
					board_no : board_no,
					member_email : member_email,
					reply_cont : reply_cont,
					reply_star : reply_star
				}),
				headers:{
					//JSON데이터를 서버(컨트롤러)에 보냄!!
					'Content-Type':'application/json'
				},
				//dataType:'json' //from 서버
				success:function(result){
					alert(result);
					$('input[name=member_email]').val('');
					$('#reply_cont').html();
					$('input[name=reply_star]').val('');
					replylist();
				}
			});
		});//댓글 입력
		
		//<ul><li data-rno=15>안녕댓글<button>수정</button></li></ul>
		//댓글 수정
		$('#replies').on('click','.replyLi button',function(){//('click','li button',function(){
			//수정버튼 좌측에 있는 댓글번호,댓글내용 얻기
			var reply = $(this).parent(); //---> <li>엘리먼트
			var reply_no = reply.attr('data-rno');
			var reply_cont = reply.attr('data-rcont');//reply.text();
			var reply_star = reply.attr('data-rstar');
			var member_email = reply.attr('data-remail');
			
			$('.modal-title').html(reply_no);
			$('#modDiv #reply_cont').val(reply_cont);
			$('#modDiv #member_email').val(member_email);
			$('#modDiv #reply_star').val(reply_star);
			$('#modDiv').show(1500);
		});
		
		//댓글 삭제 요청
		$('#delReply').click(function(){
			var reply_no = $('.modal-title').html();
			$.ajax({
				url:'/reply/'+reply_no, //--->/reply/4
				type:'delete',
				success:function(result){
					if(result==='SUCCESS'){
						alert('삭제되었습니다!!');
						$('#modDiv').hide(1500); //모달창 닫기
						replylist(); //갱신내용 확인
					}
				}
			});
		});
		
		//모달창 닫기
		$('#close').click(function(){
			$('#modDiv').hide(1500);
		});
		
		//댓글 수정
		$('#modReply').click(function(){
			var reply_no = $('.modal-title').html();
			$.ajax({
				url:'/reply/'+reply_no, //--->/reply/4
				type:'put',
				data:JSON.stringify({
					reply_cont:$('#modDiv #reply_cont').val(),
					reply_star:$('#modDiv #reply_star').val()
				}),
				headers:{
					'Content-Type':'application/json'
				},
				success:function(result){
					if(result==='SUCCESS'){
						alert('수정되었습니다!!');
						$('#modDiv').hide(1500); //모달창 닫기
						replylist(); //갱신내용 확인
					}
				}
			});
		});//댓글 수정
		
		$('.pagination').on("click","li a",function(event){ //페이징
			event.preventDefault(); // a태그의 href속성 기능 상실
			replyPage=$(this).attr('href'); // 1 또는 2 ......
			//getPageList(replyPage);
			replylistPage(replyPage);
		});
		
		$('#mainBtn').click(function(){
			window.location.href='/index';
		});
		
	});//window ready
	
	function likeClick(){
		var board_no = $('input[name=board_no]').val();
		console.log(board_no);
		//alert('클릭');
		$.ajax({
			url:'/board/like',
			type:'post',
			data:{
				board_no: board_no
			},
			success:function(result){
				alert('++');
			}
		});
	}
</script>
</head>
<body>
	<form>
		<input type="text" name="board_no" value="${boardVO.board_no }" id="board_no" readonly><br>
		제목: <input type="text" name="board_title" value="${boardVO.board_title }" readonly><br>
		이메일(작성자): <input type="text" name="member_email" value="${boardVO.member_email }" readonly><br>
		이미지: <img src="/resources/img/${boardVO.board_img }" width="300" height="300" readonly><br>
		<%-- <input type="text" value="${boardVO.board_img }" size="50"><br> --%>
		내용: <textarea rows="20" cols="50" readonly>${boardVO.board_cont }</textarea><br>
	</form>
	<br>
	
	<!-- 좋아요 버튼 -->
	<a href="javascript:likeClick();"><img src="/resources/img/like.png"></a>
	<a><img src="/resources/img/like_b.png"></a>
	
	<!-- 메인으로 돌아가기 -->
	<button id="mainBtn">메인으로</button>
	
	<hr>
	<form method="post" id="replyForm">
		댓글: <textarea rows="5" cols="70" name="reply_cont" id="reply_cont"></textarea><br>
		이메일: <input type="text" name="member_email" id="member_email"><br>
		평점: <input type="text" name="reply_star" id="reply_star"><br>
		<button id="addReply">등록</button>
	</form>
	
	<!-- 댓글list 출력 -->
	<ul id="replies"></ul>
	
	<!-- 페이지 번호 출력 -->
	<ul class="pagination"></ul>
	
	<!-- 수정과 삭제를 위한 div 모달창 -->
	<div id="modDiv" style="display: none;">
		<div class="modal-title"></div>
		<div>
			평점: <input type="text" id="reply_star"><br>
			내용: <input type="text" id="reply_cont"><br>
			이메일: <input type="text" id="member_email" disabled>
		</div>
		<div>
			<button id="modReply">수정</button>
			<button id="delReply">삭제</button>
			<button id="close">닫기</button>
		</div>
	</div>
	
</body>
</html>
