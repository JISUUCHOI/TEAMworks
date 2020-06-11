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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
	.content {
		margin-left:20%;
		width:1250px;
		float:left;
	}
	
	.tree_box {
		float:left;
		width:30%;
		height:500px;
		margin-left:50px;
	}
	.list_box {
		float:left;
		width:45%;
		height:500px;
		margin-left:90px;
	}
	
	.tree_area {
		margin-top:70px;
		width:100%;
		height:300px;
		border: 2px solid #07355A;
	}
	
	.btn {background-color: #ddd;} 
	
	/* 조직도 css */
	.tree1, .tree2, .tree3 {
		cursor:pointer;
		font-size:20px;	
	}
	.tree1 {
       margin:10px 0px 5px 15px;
    }
    .tree2 {
       margin:10px 0px 5px 45px;
       /* display:none; */
    }
    .tree3 {
       margin-top:10px;
       margin-left:83px;
       /* display:none; */
    }
	
	/* 사원 리스트 css */
	#empCount {color:red;}
	#empListTable {
		width:100%;
		text-align:center;
		font-size:13px;
		border-collapse: collapse;
		border: 1px solid #ddd;
	}
	#empListTable tr {
		height:30px;
	}
	
	#pagingArea{width:fit-content; margin:auto; color:rgb(7, 53, 90);}
	
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    <jsp:include page="../common/sidebarMg.jsp"/>

    <div class="content">
    <h1>조직도</h1>
  	<hr align="left" style="border: solid 1px grey; width: 90%;">
  	<br>
    	<!-- 왼쪽 영역 -->
		<div class="tree_box">
			<!-- 조직도 영역 -->
			<div class="tree_area">
				<div class="tree1">전체</div>
				<div class="tree2">(주) TEAMworks</div>
				
				<c:forEach var="d" items="${ deptList }">
					<div class="tree3">${ d.deptName }</div>
				</c:forEach>

	        </div>
	        <br>
	        <!-- 부서 추가/수정/삭제 버튼 영역 -->
	        <div class="btn_area" align="right">
	        	<button id="insertBtn" class="btn">부서 추가</button>
	        	<button id="updateBtn" class="btn">부서 수정</button>
	        	<button id="deleteBtn" class="btn">부서 삭제</button>
	        </div>
		</div>
		
		<!-- 오른쪽 영역 -->
		<div class="list_box">
			<!-- 사원명 검색바 -->
			<div align="right">
			<div class="input-group mb-3" style="width:190px; height:30px;">
			  <input type="text" class="form-control" placeholder="사원명">
			  <div class="input-group-append">
			    <button id="searchBtn" class="btn" type="submit">검색</button>
			  </div>
			</div>
			</div>
			
			<!-- 사원 목록 테이블 -->
			<span id="category">전체</span>&nbsp;<span id="empCount">${fn:length(empList)}</span>
			<table id="empListTable" border="1">
				<tr style="background-color: #f2f2f2;">
					<th width="15%">사원명</th>
					<th width="15%">직급</th>
					<th width="15%">부서</th>
					<th width="21%">휴대폰</th>
					<th width="34%">이메일</th>
				</tr>
				<c:forEach var="e" items="${ empList }">
					<tr>
						<td id="empName">${ e.empName }</td>
						<td id="jobName">${ e.jobName }</td>
						<td id="deptName">${ e.deptName }</td>
						<td id="empPhone">${ e.empPhone }</td>
						<td id="empEmail">${ e.empEmail }</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<br>
			
			<!-- 페이징바 -->
			<div id="pagingArea">
		    	<ul class="pagination">
	   				<li class="page-item"><a class="page-link" href="">&lt;</a></li>
	   				<li class="page-item"><a class="page-link" href="#">1</a></li>
		    		<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
		    	</ul>
	    	</div>
		</div>
		
    </div>


	<script>
		// 조직도 스크립트
		$(function(){
			
			// 조직도 slideDown slideUp
			$(".tree1").click(function(){
				var tree2 = $(this).nextAll(".tree2");
				var tree3 = $(this).nextAll(".tree3");
				
				if(tree3.css("display") == "none") {
					tree3.slideDown();
				}else {
					tree3.slideUp();
				}
				
				if(tree2.css("display") == "none") {
					tree2.slideDown();
				}else {
					tree2.slideUp();
				}
			});
			
			$(".tree2").click(function(){
				var tree3 = $(this).nextAll(".tree3");
				
				if(tree3.css("display") == "none") {
					tree3.slideDown();
				}else {
					tree3.slideUp();
				}
			});
			
			// 조직도 클릭 시
			
		});
		
		
		// 사원 리스트 스크립트
		
	</script>

</body>
</html>
