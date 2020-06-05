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

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/sidebarMg.jsp" />

	<div class="content">
		<h1>직급 관리</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">

		<div class="container" style="padding-left: 60px; padding-top:100px;">
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
					<tr>
						<th scope="row">1</th>
						<td>사장</td>
						<td><button type="button"
								class="btn btn-info btn-primary btn-sm">수정</button>
							<button type="button"
								class="btn btn-secondary btn btn-primary btn-sm">삭제</button></td>
						<td><svg class="bi bi-arrow-up-circle" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd"
									d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path fill-rule="evenodd"
									d="M4.646 8.354a.5.5 0 0 0 .708 0L8 5.707l2.646 2.647a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 0 0 0 .708z" />
						<path fill-rule="evenodd"
									d="M8 11.5a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-1 0v5a.5.5 0 0 0 .5.5z" />
						</svg> &nbsp; <svg class="bi bi-arrow-down-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 5a.5.5 0 0 0-1 0v4.793L5.354 7.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 9.793V5z" />
						</svg></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>이사</td>
						<td><button type="button"
								class="btn btn-info btn-primary btn-sm">수정</button>
							<button type="button"
								class="btn btn-secondary btn btn-primary btn-sm">삭제</button></td>
						<td><svg class="bi bi-arrow-up-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-10.646.354a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 6.207V11a.5.5 0 0 1-1 0V6.207L5.354 8.354z" />
						</svg> &nbsp; <svg class="bi bi-arrow-down-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 5a.5.5 0 0 0-1 0v4.793L5.354 7.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 9.793V5z" />
						</svg></td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>부장</td>
						<td><button type="button"
								class="btn btn-info btn-primary btn-sm">수정</button>
							<button type="button"
								class="btn btn-secondary btn btn-primary btn-sm">삭제</button></td>
						<td><svg class="bi bi-arrow-up-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-10.646.354a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 6.207V11a.5.5 0 0 1-1 0V6.207L5.354 8.354z" />
						</svg> &nbsp; <svg class="bi bi-arrow-down-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 5a.5.5 0 0 0-1 0v4.793L5.354 7.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 9.793V5z" />
						</svg></td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td>차장</td>
						<td><button type="button"
								class="btn btn-info btn-primary btn-sm">수정</button>
							<button type="button"
								class="btn btn-secondary btn btn-primary btn-sm">삭제</button></td>
						<td><svg class="bi bi-arrow-up-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-10.646.354a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 6.207V11a.5.5 0 0 1-1 0V6.207L5.354 8.354z" />
						</svg> &nbsp; <svg class="bi bi-arrow-down-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 5a.5.5 0 0 0-1 0v4.793L5.354 7.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 9.793V5z" />
						</svg></td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td>과장</td>
						<td><button type="button"
								class="btn btn-info btn-primary btn-sm">수정</button>
							<button type="button"
								class="btn btn-secondary btn btn-primary btn-sm">삭제</button></td>
						<td><svg class="bi bi-arrow-up-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-10.646.354a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 6.207V11a.5.5 0 0 1-1 0V6.207L5.354 8.354z" />
						</svg> &nbsp; <svg class="bi bi-arrow-down-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 5a.5.5 0 0 0-1 0v4.793L5.354 7.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 9.793V5z" />
						</svg></td>
					</tr>
					<tr>
						<th scope="row">6</th>
						<td>대리</td>
						<td><button type="button"
								class="btn btn-info btn-primary btn-sm">수정</button>
							<button type="button"
								class="btn btn-secondary btn btn-primary btn-sm">삭제</button></td>
						<td><svg class="bi bi-arrow-up-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-10.646.354a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 6.207V11a.5.5 0 0 1-1 0V6.207L5.354 8.354z" />
						</svg> &nbsp; <svg class="bi bi-arrow-down-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 5a.5.5 0 0 0-1 0v4.793L5.354 7.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 9.793V5z" />
						</svg></td>
					</tr>
					<tr>
						<th scope="row">7</th>
						<td>사원</td>
						<td><button type="button"
								class="btn btn-info btn-primary btn-sm">수정</button>
							<button type="button"
								class="btn btn-secondary btn btn-primary btn-sm">삭제</button></td>
						<td><svg class="bi bi-arrow-up-circle-fill" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-10.646.354a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 6.207V11a.5.5 0 0 1-1 0V6.207L5.354 8.354z" />
						</svg> &nbsp; <svg class="bi bi-arrow-down-circle" width="1em"
								height="1em" viewBox="0 0 16 16" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd"
									d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path fill-rule="evenodd"
									d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z" />
						<path fill-rule="evenodd"
									d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z" />
						</svg></td>
					</tr>
					<tr>
						<th scope="row"></th>
						<td><input type="text" placeholder="내용을 입력해주세요"></td>
						<td><button type="button"
								class="btn btn-warning btn btn-primary btn-sm"">추가</button></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>