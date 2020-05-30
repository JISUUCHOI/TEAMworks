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
<link href='css/timegridMain.css' rel='stylesheet' />
<link href='css/listMain.css' rel='stylesheet' />
<script src='js/coreMain.js'></script>
<script src='js/interactionMain.js'></script>
<script src='js/daygridMain.js'></script>
<script src='js/timegridMain.js'></script>
<script src='js/listMain.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var initialTimeZone = 'local';
    var timeZoneSelectorEl = document.getElementById('time-zone-selector');
    var loadingEl = document.getElementById('loading');
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      timeZone: initialTimeZone,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      defaultDate: '2020-02-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      selectable: true,
      eventLimit: true, // allow "more" link when too many events
      events: {
        url: 'selectList.re',
        failure: function() {
          document.getElementById('script-warning').style.display = 'inline'; // show
        }
      },
      loading: function(bool) {
        if (bool) {
          loadingEl.style.display = 'inline'; // show
        } else {
          loadingEl.style.display = 'none'; // hide
        }
      },

      eventTimeFormat: { hour: 'numeric', minute: '2-digit', timeZoneName: 'short' },

      dateClick: function(arg) {
        console.log('dateClick', calendar.formatIso(arg.date));
      },
      select: function(arg) {
        console.log('select', calendar.formatIso(arg.start), calendar.formatIso(arg.end));
      }
    });

    calendar.render();

    // load the list of available timezones, build the <select> options
    // it's HIGHLY recommended to use a different library for network requests, not this internal util func
    FullCalendar.requestJson('GET', 'php/get-time-zones.php', {}, function(timeZones) {

      timeZones.forEach(function(timeZone) {
        var optionEl;

        if (timeZone !== 'UTC') { // UTC is already in the list
          optionEl = document.createElement('option');
          optionEl.value = timeZone;
          optionEl.innerText = timeZone;
          timeZoneSelectorEl.appendChild(optionEl);
        }
      });
    }, function() {
      // TODO: handle error
    });

    // when the timezone selector changes, dynamically change the calendar option
    timeZoneSelectorEl.addEventListener('change', function() {
      calendar.setOption('timeZone', this.value);
    });
  });

</script>
<style>

  body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
  }
  .left { float: left }
  .right { float: right }
  .clear { clear: both }

  #script-warning, #loading { display: none }
  #script-warning { font-weight: bold; color: red }

  #calendar {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 10px;
  }

  .tzo {
    color: #000;
  }

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="sidebarReservation.jsp"/>
	
	<br><br>

<div style="width:1250px;    float:left;">
  <div id='top'>

    <div class='left'>
      Timezone:
      <select id='time-zone-selector'>
        <option value='local' selected>local</option>
        <option value='UTC'>UTC</option>
      </select>
    </div>

    <div class='right'>
      <span id='loading'>loading...</span>
      <span id='script-warning'><code>php/get-events.php</code> must be running.</span>
    </div>

    <div class='clear'></div>

  </div>

  <div id='calendar'></div>
  
  </div>
</body>
</html>