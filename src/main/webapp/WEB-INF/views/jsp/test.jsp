<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
//Ŀ�Ǽ� ��Ŀ�� ǥ�õ� ��ǥ �迭�Դϴ�
var coffeePositions = [ 
    new daum.maps.LatLng(37.499590490909185, 127.0263723554437),
    new daum.maps.LatLng(37.499427948430814, 127.02794423197847),
    new daum.maps.LatLng(37.498553760499505, 127.02882598822454),
    new daum.maps.LatLng(37.497625593121384, 127.02935713582038),
    new daum.maps.LatLng(37.49646391248451, 127.02675574250912),
    new daum.maps.LatLng(37.49629291770947, 127.02587362608637),
    new daum.maps.LatLng(37.49754540521486, 127.02546694890695)                
];

// ������ ��Ŀ�� ǥ�õ� ��ǥ �迭�Դϴ�
var storePositions = [
    new daum.maps.LatLng(37.497535461505684, 127.02948149502778),
    new daum.maps.LatLng(37.49671536281186, 127.03020491448352),
    new daum.maps.LatLng(37.496201943633714, 127.02959405469642),
    new daum.maps.LatLng(37.49640072567703, 127.02726459882308),
    new daum.maps.LatLng(37.49640098874988, 127.02609983175294),
    new daum.maps.LatLng(37.49932849491523, 127.02935780247945),
    new daum.maps.LatLng(37.49996818951873, 127.02943721562295)
];

// ������ ��Ŀ�� ǥ�õ� ��ǥ �迭�Դϴ�
var carparkPositions = [
    new daum.maps.LatLng(37.49966168796031, 127.03007039430118),
    new daum.maps.LatLng(37.499463762912974, 127.0288828824399),
    new daum.maps.LatLng(37.49896834100913, 127.02833986892401),
    new daum.maps.LatLng(37.49893267508434, 127.02673400572665),
    new daum.maps.LatLng(37.49872543597439, 127.02676785815386),
    new daum.maps.LatLng(37.49813096097184, 127.02591949495914),
    new daum.maps.LatLng(37.497680616783086, 127.02518427952202)                       
];    

var markerImageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // ��Ŀ�̹����� �ּ��Դϴ�. ��������Ʈ �̹��� �Դϴ�
    coffeeMarkers = [], // Ŀ�Ǽ� ��Ŀ ��ü�� ������ ���� �迭�Դϴ�
    storeMarkers = [], // ������ ��Ŀ ��ü�� ������ ���� �迭�Դϴ�
    carparkMarkers = []; // ������ ��Ŀ ��ü�� ������ ���� �迭�Դϴ�

    
createCoffeeMarkers(); // Ŀ�Ǽ� ��Ŀ�� �����ϰ� Ŀ�Ǽ� ��Ŀ �迭�� �߰��մϴ�
createStoreMarkers(); // ������ ��Ŀ�� �����ϰ� ������ ��Ŀ �迭�� �߰��մϴ�
createCarparkMarkers(); // ������ ��Ŀ�� �����ϰ� ������ ��Ŀ �迭�� �߰��մϴ�

changeMarker('coffee'); // ������ Ŀ�Ǽ� ��Ŀ�� ���̵��� �����մϴ�    


// ��Ŀ�̹����� �ּҿ�, ũ��, �ɼ����� ��Ŀ �̹����� �����Ͽ� �����ϴ� �Լ��Դϴ�
function createMarkerImage(src, size, options) {
    var markerImage = new daum.maps.MarkerImage(src, size, options);
    return markerImage;            
}

// ��ǥ�� ��Ŀ�̹����� �޾� ��Ŀ�� �����Ͽ� �����ϴ� �Լ��Դϴ�
function createMarker(position, image) {
    var marker = new daum.maps.Marker({
        position: position,
        image: image
    });
    
    return marker;  
}   
   
// Ŀ�Ǽ� ��Ŀ�� �����ϰ� Ŀ�Ǽ� ��Ŀ �迭�� �߰��ϴ� �Լ��Դϴ�
function createCoffeeMarkers() {
    
    for (var i = 0; i < coffeePositions.length; i++) {  
        
        var imageSize = new daum.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new daum.maps.Point(10, 0),    
                spriteSize: new daum.maps.Size(36, 98)  
            };     
        
        // ��Ŀ�̹����� ��Ŀ�� �����մϴ�
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(coffeePositions[i], markerImage);  
        
        // ������ ��Ŀ�� Ŀ�Ǽ� ��Ŀ �迭�� �߰��մϴ�
        coffeeMarkers.push(marker);
    }     
}

// Ŀ�Ǽ� ��Ŀ���� ���� ǥ�� ���θ� �����ϴ� �Լ��Դϴ�
function setCoffeeMarkers(map) {        
    for (var i = 0; i < coffeeMarkers.length; i++) {  
        coffeeMarkers[i].setMap(map);
    }        
}

// ������ ��Ŀ�� �����ϰ� ������ ��Ŀ �迭�� �߰��ϴ� �Լ��Դϴ�
function createStoreMarkers() {
    for (var i = 0; i < storePositions.length; i++) {
        
        var imageSize = new daum.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new daum.maps.Point(10, 36),    
                spriteSize: new daum.maps.Size(36, 98)  
            };       
     
        // ��Ŀ�̹����� ��Ŀ�� �����մϴ�
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(storePositions[i], markerImage);  

        // ������ ��Ŀ�� ������ ��Ŀ �迭�� �߰��մϴ�
        storeMarkers.push(marker);    
    }        
}

// ������ ��Ŀ���� ���� ǥ�� ���θ� �����ϴ� �Լ��Դϴ�
function setStoreMarkers(map) {        
    for (var i = 0; i < storeMarkers.length; i++) {  
        storeMarkers[i].setMap(map);
    }        
}

// ������ ��Ŀ�� �����ϰ� ������ ��Ŀ �迭�� �߰��ϴ� �Լ��Դϴ�
function createCarparkMarkers() {
    for (var i = 0; i < carparkPositions.length; i++) {
        
        var imageSize = new daum.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new daum.maps.Point(10, 72),    
                spriteSize: new daum.maps.Size(36, 98)  
            };       
     
        // ��Ŀ�̹����� ��Ŀ�� �����մϴ�
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(carparkPositions[i], markerImage);  

        // ������ ��Ŀ�� ������ ��Ŀ �迭�� �߰��մϴ�
        carparkMarkers.push(marker);        
    }                
}

// ������ ��Ŀ���� ���� ǥ�� ���θ� �����ϴ� �Լ��Դϴ�
function setCarparkMarkers(map) {        
    for (var i = 0; i < carparkMarkers.length; i++) {  
        carparkMarkers[i].setMap(map);
    }        
}

// ī�װ��� Ŭ������ �� type�� ���� ī�װ��� ��Ÿ�ϰ� ������ ǥ�õǴ� ��Ŀ�� �����մϴ�
function changeMarker(type){
    
    var coffeeMenu = document.getElementById('coffeeMenu');
    var storeMenu = document.getElementById('storeMenu');
    var carparkMenu = document.getElementById('carparkMenu');
    
    // Ŀ�Ǽ� ī�װ��� Ŭ������ ��
    if (type === 'coffee') {
    
        // Ŀ�Ǽ� ī�װ��� ���õ� ��Ÿ�Ϸ� �����ϰ�
        coffeeMenu.className = 'menu_selected';
        
        // �������� ������ ī�װ��� ���õ��� ���� ��Ÿ�Ϸ� �ٲߴϴ�
        storeMenu.className = '';
        carparkMenu.className = '';
        
        // Ŀ�Ǽ� ��Ŀ�鸸 ������ ǥ���ϵ��� �����մϴ�
        setCoffeeMarkers(map);
        setStoreMarkers(null);
        setCarparkMarkers(null);
        
    } else if (type === 'store') { // ������ ī�װ��� Ŭ������ ��
    
        // ������ ī�װ��� ���õ� ��Ÿ�Ϸ� �����ϰ�
        coffeeMenu.className = '';
        storeMenu.className = 'menu_selected';
        carparkMenu.className = '';
        
        // ������ ��Ŀ�鸸 ������ ǥ���ϵ��� �����մϴ�
        setCoffeeMarkers(null);
        setStoreMarkers(map);
        setCarparkMarkers(null);
        
    } else if (type === 'carpark') { // ������ ī�װ��� Ŭ������ ��
     
        // ������ ī�װ��� ���õ� ��Ÿ�Ϸ� �����ϰ�
        coffeeMenu.className = '';
        storeMenu.className = '';
        carparkMenu.className = 'menu_selected';
        
        // ������ ��Ŀ�鸸 ������ ǥ���ϵ��� �����մϴ�
        setCoffeeMarkers(null);
        setStoreMarkers(null);
        setCarparkMarkers(map);  
    }    
} 
</script>
</head>
<body>
${list} 
</body>
</html>