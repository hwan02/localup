/* 마이페이지 클릭 시 로그인 상태 확인 후 이동 */
		$(function(){
			if('${login}'){
				$("#loginA").attr('href','#');
				$("#loginA").text('${member_email}');
				//alert("환영합니다")
				var first="첫 화면";
				searchPlaces(first);
				$("#logCheck").text('로그아웃');
			}else{
				$("#loginA").attr('href','login');
				$("#loginA").text('로그인/회원가입');
				$("#logCheck").text(' ');
			}
			$("#logCheck").click(function(){
				$.ajax({
					url:"index",
					data:{"logout":"logout"}
				});
			});
			 $("input#mainSearch").keyup(function() {
                 var mainSearch = $(this).val();
                 if(mainSearch=='') { 
                     $("#display").hide();
                 } else {    
                     $.ajax({
                     url: "/search",
                     data: {mainSearch : mainSearch},
                     success:function(result){
							var words = result.split("|");
							var count = words[0];
 							$("#display").empty();
							if(count>0){
							$.each(words[1].split(','),function(index, value){
								var name = value.split('@')[0];
								var email = value.split('@')[1];
								$("#display").append($('<a href=javascript:goMainDetail("'+value+'")>'+name+"@"+email+'</a><br>')).show();
							})
							}
						}
                     });
                 }
             }); 
		});
	/* 마이페이지 클릭 시 로그인 상태 확인 후 이동 */
	function myPageCheck(){
		if('${login}'){
		location.href="/member/myUpdate?member_email=${member_email}";
		}else{ location.href="#";}
	}
	function goMainDetail(value){
		var name = value.split('@')[0];
		var email = value.split('@')[1];
		location.href="/member/mInfo?member_email_sub=${member_email}&member_email_guide="+name+"@"+email;
	}