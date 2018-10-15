<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지-내가올린글</title>
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--더보기-->
<link type="text/css" rel="stylesheet" href="css/reset.css" media="screen" />
<link type="text/css" rel="stylesheet" href="css/js-load.css" media="screen" />
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


.js-load {
    display: none;
}
.js-load.active {
    display: block;
}
.is_comp.js-load:after {
    display: none;
}
.btn-wrap, .lists, .main {
    display: block;
}
.main {
    max-width: 640px;
    margin: 0 auto;
}
.lists {
    margin-bottom: 4rem;
}

.btn-wrap {
    text-align: center;
}



table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
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
	
	
	$(window).on('load', function () {
	    load('#js-load', '4');
	    $("#js-btn-wrap .button").on("click", function () {
	        load('#js-load', '4', '#js-btn-wrap');
	    })
	});
	 
	function load(id, cnt, btn) {
	    var girls_list = id + " .js-load:not(.active)";
	    var girls_length = $(girls_list).length;
	    var girls_total_cnt;
	    if (cnt < girls_length) {
	        girls_total_cnt = cnt;
	    } else {
	        girls_total_cnt = girls_length;
	        $('.button').hide()
	    }
	    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	}
	
	
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
	
</script>
</head>
<body>
	<h1>마이페이지-내가올린글</h1>
	<hr>
	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
	</div>
	
	<input id="myType" type="text" placeholder="Search..">
	

<%-- 	<input type="hidden" value="${boardVO.member_email}"> --%>
	<c:forEach items="${boardList }" var="boardVO">
	<!--메뉴 클릭시 사이드바 생성 그리고 사이드바 메뉴 클릭시 이동-->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/board/myWrite?member_email=${boardVO.member_email}">전체 게시글 보기</a> 
		<a href="/board/myWriteRestaurant?member_email=${boardVO.member_email}">맛집</a>
		<a href="/board/myWriteTraffic?member_email=${boardVO.member_email}">교통</a> 
	</div>
	</c:forEach>
	
	<div id="contents">
		<div id="js-load" class="main">
			<ul class="lists">
					
					<table  class="lists__item js-load">
						<thead>
						<tr>
							<th>게시글 번호</th>
							<th>게시글 유형별</th>
							<th>게시글 제목</th>
							<th>게시글 작성 날짜</th>
						</tr>
						</thead>
						<tbody id="myTable">
						<c:forEach items="${boardList }" var="boardVO">	
						<tr>
							<td>${boardVO.board_no }</td>
							<td>${boardVO.board_type }</td>
							<td><a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
 									value="${boardVO.board_date }" /></td>
						</tr>
							
					</c:forEach>
						</tbody>
					</table>
			</ul>
<%-- 				</c:forEach> --%>
		
			<div id="js-btn-wrap" class="btn-wrap">
				<a href="javascript:;" class="button">더보기</a>
			</div>
		</div>
	</div>

</body>
</html>