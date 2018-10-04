<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로컬업</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css/mainCustom.css" rel="stylesheet">
  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.html">Localup</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <input type="search">
          <button class="navbar-toggler-icon"></button>
            </li>
            <li></li>
            <li class="nav-item">
              <a class="nav-link" href="services.html">로그인/회원가입</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                마이페이지
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="portfolio-1-col.html">1 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-2-col.html">2 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-3-col.html">3 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-4-col.html">4 Column Portfolio</a>
                <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                랭킹
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                공지사항
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="full-width.html">Full Width Page</a>
                <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
                <a class="dropdown-item" href="faq.html">FAQ</a>
                <a class="dropdown-item" href="404.html">404</a>
                <a class="dropdown-item" href="pricing.html">Pricing Table</a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <header>
      <br>
      <br>
      <br>
	<div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
	<div id="map" style="width: 100%; height: 800px;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category">
        <ul>
            <li id="mat">
                <span class="ico_comm ico_coffee"></span>
               맛집
            </li>
            <li id="kyo" >
                <span class="ico_comm ico_store"></span>
                교통
            </li>
            <li id="pyeon" >
                <span class="ico_comm ico_carpark"></span>
                편의시설
            </li>
            <li id="land" >
                <span class="ico_comm ico_carpark"></span>
                랜드마크
            </li>
            <li id="suk" >
                <span class="ico_comm ico_carpark"></span>
                숙박
            </li>
            <li id="ji" >
                <span class="ico_comm ico_carpark"></span>
                지역소식
            </li>
            <li id="guide">
                <span class="ico_comm ico_carpark"></span>
                가이드
            </li>
        </ul>
    </div>
</div>
    </header>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e44ca42b17cfcb33cbcd5af281672e&libraries=clusterer,services,drawing"></script>
		 <script>
			$(function(){
				$("#mat").click(function(){
					var bounds = map.getBounds();
					// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"맛집"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#kyo").click(function(){
					var bounds = map.getBounds();
					// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"교통"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#pyeon").click(function(){
					var bounds = map.getBounds();
					// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"편의시설"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#land").click(function(){
					var bounds = map.getBounds();
					// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"랜드마크"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#suk").click(function(){
					var bounds = map.getBounds();
					// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"숙박"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#ji").click(function(){
					var bounds = map.getBounds();
					// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"지역소식"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#guide").click(function(){
					var bounds = map.getBounds();
					// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"가이드"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
			});

		 </script>
<script>
var disMarker;

var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
    level : 12 // 지도의 확대 레벨 
});

	 // 마커 클러스터러를 생성합니다 
 var clusterer = new daum.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    gridSize: 35,
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 6, // 클러스터 할 최소 지도 레벨 
    minClusterSize : 1,
    disableClickZoom: false,
/*         styles: [{
        width : '53px', height : '52px',
        background: 'url(cluster.png) no-repeat',
        color: '#fff',
        textAlign: 'center',
        lineHeight: '54px'
    }] */
});

	 //마커이미지
 var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
 // 마커 이미지의 이미지 크기 입니다
 var imageSize = new daum.maps.Size(24, 35); 
 // 마커 이미지를 생성합니다    
 var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
 
// 데이터를 가져오기 위해 jQuery를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다

 var coffeMarkers = []; // 커피숍 마커 객체를 가지고 있을 배열입니다
/* $.get("/resources/test_data.jsp", function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    alert(data)
    data = JSON.parse(data); //string을 json으로 변환
    var markers = $(data.positions).map(function(i, position) {
        var marker = new daum.maps.Marker({
            position : new daum.maps.LatLng(position.lat, position.lng),
        	image : markerImage // 마커 이미지
        }); */
        $.get("/first", function(data) {
            // 데이터에서 좌표 값을 가지고 마커를 표시합니다
            // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        	alert(data);
        	data = JSON.parse(data); //string을 json으로 변환
            var markers = $(data.positions).map(function(i, position) {
                var marker = new daum.maps.Marker({
                    position : new daum.maps.LatLng(position.lat, position.lng),
                	image : markerImage // 마커 이미지
                });		            
     	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
        var iwContent = '<div style="padding:5px;">'
        				+'위도:'+position.lat
        				+'<br>경도:'+position.lng
        				+'<br><a href="#">게시글보기</a>'
        				+'<br><a href="#">게시글쓰기</a>'
        				+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

        // 인포윈도우를 생성합니다
        var infowindow = new daum.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        daum.maps.event.addListener(marker, 'click', function() {
              // 마커 위에 인포윈도우를 표시합니다
              //infowindow.open(map, marker);
              console.log(coffeMarkers);	
              //사라졌던 마커가 있으면 다시 표시해주기
              if(disMarker != null && disMarker.getMap() == null) {
              	disMarker.setMap(map);
              }
              
              //마커를 대신해 커스텀 오버레이를 표시하기
        	  showOverlay(marker); 
        });
        
        return marker;
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
    
});

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다

//마커생성
var marker = new daum.maps.Marker();
//인포윈도우생성
var infowindow = new daum.maps.InfoWindow();

daum.maps.event.addListener(map, 'click', function(mouseEvent) {	
	
	//커스텀 오버레이가 열려있다면
	if(customOverlay.getMap() != null) {
    	customOverlay.setMap(null); //커스텀 오버레이 닫기
    	disMarker.setMap(map); //사라졌던 마커 표시하기
		return;
	}
	  	
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng;
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng); 
    
    // 지도에 마커를 표시합니다
    marker.setMap(map);
    
    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div style="padding:5px;">'
    				+'위도:'+latlng.getLat()
    				+'<br>경도:'+latlng.getLng()
    				+'<br><a href="#">게시글쓰기</a>'
    				+'<br><a href="javascript:removeMarker()">취소</a>'
    				+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

    // 인포윈도우 설정
    infowindow.setContent(iwContent);
        
    infowindow.open(map, marker);
});

function removeMarker() {
   marker.setMap(null); //마커 표시 취소
   infowindow.close(); //인포윈도우 닫기
}

// 커스텀 오버레이를 생성합니다
var customOverlay = new daum.maps.CustomOverlay({
    xAnchor: 0.3,
    yAnchor: 0.91
});

function showOverlay(marker) {
   var content = '<div class="overlaybox">' +
    '    <div class="boxtitle">금주 영화순위</div>' +
    '    <div class="first">' +
    '        <div class="triangle text">1</div>' +
    '        <div class="movietitle text">드래곤 길들이기2</div>' +
    '    </div>' +
    '    <ul>' +
    '        <li class="up">' +
    '            <span class="number">2</span>' +
    '            <span class="title">명량</span>' +
    '            <span class="arrow up"></span>' +
    '            <span class="count">2</span>' +
    '        </li>' +
    '        <li>' +
    '            <span class="number">3</span>' +
    '            <span class="title">해적(바다로 간 산적)</span>' +
    '            <span class="arrow up"></span>' +
    '            <span class="count">6</span>' +
    '        </li>' +
    '        <li>' +
    '            <span class="number">4</span>' +
    '            <span class="title">해무</span>' +
    '            <span class="arrow up"></span>' +
    '            <span class="count">3</span>' +
    '        </li>' +
    '        <li>' +
    '            <span class="number">5</span>' +
    '            <span class="title">안녕, 헤이즐</span>' +
    '            <span class="arrow down"></span>' +
    '            <span class="count">1</span>' +
    '        </li>' +
    '    </ul>' +
    '</div>';

// 커스텀 오버레이의 내용을 설정합니다
customOverlay.setContent(content);

// 커스텀 오버레이의 위치를 설정합니다
customOverlay.setPosition(marker.getPosition());

//마커지우기
marker.setMap(null);

//사라진 마커 저장
disMarker = marker;

// 커스텀 오버레이를 지도에 표시합니다
customOverlay.setMap(map);
}

// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'zoom_changed', function() {        
	customOverlay.setMap(null); //커스텀 오버레이 닫기
});

// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'dragend', function() {   
	var level = map.getLevel();
	if(level <= 5){
	// 지도의 현재 영역을 얻어옵니다 
	var bounds = map.getBounds();
	// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
	var boundsStr = bounds.toString();
    var swLatLng = bounds.getSouthWest();
    var south = swLatLng.getLat();
    var west = swLatLng.getLng();
    var neLatLng = bounds.getNorthEast(); 
    var north = neLatLng.getLat();
    var east = neLatLng.getLng();
    var message ='영역정보는 '+boundsStr;
    var resultDiv = document.getElementById('result');  
    resultDiv.innerHTML = message;
    $.ajax({
    	url:"location",
    	data:{"south":south, "west":west,"north":north,"east":east},
    	success:function(result){
    		$("#ajaxResult").html(result);
    	}
    });
	}
});  
//20181001 --------------
// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});


// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
 // 주소로 좌표를 검색합니다
    geocoder.addressSearch(keyword, function(result, status) {
        // 정상적으로 검색이 완료됐으면 
         if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
            map.setLevel(4);
        }else if(status === daum.maps.services.Status.ERROR){
        	alert("다시 검색해주세요.");
        }else{
        	alert("검색 결과가 없습니다.");
        } 
    });    
}
</script>
<br>
<div id="result"></div>
<!-- 지도 범위 내 영역 표시  -->
<div id="ajaxResult"></div>
<!-- 키워드로 장소검색하고 목록으로 표출하기 -->
<div id="menu_wrap" class="bg_white">
    <div class="option">
        <div>
            <form onsubmit="searchPlaces(); return false;">
                키워드 : <input type="text" id="keyword" size="15"> 
                <button type="submit">검색하기</button> 
            </form>
        </div>
    </div>
    <hr>
    <ul id="placesList"></ul>
    <div id="pagination"></div>
</div>

    <!-- Page Content -->
    <div class="container">


      <!-- Marketing Icons Section -->
      <div class="row">
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <h4 class="card-header">Card Title</h4>
            <div class="card-body">
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">Learn More</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Portfolio Section -->
      <h2>Portfolio Heading</h2>

      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project One</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Two</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Three</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Four</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Five</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Six</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->

      <!-- Features Section -->
      <div class="row">
        <div class="col-lg-6">
          <h2>Modern Business Features</h2>
          <p>The Modern Business template by Start Bootstrap includes:</p>
          <ul>
            <li>
              <strong>Bootstrap v4</strong>
            </li>
            <li>jQuery</li>
            <li>Font Awesome</li>
            <li>Working contact form with validation</li>
            <li>Unstyled page elements for easy customization</li>
          </ul>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
        </div>
        <div class="col-lg-6">
          <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Call to Action Section -->
      <div class="row mb-4">
        <div class="col-md-8">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div>
      </div>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>

  </body>

</html>