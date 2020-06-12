<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- 아이콘 스크립트 -->
<script src="https://use.fontawesome.com/8f77921a99.js"></script>
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

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/sidebarMg.jsp" />

	<div class="content">
		<h1>직급 관리</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">

		<div class="container" style="padding-left: 60px; padding-top: 100px;">
			<table class="table border" style="width: 80%;">
				<thead class="thead-light">
					<tr>
						<th scope="col">No.</th>
						<th scope="col">직급명</th>
						<th scope="col">수정/삭제</th>
						<th scope="col">순서 설정</th>
					</tr>
				</thead>
				<tbody>
 					<c:forEach items="${jobList}" var="j">
						<tr>
							<td><b>${j.jobCode % 10}</b></td>
							<td>${j.jobName}</td>
							<td>
								<button type="button" class="btn btn-info btn-primary btn-sm" data-toggle="modal"  data-target="#myModal" >수정</button>
								<button type="button" class="btn btn-secondary btn btn-primary btn-sm">삭제</button>
							</td>

							<c:choose>
								<c:when test="${ j.jobCode eq min }"><!-- 제일 위 직급 / 위로 변경 X -->
									<td>
										<button class="btn" onclick="moveUp(this);" disabled><i class="fa fa-arrow-up" aria-hidden="true"></i></button>
										&nbsp;
										<button class="btn" onclick="moveDown(this);"><i class="fa fa-arrow-down" aria-hidden="true"></i></button>
									</td>
								</c:when>
								
								<c:when test="${ j.jobCode eq max }"><!-- 제일 밑 직급 / 아래로 변경 X -->
									<td>
										<button class="btn" onclick="moveUp(this);"><i class="fa fa-arrow-up" aria-hidden="true"></i></button>
										&nbsp;
										<button class="btn" onclick="moveDown(this);" disabled><i class="fa fa-arrow-down" aria-hidden="true"></i></button>
									</td>
								</c:when>
								
								
								<c:otherwise><!-- 순서 변경 가능한 버튼 -->
									<td>
										<button class="btn" onclick="moveUp(this);"><i class="fa fa-arrow-up" aria-hidden="true"></i></button>
										&nbsp;
										<button class="btn" onclick="moveDown(this);"><i class="fa fa-arrow-down" aria-hidden="true"></i></button>
									</td>
								</c:otherwise>
							</c:choose>

						</tr>
					</c:forEach>
		
					<tr>
						<th scope="row"></th>
						<td><input type="text" placeholder="내용을 입력해주세요"></td>
						<td><button type="button"
								class="btn btn-warning btn btn-primary btn-sm">추가</button></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">직급명 수정</h4>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<input style="width:100%;" type="text" placeholder="수정할 직급 명 입력 ">
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary" data-dismiss="modal">확인</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	
	<script>
		function moveUp(el) {
			var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
			$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
		}
		
		function moveDown(el) {
			var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
			$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
		}
	</script>
	
	
</body>
</html>