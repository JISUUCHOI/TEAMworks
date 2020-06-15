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
	width: 80%;
}

.table {
	text-align: center;
}
</style>
</head>
<body>
	<script>
       	$(function(){
       		$("#orgManage").css("border-bottom-style","groove");
       		$("#orgManage a").css("color","dimgray");
       		$("#empProof>a").css("color", "deepskyblue");
       	});
     </script>
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/sidebarMg.jsp" />

	<div class="content">
		<h1>증명서발급</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">
		<br>

		<div class="container" style="margin-left:0px;">
			<table class="table table-bordered table-sm">
				<thead class="thead-light">
					<tr>
						<th>신청번호</th>
						<th>증명서 구분</th>
						<th>신청일자</th>
						<th>사원번호</th>
						<th>성명</th>
						<th>발행상태</th>
						<th>용도</th>
						<th>발행</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="d" items="${ list }">
						<tr>
							<td>${ d.docNo }</td>
							<td>${ d.pfSq }</td>
							<td>${ d.docDate }</td>
							<td>${ d.empId }</td>
							<td>${ d.empName }</td>
							<c:choose>
								<c:when test="${d.pfStatus eq 'Y' }">
									<td>발행 완료</td>
								</c:when>
								<c:otherwise>
									<td>발행 전</td>
								</c:otherwise>
							</c:choose>
							<td>${ d.pfPurpose }</td>
							<c:choose>
								<c:when test="${d.pfStatus eq 'Y' }">
									<td> <button class="btn btn-outline-secondary btn-sm" type="button" disabled>발급하기</button></td>
								</c:when>
								<c:otherwise>
									<td> <button class="btn btn-primary btn-sm" onclick="issueDoc('${d.pfSq}', '${d.empId }', '${d.docNo }');" type="button">발급하기</button></td>
								</c:otherwise>
							</c:choose>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script>
				function issueDoc(pfSq, empId, docNo){
					var pfSq = pfSq
					var empId = empId
					var docNo = docNo
					if(pfSq=='재직증명서'){
						 window.open("proofOfemp.mg?empId="+empId+"&docNo="+docNo,"재직증명서","width=1000px,height=600px"); 
						 //alert(empId);
					}else if(pfSq=='경력증명서'){
						window.open("careerPf.mg?empId="+empId+"&docNo="+docNo,"재직증명서","width=1000px,height=600px"); 
					}else{
						window.open("retirementPf.mg?empId="+empId+"&docNo="+docNo,"재직증명서","width=1000px,height=600px"); 
					}
				}
			</script>

			<ul class="pagination pagination-sm justify-content-center" style="margin:20px 0">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="empDocument.mg?currentPage=${ pi.currentPage-1 }">Previous</a></li>
					</c:otherwise>
				</c:choose>
				 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="empDocument.mg?currentPage=${ p }">${ p }</a></li>
	                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }"> <!-- 현재 페이지가 마지막 페이지와 일치할 경우 클릭 불가 -->
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="empDocument.mg?currentPage=${ pi.currentPage+1 }">Next</a></li>
                   		</c:otherwise>
                    </c:choose>
				
			
			</ul>
		</div>


	</div>


</body>
</html>
