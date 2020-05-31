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

  body {
/*     margin: 40px 10px;
    padding: 0; */
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
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
		        		console.log(sch);
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

	<div style="width:1250px; float:left;">
		<div id='calendar'></div>
	</div>
	
	
	
</body>
</html>