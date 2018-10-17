$(function() { 	
		$(".payCancel").click(function() { //결제취소 버튼   
 			$('form').attr('action', '/pay/myPayInfo');
 			$('form').attr('method', 'get');
 			$('form').submit();

		});	

		$(".guideDetailPage").click(function() { //가이드상세 페이지 버튼      
 			//$('form').attr('action', '/pay/myPayInfo');
 			$('form').attr('method', 'get');
 			$('form').submit();

		});	
		
	});	