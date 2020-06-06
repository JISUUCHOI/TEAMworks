<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 정보 관리</title>
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	width: 500px;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 15px 19px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 15px 19px;
	word-break: normal;
}

.tg .tg-9wq8 {
	border-color: inherit;
	text-align: center;
	vertical-align: middle
}

.tg .tg-uzvj {
	border-color: inherit;
	font-weight: bold;
	text-align: center;
	vertical-align: middle
}

.tg .tg-0lax {
	border-color: inherit;
	text-align: center;
	vertical-align: middle
}

.job {
	width: 300px;
	height: 200px;
}

.job th {
	width: 40%;
}

.job td {
	text-align: center;
	vertical-align: middle;
}

.content {
	margin-left: 20%;
}

.infoTable {
	text-align: center;
	border: 1px solid black;
}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/sidebarMg.jsp" />


	<div class="content">

		<h1>인사 정보 등록</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">
		<h3>인적사항</h3>

		<div id="t" style="padding-left: 200px; padding-top: 50px;">
			<div id="t1">
				<div style="float: left; padding-right: 50px; padding-top: 10px;">
					<img src="/teamworks/resources/images/sampleImg.jpg"
						class="rounded" width="200px" >
				</div>

				<table class="tg">
					<thead>
						<tr>
							<th class="tg-uzvj">사원번호</th>
							<th class="tg-9wq8">0000</th>
							<th class="tg-uzvj">성명</th>
							<th class="tg-9wq8">라공주</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="tg-uzvj">주민등록번호</td>
							<td class="tg-9wq8">9011221234567</td>
							<td class="tg-uzvj">생년월일</td>
							<td class="tg-9wq8">901122</td>
						</tr>
						<tr>
							<td class="tg-uzvj">핸드폰</td>
							<td class="tg-9wq8">01012344321</td>
							<td class="tg-uzvj">E-Mail</td>
							<td class="tg-9wq8">iqqi12@kh.com</td>
						</tr>
						<tr>
							<th class="tg-0lax" rowspan="2"><b>자택주소</b></th>
							<td class="tg-0lax" colspan="3"><button
									onclick="addressSearch()">주소 검색</button></td>
						</tr>
						<tr>
							<td class="tg-0lax" colspan="3">상세주소</td>
						</tr>
				</table>
			</div>

			<!-- 주소 검색 API -->
			<script
				src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function addressSearch() {
					new daum.Postcode({
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
							// 예제를 참고하여 다양한 활용법을 확인해 보세요.
						}
					}).open();
				}
			</script>

			<div id="t2" style="padding-top: 50px; padding-left: 50px;">
				<table class="border">
					<table class="job infoTable" style="float: left"
						border="1px solid black;">
						<tr>
							<th>사업장</th>
							<td>모름</td>
						</tr>
						<tr>
							<th>직급</th>
							<td><select name="jobcode" id="jobcode">
									<option value="1">사장</option>
									<option value="2">이사</option>
									<option value="3">부장</option>
									<option value="4">차장</option>
									<option value="5">과장</option>
									<option value="6">대리</option>
									<option value="7">사원</option>
							</select></td>
						</tr>
						<th>재직구분</th>
						<td><select>
								<option>재직</option>
								<option>퇴직</option>
						</select></td>
					</table>
					<table class="job infoTable" border="1px solid black;">
						<tr>
							<th>부서</th>
							<td><select>
									<option>개발팀</option>
									<option>인사팀</option>
									<option>행정팀</option>
							</select></td>
						</tr>
						<tr>
							<th>입사일자</th>
							<td>날짜 선택</td>
						</tr>
						<tr>
							<th>퇴직일자</th>
							<td>날짜 선택</td>
						</tr>
						<tr>
							<th>급여 계약 기준</th>
							<td><select>
									<option>연봉제</option>
									<option>기간제</option>
							</select></td>
						</tr>
					</table>

					<table border="1px"
						style="width: 600px; height: 40px; text-align: center">
						<tr>
							<th style="width: 30%;">비고</th>
							<th>비고 내용</th>
						</tr>
					</table>
				</table>
			</div>
		</div>

	</div>


</body>
</html>
