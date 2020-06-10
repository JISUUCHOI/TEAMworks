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
		margin-top:65px;
		border: 2px solid #07355A;
	}
	
	.btn {background-color: #ddd;}
	
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
		        <ul id="tree_menu" class="tree_menu">
		            <li class="depth_1"><strong>전체</strong>
		                <ul class="depth_2" >
		                    <li>
		                        <a href="#none"><em>폴더</em> 팀 명 1 </a>
		                        <ul class="depth_3">
		                            <li><a href="#none">사원정보1</a></li>
		                            <li><a href="#none">사원정보2</a></li>
		                            <li><a href="#none">사원정보3</a></li>
		                            <li><a href="#none">사원정보4</a></li>
		                            <li><a href="#none">사원정보5</a></li>
		                        </ul>
		                    </li>
		                    <li class="last">
		                        <a href="#none"><em>폴더</em> 팀 명 2 </a>
		                        <ul class="depth_3">
		                            <li><a href="#none">사원정보1</a></li>
		                            <li><a href="#none">사원정보2</a></li>
		                            <li><a href="#none">사원정보3</a></li>
		                            <li><a href="#none">사원정보4</a></li>
		                            <li class="end"><a href="#none">사원정보5</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </li>
		        </ul>
	        </div>
	        <br>
	        <!-- 부서 추가/수정/삭제 버튼 영역 -->
	        <div class="btn_area" align="right">
	        	<button id="searchBtn" class="btn" type="submit">부서추가</button>
	        	<button id="searchBtn" class="btn" type="submit">부서수정</button>
	        	<button id="searchBtn" class="btn" type="submit">부서삭제</button>
	        </div>
		</div>
		
		<!-- 오른쪽 영역 -->
		<div class="list_box" style="border:1px solid black;">
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
			<span id="category">전체</span>&nbsp;<span id="empCount">10</span>
			<table id="empListTable" border="1">
				<tr style="background-color: #f2f2f2;">
					<th width="15%">사원명</th>
					<th width="15%">직급</th>
					<th width="15%">부서</th>
					<th width="21%">휴대폰</th>
					<th width="34%">이메일</th>
				</tr>
				<tr>
					<td>최지수</td>
					<td>이사</td>
					<td>영업지원팀</td>
					<td>010-2222-3333</td>
					<td>twgroupware.vo@gmail.com</td>
				</tr>
				<tr>
					<td>라공주</td>
					<td>사원</td>
					<td>영업지원팀</td>
					<td>010-3434-2323</td>
					<td>twgroupware.vo@gmail.com</td>
				</tr>
				<tr>
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
				</tr>
				<tr>
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
				</tr>
				<tr>
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
				</tr>
				<tr>
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


</body>
</html>
