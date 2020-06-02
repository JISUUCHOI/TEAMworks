<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약 목록</title>
<style>
    table {
      border-collapse: collapse;
      width: 1000px;
    }
    
    th, td {
      text-align: center;
      padding: 8px;
      border-bottom:1px solid #f2f2f2;
      height: 40px;
    }
    
    tr:nth-child(1) {background-color: #f2f2f2;}

    button{
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
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="reservationSidebar.jsp"/>


	    <h2>나의 예약 목록</h2>
	
	    <table>
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
							                <button id="cancelBtn" onclick="cancel();">취소</button>
						                </c:if>
						            </td>
						            <td>
						            	<c:if test="${ r.status eq '예정' }">
						            	    <button id="confirmBtn" onclick="confirm();">완료</button>
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


    <script>
        function cancel(){
            if(confirm('예약을 취소하시겠습니까?')){
                alert('성공적으로 예약이 취소되었습니다.');
            }
        };
    </script>


</body>
</html>