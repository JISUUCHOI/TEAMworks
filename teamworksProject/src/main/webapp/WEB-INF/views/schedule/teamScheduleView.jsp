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
	/*  margin: 40px 10px;
	    padding: 0; */
	    font-family: Handon3gyeopsal300g;
	    font-size: 14px;
	}

	#calendar {
	    max-width: 900px;
	    margin: 0 auto;
	    float:left;
	    margin-left:180px;
	}
  
	#rightArea	{
		float:right;
		width:400px;
		height:700px;
		/* border:1px solid red; */
	}
	
	#insertFormArea{display:none;}
	#updateFormArea{display:none;}
	
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
	<script>
	    var events = [];
	    <c:forEach var="e" items="${events}">
    		events.push({
    			id:'${e.schNo}',
	    		title:'${e.schTitle}',
	    		start:'${e.startDate}',
	    		end:'${e.endDate}',
	    		constraint:'${e.schCategory}'
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
	      eventClick: function(info) { //info.event.id
	    	  	
 		        $.ajax({
		        	url:"detail.sc",
		        	data:{schNo:info.event.id},
		        	type:"post",
		        	success:function(sch){
		        		
		                // Add response in Modal body
		                //$('.modal-body').html("로그인 성공");
				        $('#detailTable tr:first td').text(sch.schCategory);
			    	    $('#detailTable tr:nth-child(2) td').text(sch.schTitle);
			    	    $('#detailTable tr:nth-child(3) td').text(sch.startDate);
			    	    $('#detailTable tr:nth-child(4) td').text(sch.endDate);
			    	    $('#detailTable tr:nth-child(5) td').text(sch.schContent);
		        		
		        		if(sch.schCategory == "개인"){	// 개인 일정일 경우
		        			var value = '<button type="button" class="btn btn-primary" onclick="postFormSubmit(1);">수정</button><button type="button" class="btn btn-danger" onclick="postFormSubmit(2);">삭제</button>';
		        			$('.modal-footer').html(value);
		        		
		        		}else{	// 회사 일정일 경우
		        			var value='<button class="btn btn-danger" data-dismiss="modal">닫기</button>';
		        			$('.modal-footer').html(value);
		        		}
		        		
		        		$("#inputSchNo").attr("value", sch.schNo);
		        		
		                $('#detailModal').modal('show'); // Display Modal
		        		
		        		
		        	},error:function(){
		        		console.log("이벤트 상세조회용 ajax 통신 실패");
		        	}
		        });
	      }
	
	    });
	
	    calendar.render();
	  });

		$(function(){
			$("#calender>a").css("color", "dimgray");
			$("#calender").css("border-bottom-style", "groove");
			$("#teamSchCate>a").css("color", "deepskyblue");
		});	
	</script>

	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="scheduleSidebar.jsp"/>
	
	<br><br>

	<div style="width:1500px; float:left;">
		<h1 style="margin-left:180px;">회사 일정</h1>
		<div id='calendar'></div>
		<div id="rightArea"></div>
	</div>

	
	<!-- 이벤트 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 이벤트 클릭 시 보임) -->
    <div class="modal fade" id="detailModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h4 class="modal-title"c>일정 상세보기</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button> 
	            </div>

	            <!-- Modal Body -->
	            <div class="modal-body">
	                <table id="detailTable">
	                	<tr height="15%">
	                		<th>분류</th>
	                		<td id="category"></td>
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
	                		<th style="vertical-align:top; padding-top:10px;">일정 내용</th>
	                		<td style="vertical-align:top; padding-top:10px;"></td>
	                	</tr>
	                </table>
	            </div>
            
	            <!-- Modal footer -->
	            <div class="modal-footer"></div>
	            
	            <form action="" id="postForm" method="post">
	            	<input type="hidden" name="schNo" id="inputSchNo" value=""> <!-- schNo 넘겨야됨 -->
	            	<input type="hidden" name="empId" value="${loginUser.empId }">
	            </form>
	            
	            <script>
	            	function postFormSubmit(num) {
	            		if(num == 1) {	// 수정하기 클릭 시
	            			$("#postForm").attr("action", "updateSchForm.sc");
	            			//$("#updateFormArea").css("display", "block");
	            		}else {	// 삭제하기 클릭 시
	            			$("#postForm").attr("action", "deleteSch.sc");
	            		}
	            		
	            		$("#postForm").submit();
	            	}
	            </script>
            </div>
        </div>
    </div>
    <!-- 이벤트 클릭 시 뜨는 모달 끝 -->
    
    

	
</body>
</html>