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
/*     margin: 40px 10px;
    padding: 0; */
    font-family: Handon3gyeopsal300g;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  
  /* 모달 관련 style */
  .modal-content {
  	width:400px;
  	height:500px;
  }
  #detailTable {
  	width:400px;
  	height:300px;
  	font-size:17px;
  }
  #detailTable th{width:90px;}

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

		                // Add response in Modal body
		                //$('.modal-body').html("로그인 성공");
				        $('#detailTable tr:first td').text(sch.schCategory);
			    	    $('#detailTable tr:nth-child(2) td').text(sch.schTitle);
			    	    $('#detailTable tr:nth-child(3) td').text(sch.startDate);
			    	    $('#detailTable tr:nth-child(4) td').text(sch.endDate);
			    	    $('#detailTable tr:nth-child(5) td').text(sch.schContent);
		                $('#detailModal').modal('show'); // Display Modal
		        		
		        	},error:function(){
		        		console.log("이벤트 상세조회용 ajax 통신 실패");
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

	
	<!-- 이벤트 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 이벤트 클릭 시 보임) -->
    <div class="modal fade" id="detailModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title">일정 상세보기</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button> 
	            </div>

	            <!-- Modal Body -->
	            <div class="modal-body">
<!-- 	                <label for="userId" class="mr-sm-2">ID :</label>
	                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId"> <br>
	                <label for="userPwd" class="mr-sm-2">Password:</label>
	                <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd"> -->
	                <table id="detailTable">
	                	<tr height="15%">
	                		<th>분류</th>
	                		<td></td>
	                	</tr>
	                	<tr height="15%">
	                		<th>일정 제목</th>
	                		<td></td>
	                	</tr>
	                	<tr height="15%">
	                		<th>시작일</th>
	                		<td></td>
	                	</tr>
	                	<tr height="15%">
	                		<th>종료일</th>
	                		<td></td>
	                	</tr>
	                	<tr height="40%">
	                		<th>일정 내용</th>
	                		<td></td>
	                	</tr>
	                </table>
	            </div>
            
	            <!-- Modal footer -->
	            <div class="modal-footer">
	                <button type="submit" class="btn btn-primary">수정</button>
	                <button type="button" class="btn btn-danger" data-dismiss="modal">삭제</button>
	            </div>
            </div>
        </div>
    </div>
	
</body>
</html>