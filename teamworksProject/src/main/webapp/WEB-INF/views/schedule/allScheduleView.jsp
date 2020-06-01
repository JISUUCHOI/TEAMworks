<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='css/coreMain.css' rel='stylesheet' />
<link href='css/daygridMain.css' rel='stylesheet' />
<script src='js/coreMain.js'></script>
<script src='js/interactionMain.js'></script>
<script src='js/daygridMain.js'></script>
<script src='js/ko.js'></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	@font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }
  body {
/*     margin: 40px 10px;
    padding: 0; */
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
    float:left; 
    border:1px solid black; 
    margin-left:180px;
  }
  
  .rightArea {
  	font-family:'Handon3gyeopsal300g';
  	float:right; 
  	border:1px solid #f2f2f2; 
  	width:400px; 
  	height:720px;
  }

</style>
</head>
<body>
	<script>
	    var events = [];
	    <c:forEach var="e" items="${events}">
    		events.push({
    			id:'${e.schNo}',
	    		title:'${e.schTitle}',
	    		start:'${e.startDate}',
	    		end:'${e.endDate}'
    		});
	    </c:forEach>
	    
		document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid' ],
	      defaultDate: '${today}',
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: events,
	      locale: 'ko',
	      eventClick: function(info) {//info.event.id
	    	  
 		        $.ajax({
		        	url:"detail.sc",
		        	data:{schNo:info.event.id},
		        	type:"post",
		        	success:function(sch){
		        		//console.log(sch);
		        		
				    	$('#detailTable tr:first td').text(sch.schCategory);
				    	$('#detailTable tr:nth-child(2) td').text(sch.schTitle);
				    	$('#detailTable tr:nth-child(3) td').text(sch.startDate);
				    	$('#detailTable tr:nth-child(4) td').text(sch.endDate);
				    	$('#detailTable tr:nth-child(5) td').text(sch.schContent);
		        		
		        		
		        	},error:function(){
		        		console.log("이벤트 상세조회용 ajax 통신 실패!");
		        	}
		        });
	      }
	
	    });
	
	    calendar.render();
	  });

	</script>

	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="sidebarSchedule.jsp"/>
	
	<br><br>

	<div style="width:1500px; float:left;">
		<div id='calendar'></div>
		<div class="rightArea" id="detailForm">
			<h1>일정 상세보기</h1>
			<table id="detailTable" border="1">
				<tr>
					<th>분류</th>
					<td></td>
				</tr>
				<tr>
					<th>일정 제목</th>
					<td></td>
				</tr>
				<tr>
					<th>일정 시작일</th>
					<td></td>
				</tr>
				<tr>
					<th>일정 종료일</th>
					<td></td>
				</tr>
				<tr>
					<th>일정 내용</th>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="rightArea" id="updateForm">
		
		</div>
	</div>
	
	
	
</body>
</html>