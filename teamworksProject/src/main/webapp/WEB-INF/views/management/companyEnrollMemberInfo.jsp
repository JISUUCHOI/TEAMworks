<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 정보 관리</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- 이외의 추가 스크립트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha256-siyOpF/pBWUPgIcQi17TLBkjvNgNQArcmwJB8YvkAgg=" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha256-tz3ebpf1UY2wJOfYAEYo/iIElWlm+JNP7cOGtloSAWM=" crossorigin="anonymous"></script>

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
	
	<c:if test="${ !empty msg }">
		<script>
			alertify.alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>


	<div class="content">

		<h1>인사 정보 등록</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">
		<h3>인적사항</h3>

		<form  action="insertEmp.mg" method="post" id="enrollEmpForm" style="padding-top: 50px;">
			<div id="t1" style="padding-left:50px;">
				<table class="tg" style="width: 1000px;">
					<tr>
						<th class="tg-uzvj" width="200px;">사원사진</th>
						<th class="tg-uzvj" width="150px;">사원번호</th>
						<th class="tg-9wq8" height="60px;">
							<input type="text" id="empId" name="empId" placeholder="사원 번호 입력" required>
							<div id="checkResult" style="display:none; font-size:0.7em"></div>
						</th>
						<th class="tg-uzvj">성명</th>
						<th class="tg-9wq8">
							<input type="text" id="empName" name="empName" placeholder="사원 이름 입력" required>
						</th>
					</tr>
					<tr>
						<td rowspan="4" width="250px;"><input type="file"></td>
						<td class="tg-uzvj">주민 등록 번호</td>
						<td class="tg-9wq8"><input type="text" id="empNo"
							name="empNo" placeholder="사원 주민번호 입력(-포함)" required></td>
						<td class="tg-uzvj">생년월일</td>
						<td class="tg-9wq8">
							생년월일 임시 비밀번호
						</td>
					</tr>
					<tr>
						<td class="tg-uzvj">핸드폰</td>
						<td class="tg-9wq8"><input type="text" id="phone"
							name="phone" placeholder="사원 핸드폰 번호 입력"></td>
						<td class="tg-uzvj">E-Mail</td>
						<td class="tg-9wq8"><input type="text" id="email"
							name="email" placeholder="사원 이메일 입력"></td>
					</tr>
					<tr>
						<th class="tg-0lax" rowspan="2"><b>자택주소</b></th>
						<td class="tg-0lax" colspan="3"
							style="text-align: left; vertical-align: 10px;"><b>우편번호 :</b>
							<input name="postcode" id="postcode" readonly size="10"> 
							<!-- daumZipCode()는 다음 사이트에서 가져온 API -->
							<input type="button" onclick="addressSearch()" value="우편번호 찾기"><br>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<b>주소 : <b></b><input name="empAdd" id="empAdd"	size="60"><br>
							<b>상세주소 : </b><input name="empAddDetail"	id="empAddDetail" size="60">
						</td>
					</tr>
				</table>
			</div>


			<script>
		       function idCheckValidate(num){
		           if(num == 1){ // 1. 아이디 중복체크를 아직 안하는 경우 : 메세지 보여지지 않음, 회원가입 버튼 비활성화
		              
		              $("#checkResult").hide();
		              $("#enrollEmpBtn").attr("disabled", true);
		              
		           }else if(num == 2){ //2. 아이디 중복체크 후 사용불가능한 아이디일 경우 : "중복아이디 존재 사용불가능" 메세지 보여짐, 회원가입 버튼 비활성화
		              
		              $("#checkResult").css("color", "red").text("중복된 사원 번호가 존재합니다.");
		              $("#checkResult").show();
		              $("#enrollEmpBtn").attr("disabled", true);
		              
		           }else{ // 3 .아이디 중복체크 후 사용 가능한 아이디일 경우 : "사용 가능한 아이디" 메세지 보여짐, 회원가입 버튼 활성화
		              
		              $("#checkResult").css("color", "green").text("사용 가능한 사원 번호입니다.");
		              $("#checkResult").show();
		              $("#enrollEmpBtn").removeAttr("disabled");
		              
		           }
		        }
		     
		        $(function(){
		           
		           var $idInput = $("#enrollEmpForm input[name=empId]");
		           
		           $idInput.keyup(function(){
		              if($idInput.val().length >= 5) { // 적어도 아이디가 5글자 이상되었을 때 중복검사
		                 $.ajax({
		                    url:"empIdCheck.mg",
		                    data:{empId:$idInput.val()},
		                    success:function(status){
		                       if(status == "fail"){ // 중복된 아이디 존재 == 사용불가
		                          idCheckValidate(2);
		                       }else{ // 중복된 아이디 없음 == 사용가능
		                          idCheckValidate(3);
		                       }
		                    }, error:function(){
		                       console.log("아이디 중복체크용 ajax 통신실패");
		                    }
		                 });
		              }else{ // 중복검사x
		                 idCheckValidate(1);
		              }
		           });
		        });
		    </script>
		       
			<!-- 주소 검색 API -->
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function addressSearch() {
					new daum.Postcode({
						oncomplete : function(data) {
							
							var fullAddr = '';
							var extraAddr = '';

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
									extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								}

								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
							}

							document.getElementById('postcode').value = data.zonecode;
							document.getElementById('empAdd').value = fullAddr; //address1에 확정된 주소값의 풀네임이 들어간다.

							document.getElementById('empAddDetail').focus();
						}
					}).open();
				}
			</script>

			<div id="t2" style="padding-top: 20px; padding-left: 270px;">
				<table class="border">
					<table class="job infoTable" style="float: left" border="1px solid black;">
						<tr>
							<th>사업장</th>
							<td><input type="text" name="homNo" id="homNo" placeholder="사업장 입력" size="10" required></td>
						</tr>
						<tr>
							<th>직급</th>
							<td><select name="jobCode" id="jobCode">
									<option value="11">대표이사</option>
									<option value="12">이사</option>
									<option value="13">팀장</option>
									<option value="14">사원</option>
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
								<select name="deptCode" id="deptCode">
									<option value="1001">개발팀</option>
									<option value="1002">인사팀</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>입사일자</th>
							<td><input type="text" id="hireDate" name="hireDate" class="form-control"></td>
						</tr>
						<tr>
							<th>퇴직일자</th>
							<td><input type="text" id="retireDate" name="exitDate" class="form-control"></td>
						</tr>
							<th>급여 계약 기준</th>
							<td><select id="salType" name="salType">
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
				$("#hireDate").datepicker({
					format : "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
					autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
					calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
					clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
					templates : {
						leftArrow : '&laquo;',
						rightArrow : '&raquo;'
					}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
					showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
					todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
					toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
					weekStart : 0,
					language : "ko" 
				});
			});
			
			$(function() {
				$("#retireDate").datepicker({
					format : "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
					autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
					calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
					clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
					templates : {
						leftArrow : '&laquo;',
						rightArrow : '&raquo;'
					}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
					showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
					todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
					toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
					weekStart : 0,
					language : "ko" 
				});
			});
			</script>

			<br><br>
			
			<div class="btns" align="center" style="padding-right:130px;">
				<button type="submit" class="btn btn-primary" id="enrollEmpbtn">인사 정보 등록</button>
				<button type="reset" class="btn btn-danger">초기화</button>
			</div>
			
		</form>

	</div>
	<br><br><br>


</body>
</html>
