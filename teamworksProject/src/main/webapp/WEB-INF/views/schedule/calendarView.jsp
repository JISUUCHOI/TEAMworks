<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: '2020-03-12',
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2020-03-01'
        },
        {
          title: 'Long Event',
          start: '2020-03-07',
          end: '2020-03-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-03-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2020-03-11',
          end: '2020-03-13'
        },
        {
          title: 'Meeting',
          start: '2020-03-12T10:30:00',
          end: '2020-03-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2020-03-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2020-03-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2020-03-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2020-03-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2020-03-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2020-03-28'
        }
      ],

      locale: 'ko',
      dateClick: function() {
        alert('날짜 클릭 이벤트 발생');
      },
      eventClick: function() {
        alert('일정 클릭 이벤트 발생');
      },
      titleFormat: function(date) {
        return `${date.date.year}년 ${date.date.month + 1}월`;
      }

    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
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
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="sidebarSchedule.jsp"/>

	<div style="width:1250px; float:left;">
		<div id='calendar'></div>
	</div>
	
</body>
</html>