<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
  #todayDate{
    font-size: 30px;
    padding-left: 20px;
    padding-right: 20px;
  }

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
	
		<div align="center">
		  <button class="pointBtn" id="beforeBtn">&lt;</button>
		  <b id="todayDate">${ today }&nbsp;${ dayOfWeek }</b>
		  <button class="pointBtn" id="afterBtn">&gt;</button>
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
		      <tr id="07:00" class="">
		      	<th>07:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="08:00" class="">
		      	<th>08:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="09:00" class="">
		      	<th>09:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="10:00" class="">
		      	<th>10:00</th>
		        <td class="001" style="background:#d4f4fa;"><p>최부장 | 개발팀 <br> 10:00 - 11:00</p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="11:00" class="">
		      	<th>11:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="12:00" class="">
		      	<th>12:00</th>
		        <td class="001"><p></p></td>
		        <td class="002" style="background:#d4f4fa;"><p>라이사 | 경영지원팀 <br> 12:00 - 13:00</p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="13:00" class="">
		      	<th>13:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="14:00" class="">
		      	<th>14:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="15:00" class="">
		      	<th>15:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td style="background:#d4f4fa;"><p>이부장 | 경영지원팀 <br> 15:00 - 16:00</p></td>
		      </tr>
		      <tr id="16:00" class="">
		      	<th>16:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="17:00" class="">
		      	<th>17:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="18:00" class="">
		      	<th>18:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="19:00" class="">
		      	<th>19:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="20:00" class="">
		      	<th>20:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="21:00" class="">
		      	<th>21:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="22:00" class="">
		      	<th>22:00</th>
		        <td class="001"><p></p></td>
		        <td class="002"><p></p></td>
		        <td class="003"><p></p></td>
		      </tr>
		      <tr id="23:00" class="">
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
	              <button type="submit" class="btn btn-primary" onclick="return reservationSubmit();">예약</button>
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
	          <h4 class="modal-title">예약 상세</h4>
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