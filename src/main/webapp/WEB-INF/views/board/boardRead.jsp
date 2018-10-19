<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로컬업</title>
<style type="text/css">
	#modDiv {
		/* background-color: #FAF4C0; */
		width: 480px;
		height: 200px;
		padding: 30px;
		/*position: absolute;
		top: 100%;
		right: 10%;
		bottom: 100%;
		margin-top: -100px;
		margin-left: -150px; */
		z-index: 1000;
		border: 1px solid #00ff80;
		border-radius: 5px;
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
	body{
		/* margin: 70px 50px; */
		width: 480px;
		margin: 0 auto;
	}
	/* div{
		margin: 20px 30px;
	} */
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
	button{
		background-color: #00ff80;
		border: thin;
		border-radius: 10px;
		height: 40px;
		width: 90px;
	}
	input[type="button"]{
		background-color: #00ff80;
		border: thin;
		border-radius: 10px;
		height: 40px;
		width: 90px;
	}
	#board_cont{
		border-radius: 5px;
		height: 350px;
	}
	#reply_cont{
		border-radius: 5px;
		height: 100px;
		width: 480px;
	}
	ul{
		list-style:none;
		padding-left:0px;
	}
	#repl{
		/* border: 1px solid #ddd; */
		border: 1px solid #00ff80;
		margin-bottom: 2px;
		border-radius: 5px;
		padding: 10px;
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
				//console.log(result.length);
				//console.log(result);
				var str='';
				$(result).each(function(){
					/* str += '<li data-rno="'+ this.reply_no +'" data-rstar="'+ this.reply_star +'" data-rcont="'
						+ this.reply_cont +'" data-remail="'+ this.member_email +'" data-rdate="'+ this.reply_date +'" class="replyLi">'
							+ this.reply_no +":"+ this.reply_star +":"+ this.reply_cont +":"+ this.member_email +":"+ this.reply_date +'<button>수정</button></li>'; */
					str += '<li data-rno="'+ this.reply_no +'" data-rstar="'+ this.reply_star +'" data-rcont="'
						+ this.reply_cont +'" data-remail="'+ this.member_email +'" data-rdate="'+ this.reply_date +'" class="replyLi">'
							+ this.reply_star +", "+ this.reply_cont +"//"+ this.member_email +":"+ this.reply_date +'<button id="upRepl">수정</button></li>';
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
					/* str += '<li data-rno="'+ this.reply_no +'" data-rstar="'+ this.reply_star +'" data-rcont="'
					+ this.reply_cont +'" data-remail="'+ this.member_email +'" class="replyLi">'
							+ this.reply_no +" 평점:"+ this.reply_star +":"+ this.reply_cont +" 이메일:"+ this.member_email + '<button>수정</button></li>'; */
					str += '<div id="repl"><li data-rno="'+ this.reply_no +'" data-rstar="'+ this.reply_star +'" data-rcont="'
						+ this.reply_cont +'" data-remail="'+ this.member_email +'" class="replyLi">'
						+ this.reply_star +"점<br>"+ this.reply_cont +"<br>작성자:"+ this.member_email +' <button>수정</button></li></div>';
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
			if($('#reply_cont').val().trim()==''){
				alert('내용을 입력해주세요.');
				$('#reply_cont').focus();
			}else if($('#reply_star').val()==''){
				alert('평점을 입력해주세요');
				$('#reply_star').focus();
			}else{
				var member_email = $('#replyForm input[name=member_email]').val();
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
						//$('#replyForm input[name=member_email]').val('');
						$('#reply_cont').val('');
						$('input[name=reply_star]').val('');
						//replylist();
						replylistPage(1);
					}
				});
			
			}
			
		});//댓글 입력
		
		//<ul><li data-rno=15>안녕댓글<button>수정</button></li></ul>
		//댓글 수정
		$('#replies').on('click','.replyLi button',function(){//('click','li button',function(){
			var reply = $(this).parent(); //---> <li>엘리먼트
			var member_email = reply.attr('data-remail');
			var login_email = $('#login_email').val();
			if(member_email != login_email){
				alert('이 댓글을 작성한 사용자만 수정할 수 있습니다');
				return;
			}else{
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
			}
			
			
			
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
						//replylist(); //갱신내용 확인
						replylistPage(1); //갱신내용 확인
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
						//replylist(); //갱신내용 확인
						replylistPage(1); //갱신내용 확인
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
		}); //메인으로 버튼
		
		$('#boardCont input[name=member_email]').click(function(){
			//alert('click');
			window.location.href='/member/mInfo?member_email_guide=${boardVO.member_email}&member_email_sub=${member_email}';
			//window.location.href='/member/mInfo?member_email_guide=${boardVO.member_email}&member_email_sub=localup@gmail.com';
			//이메일 정보값 넘겨줘야 함
		}); //게시글 이메일 클릭시 사용자 정보 페이지 이동
		
		$('#modBtn').click(function(){
			var email = $('#boardCont input[name=member_email]').val();
			var login_email = $('#login_email').val();
			if(email != login_email){
				alert('이 게시글을 작성한 사용자만 수정할 수 있습니다');
			}else{
				//self.location="/board/update?board_no=${board_no}"; //수정폼으로 이동
				$('[name=boardCont]').attr("action","/board/update");
				$('[name=boardCont]').attr("method","get");
				$('[name=boardCont]').submit();	
			}
		}); //수정 버튼
			
		$('#delBtn').click(function(){
			var email = $('#boardCont input[name=member_email]').val();
			var login_email = $('#login_email').val();
			if(email != login_email){
				alert('이 게시글을 작성한 사용자만 수정할 수 있습니다');
			}else{
				//alert('click'+board_no);
				self.location="/board/delete?board_no=${boardVO.board_no}";
			}
			
		}); //삭제 버튼
		
		$('#insertTour').click(function(){
			var email = $('#boardCont input[name=member_email]').val();
			var login_email = $('#login_email').val();
			if(email != login_email){
				alert('투어등록은 작성한 사용자만 수정할 수 있습니다');
			}else{
				//alert('click'+board_no);
				self.location="/guide/guideWrite?board_no=${boardVO.board_no}";
			}
			
		}); //삭제 버튼
		
		$('#likePlus').click(function(){
			$('#likePlus').hide();
			$('#likeMinus').show();
		}); //좋아요+1
		
		$('#likeMinus').click(function(){
			$('#likeMinus').hide();
			$('#likePlus').show();
		}); //좋아요-1
		
	});//window ready
	
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
	///////
	function likeMinus(){ //좋아요 업데이트, 좋아요 갯수 나타내기
		var board_no = $('input[name=board_no]').val();
		console.log('board_no>>>'+board_no);
		//alert('클릭');
		$.ajax({
			url:'/board/likeMinus',
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
	/////////
</script>
</head>
<body>
	<br><br>
	<input type="hidden" name="login_email" value="${member_email }" id="login_email"><br>
	<!-- 게시글 내용 -->
	<form name="boardCont" id="boardCont">
		<input type="text" name="board_no" value="${boardVO.board_no }" id="board_no" readonly><br>
		<input type="text" name="board_title" value="${boardVO.board_title }" readonly placeholder="제목"><br>
		<input type="text" name="member_email" value="${boardVO.member_email }" readonly style="width: 230px;" placeholder="작성자"><br>
		<img src="/resources/img/${boardVO.board_img }" width="420" height="300"><br>
		<%-- <input type="text" value="${boardVO.board_img }" size="50"><br> --%>
		<textarea rows="20" cols="50" readonly id="board_cont">${boardVO.board_cont }</textarea><br>
	</form>
	
	<!-- 좋아요 버튼 -->
	<a href="javascript:likeClick();" id="likePlus"><img src="/resources/img/like.png"></a>
	<a href="javascript:likeMinus();" id="likeMinus" style="display: none;"><img src="/resources/img/like_b.png"></a>
	[<span id="like">${board_like }</span>]
	<br>
	
	<!-- 댓글 갯수 -->
	<%-- <a><img src="/resources/img/comment-white-oval-bubble_b.png"></a>
	<span id="replyCount">[${replyCnt }]</span> --%>
		
	<!-- 메인으로 돌아가기 -->
	<br>
	<button type="button" id="modBtn">수정</button>
	<button type="button"id="delBtn">삭제</button>
	<button id="mainBtn">메인으로</button>
	<a href="/guide/guideDetailPage?board_no=${boardVO.board_no }&member_eamil=${member_email}"><button type="button">투어신청</button></a>
	<!--가이드 일때만 투어 등록하기-->
<%-- 	<a href="/guide/guideWrite?board_no=${boardVO.board_no}"> --%>
	<input type="button" value="투어 등록" id="insertTour">

	<hr>
	<!-- 댓글 입력폼 -->
	<img src="/resources/img/comment-white-oval-bubble_b.png">Comment
	<form method="post" id="replyForm">
		<textarea rows="5" cols="70" name="reply_cont" id="reply_cont"></textarea><br>
		<input type="text" name="member_email" id="member_email" placeholder="이메일" value="${member_email }" readonly><br>
		<input type="text" name="reply_star" id="reply_star" placeholder="1~5점 사이의 점수를 남겨주세요" >
		<br><button id="addReply" type="button">등록</button>
	</form>
	
	<!-- 댓글list 출력 -->
	<ul id="replies"></ul>
	
	<!-- 페이지 번호 출력 -->
	<ul class="pagination"></ul>
	
	<!-- 수정과 삭제를 위한 div 모달창 -->
	<div id="modDiv" style="display: none;">
		<div class="modal-title" style="display: none;"></div>
		<div>
			<input type="text" id="reply_star" placeholder="평점"><br>
			<input type="text" id="reply_cont" placeholder="내용" style="width: 300px; height: 50px;">
			<input type="text" id="member_email" name="member_email"readonly>
		</div>
		<div>
			<button id="modReply">수정</button>
			<button id="delReply">삭제</button>
			<button id="close">닫기</button>
		</div>
	</div>
	
</body>
</html>
