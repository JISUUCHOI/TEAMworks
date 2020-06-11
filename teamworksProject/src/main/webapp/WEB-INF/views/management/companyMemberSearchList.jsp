<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 정보 관리</title>
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>

.content {
	margin-left: 20%;
	width:80%
}
.container td {
	height: 40px;
}
#searchForm{
	width:500px;
	margin:auto;
	margin-left:50px;
}
#searchForm>*{
	float:left;
	margin:5px;
}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/sidebarMg.jsp" />

	<div class="content">
		<h1>사원명부</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">
		<br>
		
		<div class="container" style="margin-left: 10px; width:1070px;">
			<div>
			
				<form id="searchForm" action="empListSearch.mg" method="Get" align="center">
					<div class="select" >
						<select class="custom-select" name="condition">
							<option value="empId">사원번호</option>
							<option value="empName">성명</option>
							<option value="deptName">부서명</option>
						</select>
					</div>
					<div class="text">
						<input type="text" class="form-control" name="keyword" value="${ keyword }">
						<input type="hidden" name="currentPage" value="1">
					</div>
					<button type="submit" class="searchBtn btn btn-secondary">검색</button>
				</form>
				
				<input type="checkbox" name="status" id="status" style="margin-left:30px; margin-right:10px;"><b>퇴직자 포함</b>
				<button type="" class="btn btn-outline-primary btn-sm"  style="float:right; margin-right:50px;">퇴사자 등록</button>
				
			</div>
			<br>
			

				
			<table class="table table-bordered"
				style="table-layout: fixed; text-align: center;" id="result3">
				<thead class="thead-light">
					<tr>
						<th width="40px;"><input type="checkbox"></th>
						<th width="110px;">사원번호</th>
						<th width="100px;">성명</th>
						<th width="150px;">주민등록번호</th>
						<th>부서명</th>
						<th>직위/직급</th>
						<th>입사일자</th>
						<th width="250px;">Email</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ empSearchList }" var="e">
						<tr>
							<td><input type="checkbox"></td>
							<td>${ e.empId }</td>
							<td>${ e.empName }</td>
							<td>${ e.empNo }</td>
							<td>${ e.deptName }</td>
							<td>${ e.jobName }</td>
							<td>${ e.hireDate }</td>
							<td>${ e.email }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		
			
			
			
			<div id="pagingArea">
                <ul class="pagination pagination-sm justify-content-center">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    </c:when>
	                    <c:otherwise>
		                    	<c:url value="empListSarch.mg" var="searchUrl">
		                    		<c:param name="condition" value="${ condition }"/>
		                    		<c:param name="keyword" value="${ keyword }"/>
		                    		<c:param name="currentPage" value="${ p }"/>
		                    	</c:url>
	                    	<li class="page-item"><a class="page-link" href="empListSearch.mg?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
	                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
	                    	<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="empListSearch.mg?currentPage=${ p }">${ p }</a></li>
	                    	</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="empListSearch.mg?currentPage=${ pi.currentPage+1 }">Next</a></li>
	                    </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            

		            
            
		</div>

	</div>


</body>
</html>
