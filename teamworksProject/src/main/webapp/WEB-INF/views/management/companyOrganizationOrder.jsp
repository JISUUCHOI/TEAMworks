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

		<div class="container" style="padding-left: 60px; padding-top: 50px;">

			<button onclick="saveRank();">순서 저장</button> 

			<table id="rankTable" class="table border" style="width: 80%;">
				<thead class="thead-light">
					<tr>
						<th width="20%">No.</th>
						<th width="30%">직급명</th>
						<th width="25%">수정/삭제</th>
						<th width="25%">순서 설정</th>
					</tr>
				</thead>
				<tbody>
 					<c:forEach items="${jobList}" var="j">
						<tr id="${j.jobCode}">
							<td><b>${j.jobCode % 10}</b></td>
							<td>${j.jobName}</td>
							<td>
								<button type="button" class="btn btn-info btn-primary btn-sm" data-toggle="modal" data-target="#myModal">수정</button>
								<button type="button" class="btn btn-secondary btn btn-primary btn-sm">삭제</button>
							</td>
							<td>
								<button class="btn" onclick="moveUp(${j.jobCode});"><i class="fa fa-arrow-up" aria-hidden="true"></i></button>
								&nbsp;
								<button class="btn" onclick="moveDown(${j.jobCode});"><i class="fa fa-arrow-down" aria-hidden="true"></i></button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
 				<tfoot>
					<tr>
						<th scope="row"></th>
						<td colspan="2">
							<form action="insertJob.mg" id="insertForm" method="post">
								<input type="text" name="jobName" placeholder="추가할 직급명 입력">
								&nbsp;&nbsp;&nbsp;
								<button type="submit"
									class="btn btn-warning btn btn-primary btn-sm">추가</button>
							</form>
						</td>
						<td>
							
						</td>
					</tr>
				</tfoot>
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
/* 		function moveUp(el) {
			var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
			$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
		}
		
		function moveDown(el) {
			var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
			$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
		} */
		
		function moveUp(obj) {
			var idStr = '#' + obj;
			var prevHtml = $(idStr).prev().html();
			if(prevHtml == null) {
				alert('최상위 리스트입니다!');
				return;
			}
			
			var prevobj = $(idStr).prev().attr("id");
			var currobj = $(idStr).attr("id");
			var currHtml = $(idStr).html();
			
			$(idStr).html(prevHtml); //값 변경
			$(idStr).prev().html(currHtml);
			$(idStr).prev().attr("id", 'TEMP_TR'); //id값 변경
			$(idStr).attr("id", prevobj);
			$('#TEMP_TR').attr("id", currobj);
		}
		
		function moveDown(obj) {
			var idStr = '#' + obj;
			var nextHtml = $(idStr).next().html();
			if(nextHtml == null) {
				alert('최하위 리스트입니다!');
				return;
			}
			
			var nextobj = $(idStr).next().attr("id");
			var currobj = $(idStr).attr("id");
			var currHtml = $(idStr).html();
			
			$(idStr).html(nextHtml); //값 변경
			$(idStr).next().html(currHtml);
			$(idStr).next().attr("id", 'TEMP_TR'); //id값 변경
			$(idStr).attr("id", nextobj);
			$('#TEMP_TR').attr("id", currobj);
		}
		
		// 순서 저장 버튼 클릭 시
		function saveRank() {

			var str = "";
			for(var i=1; i<=${fn:length(jobList)}; i++) {
				
				str += $('#rankTable>tbody>tr:nth-child('+i+')>td:nth-child(2)').text() + ",";
			}


  			$.ajax({
				url:"saveRank.mg",
				type:"post",
				data:{str:str},
				success:function(list){
					
					alert('직급 순서가 변경되었습니다.');
					
					for(var i=0; i<list.length; i++) {
						var index = i + 1;
						$('#rankTable>tbody>tr:nth-child('+index+')').attr("id", list[i].jobCode);
						$('#rankTable>tbody>tr:nth-child('+index+')>td:nth-child(1)>b').text(list[i].jobCode%10);
						$('#rankTable>tbody>tr:nth-child('+index+')>td:nth-child(2)').text(list[i].jobName);
					}
					
				},error:function(){
					console.log('순서 저장용 ajax 통신 실패!');
				}
			});  
		}
		

	</script>
	
	
</body>
</html>