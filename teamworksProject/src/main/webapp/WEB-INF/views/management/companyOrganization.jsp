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
	<!-- 아이콘 스크립트 -->
	<script src="https://use.fontawesome.com/8f77921a99.js"></script>
<style>
	@font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }
	body {font-family:Handon3gyeopsal300g;}
	
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
	
	#searchBtn, #insertBtn, #updateBtn, #deleteBtn {background-color: #e9ecef;} 
	
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
	
	/* 모달 css */
	.modal-content {width:350px;}
	.modalTable {
		width:300px;
		border: 1px solid #ddd;
	}
	.modalTable tr {height:35px;}
	.modalTable th {
		text-align:center;
		background-color:#e9ecef;
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
				<div class="tree1"><i class="fa fa-folder-o" aria-hidden="true">&nbsp;</i>전체</div>
				<div class="tree2"><i class="fa fa-folder-o" aria-hidden="true">&nbsp;</i>(주)TEAMworks</div>
				
				<c:forEach var="d" items="${ deptList }">
					<div class="tree3"><i class="fa fa-folder-o" aria-hidden="true">&nbsp;</i>${ d.deptName }
					<input type="hidden" name="deptCode" value="${ d.deptCode }">
					</div>
				</c:forEach>
	        </div>
	        <br>
	        
	        <!-- 부서 추가/수정/삭제 버튼 영역 -->
	        <div class="btn_area" align="right">
	        	<button id="insertBtn" class="btn" data-toggle="modal" data-target="#insertModal">부서 등록</button>
	        	<button id="updateBtn" class="btn" data-toggle="modal" data-target="#updateModal">부서 수정</button>
	        	<button id="deleteBtn" class="btn" data-toggle="modal" data-target="#deleteModal">부서 삭제</button>
	        </div>
		</div>
		
		<!-- 오른쪽 영역 -->
		<div class="list_box">
			<!-- 사원명 검색바 -->
			<div align="right">
			<div class="input-group mb-3" style="width:190px; height:30px;">
			  <input type="text" id="keyword" class="form-control" placeholder="사원명">
			  <div class="input-group-append">
			    <button id="searchBtn" class="btn">검색</button>
			  </div>
			</div>
			</div>
			
			<!-- 사원 목록 테이블 -->
			<span id="category"></span>&nbsp;<span id="empCount"></span>
			<table id="empListTable" border="1">
				<thead>
					<tr style="background-color: #e9ecef;">
						<th width="15%">사원명</th>
						<th width="15%">직급</th>
						<th width="15%">부서</th>
						<th width="21%">휴대폰</th>
						<th width="34%">이메일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="t" begin="0" end="9">
						<tr id="00${t}">
							<td id="empName"></td>
							<td id="jobName"></td>
							<td id="deptName"></td>
							<td id="empPhone"></td>
							<td id="empEmail"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			
			<!-- 페이징바 -->
			<div id="pagingArea">
		    	<ul class="pagination">
	   				<li class="page-item disabled"><a class="page-link" href="">&lt;</a></li>
	   				<li class="page-item disabled"><a class="page-link" href="#">1</a></li>
		    		<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
		    	</ul>
	    	</div>
		</div>
    </div>
    
    
    <!-- 부서 등록 클릭 시 뜨는 모달 -->
    <div class="modal fade" id="insertModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">부서 등록</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="insertDept.mg" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <table class="modalTable" border="1">
                    	<tr>
                    		<th width="40%">상위 부서명</th>
                    		<td width="60%">(주) TEAMworks</td>
                    	</tr>
                    	<tr>
                    		<th>부서명</th>
                    		<td><input type="text" name="deptName" required></td>
                    	</tr>
                    </table>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">등록</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    
    <!-- 부서 수정 클릭 시 뜨는 모달 -->
    <div class="modal fade" id="updateModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">부서 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="updateDept.mg" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <table class="modalTable" border="1">
                        <tr>
                    		<th width="40%">변경할 부서</th>
                    		<td width="60%">
                    			<select name="deptCode" style="width:150px; height:30px;">
                    				<c:forEach var="d" items="${ deptList }">
                    					<option value="${d.deptCode}">${ d.deptName }</option>
                    				</c:forEach>
                    			</select>
                    		</td>
                    	</tr>
                    	<tr>
                    		<th>부서명</th>
                    		<td><input type="text" name="deptName" style="width:150px;" required></td>
                    	</tr>
                    </table>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">수정</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    
    <!-- 부서 삭제 클릭 시 뜨는 모달 -->
    <div class="modal fade" id="deleteModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">부서 삭제</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="deleteDept.mg" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <table class="modalTable" border="1">
                        <tr>
                    		<th width="40%">삭제할 부서</th>
                    		<td width="60%">
                    			<select name="deptCode" style="width:150px; height:30px;">
                    				<c:forEach var="d" items="${ deptList }">
                    					<option value="${d.deptCode}">${ d.deptName }</option>
                    				</c:forEach>
                    			</select>
                    		</td>
                    	</tr>
                    </table>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">삭제</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>


	<script>
		// 메뉴바 & 사이드바 css
		$(function(){
			$("#orgManage>a").css("color", "dimgray");
			$("#orgManage").css("border-bottom-style", "groove");
			$("#org>a").css("color", "deepskyblue");
		});	
	
	
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
				
				$.ajax({
					url:"allEmpList.mg",
					data:{},
					type:"post",
					success:function(empList){
						
						$('#category').text('전체');
						$('#empCount').text(empList.length);
						
						for(var e=0; e<empList.length; e++) {
							var selector = '#00' + e;
							$(selector).children('#empName').text(empList[e].empName);
							$(selector).children('#jobName').text(empList[e].jobName);
							$(selector).children('#deptName').text(empList[e].deptName);
							$(selector).children('#empPhone').text(empList[e].phone);
							$(selector).children('#empEmail').text(empList[e].email);
						}
						
					},error:function(){
						console.log("조직도 전체 클릭 시 사원 목록 불러오는 ajax 통신 실패");
					}
				});
				
			});
			
			$(".tree2").click(function(){
				var tree3 = $(this).nextAll(".tree3");
				
				if(tree3.css("display") == "none") {
					tree3.slideDown();
				}else {
					tree3.slideUp();
				}
			});
			
			// 조직도 클릭 시 --> 해당 부서의 사원 목록 조회
			$(".tree3").click(function(){
				var deptCode = $(this).children('input').val();
				var deptName = $(this).text();
				
				$.ajax({
					url:"orgEmpList.mg",
					data:{deptCode:deptCode},
					type:"post",
					success:function(empList){
						$('#empListTable>tbody td').text('');
						
						if(empList.length != 0) {	// 해당 부서에 사원이 존재할 경우
							
							$('#category').text(deptName);
							$('#empCount').text(empList.length);						
							
							for(var e=0; e<empList.length; e++) {
								var selector = '#00' + e;
								$(selector).children('#empName').text(empList[e].empName);
								$(selector).children('#jobName').text(empList[e].jobName);
								$(selector).children('#deptName').text(empList[e].deptName);
								$(selector).children('#empPhone').text(empList[e].phone);
								$(selector).children('#empEmail').text(empList[e].email);
							}
							
						}else {	// 해당 부서에 사원이 존재하지 않을 경우
							
							$('#category').text(deptName);
							$('#empCount').text(0);
						}
						
					},error:function(){
						console.log("부서명 클릭 시 실행되는 ajax 통신 실패");
					}
				});
				
			});
			
		});
		
		
		// 사원 리스트 스크립트 --> 페이지 로딩 시 실행
		$(function(){
			$.ajax({
				url:"allEmpList.mg",
				data:{},
				type:"post",
				success:function(empList){
					
					$('#category').text('전체');
					$('#empCount').text(empList.length);
					
					for(var e=0; e<empList.length; e++) {
						var selector = '#00' + e;
						$(selector).children('#empName').text(empList[e].empName);
						$(selector).children('#jobName').text(empList[e].jobName);
						$(selector).children('#deptName').text(empList[e].deptName);
						$(selector).children('#empPhone').text(empList[e].phone);
						$(selector).children('#empEmail').text(empList[e].email);
					}
					
				},error:function(){
					console.log("페이지 로딩 시 사원 목록 불러오는 ajax 통신 실패");
				}
			});
		});
		
		// 사원명 검색바 스크립트
		$('#searchBtn').click(function(){
			var keyword = $('#keyword').val();
			
			$.ajax({
				url:"searchEmpName.mg",
				data:{keyword:keyword},
				type:"post",
				success:function(searchList){
					
					$('#empListTable>tbody td').text('');
					
					if(searchList.length != 0) {	// 검색 결과가 존재할 경우
						
						$('#category').text('검색 결과');
						$('#empCount').text(searchList.length);						
						
						for(var e=0; e<searchList.length; e++) {
							var selector = '#00' + e;
							$(selector).children('#empName').text(searchList[e].empName);
							$(selector).children('#jobName').text(searchList[e].jobName);
							$(selector).children('#deptName').text(searchList[e].deptName);
							$(selector).children('#empPhone').text(searchList[e].phone);
							$(selector).children('#empEmail').text(searchList[e].email);
						}
						
					}else {	// 검색 결과가 존재하지 않을 경우
						
						$('#category').text('검색 결과');
						$('#empCount').text(0);
					}
					
				},error:function(){
					console.log("사원명 검색 시 실행되는 ajax 통신 실패");
				}
			});
		});
	</script>

</body>
</html>
