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
@font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }

	body {
	
	    font-family: Handon3gyeopsal300g;
	  
	}
.content {
	margin-left: 20%;
	width: 80%
}

.container td {
	height: 40px;
}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../employee/sidebarMyAttendance.jsp" />

	<div class="content">
		<h2>휴가 내역</h1>
		<hr align="left" style="border: solid 1px grey; width: 90%;">
		<br>

		<div class="container" style="margin-left: 0px;">
			
			<br>
			
			


			<table class="table table-bordered"
				style="table-layout: fixed; text-align: center; margin-top: 30px;">
				<thead class="thead-light">
					<tr>
						
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
					
					
				
				</tbody>
			</table>


			
		</div>
	</div>
	<script>
	$(function(){
		
			$.ajax({
				url:"MyVacation.em",
				data:{empId:"${loginUser.empId}"},
				type:"post",
				success:function(v){
					console.log(v);
					value="";
					value+=	"<tr>"+
					
					"<td>"+ v.hireDate +"</td>"+
					"<td>";
					if(v.months >=36){
						value+= 16;
					}else if(v.months >= 12){
						value+= 15;
					}else{
						value+= v.months;
					}
						
				value+="</td>"	+
							"<td>" +v.typeA +"</td>"+
							"<td>" +v.typeB +"</td>"+
							"<td>"+ v.typeC +"</td>"+
							"<td>"+ v.typeD +"</td>"+
							"<td>";
							if(v.months >=36){
								value+= 16- v.vcCount;
							}else if(v.months >= 12){
								value+= 15- v.vcCount;
							}else{
								value+= v.months - v.vcCount;
							}
							
							value+="</td>"+
						"</tr>";
						console.log(value);
						$("table tbody").html(value);	
					
				},errorPage:function(){
					console.log("조회실패");
				}
				
			});
		
	});
	</script>

</body>
</html>