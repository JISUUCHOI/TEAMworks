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
		<hr>
		<br>

		<div class="container">
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
					<tr>
						<td>라공주</td>
						<td>2020-05-11</td>
						<td>15</td>
						<td>3</td>
						<td>1</td>
						<td>1</td>
						<td>0</td>
						<td>10</td>
					</tr>
					<tr>
						<td>김정은</td>
						<td>2019-05-11</td>
						<td>15</td>
						<td>4</td>
						<td>1</td>
						<td>0</td>
						<td>0</td>
						<td>10</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>

			<ul class="pagination justify-content-center" style="margin: 20px 0">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
	</div>

</body>
</html>