<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- fullCalendar -->
<link href='css/coreMain.css' rel='stylesheet' />
<link href='css/daygridMain.css' rel='stylesheet' />
<script src='js/coreMain.js'></script>
<script src='js/interactionMain.js'></script>
<script src='js/daygridMain.js'></script>
<script src='js/ko.js'></script>
<!-- jQuery 라이브러리 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	@font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }
  
	body {
	    font-family: Handon3gyeopsal300g;
	    font-size: 14px;
	}

	#calendar {
	    max-width: 900px;
	    margin: 0 auto;
	    float:left;
	    margin-left:50px;
	}
  
	#rightArea	{
		float:left;
		margin-left:30px;
		width:400px;
		height:700px;
	}
	
	#insertFormTable, #updateFormTable {
		width:400px;
		height:500px;
		font-size:17px;
		table-layout:fixed;
	}
	
  /* 모달 관련 style */
	.modal-content {
	  	width:450px;
	  	height:500px;
	}
	#detailTable {
	  	width:400px;
	  	height:300px;
	  	font-size:17px;
	  	table-layout:fixed;
	}
	#detailTable th, #insertFormTable th, #updateFormTable th {
	  	width:100px;
	  	padding-left:3px;
	}
	#detailTable td, #insertFormTable td, #updateFormTable td {
	  	overflow:auto;
		word-wrap:break-word;
	}
	td.textOverDefault {
	  	white-space : normal;
	  	text-overflow: clip;
	}
	/* 모달 관련 style 끝 */

</style>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			alertify.alert('message', '${msg}');
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>

	<script>
	    var events = [];
	    <c:forEach var="e" items="${events}">
	    	<c:choose>
	    		<c:when test="${e.schCategory eq '회사'}">
		    		events.push({
		    			id:'${e.schNo}',
			    		title:'${e.schTitle}',
			    		start:'${e.startDate}',
			    		end:'${e.endDate}',
			    		constraint:'${e.schCategory}',
			    		color:'#6c757d',
			    		textColor:'#ffffff'
		    		});
	    		</c:when>
	    		<c:otherwise>
		    		events.push({
		    			id:'${e.schNo}',
			    		title:'${e.schTitle}',
			    		start:'${e.startDate}',
			    		end:'${e.endDate}',
			    		constraint:'${e.schCategory}',
			    		color:'#0090ff',
			    		textColor:'#ffffff'
		    		});
	    		</c:otherwise>
	    	</c:choose>
	    </c:forEach>
	    
		document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid' ],
	      defaultDate: '${today}',
	      editable: true,
	      eventLimit: true,
	      events: events,
	      locale: 'ko'
	
	    });
	
	    calendar.render();
	  });

		$(function(){
			$("#calender>a").css("color", "dimgray");
			$("#calender").css("border-bottom-style", "groove");
			$("#insertSchCate>a").css("color", "deepskyblue");
			
			$(document).ready(function(){
				$("#sidebarOuter").css("min-height", "800px");
			});
		});	
	</script>

	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="scheduleSidebar.jsp"/>
	
	<br><br>

	<div style="width:1250px; float:left;">
		<div style="width:800px;">
			<div id='calendar'></div>
		</div>
		<div id="rightArea">
			<div id="insertFormArea">	<!-- 일정 추가 폼 -->
				<h3>일정 등록</h3>
				<form id="insertSchForm" action="insertManageSch.sc" method="post">
					<table id="insertFormTable">
	                	<tr height="10%">
	                		<th>분류</th>
	                		<td id="category">회사</td>
	                	</tr>
	                	<tr height="10%">
	                		<th>일정 제목</th>
	                		<td><input type="text" name="schTitle" size="25" required></td>
	                	</tr>
	                	<tr height="10%">
	                		<th>시작일</th>
	                		<td><input type="date" name="startDate" id="startDate" required></td>
	                	</tr>
	                	<tr height="10%">
	                		<th>종료일</th>
	                		<td><input type="date" name="endDate" id="endDate" required></td>
	                	</tr>
	                	<tr height="50%">
	                		<th style="vertical-align:top; padding-top:10px;">일정 내용</th>
	                		<td style="vertical-align:top; padding-top:10px;">
	                			<textarea name="schContent" rows="8" cols="30" style="resize:none;" required></textarea>
	                		</td>
	                	</tr>
	                	<tr height="10%">
	                		<td colspan="2">
	                			<div align="right" style="padding-right:10px;">
		                			<button type="submit" class="btn btn-primary" onclick="return validate();">등록</button>
		                			<button type="button" class="btn btn-danger" onclick="location.href='selectManageSch.sc';">취소</button>
	                			</div>
	                		</td>
	                	</tr>
	                </table>
				</form>
			</div>
		</div>
	</div>

	<script>
		function validate() {
			var startDate = document.getElementById("startDate");
			var endDate = document.getElementById("endDate");
			
            if(startDate.value > endDate.value){
                alert("일정 시작일이 종료일보다 늦을 수 없습니다. 다시 확인해주세요.");
                endDate.value = "";
                endDate.focus();
                return false;
            }
            
            return true;
		}
	</script>
    

	
</body>
</html>