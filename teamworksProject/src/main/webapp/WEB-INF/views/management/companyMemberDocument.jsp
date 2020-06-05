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
		<h1>증명서발급</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">
		<br>

		<div class="container" style="margin-left:0px;">
			<table class="table table-bordered">
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
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
					<tr>
						<td>1234</td>
						<td>경력증명서</td>
						<td>2020-05-11</td>
						<td>3</td>
						<td>김정은</td>
						<td>발행전</td>
						<td>금융기관 제출</td>
						<td><button type="button"
								class="btn btn-primary btn-primary btn-sm">발급하기</button></td>
					</tr>
				</tbody>
			</table>


			<ul class="pagination pagination-sm justify-content-center" style="margin:20px 0">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>


	</div>


</body>
</html>
