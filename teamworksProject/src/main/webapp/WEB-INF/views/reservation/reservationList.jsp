<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  #date{
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
  #reservationTable tbody tr td:nth-child(2), #reservationTable tbody tr td:nth-child(3), #reservationTable tbody tr td:nth-child(4){
    font-size:11px;
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


</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="sidebarReservation.jsp"/>

	<div align="center">
	  <button class="pointBtn">&lt;</button>
	  <b id="date">2020.05.12 (화)</b>
	  <button class="pointBtn">&gt;</button>
	</div>
	
	<br>
	
	<table id="reservationTable" align="center">
	  <thead>
	    <tr>
	      <th width="25%"></th>
	      <th width="25%">회의실1</th>
	      <th width="25%">회의실2</th>
	      <th width="25%">회의실3</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th>07:00</th>
	      <td><a data-toggle="modal" data-target="#loginModal"></a></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>08:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>09:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>10:00</th>
	      <td style="background:#d4f4fa;"><a>최부장 | 개발팀 <br> 10:00 - 11:00</a></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>11:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>12:00</th>
	      <td></td>
	      <td style="background:#d4f4fa;"><a>라이사 | 경영지원팀 <br> 12:00 - 13:00</a></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>13:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>14:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>15:00</th>
	      <td></td>
	      <td></td>
	      <td style="background:#d4f4fa;"><a>이부장 | 경영지원팀 <br> 15:00 - 16:00</a></td>
	    </tr>
	    <tr>
	      <th>16:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>17:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>18:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>19:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>20:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>21:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>22:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>23:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>00:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr>
	      <th>01:00</th>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	  </tbody>
	</table>
	
	<br><br>
	
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
	                  <td>(로그인유저의이름)</td>
	                </tr>
	                <tr>
	                  <th>날짜</th>
	                  <td>(현재페이지의날짜)</td>
	                </tr>
	                <tr>
	                  <th>예약시간</th>
	                  <td>
	                    <input type=time name="startTime" step="3600" required>
	                    ~
	                    <input type=time name="endTime" step="3600" required>
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
	              <button type="submit" class="btn btn-primary">예약</button>
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
	                  <td>(사용자의이름)</td>
	                </tr>
	                <tr>
	                  <th>날짜</th>
	                  <td>(일정날짜)</td>
	                </tr>
	                <tr>
	                  <th>예약시간</th>
	                  <td>
	                    <input type=time name="startTime" step="3600" required>
	                    ~
	                    <input type=time name="endTime" step="3600" required>
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
	
	<!-- 예약 수정 모달 (예약 상세 모달에서 수정버튼 클릭 시 뜸)-->
	<div class="modal fade" id="updateModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	          <h4 class="modal-title">예약 수정</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button> 
	      </div>
	
	      <form action="예약수정요청받아주는서버" method="post">
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
	                  <td>(로그인유저의이름)</td>
	                </tr>
	                <tr>
	                  <th>날짜</th>
	                  <td>(현재페이지의날짜)</td>
	                </tr>
	                <tr>
	                  <th>예약시간</th>
	                  <td>
	                    <input type=time name="startTime" step="3600" required>
	                    ~
	                    <input type=time name="endTime" step="3600" required>
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
	              <button type="submit" class="btn btn-primary">수정</button>
	              <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	          </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	
	
	<script>
	  $(function(){
	    $('tbody td').click(function(){
	      $('div#insertModal').modal();
	    });
	  });
	
	</script>
</body>
</html>