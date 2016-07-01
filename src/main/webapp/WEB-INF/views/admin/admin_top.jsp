<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>

<title>adminMain.jsp</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<style type="text/css">
/*---------------------------------------
 **   SECTION:  OUR FOCUS             -----
-----------------------------------------*/
.focus {
	padding-bottom: 100px;
	overflow: hidden;
	background: #FFFFFF;
}
/* FOCUS BOX */
.focus-box {
	float: left;
}

.focus-box .service-icon {
	width: 160px;
	height: 160px;
	margin: auto;
	border-radius: 50%;
	border: 10px solid #ececec;
	margin-bottom: 20px;
	position: relative;
	margin: auto;
	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	margin-bottom: -50px;
}

.service-icon .pd-icon-monitor {
	margin-top: 10px;
	width: 100px;
}

.service-icon .pd-icon-check {
	width: 90px;
	margin-top: 10px;
}

/* ON HOVER COLORED ROUNDED CIRCLE AROUND ICONS */
.red, .green, .blue, .yellow {
	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

.red:hover .service-icon {
	border: 10px solid #e96656;
}

.green:hover .service-icon {
	border: 10px solid #34d293;
}

.blue:hover .service-icon {
	border: 10px solid #3ab0e2;
}

.yellow:hover .service-icon {
	border: 10px solid #f7d861;
}

.focus-box h5 {
	color: #404040;
	position: relative;
	display: inline-block;
	text-transform: uppercase;
	font-weight: bold;
	font-size: 20px;
}

.focus-box p {
	font-size: 14px;
}

.center{margin: auto;}
</style>

<script type="text/javascript">
function logout(){
	<%session.invalidate();%>
	alert("로그아웃 되셨습니다.");
	location.href="template";
}//logout()
</script>

</head>
<body>
	<table align="center">
		<tr>
			<td width=25%></td>
			<td align="center">
				<div class="focus-box red wow fadeInLeft animated center"	data-wow-offset="30" data-wow-duration="1.5s"
					data-wow-delay="0.15s">
					<div class="service-icon">
						<a href="adminMain?page=/scoreList"> <img class="pd-icon-check" src="resources/admin/img/icon-check.png">
						</a>
					</div>
					<h5 class="red-border-bottom">MATCH</h5>
					<!-- FOCUS HEADING -->
				</div>

				<div class="focus-box yellow wow fadeInRight animated center" data-wow-offset="30" data-wow-duration="1.5s"
					data-wow-delay="0.15s">
					<div class="service-icon">
						<a href="adminMain?page=/bannerList"> <img class="pd-icon-monitor"	src="resources/admin/img/icon-monitor.png">
						</a>
					</div>
					<h5 class="yellow-border-bottom">BANNER</h5>
				</div>
			</td>
		</tr>
	</table>
	
</body>
</html>
