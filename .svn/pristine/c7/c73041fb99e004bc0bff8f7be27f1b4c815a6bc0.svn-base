<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Stadium Detail</title>
<style type="text/css">
#top {
	displayt: table; background-color : #2FED28;
	padding: 7px;
	vertical-align: middle;
	width: 789px;
	float: left;
	background-color: #2FED28;
}

#main {
	display: table;
	width: 800px;
	margin: 0 auto;
	float: left;
	border: 1px solid #2FED28;
}

.navi1 {
	display: table-cell;
	font-size: 9pt;
	font-family: sans-serif;
	font-weight: bold;
	text-align: left;
	vertical-align: middle;
}

.navi2 {
	display: table-cell;
	font-size: 9pt;
	font-family: sans-serif;
	font-weight: bold;
	text-align: right;
	vertical-align: middle;
	width: 720px;
}

.cate {
	display: table-cell;
	width: 100px;
	text-align: center;
	vertical-align: middle;
}

.content {
	display: table-cell;
	width: 700px;
	text-align: center;
	vertical-align: middle;
}

.cate, .content {
	padding: 15px;
}

.list7 {
	cursor: pointer;
}

#map-canvas {
	width: 85%;
	height: 400px;
}
</style>

<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
	function initialize() {
		var mapLocation = new google.maps.LatLng('${staDto.st_latitude}',
				'${staDto.st_longtitude}'); // 지도에서 가운데로 위치할 위도와 경도
		var markLocation = new google.maps.LatLng('${staDto.st_latitude}',
				'${staDto.st_longtitude}'); // 마커가 위치할 위도와 경도

		var mapOptions = {
			center : mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
			zoom : 17, // 지도 zoom단계
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
		mapOptions);

		var size_x = 60; // 마커로 사용할 이미지의 가로 크기
		var size_y = 60; // 마커로 사용할 이미지의 세로 크기

		// 마커로 사용할 이미지 주소
		var image = new google.maps.MarkerImage(
				'http://www.larva.re.kr/home/img/boximage3.png',
				new google.maps.Size(size_x, size_y), '', '',
				new google.maps.Size(size_x, size_y));

		var marker;
		marker = new google.maps.Marker({
			position : markLocation, // 마커가 위치할 위도와 경도(변수)
			map : map,
			icon : image, // 마커로 사용할 이미지(변수)
			//       info: '말풍선 안에 들어갈 내용',
			title : '${staDto.st_name}' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
		});

		var content = '${staDto.st_name}'; // 말풍선 안에 들어갈 내용

		// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
		var infowindow = new google.maps.InfoWindow({
			content : content
		});

		google.maps.event.addListener(marker, "click", function() {
			infowindow.open(map, marker);
		});

	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>

<script type="text/javascript">
	/* function openLink(link) {

		var url = link;
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizeable=no,width=750,height=900");
	} */
</script>
</head>
<body>
	<div id="top">
		<span class="stadium navi1">경기장안내</span> <span class="stadium navi2">${staDto.st_area}>>${staDto.st_name}</span>
	</div>
	<p>	<p>	<p>
	<div id="main">
		<div class="imp line1">
			<span class="cate title1">풋살장</span> <span class="content list1">${staDto.st_name}</span>
		</div>
		<div class="imp line2">
			<span class="cate title2">주소</span> <span class="content list2">${staDto.st_addr}</span>
		</div>
		<div class="imp line3">
			<span class="cate title3">위치</span>
			<div class="content list3" id="map-canvas"></div>
		</div>
		<div class="imp line4">
			<span class="cate title4">전화번호</span> <span class="content list4">${staDto.st_phone}</span>
		</div>
		<div class="imp line5">
			<span class="cate title5">가능시간대</span> <span class="content list5">${staDto.st_time}</span>
		</div>
		<div class="imp line6">
			<span class="cate title6">가격대</span> <span class="content list6">${staDto.st_price}</span>
		</div>
		<div class="imp line7">
			<span class="cate title7">링크</span> <span class="content list7" ><a href='${staDto.st_link}'"><img src="resources/staImg/link_button.jpg" alt="" /></a></span>
		</div>
	</div>
</body>
</html>