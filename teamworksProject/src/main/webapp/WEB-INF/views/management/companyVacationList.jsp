<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 80%
}

.container td {
	height: 40px;
}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/sidebarMg.jsp" />

	<div class="content">
		<h1>휴가 관리</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">
		<br>

		<div class="container" style="margin-left: 0px;">

			<form id="searchForm" action="empVacSearch.mg" method="post"
				align="center">
				<div class="select">
					<select class="custom-select" name="condition">
						<option value="empId">사원번호</option>
						<option value="empName">성명</option>
						<option value="vacationYear">휴가사용년도</option>
					</select>
				</div>
				<div class="text">
					<input type="text" class="form-control" name="keyword"
						value="${ eSc.keyword }"> <input type="hidden"
						name="currentPage" value="1">
				</div>
				<button type="submit" class="searchBtn btn btn-secondary">검색</button>
			</form>

			<script type="text/javascript">
	       		$(function(){
	       			switch('${eSc.condition}'){
	       			case "empId": $("#searchArea option").eq(0).attr("selected", true);  break;
					case "empName":  $("#searchArea option").eq(1).attr("selected", true);  break;
					case "vacationYear": $("#searchArea option").eq(2).attr("selected", true);  break;
					 
	       			}
	       		});
	       </script>


			<table class="table table-bordered"
				style="table-layout: fixed; text-align: center;">
				<thead class="thead-light">
					<tr>
						<th>사원명</th>
						<th>입사일</th>
						<th>올해 생성</th>
						<th>사용 연차</th>
						<th>경조사 사용</th>
						<th>병가 사용</th>
						<th>출산 사용</th>
						<th>잔여</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ vacList }" var="v">
						<tr>
							<td>${ v.empName }</td>
							<td>${ v.hireDate }</td>
							<td>15</td>
							<td>${ v.vcCount }</td>
							<td>1</td>
							<td>1</td>
							<td>0</td>
							<td>${ v.vcTotal - v.vcCount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<div id="pagingArea">
				<ul class="pagination pagination-sm justify-content-center">
					<c:if test="${ pi.currentPage ne 1 }">
						<c:choose>
							<c:when test="${ empty eSc }">
								<li class="previous page-item"><a class="page-link"
									href="vacationList.mg?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
							</c:when>
							<c:otherwise>
								<c:url value="vacationList.mg" var="searchUrl">
									<c:param name="condition" value="${ eSc.condition }" />
									<c:param name="keyword" value="${ eSc.keyword }" />
									<c:param name="currentPage" value="${  pi.currentPage -1 }" />
								</c:url>
								<li class="previous page-item"><a class="page-link"
									href="${ searchUrl }">Previous</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
							<c:when test="${ p eq pi.currentPage }">
								<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${ empty eSc }">
										<li class="page-item"><a class="page-link"
											href="vacationList.mg?currentPage=${ p }">${ p }</a></li>
									</c:when>
									<c:otherwise>
										<c:url value="vacationList.mg" var="searchUrl">
											<c:param name="condition" value="${ eSc.condition }" />
											<c:param name="keyword" value="${ eSc.keyword }" />
											<c:param name="currentPage" value="${ p }" />
										</c:url>
										<li class="page-item"><a class="page-link"
											href="${searchUrl}">${ p }</a></li>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:choose>
							<c:when test="${ empty eSc }">
								<li class="next page-item"><a class="page-link"
									href="vacationList.mg?currentPage=${ pi.currentPage + 1 }">Next</a></li>
							</c:when>
							<c:otherwise>
								<c:url value="vacationList.mg" var="searchUrl">
									<c:param name="condition" value="${ eSc.condition }" />
									<c:param name="keyword" value="${ eSc.keyword }" />
									<c:param name="currentPage" value="${  pi.currentPage + 1  }" />
								</c:url>
								<li class="next page-item"><a class="page-link"
									href="${ searchUrl }">Next</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>