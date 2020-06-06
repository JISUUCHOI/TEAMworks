<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약 목록</title>
<!-- jQuery 라이브러리 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	@font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }
	
	body {font-family:Handon3gyeopsal300g;}
	
    #listTable {
      border-collapse: collapse;
      width: 1000px;
    }
    
    #listTable th, #listTable td {
      text-align: center;
      padding: 8px;
      border-bottom:1px solid #f2f2f2;
      height: 50px;
    }
    
    #listTable tr:nth-child(1) {background-color: #f2f2f2;}

    .btn{
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 13px;
        padding:4px 8px;
        transition-duration: 0.4s;
        cursor: pointer;
    } 
</style>
</head>
<body>
<%-- 	<c:if test="${ !empty msg }">
		<script>
			alert('${msg}');
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if> --%>
	

	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="reservationSidebar.jsp"/>
	
	<br><br>

	<div style="width:1250px; float:left;">
	    <h2 style="margin-left:130px; margin-bottom:20px;">나의 예약 목록</h2>
	    <table id="listTable" align="center">
	        <tr>
	            <th width="16%">분류</th>
	            <th width="30%">예약시간</th>
	            <th width="20%">사용 용도</th>
	            <th width="10%">상태</th>
	            <th width="12%">예약취소</th>
	            <th width="12%">사용여부</th>
	        </tr>
	        <c:choose>
	        	<c:when test="${ empty list }">
	        		<tr>
	        			<td colspan="6">예약이 없습니다.</td>
	        		</tr>
	        	</c:when>
	        	<c:otherwise>
	        		<c:forEach var="r" items="${ list }">
	        			        <tr>
						            <td>회의실${ r.roomNo }</td>
						            <td>${ r.reservationDate } ${ r.startTime }:00-${ r.endTime }:00</td>
						            <td>${ r.purpose }</td>
						            <td>${ r.status }</td>
						            <td>
						            	<c:if test="${ r.status eq '예정' }">
							                <button id="cancelBtn" class="btn btn-danger" onclick="cancel(${r.reservationNo});">취소</button>
						                </c:if>
						            </td>
						            <td>
						            	<c:if test="${ r.status eq '예정' }">
						            	    <button id="confirmBtn" class="btn btn-secondary" onclick="confirm(${r.reservationNo});">완료</button>
						            	</c:if>
						            </td>
						        </tr>
	        		</c:forEach>
	        	</c:otherwise>
	        </c:choose>
	<!--         <tr>
	            <td>회의실1</td>
	            <td>2020-05-08 10:00-11:00</td>
	            <td>팀 회의</td>
	            <td>예정</td>
	            <td>
	                <button id="cancelBtn" onclick="cancel();">취소</button>
	            </td>
	            <td>
	                <button id="confirmBtn" onclick="confirm();">완료</button>
	            </td>
	        </tr> -->
	    </table>
	    </div>

    <script>
    	// 메뉴바 & 사이드바 css
		$(function(){
			$("#book>a").css("color", "dimgray");
			$("#book").css("border-bottom-style", "groove");
			$("#myReservation>a").css("color", "deepskyblue");
		});	

		
		// 취소 버튼 클릭 시 예약 취소
		function cancel(reservationNo) {
			
			if(confirm('해당 회의실 예약을 취소하시겠습니까?')) {
				
				location.href="cancel.re?reservationNo=" + reservationNo;
			}
		}
    </script>


</body>
</html>