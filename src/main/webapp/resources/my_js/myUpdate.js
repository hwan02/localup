$(function() {
	$('#updateBT').click(function() { //수정 버튼 클릭시
		alert("수정 완료");
	});

	$("input").keydown(function() { //수정 할시 버튼 생김
		$("#updateDIV").show(1000);
	});

	$("textarea").keydown(function() {//수정 할시 버튼 생김
		$("#updateDIV").show(1000);
	});
});

$(function() {
	$("#deleteBT").click(function() {
		$('form').attr('action', '/member/delete');
		$('form').submit();
	});
});

/* 메뉴 클릭시 사이드바 생성 */
function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
	document.getElementById("main").style.marginLeft = "250px";
	document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
	document.getElementById("main").style.marginLeft = "0";
	document.body.style.backgroundColor = "white";
}