<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 정보 관리</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- alertifyJS 라이브러리 -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- alertifyCSS 라이브러리 -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	

<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
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
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-c3ow {
	border-color: inherit;
	text-align: center;
	vertical-align: top
}

.tg .tg-7btt {
	border-color: inherit;
	font-weight: bold;
	text-align: center;
	vertical-align: top
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 20px 20px;
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
	padding: 20px 20px;
	word-break: normal;
}

.tg .tg-baqh {
	text-align: center;
	vertical-align: top
}

.tg .tg-amwm {
	font-weight: bold;
	text-align: center;
	vertical-align: top
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}

#t2 {
	float: left;
}

#t3 {
	float: left;
	margin: auto;
	vertical-align: middle;
	padding-bottom: 130px;
	padding-left: 30px;
}

.content {
	margin-left: 20%;
}

.content div {
	display: inline-block;
	vertical-align: middle;
	height: 100%;
}

.content t3 {
	margin: 0 auto;
	text-align: center;
}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/sidebarMg.jsp" />
	
	<c:if test="${ !empty msg }">
		<script>
			alertify.alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>


	<div class="content">

		<h1>회사 정보</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">

		<div id="d1-logo" style="padding-left:300px; padding-top:30px;">
			<div id="t2">
				<p style="font-size: 13px;">
					<b>회사 로고</b>
				</p>
				<img src="${ pageContext.servletContext.contextPath }/resources/CompanyLogo/${ companyInfo.logoChange }" class="img-rounded"
				style="width:200px;">
			</div>

			<div id="t3" style="padding:10; font-size:13px;">
				<div id="t3-1" style="margin-top:50px;">
					서비스 이용중 표시되는 로고를 등록 할 수 있습니다.<br> 
					<img src="/teamworks/resources/icons/redMark.png" width="30px">
					최대 사이즈 : 용량 500KB 미만, 확장자 PNG, JPG <br>
					<form id="logoChange" action="updateLogo.mg" method="post" enctype="multipart/form-data" style="margin-top:20px;">
						<input type="file" id="reUplogo" class="form-control-file border" name="reUploadLogo"><br>
						<button type="submit" class="btn btn-secondary btn-sm"
							name="logoChangeFile">변경</button>
						&nbsp;
						<button type="button" class="btn btn-secondary btn-sm">삭제</button>
					</form>

					<!-- <input type="file"> 등록 누르면 팝업창으로 뜨게 설정하기 -->
				</div>
			</div>
		</div>

	
		<div id="d2-info" style="padding-left:200px;">	
			<h4><b>회사 정보</b></h4>
			<table id="infoTable" align="center" style="border: 1px solid black;">
				<table class="tg" style="width: 800px;">
					<thead>
						<tr>
							<th class="tg-7btt">회사명</th>
							<th class="tg-c3ow">${ companyInfo.homName }</th>
							<th class="tg-7btt">대표자</th>
							<th class="tg-c3ow">${ companyInfo.homHead }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="tg-7btt">회사주소</td>
							<td class="tg-c3ow" colspan="3">${ companyInfo.homAdrs }</td>
						</tr>
					</tbody>
				</table>
			</table>
		</div>

		<div id="d3-company" style="padding-left:200px;">
			<br> <br> <b>사업장 정보</b>
			<button type="button"
				class="float-right btn btn-outline-secondary btn-sm">사업장 정보
				변경</button>

			<br>

			<table class="tg" style="width: 800px;">
					<tr>
						<th class="tg-amwm">사업자 등록번호</th>
						<th class="tg-baqh">${ companyBsns.companyNo }</th>
						<th class="tg-amwm">종사업장번호</th>
						<th class="tg-baqh">???</th>
					</tr>
					<tr>
						<td class="tg-amwm">사업장명</td>
						<td class="tg-baqh">${ companyBsns.companyName }</td>
						<td class="tg-amwm">대표자명</td>
						<td class="tg-baqh">${ companyBsns.companyHead }</td>
					</tr>
					<tr>
						<td class="tg-amwm">업태</td>
						<td class="tg-baqh">${ companyBsns.companyCon }</td>
						<td class="tg-amwm">업종</td>
						<td class="tg-baqh">${ companyBsns.companyKind }</td>
					</tr>
					<tr>
						<td class="tg-amwm">사업장 주소</td>
						<td class="tg-baqh" colspan="3">${ companyBsns.companyAdrs }</td>
					</tr>
					<tr rowspan="3">
						<td class="tg-amwm" style="vertical-align:middle;">직인</td>
						<td class="tg-0lax" colspan="3"><div>
								<img src="/teamworks/resources/images/No-image-available.png"
									width="70" height="70" style="float: left;">
							</div>
							<div style="font-size:13px;">
								<img src="/teamworks/resources/icons/redMark.png" width="30">최대 사이즈 : 70*70px, 용량 300Kb 미만, 확장자 PNG
								<br>
								<button type="button" class="btn btn-secondary btn-sm">등록</button>
								&nbsp;
								<button type="button" class="btn btn-secondary btn-sm">삭제</button>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<br><br><br>

</body>
</html>