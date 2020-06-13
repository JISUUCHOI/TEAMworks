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
		
		<div class="container" style="margin-left: 10px; margin-top:10px; width:1070px;">
			
			<div>
				<form id="searchForm" action="empListSearch.mg" method="post" align="center">
					<div class="select" >
						<select class="custom-select" name="condition">
							<option value="empId">사원번호</option>
							<option value="empName">성명</option>
							<option value="deptName">부서명</option>
						</select>
					</div>
					<div class="text">
						<input type="text" class="form-control" name="keyword" value="${ eSc.keyword }">
						<input type="hidden" name="currentPage" value="1">
					</div>
					<button type="submit" class="searchBtn btn btn-secondary">검색</button>
				</form>
				
				<input type="checkbox" name="statusN" id="statusN" style="margin-left:30px; margin-right:10px; margin-top:20px;"><b>퇴직자 보기</b>
				<button type="" class="btn btn-outline-primary btn-sm"  style="float:right; margin-right:50px; margin-top:20px;" id="updateStatus">퇴사자 등록</button>
				
			</div>
			<br>
			
			<form id="postForm" action="deleteEmp.mg" method="post">
				<input type="hidden" name="empList" value="">
			</form>
			
			
	       <script type="text/javascript">
	       		$(function(){
	       			switch('${eSc.condition}'){
	       			case "empId": $("#searchArea option").eq(0).attr("selected", true);  break;
					case "empName":  $("#searchArea option").eq(1).attr("selected", true);  break;
					case "deptName": $("#searchArea option").eq(2).attr("selected", true);  break;
					 
	       			}
	       		});
	       </script>
				
			<table class="table table-bordered"
				style="table-layout: fixed; text-align: center; margin-top: 30px;">
				<thead class="thead-light">
					<tr>
						<th width="40px;"><input id="checkAll" name="checkAll" type="checkbox" onclick="checkAll();"></th>
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
					<c:forEach items="${ empList }" var="e">
						<tr>
							<td><input type="checkbox" name="checkRow" value="${ e.empId }"></td>
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

			<script type="text/javascript">
				function checkAll() {
					if ($("#checkAll").is(':checked')) {
						$("input[name=checkRow]").prop("checked", true);
					} else {
						$("input[name=checkRow]").prop("checked", false);
					}
				}
				
		
				$("#updateStatus").click(function() {
					var confirm_val = confirm("퇴사 등록하시겠습니까?");

					if (confirm_val) {
						var checkArr = new Array();

						$("input[name=checkRow]:checked").each(function() {
							checkArr.push($(this).attr("value"));
						});

						$.ajax({
							url : "updateStatus.mg",
							type : "post",
							data : { checkRow : empRetire},
							success : function() {
								location.href = "empList.mg";
							}
						});
					}
				});
			</script>


			<div id="pagingArea" style="margin-top:50px;">
                <ul class="pagination pagination-sm justify-content-center">
	                <c:if test="${ pi.currentPage ne 1 }">
	            		<c:choose>
	            			<c:when test="${ empty eSc }">
	            				<li class="previous page-item"><a class="page-link" href="empList.mg?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
	            			</c:when>
	            			<c:otherwise>
	            					<c:url value="empListSearch.mg" var="searchUrl">
											<c:param name="condition" value="${ eSc.condition }"/>
											<c:param name="keyword" value="${ eSc.keyword }"/>
											<c:param name="currentPage" value="${  pi.currentPage -1 }"/>
									</c:url>
	            				<li class="previous page-item">
	            				<a class="page-link" href="${ searchUrl }">Previous</a>
	            				</li>
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
		            					<li class="page-item"><a class="page-link" href="empList.mg?currentPage=${ p }">${ p }</a></li>
		            				</c:when>
		            				<c:otherwise>
		            					<c:url value="empListSearch.mg" var="searchUrl">
											<c:param name="condition" value="${ eSc.condition }"/>
											<c:param name="keyword" value="${ eSc.keyword }"/>
											<c:param name="currentPage" value="${ p }"/>
										</c:url>
		            					<li class="page-item">
		            						<a class="page-link" href="${searchUrl}">${ p }</a>
		            					</li>
		            				</c:otherwise>
	            				</c:choose>
	            	 		</c:otherwise>
	            	 	</c:choose>
	            	 </c:forEach>
	            	
	            	<c:if test="${ pi.currentPage ne pi.maxPage }">
	            		<c:choose>
							<c:when test="${ empty eSc }">
								<li class="next page-item"><a class="page-link" href="empList.mg?currentPage=${ pi.currentPage + 1 }">Next</a></li>
							</c:when>
							<c:otherwise>
								<c:url value="empListSearch.mg" var="searchUrl">
											<c:param name="condition" value="${ eSc.condition }"/>
											<c:param name="keyword" value="${ eSc.keyword }"/>
											<c:param name="currentPage" value="${  pi.currentPage + 1  }"/>
								</c:url>
								<li class="next page-item">
								<a class="page-link" href="${ searchUrl }">Next</a>
								</li>
							</c:otherwise>        		
	            		</c:choose>
	            	</c:if>
	            </ul>
            </div>
		</div>
	</div>


</body>
</html>
