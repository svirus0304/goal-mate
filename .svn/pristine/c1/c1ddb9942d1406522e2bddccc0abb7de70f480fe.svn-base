<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>GoogleMap</title>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
      function initialize() {
    	  //참고로 위도와 경도는 https://maps.google.com 의 지도에서, 오른쪽 클릭 → 이곳이 궁금한가요? 선택하면 알아낼 수 있다
    	  //DB변수로 지정해야 될것 : 해당위치의 위도 및 경도, 구장이름, 말풍선 내용
        var mapLocation = new google.maps.LatLng('35.895074', '128.627712'); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng('35.895074', '128.627712'); // 마커가 위치할 위도와 경도
         
        var mapOptions = {
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 17, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
         
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
         
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
         
        var marker;
        marker = new google.maps.Marker({
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               icon: image, // 마커로 사용할 이미지(변수)
//            info: '말풍선 안에 들어갈 내용',
               title: '불로풋살장' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });
         
        var content = "이곳은 불로풋살장 <br/> 풋살 한겜!~"; // 말풍선 안에 들어갈 내용
         
        // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });
         
 
         
      }
      google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
<h1>구글 맵</h1>
<div id="map-canvas" style="width: 80%; height: 400px;"></div>

</body>
</html>