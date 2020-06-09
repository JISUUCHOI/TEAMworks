<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 정보 관리</title>
<!-- jQuery 라이브러리 -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- 이외의 추가 스크립트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"></script>
      

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

		<form id="enrollEmpForm" method="post" action="insertEmp.mg"
			style="padding-left: 70px; padding-top: 50px;">


			<div id="t1">
				<div style="float: left; padding-right: 50px; padding-top: 10px;">
					<img src="/teamworks/resources/images/sampleImg.jpg"
						class="rounded" width="200px">
				</div>

				<table class="tg" style="width: 700px;">
					<thead>
						<tr>
							<th class="tg-uzvj">사원번호</th>
							<th class="tg-9wq8"><input type="text" id="empId"
								name="empId" placeholder="사원 번호 입력"></th>
							<th class="tg-uzvj">성명</th>
							<th class="tg-9wq8"><input type="text" id="empName"
								name="empName" placeholder="사원 이름 입력"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="tg-uzvj">주민등록번호</td>
							<td class="tg-9wq8"><input type="text" id="empNo"
								name="empNo" placeholder="사원 주민번호 입력"></td>
							<td class="tg-uzvj">생년월일</td>
							<td class="tg-9wq8">자동생성???</td>
						</tr>
						<tr>
							<td class="tg-uzvj">핸드폰</td>
							<td class="tg-9wq8"><input type="text" id="empPhone"
								name="empPhone" placeholder="사원 핸드폰 번호 입력"></td>
							<td class="tg-uzvj">E-Mail</td>
							<td class="tg-9wq8"><input type="text" id="empEmail"
								name="empEmail" placeholder="사원 이메일 입력"></td>
						</tr>
						<tr>
							<th class="tg-0lax" rowspan="2"><b>자택주소</b></th>
							<td class="tg-0lax" colspan="3" style="text-align:left; vertical-align:10px;">
								우편번호 : <input name="zipcode" id="zipcode" readonly size="10">
								<!-- daumZipCode()는 다음 사이트에서 가져온 API -->
								<input type="button" onclick="addressSearch()" value="우편번호 찾기"><br>
						</tr>
						<tr>
							<td colspan="3">
								주소 : <input name="address1" id="address1" size="60"><br>
								상세주소 : <input name="address2" id="address2" size="56">
							</td>
						</tr>
				</table>
			</div>


			<!-- 주소 검색 API -->
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function addressSearch() {
					new daum.Postcode({
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
							// 예제를 참고하여 다양한 활용법을 확인해 보세요.
							
			
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							if (data.userSelectedType === 'R') { //R은 도로명 주소이다.
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress; //도로명 주소가 아니라면.. 지번주소.
							}

							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								} //도로명 주소일때는 법에 맞춰서 '동' 이름을 추가해야 한다.

								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}

								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							//5자리 새우편번호 사용
							document.getElementById('zipcode').value = data.zonecode;
							document.getElementById('address1').value = fullAddr; //address1에 확정된 주소값의 풀네임이 들어간다.

							// 커서를 상세주소 필드로 이동한다. 
							// 커서를 이동시켜서 깜빡이게끔 한다.
							document.getElementById('address2').focus();
						}
					}).open();
		}
	</script>



			<div id="t2" style="padding-top: 50px; padding-left: 170px;">
				<table class="border">
					<table class="job infoTable" style="float: left" border="1px solid black;">
						<tr>
							<th>사업장</th>
							<td>모름</td>
						</tr>
						<tr>
							<th>직급</th>
							<td><select name="jobcode" id="jobcode">
									<option value="job_01">사장</option>
									<option value="job_02">이사</option>
									<option value="job_03">부장</option>
									<option value="job_04">차장</option>
									<option value="job_05">과장</option>
									<option value="job_06">대리</option>
									<option value="job_07">사원</option>
							</select></td>
						</tr>
						<th>재직구분</th>
						<td>
							<select>
								<option value="Y">재직</option>
								<option value="N">퇴직</option>
							</select>
						</td>
					</table>
					<table class="job infoTable" border="1px solid black;">
						<tr>
							<th>부서</th>
							<td>
								<select>
									<option value="개발팀">개발팀</option>
									<option value="인사팀">인사팀</option>
									<option value="행정팀">행정팀</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>입사일자</th>
							<td><input type="text" id="enterDatePicker" name="enterDate" class="form-control" value="2019-06-27"></td>
						</tr>
						<tr>
							<th>퇴직일자</th>
							<td><input type="text" id="exitDatePicker" name="exitDate" class="form-control"></td>
						</tr>
							<th>급여 계약 기준</th>
							<td><select>
									<option value="연봉제">연봉제</option>
									<option value="기간제">기간제</option>
							</select></td>
						</tr>
					</table>

					<table border="1px"	style="width: 600px; height: 40px; text-align: center">
						<tr>
							<th style="width: 30%;">비고</th>
							<th><input type="text" id="empNote" name="empNote" placeholder="사원 비고 내용 입력" style="width:90%;"></th>
						</tr>
					</table>
				</table>
			</div>


			<script>    
				$(function() {
					$("#enterDatePicker").datepicker({
						format : "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
						startDate : '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
						endDate : '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
						autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
						calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
						clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
						datesDisabled : [ '2019-06-24', '2019-06-26' ],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
						daysOfWeekDisabled : [ 0, 6 ], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
						daysOfWeekHighlighted : [ 3 ], //강조 되어야 하는 요일 설정
						disableTouchKeyboard : false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
						immediateUpdates : false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
						multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
						multidateSeparator : ",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
						templates : {
							leftArrow : '&laquo;',
							rightArrow : '&raquo;'
						}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
						showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
						title : "테스트", //캘린더 상단에 보여주는 타이틀
						todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
						toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
						weekStart : 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
						language : "ko" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

					});//datepicker end
				});//ready end
			</script>




			<br><br>
			
			<div class="btns" align="center" style="padding-right:100px;">
				<button type="submit" class="btn btn-primary" id="enrollEmpbtn"
					style="">인사 정보 등록</button>
				<button type="reset" class="btn btn-danger">초기화</button>
			</div>
		</form>

	</div>
	<br><br><br>


</body>
</html>
