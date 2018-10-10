<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <a class="navbar-brand" href="index">Localup</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <input type="search" id="mainSearch">
          <button class="navbar-toggler-icon" id="mainButton"></button>
           <div id="display"  style="position: absolute; background-color: white; top: 25px; border: 1px solid black; width: 300px; display: none"></div>
            </li>
            <li></li>
            <li class="nav-item">
              <a class="nav-link" href="#" id="loginA"></a>
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
            <li>
              <a class="nav-link" href="index" id="logCheck">
              </a>
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
            <li id="all">
                <span class="ico_comm ico_coffee"></span>
              ��ü
            </li>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- email�� �ش��ϴ� ��ȣ ���� ��ġ �������� -->
	<script>
		$(function(){
			if('${login}'){
				$("#loginA").attr('href','#');
				$("#loginA").text('${member_email}');
				alert("ȯ���մϴ�")
				var first="ù ȭ��";
				searchPlaces(first);
				$("#logCheck").text('�α׾ƿ�');
			}else{
				$("#loginA").attr('href','login');
				$("#loginA").text('�α���/ȸ������');
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
                    	 alert(result);
							var words = result.split("|");
							var count = words[0];
 							$("#display").empty();
							if(count>0){
							$.each(words[1].split(','),function(index, value){
								var name = value.split('@')[0];
								var email = value.split('@')[1];
								$("#display").append($('<a href="javascript:goMainDetail('+name+')">'+name+"@"+email+'</a><br>')).show();
							})
							}
						}
                     });
                 }
             });
		});
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e44ca42b17cfcb33cbcd5af281672e&libraries=clusterer,services,drawing"></script>
		 <script>
			$(function(){
				$("#all").click(function(){
				    newLocation();
				});
				$("#mat").click(function(){
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
				    var info = "south="+south+"&west="+west+"&east="+east+"&north="+north+"&board_type="+ encodeURIComponent("���ǽü�")
				    newLocation(info);
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
				    var info = "south="+south+"&west="+west+"&east="+east+"&north="+north+"&board_type="+ encodeURIComponent("���帶ũ")
				    newLocation(info);
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
				    var info = "south="+south+"&west="+west+"&east="+east+"&north="+north+"&board_type="+ encodeURIComponent("����")
				    newLocation(info);
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
				    var info = "south="+south+"&west="+west+"&east="+east+"&north="+north+"&board_type="+ encodeURIComponent("�����ҽ�")
				    newLocation(info);
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
				    var info = "south="+south+"&west="+west+"&east="+east+"&north="+north+"&board_type="+ encodeURIComponent("���̵�")
				    newLocation(info);
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
    center : new daum.maps.LatLng(37.486454939832456, 127.02068035663186), // ������ �߽���ǥ 
    level : 5 // ������ Ȯ�� ���� 
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
              var lng = marker.getPosition().getLng();
              var lat = marker.getPosition().getLat();
              $.ajax({
			    	url:"customOverlay",
			    	data:{"lng":lng,"lat":lat},	    	
			    	success:function(result){
			    		//���� �־��־�� �ϴµ� 
		              //��Ŀ�� ����� Ŀ���� �������̸� ǥ���ϱ� 
		        	  showOverlay(marker,result); 
			    	}
			    });
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
    	//customOverlay.setMap(null); //Ŀ���� �������� �ݱ�
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
    				+'<br><a href="board/write">�Խñ۾���</a>'
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

function showOverlay(marker,result) {
	/* var content = '<div class="overlaybox">' +
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
    '</div>'; */
if(result!=undefined){
// Ŀ���� ���������� ������ �����մϴ�
customOverlay.setContent(result);
}

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
});  
//20181001 --------------
// ��� �˻� ��ü�� �����մϴ�
var ps = new daum.maps.services.Places();  

// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
var infowindow = new daum.maps.InfoWindow({zIndex:1});


		
// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
var geocoder = new daum.maps.services.Geocoder();
// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
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
    //�α��� �� ���� �������� �Ѿ�� �� �ش� ���̵� ��ȣ�������� ���� �̵�
    keyword = document.getElementById('keyword').value;
    keyCheck(keyword)
	}
}
function keyCheck(keyword){
if(keyword!=undefined){
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
	            replaceLoc()
	        }else if(status === daum.maps.services.Status.ERROR){
	        	alert("�ٽ� �˻����ּ���.");
	        }else{
	        	alert("�˻� ����� �����ϴ�.");
	        } 
	    });    
	}	
}
function replaceLoc(){
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
    	data:{"south":south, "west":west,"north":north,"east":east},	    	
    	success:function(result){
    		$("#newBoard").html(result);
    	}
    });
}
</script>
<br>
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

<script>
	$(function(){
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
	    	data:{"south":south, "west":west,"north":north,"east":east},	    	
	    	success:function(result){
	    		$("#newBoard").html(result);
	    	}
	    });
	});
</script>
      <!-- �Խñ� -->
      <div class="row">
      <div id="newBoard"></div>
      </div>
      <!-- /.row -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; localup Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="/resources/js/bootstrap.bundle.min.js"></script>

  </body>

</html>