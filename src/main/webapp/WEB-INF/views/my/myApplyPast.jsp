<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지-투어 완료</title>
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--더보기-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--메뉴 클릭시 사이드바 생성-->
<style>
body {
	font-family: "Lato", sans-serif;
	transition: background-color .5s;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	transition: margin-left .5s;
	padding: 16px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}


td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}


#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}
</style>

<!--메뉴 클릭시 사이드바 생성-->
<script>
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
	
	
	//더보기
	var showUntil = 1; 
	function showMore() {
		for(var i=showUntil; i<showUntil+5; i++) {
			$('#td_'+i).show();
		}
		showUntil+=5;
	}
	
	$(function() {
		showMore();
	});
	
	//검색
	function myFunction() {
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("myType");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    if (td) {
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }
		  }
		}
	
	$(function() {
		$("#myType").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			    $("#myTable tr").filter(function() {
			      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			    });
			  });
	});
	
	//맨위로 버튼
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
	    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	        document.getElementById("myBtn").style.display = "block";
	    } else {
	        document.getElementById("myBtn").style.display = "none";
	    }
	}
	
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	    document.body.scrollTop = 0;
	    document.documentElement.scrollTop = 0;
	}
</script>
</head>
<body class="container">
	<h1><a href="/index">투어 완료</a></h1>
	<hr>
	<!--맨위로 클릭-->
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

	
	<c:forEach items="${PayInfoVO}" var="PayInfoVO">
	<!--메뉴 클릭시 사이드바 생성 그리고 사이드바 메뉴 클릭시 이동-->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/board/myWrite?member_email=${PayInfoVO.member_email}">전체 게시글 보기</a>
		<a href="/guide/myApplySchedule?member_email=${PayInfoVO.member_email}">투어예정</a>
		<a href="/guide/myApply?member_email=${PayInfoVO.member_email}">투어 신청현황</a>  
		<a href="/guide/myApplyPast?member_email=${PayInfoVO.member_email}">완료 투어</a> 
	</div>
	</c:forEach>

	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
			<div>
				<input id="myType" type="text" placeholder="Search..">		
			</div>
	</div>
	

	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd; margin-top: 50px margin-left: auto; margin-right: auto;">
		<thead>
			<tr>
				<th>투어명</th>
				<th>시작 날짜</th>
				<th>마지막 날짜</th>
				<th>투어 올린글 확인하기</th>
			</tr>
		</thead>

		<tbody id="myTable">
			<c:forEach items="${GuideVO}" var="GuideVO"  varStatus="stat">
				<tr id="td_${stat.count }" style="display: none;">
				<td>${GuideVO.tour_title }</td>
				<td>${GuideVO.tour_sdate}</td>
				<td>${GuideVO.tour_edate }</td>
			
				<!--가이드 상세페이지 이동하기-->
				<td>
					<a href='/guide/guideDetailPage?board_no=${GuideVO.board_no}'>	
						<input type="button"  class="guideDetailPage" value="가이드 상세페이지">
					</a>
				</td>
			</tr>
		</c:forEach>
		
	</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<a href="javascript:showMore();" class="btn btn-primary">더보기</a>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>