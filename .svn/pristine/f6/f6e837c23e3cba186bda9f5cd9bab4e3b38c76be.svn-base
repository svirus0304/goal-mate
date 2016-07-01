<%@page import="com.GoalMate.www.DTO.MatchDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<head>
<meta name-"viewport" content="width=device-width, initial-scale=1"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"	src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <link rel="stylesheet" href="//code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="//code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> -->

<!-- ///////////////////////////////////////////////////////////////////////////////// -->

<style type="text/css">
/* Kurien / Kurien's Blog / http://blog.kurien.co.kr */
/* 주석만 제거하지 않는다면, 어떤 용도로 사용하셔도 좋습니다. */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Nanum Gothic', serif;
}

#kCalendar {
	width: 500px;
	height: 550px;
	margin: auto;
}

#kCalendar #header {
	height: 50px;
	line-height: 50px;
	text-align: center;
	font-size: 18px;
	font-weight: bold
}

#kCalendar .button {
	color: #000;
	text-decoration: none;
}

#kCalendar table {
	width: 500px;
	height: 400px;
	border-collapse: collapse;
	border-width: 1px;
	border-style:solid;
	border: 1px solid;
}

#kCalendar caption {
	display: none;
}

#kCalendar .sun {
	text-align: left;
	color: deeppink;
	vertical-align: top;
}

#kCalendar .mon {
	text-align: left;
	vertical-align: top;
}

#kCalendar .tue {
	text-align: left;
	vertical-align: top;
}

#kCalendar .wed {
	text-align: left;
	vertical-align: top;
}

#kCalendar .thu {
	text-align: left;
	vertical-align: top;
}

#kCalendar .fri {
	text-align: left;
	vertical-align: top;
}

#kCalendar .sat {
	text-align: left;
	color: deepskyblue;
	vertical-align: top;
}

#kCalendar .index {
	text-align: center;
	background-color: lightyellow;
}

/* dayDiv */
#kCalendar .dayDiv {
	width: 70px;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	line-height: 40px;
}
#kCalendar .dayDiv:hover {
	background-color: lightyellow;
	cursor: pointer;
}
#kCalendar .dayDiv.cntOn {
	width:70%;
	height:70%;
	margin:auto;
	border-radius: 50%;
	border: 5px solid #c0c0c0;
	-webkit-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}
#kCalendar .dayDiv.cntOn:hover {
	width:70%;
	height:70%;
	margin:auto;
	border-radius: 50%;
	border: 5px solid #ff8080;
	-webkit-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}
#kCalendar .dayDiv.cntOff:hover {
	font-size:13px;
	color:red;
	margin:auto;
	-webkit-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

/* 윗부분 */
#kCalendar .listSize {
	font-size:14px;
	float: right;
	margin-right: 10px;
	margin-top: 20px;
}
#kCalendar #date {
	margin-left: 30px;
	margin-right: 30px;
}
#kCalendar .leftSpan {
	margin-right: 0px;
}
#kCalendar .rightSpan {
	margin-left: 0px;
}
#kCalendar .indexSpan {
	margin-right: -80px;
}
.mainDiv{
	margin:auto;
	margin-top:60px;
}
.areaDiv{
	margin-left:250px;
	margin-bottom:-60px;
}

</style>

<!-- ///////////////////////////////////////////////////////////////////////////////// -->

<script type="text/javascript">



/* Kurien / Kurien's Blog / http://blog.kurien.co.kr */
/* 주석만 제거하지 않는다면, 어떤 용도로 사용하셔도 좋습니다. */

function kCalendar(id, date) {
	var kCalendar = document.getElementById(id);
	
	var list=new Array();
	var ii=0;
	<c:forEach var="fors" items="${list}">
		var ob=['${fors.mat_num}','${fors.mat_date}'];
		 list[ii]=ob;
		ii++;
	</c:forEach>
	
	/* for (var i = 0; i < list.length; i++) {
		alert(list[i][0]+" , "+list[i][1]);
	} */
	
	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	var currentYear = date.getFullYear();
	//년도를 구함
	
	var currentMonth = date.getMonth() + 1;
	//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
	
	var currentDate = date.getDate();
	//오늘 일자.
	
	date.setDate(1);
	var currentDay = date.getDay();
	//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
	
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
	var currentLastDate = lastDate[currentMonth-1];
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	
	//prevDate
	if(currentMonth != 1){
		if(currentDate==31){currentDate=1;}
		var cMonth=currentMonth-1;
		var cDate=currentDate;
		if(cMonth<10){cMonth='0'+cMonth;} 
		if(cDate<10){cDate='0'+cDate;} 
		var prevDate = currentYear + '-' + cMonth + '-' + cDate;
	}else{
		if(currentDate==31){currentDate=1;}
		var cDate=currentDate;
		if(cDate<10){cDate='0'+cDate;} 
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + cDate;
	}
	//만약 이번달이 1월이라면 1년 전 12월로 출력.
	
	//nextDate
	if(currentMonth != 12) {
		if(currentDate==31){currentDate=1;}
		var cMonth=currentMonth+1;
		var cDate=currentDate;
		if(cMonth<10){cMonth='0'+cMonth;} 
		if(cDate<10){cDate='0'+cDate;} 
		var nextDate = currentYear + '-' + cMonth + '-' + cDate;
	}else{
		if(currentDate==31){currentDate=1;}
		var cDate=currentDate;
		if(cDate<10){cDate='0'+cDate;} 
		var nextDate = ( currentYear + 1 ) + '-' + '01' + '-' + cDate;
	}
	//만약 이번달이 12월이라면 1년 후 1월로 출력.

	
	/* if( currentMonth < 10 )
		var currentMonth = '0' + currentMonth;
	//10월 이하라면 앞에 0을 붙여준다. */
	
	var calendar = '';
	var area=$('select[name=area]').val();
	
	calendar += '<div id="header">';
	calendar += '			<span class="listSize">총 매치 :  '+list.length+'</span>';
	calendar += '			<span class="indexSpan">';
	calendar += '			<span class="leftSpan"><a href="template?page=/matchUpCal?date='+prevDate+'&area='+area+'" class="button left">◀</a></span>';
/* 	calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>'; */
	calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
	calendar += '			<span class="rightSpan"><a href="template?page=/matchUpCal?date='+nextDate+'&area='+area+'" class="button right">▶</a></span>';
	calendar += '			</span>';
/* 	calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>'; */
	calendar += '		</div>';
	calendar += '		<table border="1" cellspacing="0" cellpadding="0">';
	calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
	calendar += '			<thead>';
	calendar += '				<tr>';
	calendar += '				  <th class="sun index" scope="row">일</th>';
	calendar += '				  <th class="mon index" scope="row">월</th>';
	calendar += '				  <th class="tue index" scope="row">화</th>';
	calendar += '				  <th class="wed index" scope="row">수</th>';
	calendar += '				  <th class="thu index" scope="row">목</th>';
	calendar += '				  <th class="fri index" scope="row">금</th>';
	calendar += '				  <th class="sat index" scope="row">토</th>';
	calendar += '				</tr>';
	calendar += '			</thead>';
	calendar += '			<tbody>';
	
	var dateNum = 1 - currentDay;
	var idx=0;
	for(var i = 0; i < week; i++) {
		calendar += '			<tr>';
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="' + dateString[j] + '"> </td>';
				continue;
			}//if
			var cnt=0;
			for (var p = 0; p < list.length ; p++) {
				if (list[p][1].substring(8,10)==dateNum) {
					cnt++;
				}//if
			}//for
			
			if (cnt!=0) {
				calendar += '				<td class="' + dateString[j] + '">' + dateNum + '<div class="dayDiv cntOn">'+cnt+'</div></td>';
			}else{
				calendar += '				<td class="' + dateString[j] + '">' + dateNum + '<div class="dayDiv cntOff"></div></td>';
			}//else
			
		}//for days
		calendar += '			</tr>';
	}//for weeks
	
	calendar += '			</tbody>';
	calendar += '		</table>';
	
	kCalendar.innerHTML = calendar;
////////////////////////////////////////////
$(document).ready(function(){

	$(".cntOff").hover(function(){
		$(this).text("매치등록");
	},function(){
		$(this).text("");
	});//hover
	
	$(".cntOff").click(function(){
		var test=$(this).parent("td").text();
		var testSp=test.split("매");
		var date=currentYear+"-"+currentMonth+"-"+testSp[0];
		
		location.href="template?page=/challengeRegForm?date="+date;
	});
	$(".cntOn").click(function(){
		var td_day=$(this).parent("td").text();
		var td_cnt=$(this).text();
		var day=td_day.substring(0,td_day.length-td_cnt.length);
		var date=currentYear+"-"+currentMonth+"-"+day;
		var area=$('select[name=area]').val();
		
		location.href="template?page=/matchUpList?date="+date+"&area="+area;
	});
		
		
});//ready
/////////////////////////////////////////////

}//kCalendar

function changeArea(){
	var area=$('select[name=area]').val();
	location.href="template?page=/matchUpCal?date=${date}&area="+area;
}//chageArea()
$(document).ready(function(){
	
});
	</script>
<!-- ///////////////////////////////////////////////////////////////////////////////// -->
</head>
<body>
<div class="mainDiv">
	<div class="areaDiv">
		<select name="area" onchange="changeArea();">
			<c:forEach var="fors" items="${areas }">
				<c:choose>
					<c:when test="${fors.equals(area) }">
						<option selected>${fors }</option>
					</c:when>
					<c:otherwise>
						<option>${fors }</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
	</div>
	<div id="kCalendar" ></div>
</div>
	<script>
		window.onload = function () {
			kCalendar('kCalendar','${date}');
		};
	</script>
	

</body>
</html>