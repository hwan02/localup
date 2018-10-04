<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>���þ�</title>
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
              <a class="nav-link" href="services.html">�α���/ȸ������</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                ����������
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
                ��ŷ
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                ��������
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
    <!-- ������ ǥ�õ� div -->
	<div id="map" style="width: 100%; height: 800px;"></div>
    <!-- ���� ���� ǥ�õ� ��Ŀ ī�װ� -->
    <div class="category">
        <ul>
            <li id="mat">
                <span class="ico_comm ico_coffee"></span>
               ����
            </li>
            <li id="kyo" >
                <span class="ico_comm ico_store"></span>
                ����
            </li>
            <li id="pyeon" >
                <span class="ico_comm ico_carpark"></span>
                ���ǽü�
            </li>
            <li id="land" >
                <span class="ico_comm ico_carpark"></span>
                ���帶ũ
            </li>
            <li id="suk" >
                <span class="ico_comm ico_carpark"></span>
                ����
            </li>
            <li id="ji" >
                <span class="ico_comm ico_carpark"></span>
                �����ҽ�
            </li>
            <li id="guide">
                <span class="ico_comm ico_carpark"></span>
                ���̵�
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
					alert("Ŭ��")
					var bounds = map.getBounds();
					// ���������� ���ڿ��� ���ɴϴ�. ((��,��), (��,��)) �����Դϴ�
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
				    
				    var info = "south="+south+"&west="+west+"&east="+east+"&north="+north+"&board_type="+ encodeURIComponent("����")
				    newLocation(info);
					/* $.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"����"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    }); */
				});
				$("#kyo").click(function(){
					var bounds = map.getBounds();
					// ���������� ���ڿ��� ���ɴϴ�. ((��,��), (��,��)) �����Դϴ�
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
				    
				    var info = "south="+south+"&west="+west+"&east="+east+"&north="+north+"&board_type="+ encodeURIComponent("����")
				    newLocation(info);
					/* $.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"����"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    }); */
				});
				$("#pyeon").click(function(){
					var bounds = map.getBounds();
					// ���������� ���ڿ��� ���ɴϴ�. ((��,��), (��,��)) �����Դϴ�
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"���ǽü�"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#land").click(function(){
					var bounds = map.getBounds();
					// ���������� ���ڿ��� ���ɴϴ�. ((��,��), (��,��)) �����Դϴ�
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"���帶ũ"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#suk").click(function(){
					var bounds = map.getBounds();
					// ���������� ���ڿ��� ���ɴϴ�. ((��,��), (��,��)) �����Դϴ�
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"����"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#ji").click(function(){
					var bounds = map.getBounds();
					// ���������� ���ڿ��� ���ɴϴ�. ((��,��), (��,��)) �����Դϴ�
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"�����ҽ�"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
				$("#guide").click(function(){
					var bounds = map.getBounds();
					// ���������� ���ڿ��� ���ɴϴ�. ((��,��), (��,��)) �����Դϴ�
					var boundsStr = bounds.toString();
				    var swLatLng = bounds.getSouthWest();
				    var south = swLatLng.getLat();
				    var west = swLatLng.getLng();
				    var neLatLng = bounds.getNorthEast(); 
				    var north = neLatLng.getLat();
				    var east = neLatLng.getLng();
					$.ajax({
				    	url:"location",
				    	data:{"south":south, "west":west,"north":north,"east":east,"board_type":"���̵�"},	    	
				    	success:function(result){
				    		$("#ajaxResult").html(result);
				    	}
				    });
				});
			});
function newLocation(type){
	        	$.get("/first?"+type, function(data) {
	                // �����Ϳ��� ��ǥ ���� ������ ��Ŀ�� ǥ���մϴ�
	                // ��Ŀ Ŭ�����ͷ��� ������ ��Ŀ ��ü�� ������ �� ���� ��ü�� �������� �ʽ��ϴ�
	            	data = JSON.parse(data); //string�� json���� ��ȯ
	                var markers = $(data.positions).map(function(i, position) {
	                    var marker = new daum.maps.Marker({
	                        position : new daum.maps.LatLng(position.lat, position.lng),
	                    	image : markerImage // ��Ŀ �̹���
	                    });		            
	         	// ��Ŀ�� Ŭ������ �� ��Ŀ ���� ǥ���� ���������츦 �����մϴ�
	            var iwContent = '<div style="padding:5px;">'
	            				+'����:'+position.lat
	            				+'<br>�浵:'+position.lng
	            				+'<br><a href="#">�Խñۺ���</a>'
	            				+'<br><a href="#">�Խñ۾���</a>'
	            				+'</div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
	                iwRemoveable = true; // removeable �Ӽ��� ture �� �����ϸ� ���������츦 ���� �� �ִ� x��ư�� ǥ�õ˴ϴ�

	            // ���������츦 �����մϴ�
	            var infowindow = new daum.maps.InfoWindow({
	                content : iwContent,
	                removable : iwRemoveable
	            });

	            // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
	            daum.maps.event.addListener(marker, 'click', function() {
	                  // ��Ŀ ���� ���������츦 ǥ���մϴ�
	                  //infowindow.open(map, marker);
	                  console.log(coffeMarkers);	
	                  //������� ��Ŀ�� ������ �ٽ� ǥ�����ֱ�
	                  if(disMarker != null && disMarker.getMap() == null) {
	                  	disMarker.setMap(map);
	                  }
	                  
	                  //��Ŀ�� ����� Ŀ���� �������̸� ǥ���ϱ�
	            	  showOverlay(marker); 
	            });
	            
	            return marker;
	        });

	        // Ŭ�����ͷ��� ��Ŀ���� �߰��մϴ�
	        clusterer.clear();
	        clusterer.addMarkers(markers);
	        
	    });
	}
		 </script>
<script>
var disMarker;

var map = new daum.maps.Map(document.getElementById('map'), { // ������ ǥ���� div
    center : new daum.maps.LatLng(36.2683, 127.6358), // ������ �߽���ǥ 
    level : 12 // ������ Ȯ�� ���� 
});

	 // ��Ŀ Ŭ�����ͷ��� �����մϴ� 
 var clusterer = new daum.maps.MarkerClusterer({
    map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü 
    gridSize: 35,
    averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ���� 
    minLevel: 6, // Ŭ������ �� �ּ� ���� ���� 
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

	 //��Ŀ�̹���
 var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
 // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
 var imageSize = new daum.maps.Size(24, 35); 
 // ��Ŀ �̹����� �����մϴ�    
 var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
 
// �����͸� �������� ���� jQuery�� ����մϴ�
// �����͸� ������ ��Ŀ�� �����ϰ� Ŭ�����ͷ� ��ü�� �Ѱ��ݴϴ�

 var coffeMarkers = []; // Ŀ�Ǽ� ��Ŀ ��ü�� ������ ���� �迭�Դϴ�
/* $.get("/resources/test_data.jsp", function(data) {
    // �����Ϳ��� ��ǥ ���� ������ ��Ŀ�� ǥ���մϴ�
    // ��Ŀ Ŭ�����ͷ��� ������ ��Ŀ ��ü�� ������ �� ���� ��ü�� �������� �ʽ��ϴ�
    alert(data)
    data = JSON.parse(data); //string�� json���� ��ȯ
    var markers = $(data.positions).map(function(i, position) {
        var marker = new daum.maps.Marker({
            position : new daum.maps.LatLng(position.lat, position.lng),
        	image : markerImage // ��Ŀ �̹���
        }); */

        $.get("/first", function(data) {
            // �����Ϳ��� ��ǥ ���� ������ ��Ŀ�� ǥ���մϴ�
            // ��Ŀ Ŭ�����ͷ��� ������ ��Ŀ ��ü�� ������ �� ���� ��ü�� �������� �ʽ��ϴ�
        	data = JSON.parse(data); //string�� json���� ��ȯ
            var markers = $(data.positions).map(function(i, position) {
                var marker = new daum.maps.Marker({
                    position : new daum.maps.LatLng(position.lat, position.lng),
                	image : markerImage // ��Ŀ �̹���
                });		            
     	// ��Ŀ�� Ŭ������ �� ��Ŀ ���� ǥ���� ���������츦 �����մϴ�
        var iwContent = '<div style="padding:5px;">'
        				+'����:'+position.lat
        				+'<br>�浵:'+position.lng
        				+'<br><a href="#">�Խñۺ���</a>'
        				+'<br><a href="#">�Խñ۾���</a>'
        				+'</div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
            iwRemoveable = true; // removeable �Ӽ��� ture �� �����ϸ� ���������츦 ���� �� �ִ� x��ư�� ǥ�õ˴ϴ�

        // ���������츦 �����մϴ�
        var infowindow = new daum.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
        daum.maps.event.addListener(marker, 'click', function() {
              // ��Ŀ ���� ���������츦 ǥ���մϴ�
              //infowindow.open(map, marker);
              console.log(coffeMarkers);	
              //������� ��Ŀ�� ������ �ٽ� ǥ�����ֱ�
              if(disMarker != null && disMarker.getMap() == null) {
              	disMarker.setMap(map);
              }
              
              //��Ŀ�� ����� Ŀ���� �������̸� ǥ���ϱ�
        	  showOverlay(marker); 
        });
        
        return marker;
    });

    // Ŭ�����ͷ��� ��Ŀ���� �߰��մϴ�
    clusterer.addMarkers(markers);
    
});

// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
// ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�

//��Ŀ����
var marker = new daum.maps.Marker();
//�������������
var infowindow = new daum.maps.InfoWindow();

daum.maps.event.addListener(map, 'click', function(mouseEvent) {	
	
	//Ŀ���� �������̰� �����ִٸ�
	if(customOverlay.getMap() != null) {
    	customOverlay.setMap(null); //Ŀ���� �������� �ݱ�
    	disMarker.setMap(map); //������� ��Ŀ ǥ���ϱ�
		return;
	}
	  	
    // Ŭ���� ����, �浵 ������ �����ɴϴ� 
    var latlng = mouseEvent.latLng;
    
    // ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
    marker.setPosition(latlng); 
    
    // ������ ��Ŀ�� ǥ���մϴ�
    marker.setMap(map);
    
    // ��Ŀ�� Ŭ������ �� ��Ŀ ���� ǥ���� ���������츦 �����մϴ�
    var iwContent = '<div style="padding:5px;">'
    				+'����:'+latlng.getLat()
    				+'<br>�浵:'+latlng.getLng()
    				+'<br><a href="#">�Խñ۾���</a>'
    				+'<br><a href="javascript:removeMarker()">���</a>'
    				+'</div>'; // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�

    // ���������� ����
    infowindow.setContent(iwContent);
        
    infowindow.open(map, marker);
});

function removeMarker() {
   marker.setMap(null); //��Ŀ ǥ�� ���
   infowindow.close(); //���������� �ݱ�
}

// Ŀ���� �������̸� �����մϴ�
var customOverlay = new daum.maps.CustomOverlay({
    xAnchor: 0.3,
    yAnchor: 0.91
});

function showOverlay(marker) {
   var content = '<div class="overlaybox">' +
    '    <div class="boxtitle">���� ��ȭ����</div>' +
    '    <div class="first">' +
    '        <div class="triangle text">1</div>' +
    '        <div class="movietitle text">�巡�� ����̱�2</div>' +
    '    </div>' +
    '    <ul>' +
    '        <li class="up">' +
    '            <span class="number">2</span>' +
    '            <span class="title">��</span>' +
    '            <span class="arrow up"></span>' +
    '            <span class="count">2</span>' +
    '        </li>' +
    '        <li>' +
    '            <span class="number">3</span>' +
    '            <span class="title">����(�ٴٷ� �� ����)</span>' +
    '            <span class="arrow up"></span>' +
    '            <span class="count">6</span>' +
    '        </li>' +
    '        <li>' +
    '            <span class="number">4</span>' +
    '            <span class="title">�ع�</span>' +
    '            <span class="arrow up"></span>' +
    '            <span class="count">3</span>' +
    '        </li>' +
    '        <li>' +
    '            <span class="number">5</span>' +
    '            <span class="title">�ȳ�, ������</span>' +
    '            <span class="arrow down"></span>' +
    '            <span class="count">1</span>' +
    '        </li>' +
    '    </ul>' +
    '</div>';

// Ŀ���� ���������� ������ �����մϴ�
customOverlay.setContent(content);

// Ŀ���� ���������� ��ġ�� �����մϴ�
customOverlay.setPosition(marker.getPosition());

//��Ŀ�����
marker.setMap(null);

//����� ��Ŀ ����
disMarker = marker;

// Ŀ���� �������̸� ������ ǥ���մϴ�
customOverlay.setMap(map);
}

// ������ Ȯ�� �Ǵ� ��ҵǸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
daum.maps.event.addListener(map, 'zoom_changed', function() {        
	customOverlay.setMap(null); //Ŀ���� �������� �ݱ�
});

// ���콺 �巡�׷� ���� �̵��� �Ϸ�Ǿ��� �� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
daum.maps.event.addListener(map, 'dragend', function() {   
	var level = map.getLevel();
	if(level <= 5){
	// ������ ���� ������ ���ɴϴ� 
	var bounds = map.getBounds();
	// ���������� ���ڿ��� ���ɴϴ�. ((��,��), (��,��)) �����Դϴ�
	var boundsStr = bounds.toString();
    var swLatLng = bounds.getSouthWest();
    var south = swLatLng.getLat();
    var west = swLatLng.getLng();
    var neLatLng = bounds.getNorthEast(); 
    var north = neLatLng.getLat();
    var east = neLatLng.getLng();
    var message ='���������� '+boundsStr;
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
// ��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places();  

// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
var infowindow = new daum.maps.InfoWindow({zIndex:1});


// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
var geocoder = new daum.maps.services.Geocoder();
// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('Ű���带 �Է����ּ���!');
        return false;
    }
 // �ּҷ� ��ǥ�� �˻��մϴ�
    geocoder.addressSearch(keyword, function(result, status) {
        // ���������� �˻��� �Ϸ������ 
         if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
            // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
            map.setCenter(coords);
            map.setLevel(4);
        }else if(status === daum.maps.services.Status.ERROR){
        	alert("�ٽ� �˻����ּ���.");
        }else{
        	alert("�˻� ����� �����ϴ�.");
        } 
    });    
}
</script>
<br>
<div id="result"></div>
<!-- ���� ���� �� ���� ǥ��  -->
<div id="ajaxResult"></div>
<!-- Ű����� ��Ұ˻��ϰ� ������� ǥ���ϱ� -->
<div id="menu_wrap" class="bg_white">
    <div class="option">
        <div>
            <form onsubmit="searchPlaces(); return false;">
                Ű���� : <input type="text" id="keyword" size="15"> 
                <button type="submit">�˻��ϱ�</button> 
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