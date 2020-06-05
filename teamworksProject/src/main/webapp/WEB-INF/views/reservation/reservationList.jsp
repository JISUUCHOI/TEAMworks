<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.teamworks.reservation.model.vo.ReservationDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
@font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }
	
	body {font-family: Handon3gyeopsal300g;}
	p {
		margin-bottom:0px;
	}
	
   #dateArea b {font-size: 30px;}

  .pointBtn{
    background-color: #07355A;
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 27px;
    cursor: pointer;
    border-radius: 50%;
    padding-left:10px;
    padding-right:10px;
    margin-left:20px;
    margin-right:20px;
  }

  #reservationTable{
    width:800px;
    border-collapse: collapse;
  }

  #reservationTable th, #reservationTable td{
    height:40px;
    text-align:center;
    border: 1px solid #ddd;
  }

  #reservationTable thead>tr {background-color: #f2f2f2;}
  #reservationTable tr {height:50px;}
  #reservationTable tbody tr td:nth-child(2), #reservationTable tbody tr td:nth-child(3), #reservationTable tbody tr td:nth-child(4){
    font-size:13px;
  }

  a{
    text-decoration: none;
    color:black;
  }

  .modal-content{width:400px;}
  .modalTable th, .modalTable td{
    height:40px;
    text-align:center;
    border:1px solid #ddd;
  }
  .modalTable th{background:#f2f2f2;}

	input[type=number]{width:45px;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="reservationSidebar.jsp"/>
	
	<br>

	<div style="width:1250px; float:left;">
	
		<div id="dateArea" align="center">
		  <button class="pointBtn" id="beforeBtn" onclick="absAday();">&lt;</button>
		  <b id="todayDate">${ rdto.currentDate }</b>&nbsp;<b id="todayOfWeek">${ rdto.dayOfWeek }</b>
		  <button class="pointBtn" id="afterBtn" onclick="addAday();">&gt;</button>
		</div>
		
		<br>
		
		<table id="reservationTable" align="center">
		  <thead>
		    <tr>
		    	<th width="25%"><p>&nbsp;</p></th>
		    	<th width="25%"><p>회의실1</p></th>
		    	<th width="25%"><p>회의실2</p></th>
		    	<th width="25%"><p>회의실3</p></th>
		    </tr>
		  </thead>
		  <tbody>
		      <tr id="07" class="">
		      	<th>07:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="08" class="">
		      	<th>08:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="09" class="">
		      	<th>09:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="10" class="">
		      	<th>10:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="11" class="">
		      	<th>11:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="12" class="">
		      	<th>12:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="13" class="">
		      	<th>13:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="14" class="">
		      	<th>14:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="15" class="">
		      	<th>15:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="16" class="">
		      	<th>16:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="17" class="">
		      	<th>17:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="18" class="">
		      	<th>18:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="19" class="">
		      	<th>19:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="20" class="">
		      	<th>20:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="21" class="">
		      	<th>21:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="22" class="">
		      	<th>22:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="23" class="">
		      	<th>23:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
    		</tbody>
		</table>
		
		<br><br><br><br>
	</div>
	
	<script>
		// 페이지 로딩 시 오늘 날짜와 그에 해당하는 예약 리스트 가져옴
		$(function(){
			
			$.ajax({
				url:"selectList.re",
				data:{},
				type:"post",
				success:function(rdto){
					// 오늘 날짜 보여주기
					$('#todayDate').text(rdto.currentDate);
					$('#todayOfWeek').text(rdto.dayOfWeek);
					
					// 조회해온 오늘의 예약 리스트 보여주기
					for(var r=0; r<rdto.list.length; r++) {
						
						var selector = '#' + rdto.list[r].startTime + ' .00' + rdto.list[r].roomNo;
						var rInfo = rdto.list[r].empName + ' | ' + rdto.list[r].deptName + '<br>' + rdto.list[r].startTime + ':00 - ' + rdto.list[r].endTime + ":00";
						
						$(selector).html(rInfo);
						$(selector).css('background', '#d4f4fa');
					}
					
				},error:function(){
					console.log("처음 페이지 로딩 시 실행되는 ajax 통신 실패");
				}
			});
			
		});
	
		
		// 이전 버튼 클릭 시 하루 전 날짜로 예약 리스트 재 조회 후 리스트와 날짜 가져오는 function
		function absAday() {
			
			$.ajax({
				url:"reSelectAbs.re",
				data:{currentDate:$('#todayDate').text()},
				type:"post",
				success:function(rdto){
					// 이전 날짜의 예약 정보 지우기
					$('#reservationTable td').text('');
					$('#reservationTable td').css('background', '');
					
					// 현재 날짜 보여주기
					$('#todayDate').text(rdto.currentDate);
					$('#todayOfWeek').text(rdto.dayOfWeek);
					
					// 새로 조회해온 현재 날짜의 예약 리스트 보여주기
					for(var r=0; r<rdto.list.length; r++) {
						
						var selector = '#' + rdto.list[r].startTime + ' .00' + rdto.list[r].roomNo;
						var rInfo = rdto.list[r].empName + ' | ' + rdto.list[r].deptName + '<br>' + rdto.list[r].startTime + ':00 - ' + rdto.list[r].endTime + ":00";
						
						$(selector).html(rInfo);
						$(selector).css('background', '#d4f4fa');

					}
					
				},error:function(){
					console.log("이전 날짜 조회용 ajax 통신 실패");
				}
			});
			
		}
		
		// 다음 버튼 클릭 시 하루 뒤 날짜로 예약 리스트 재 조회 후 리스트와 날짜 가져오는 function
		function addAday() {
			
			$.ajax({
				url:"reSelectAdd.re",
				data:{currentDate:$('#todayDate').text()},
				type:"post",
				success:function(rdto){
					// 이전 날짜의 예약 정보 지우기
					$('#reservationTable td').text('');
					$('#reservationTable td').css('background', '');
					
					// 현재 날짜 보여주기
					$('#todayDate').text(rdto.currentDate);
					$('#todayOfWeek').text(rdto.dayOfWeek);
					
					// 새로 조회해온 현재 날짜의 예약 리스트 보여주기
					for(var r=0; r<rdto.list.length; r++) {
						
						var selector = '#' + rdto.list[r].startTime + ' .00' + rdto.list[r].roomNo;
						var rInfo = rdto.list[r].empName + ' | ' + rdto.list[r].deptName + '<br>' + rdto.list[r].startTime + ':00 - ' + rdto.list[r].endTime + ":00";
						
						$(selector).html(rInfo);
						$(selector).css('background', '#d4f4fa');
						
					}
					
				},error:function(){
					console.log("다음 날짜 조회용 ajax 통신 실패");
				}
			});
			
		}
		
		// 테이블의 td가 비어있을 시 --> 예약 추가 모달 / 채워져있을 시 --> 예약 상세 모달 띄움
		$(function(){
			$('#reservationTable>tbody td').click(function(){
				
				if($(this).text() == '') {	// 예약 없음 --> 추가 모달
					
					var startTime = $(this).siblings('th').text().substring(0,2);
					var numEndTime = (startTime*1) + 1;
					var endTime = '';
					if(numEndTime == 8 || numEndTime == 9) {
						endTime = '0' + numEndTime;
					}else {
						endTime += numEndTime;
					}
					var meetingRoom = '회의실' + $(this).attr('class').substring(2);

					$('#meetingRoom').text(meetingRoom);
					$('#reservationDate').text($('#todayDate').text());
					$('#startTime').attr('value', startTime);
					$('#endTime').attr('value', endTime);
					
					$('#insertModal').modal('show');
					
				}else {	// 예약 있음 --> 상세 모달
					
					$('#detailModal').modal('show');
					
				}
			});
		});
	</script>

	
	
	<!-- 예약 추가 모달 (빈 칸 클릭 시 뜸)-->
	<div class="modal fade" id="insertModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	          <h4 class="modal-title">예약하기</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button> 
	      </div>
	
	      <form action="예약요청받아주는서버" method="post">
	          <!-- Modal Body -->
	          <div class="modal-body">
	              <table align="center" class="modalTable">
	                <tr>
	                  <th width="30%">회의실</th>
	                  <td width="70%" id="meetingRoom"></td>
	                </tr>
	                <tr>
	                  <th>사용자</th>
	                  <td id="empName">${ loginUser.empName }</td>
	                </tr>
	                <tr>
	                  <th>날짜</th>
	                  <td id="reservationDate"></td>
	                </tr>
	                <tr>
	                  <th>예약시간</th>
	                  <td>
	                    <input type=number id="startTime" name="startTime" value="" readonly> : 00
	                    ~
	                    <input type=number id="endTime" name="endTime" value="" readonly> : 00
	                  </td>
	                </tr>
	                <tr>
	                  <th>사용용도</th>
	                  <td>
	                    <input type="radio" name="purpose" id="team" value="팀사용">
	                    <label for="team">팀 사용</label> <br>
	                    <input type="radio" name="purpose" id="outside" value="외부사용">
	                    <label for="outside">외부 사용</label> <br>
	                    <input type="radio" name="purpose" id="etc">
	                    <label for="etc">기타</label>
	                    <input type="text" name="purpose" size="15">
	                  </td>
	                </tr>
	              </table>
	          </div>
	          
	          <input type="hidden" name="reservationDate" value="${ rdto.currentDate }">	<!-- 예약 날짜 -->
	          <input type="hidden" name="empId" value="${ loginUser.empId }">
	          
	          <!-- Modal footer -->
	          <div class="modal-footer">
	              <button type="submit" class="btn btn-primary" onclick="">예약</button>
	              <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	          </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	
	<!-- 예약 상세 모달 (예약있는 칸 클릭 시 뜸)-->
	<div class="modal fade" id="detailModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	          <h4 class="modal-title">예약 상세보기</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button> 
	      </div>
	
	      <form action="예약상세조회서버" method="post">
	          <!-- Modal Body -->
	          <div class="modal-body">
	              <table align="center" class="modalTable">
	                <tr>
	                  <th width="30%">회의실</th>
	                  <td width="70%">
	                    <select>
	                      <option value="회의실1">회의실1</option>
	                      <option value="회의실2">회의실2</option>
	                      <option value="회의실3">회의실3</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr>
	                  <th>사용자</th>
	                  <td>${ loginUser.empName }</td>
	                </tr>
	                <tr>
	                  <th>날짜</th>
	                  <td>${ today }</td>
	                </tr>
	                <tr>
	                  <th>예약시간</th>
	                  <td>
	                    <input type=number id="startTime" name="startTime" min="8" max="23" required> : 00
	                    ~
	                    <input type=number id="endTime" name="endTime" min="8" max="23" required> : 00
	                  </td>
	                </tr>
	                <tr>
	                  <th>사용용도</th>
	                  <td>
	                    <input type="radio" name="purpose" id="team" value="팀사용">
	                    <label for="team">팀 사용</label> <br>
	                    <input type="radio" name="purpose" id="outside" value="외부사용">
	                    <label for="outside">외부 사용</label> <br>
	                    <input type="radio" name="purpose" id="etc">
	                    <label for="etc">기타</label>
	                    <input type="text" name="purpose" size="15">
	                  </td>
	                </tr>
	              </table>
	          </div>
	          
	          <!-- Modal footer -->
	          <div class="modal-footer">
	              <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	          </div>
	      </form>
	    </div>
	  </div>
	</div>

	
</body>
</html>