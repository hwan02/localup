$(function(){
		$('#addBoard').click(function(){ //게시글 입력폼 유효성 검사
			if($('#board_title').val().trim()==''){
				alert('제목을 입력해주세요.');
				$('#board_title').focus();
			}else if($('#board_type').val()=='==선택=='){
				alert('유형을 선택해주세요.');
				$('#board_type').focus();
			}else if($('#member_email').val().trim()==''){
				alert('아이디(메일)을 입력해주세요.');
				$('#member_email').focus();
			}else if($('#board_cont').val().trim()==''){
				alert('내용을 입력해주세요.');
				$('#board_cont').focus();
			}else if($('#board_imgs').val()==''){
				alert('사진과 함께 올리주세요.');
				$('#board_imgs').focus();
			}else if($('#board_alti').val()==''&&$('#board_long').val()==''){
				alert('지도에서 지역을 선택해주세요.');
				$('#question').focus();
			}else{
				//올바른 데이터 입력시
				$('#write').submit();
			}
		}); //게시글 등록 버튼 클릭

	});