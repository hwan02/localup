<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로컬업</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css/mainCustom.css" rel="stylesheet">
    <%--아이콘  --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/index"><img src="resources/img/logo.png"></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <input type="search" id="mainSearch">
          <button class="navbar-toggler-icon" id="mainButton"></button>
           <div id="display"></div>
            </li>
            <li class="dropdown messages-menu">
            	<%-- 알림 --%>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o <%-- fa-spin fa-3x fa-fw --%>"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <img src="#" class="img-circle" alt="User Image"/>
                          </div>
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li><!-- end message -->
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="#" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            AdminLTE Design Team
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="#" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Developers
                            <small><i class="fa fa-clock-o"></i> Today</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="#" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Sales Department
                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="#" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Reviewers
                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="#" id="loginA"></a>
            </li>
            <li class="nav-item <%--dropdown--%>">
              <a class="nav-link <%--dropdown-toggle--%>" href="javascript:myPageCheck()" id="navbarDropdownPortfolio" aria-haspopup="true" aria-expanded="false">
                마이페이지
              </a>
              <%-- <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
              </div> --%>
            </li>
            <li class="nav-item <%--dropdown--%>">
              <a class="nav-link <%--dropdown-toggle--%>" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                랭킹
              </a>
              <%--<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
              </div>--%>
            </li>
            <li class="nav-item <%--dropdown--%>">
              <a class="nav-link <%--dropdown-toggle--%>" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                공지사항
              </a>
              <%--<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="full-width.html">Full Width Page</a>
                <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
                <a class="dropdown-item" href="faq.html">FAQ</a>
                <a class="dropdown-item" href="404.html">404</a>
                <a class="dropdown-item" href="pricing.html">Pricing Table</a>
              </div>--%>
            </li>
            <li>
              <a class="nav-link" href="index" id="logCheck">
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- email에 해당하는 선호 지역 위치 가져오기 -->
	<script>
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
	</script>
	





   

    <!-- Bootstrap core JavaScript -->
    <script src="/resources/js/bootstrap.bundle.min.js"></script>

  </body>

</html>