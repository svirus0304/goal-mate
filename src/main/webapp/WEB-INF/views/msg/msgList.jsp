<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
var check=false;


function delSelect(){
	  var chked_val = "";
	  $(":checkbox[name='sel']:checked").each(function(pi,po){
	    chked_val += ","+po.value;
	  });
	  if(chked_val!="")
	  {
		  chked_val = chked_val.substring(1);	  
		  location.href="template?page=/msgDel?lists="+chked_val;
	  }else{
	  alert("선택되지 않았습니다");		  
	  }
	  
}

function oneDel(num){
	location.href="template?page=/msgDel?ones="+num+"&nowpage="+${pages};
}


function CheckAll(){
	var chk = document.getElementsByName("sel");
	if(check == false){
	check = true;
	for(var i=0; i<chk.length;i++){                                                                    
	chk[i].checked = true;     //모두 체크
	}
	}else{
	check = false;
	for(var i=0; i<chk.length;i++){                                                                    
	chk[i].checked = false;     //모두 해제
	}
	}
}
	
function msgDetail(msg_num){
	var width = 800;
	var height = 600;
	var left = screen.width/2 - width/2;
	var top = screen.height/2 - height/2
	var option = 'width = ' + 800 + ', ' + 'height = ' + 600;
	option += ', ' + 'top = ' + top + ', ' + 'left = ' + left;
	window.open("msgDetail?msg_num="+msg_num,"msgDetail",option);
}



$(document).ready(function(){
	$('.msg_num').css("display","none");
	$("#searchText").focus();
	$(".items").hover(function(){
		$(this).css("background-color","#B2EBF4").css("cursor","pointer");
	},function(){
		$(this).css("background-color","white").css("cursor","pointer");
	});//hover
	
	$(".items").click(function(){
		var msg_num=$(this).children('.msg_num').text();
		msgDetail(msg_num);
	});//click
	
});//ready

</script>
<style>
#tables{
	text-align: center;
}
.center{
 text-align: center;	
}

img{
	width: 30%
}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	
	<div class="">
		<form>
		<table id="tables" width="80%" align="center" >
			<tr><td>총쪽지 수:${count}</td></tr>
			<tr bgcolor="#B2EBF4">
				<td width="10%" >상태</td>
				<td width="15%" >보낸 사람</td>
				<td width="35%" >내용</td>
				<td width="15%" >날짜</td>
				<td width="15%" ><input type="button" value="전체 선택/선택 취소" onclick="CheckAll()"></td>
				<td width="15%" ><input type="button" value="선택 삭제" onclick="delSelect()"></td>
			</tr>
			<c:forEach items="${list}" var="rows" varStatus="num">
			<tr class="items">
			<td class="msg_num">${rows.me_num}</td>
			<td>
			<c:if test="${fn:substring(rows.me_join,0,11) eq fn:substring(todate,0,11)}">
			<c:if test="${rows.recipient_read==0}" ><img src="resources/msg/NEW.png"> </c:if>
			<c:if test="${rows.recipient_read!=0}" >읽음</c:if>
		   </c:if>
		   <c:if test="${fn:substring(rows.me_join,0,11) != fn:substring(todate,0,11)}">
		   <c:if test="${rows.recipient_read==0}" >안읽음</c:if>
		   <c:if test="${rows.recipient_read!=0}" >읽음</c:if>
		   </c:if>
		   </td>
		   
			<td>${rows.me_sender}</td>
			<td>
			<c:if test="${fn:length(rows.me_content)<=20}">${rows.me_content}</c:if>
			<c:if test="${fn:length(rows.me_content)>20}">${fn:substring(rows.me_content,0,20)}...</c:if>
			</td>
			<td>${fn:substring(rows.me_join,0,11)}</td>
			<td><input type="checkbox" name="sel" value="${rows.me_num}"></td>
			<td><input type="button" name="delete" value="삭제" onclick="oneDel(${rows.me_num})"></td>
			</tr>
			</c:forEach>
		</table>
	<table cellpadding="10" cellspacing="10" align="center">
		<tr>
				<td>
			<c:if test="${pages>1}">
				[<a href="template?page=/msgList&nowpage=1">◀◀</a>]
				[<a href="template?page=/msgList&nowpage=${pages-1}">◀</a>]
			</c:if>
			
			<c:set var="doneLoop" value="false" />
			<c:forEach varStatus="num" begin="${startPage}" end="${endPage}">
				<c:if test="${not doneLoop}">					
						<a href="template?page=/msgList&nowpage=${num.index}">&nbsp&nbsp${num.index}</a>			
					</c:if>
				<c:if test="${num.index==allPage}">
					<c:set var="doneLoop" value="true" />
				</c:if>
			</c:forEach>
			<c:if test="${pages<allPage}">	
			[<a href="template?page=/msgList&nowpage=${pages+1}">▶</a>]
			[<a href="template?page=/msgList&nowpage=${allPage}">▶▶</a>]
			</c:if>
			</td>
		</tr>
	</table>
	</form>
	</div>
	
</body>
</html>