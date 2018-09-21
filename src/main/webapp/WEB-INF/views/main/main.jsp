<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>메인 페이지</title>
 <style>
.overlaybox {position:relative;width:360px;height:350px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
.overlaybox li {list-style: none;}
.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
.overlaybox .first {position:relative;width:247px;height:136px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png') no-repeat;margin-bottom:8px;}
.first .text {color:#fff;font-weight:bold;}
.first .triangle {position:absolute;width:48px;height:48px;top:0;left:0;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png') no-repeat; padding:6px;font-size:18px;}
.first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
.overlaybox ul {width:247px;}
.overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
.overlaybox li span {display:inline-block;}
.overlaybox li .number {font-size:16px;font-weight:bold;}
.overlaybox li .title {font-size:13px;}
.overlaybox ul .arrow {position:absolute;margin-top:8px;right:25px;width:5px;height:3px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/updown.png') no-repeat;} 
.overlaybox li .up {background-position:0 -40px;}
.overlaybox li .down {background-position:0 -60px;}
.overlaybox li .count {position:absolute;margin-top:5px;right:15px;font-size:10px;}
.overlaybox li:hover {color:#fff;background:#d24545;}
.overlaybox li:hover .up {background-position:0 0px;}
.overlaybox li:hover .down {background-position:0 -20px;}   
</style>
</head>
<body>
<br>
<p style="margin-top:-12px">
    사용한 데이터를 보시려면 
    <em class="link">
       <a href="/resources/test_data.jsp" target="_blank">여기를 클릭하세요!</a>
    </em>
</p>
<div id="map" style="width:100%;height:800px;"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e44ca42b17cfcb33cbcd5af281672e&libraries=clusterer"></script>
<script>
	var disMarker;

    var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 14 // 지도의 확대 레벨 
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
    $.get("/resources/test_data.jsp", function(data) {
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

            // 마커에 클릭이벤트를 등록합니다
            daum.maps.event.addListener(marker, 'click', function() {
                  // 마커 위에 인포윈도우를 표시합니다
                  //infowindow.open(map, marker);
                  
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
</script>
</body>
</html>