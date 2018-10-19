<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로컬업</title>
<!--전체 디자인 요소-->
<link rel= "stylesheet" type="text/css" href="/resources/board_css/boardWrite.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--유효성 검사-->
<script type="text/javascript" src="/resources/board_js/boardWrite.js"></script>
</head>
<body>
	<div class="map_wrap">
    	<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

		<div id="menu_wrap" class="bg_white">
        	<div class="option">
            	<div>
                	<form onsubmit="searchPlaces(); return false;">
                		키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
						<button type="submit">검색하기</button> 
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

	<!-- <div id="map" style="width:100%;height:350px;"></div> -->
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f91e6d892e5876c99502e2d0571baffb&libraries=clusterer,drawing,services"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요&libraries=services"></script> -->
	<script>
	// 마커를 담을 배열입니다
	var markers = [];
		
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng('${board_alti}', '${board_long}'), // 지도의 중심좌표
		level : 5 // 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var marker = new daum.maps.Marker(); // 클릭한 위치를 표시할 마커입니다
	
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	//searchPlaces();
	$(function(){
		var board_alti = document.getElementById('board_alti');
		var board_long = document.getElementById('board_long');
		board_alti.value = '${board_alti}';
		board_long.value = '${board_long}';
		//해당 위치에 해당하는 인포 띄우기 
		var iwContent = '<div style="padding:5px;">선택위치!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new daum.maps.LatLng('${board_alti}', '${board_long}'), //인포윈도우 표시 위치입니다
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
	// 인포윈도우를 생성하고 지도에 표시합니다
		var infowindow = new daum.maps.InfoWindow({
		    map: map, // 인포윈도우가 표시될 지도
		    position : iwPosition, 
		    content : iwContent,
		    removable : iwRemoveable
		});
		newLocation();
		//해당 위치에 마커 띄우기
		//마커이미지
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png";
	 // 마커 이미지의 이미지 크기 입니다
	 var imageSize = new daum.maps.Size(24, 35); 
	 // 마커 이미지를 생성합니다    
	 var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		 var marker2 = new daum.maps.Marker({
                    position : new daum.maps.LatLng('${board_alti}', '${board_long}'),
                	image : markerImage // 마커 이미지
                });		
		 marker2.setMap(map); // 지도 위에 마커를 표출합니다
		
	});
	
	
	
	//마커이미지
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	 // 마커 이미지의 이미지 크기 입니다
	 var imageSize = new daum.maps.Size(24, 35); 
	 // 마커 이미지를 생성합니다    
	 var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
	// 마커 클러스터러를 생성합니다 
	 var clusterer = new daum.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	    gridSize: 35,
	    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	    minLevel: 6, // 클러스터 할 최소 지도 레벨 
	    minClusterSize : 1,
	    disableClickZoom: false,
	});
	//클러스터 가져오기 
	function newLocation(type){
    	$.get("/first?"+type, function(data) {
            // 데이터에서 좌표 값을 가지고 마커를 표시합니다
            // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
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

        // 마커에 클릭이벤트를 등록합니다 기존마커정보 
        daum.maps.event.addListener(marker, 'click', function() {
        	
			//마커 클릭 시 해당 위도, 경도 값 넣기
			var board_alti = document.getElementById('board_alti');
			var board_long = document.getElementById('board_long');
            board_alti.value = marker.getPosition().getLat();
			board_long.value = marker.getPosition().getLng();
			searchDetailAddrFromLoc( marker.getPosition().getLat(),marker.getPosition().getLng(), function(result, status) {
			        if (status === daum.maps.services.Status.OK) {
			            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
			            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			            var content = '<div class="bAddr">' +
			                            detailAddr + 
			                        '</div>';
			         // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
						 infowindow.setContent(content);
						 infowindow.open(map, marker);
			        }
			});
			/* var content="제목을 넣어주세요"
			infowindow.setContent(content);
		    infowindow.open(map, marker); */
              //사라졌던 마커가 있으면 다시 표시해주기
              /* if(disMarker != null && disMarker.getMap() == null) {
              	disMarker.setMap(map);
              }
              
              //마커를 대신해 커스텀 오버레이를 표시하기
        	  showOverlay(marker);  */
        });
        return marker;
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.clear();
    clusterer.addMarkers(markers);
    
});
}
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	// 키워드 검색을 요청하는 함수입니다
function searchPlaces(first) {
var keyword = null;
if(first!=undefined){
	 $.ajax({
			url:"locInfo",
	    	data:{'email':'${member_email}'},
	    	success:function(result){
	    		keyCheck(result)
	    	}
			});
}else{
//로그인 후 메인 페이지로 넘어올 때 해당 아이디 선호지역으로 지도 이동
keyword = document.getElementById('keyword').value;
keyCheck(keyword)
}
}
function keyCheck(keyword){
if(keyword!=undefined){
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
            replaceLoc()
        }else if(status === daum.maps.services.Status.ERROR){
        	alert("다시 검색해주세요.");
        }else{
        	alert("검색 결과가 없습니다.");
        } 
    });    
}	
}
function replaceLoc(){
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
	data:{"south":south, "west":west,"north":north,"east":east},	    	
	success:function(result){
		$("#newBoard").html(result);
	}
});
}
	
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	 
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	/* 기존마커클릭시 해당 좌표 주소 */
	function searchDetailAddrFromLoc(alti,longt, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(longt, alti, callback);
	} 
	//지도에 클릭 이벤트를 등록합니다
	//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		            
		            var content = '<div class="bAddr">' +
		                           
		                            detailAddr + 
		                        '</div>';
		         // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					 infowindow.setContent(content);
					 infowindow.open(map, marker);
		        }
		});
		 
		// 마커를 클릭한 위치에 표시합니다 
        marker.setPosition(mouseEvent.latLng);
        marker.setMap(map);
        
		//클릭한 위도, 경도 정보를 가져옵니다 
		var latlng = mouseEvent.latLng;
		
		var board_alti = document.getElementById('board_alti');
		var board_long = document.getElementById('board_long');
		board_alti.value = latlng.getLat();
		board_long.value = latlng.getLng();
	});
	</script>

	<form name="write" id="write" method="post" enctype="multipart/form-data">
	<div class="align-center">
		<div>
		유형:
			<select name="board_type" id="board_type">
				<option value="==선택==">==선택==</option>
				<option value="맛집">맛집</option>
				<option value="교통">교통</option>
				<option value="편의시설">편의시설</option>
				<option value="숙박">숙박</option>
				<option value="랜드마크">랜드마크</option>
			</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		이미지: <input type="file" name="board_imgs" id="board_imgs">
		</div>
		<div class="question">
			<input type="text" name="board_title" id="board_title" required />
			<label>제목</label>
		</div>

		<div class="question">
			<input type="text" name="member_email" id="member_email" required value="${member_email }" readonly/>
			<label>이메일</label>
		</div>
		
		<div class="question">
<!-- 			<div class="form-group"> -->
      			<textarea class="form-control"  rows="5" name="board_cont" id="board_cont" placeholder="내용"></textarea>
<!--     		</div> -->
    	</div>
		
		<div class="question">
			<input type="text" name="board_alti" id="board_alti" required>
			<label>위도</label>
			<input type="text" name="board_long" id="board_long" required>
			<label>경도</label>
		</div>

<!-- 		제목: <input type="text" name="board_title" id="board_title"><br> -->
<!-- 		유형: -->
<!-- 			<select name="board_type" id="board_type"> -->
<!-- 				<option value="==선택==">==선택==</option> -->
<!-- 				<option value="맛집">맛집</option> -->
<!-- 				<option value="교통">교통</option> -->
<!-- 				<option value="편의시설">편의시설</option> -->
<!-- 				<option value="숙박">숙박</option> -->
<!-- 				<option value="랜드마크">랜드마크</option> -->
<!-- 			</select> -->
<!-- 			<br> -->
<!-- 		이메일: <input type="text" name="member_email" id="member_email"><br> -->
<!-- 		내용: <textarea rows="20" cols="50" name="board_cont" id="board_cont"></textarea><br> -->
		
<!-- 		위도: <input type="text" name="board_alti" id="board_alti"> -->
<!-- 		경도: <input type="text" name="board_long" id="board_long"><br> -->
		<button type="button" id="addBoard">등록</button>
	</div>
	</form>
</body>
</html>