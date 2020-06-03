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
	.content{margin-left:20%;}
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    <jsp:include page="../common/sidebarMg.jsp"/>

    <div class="content">
		<div class="tree_box">
	    <div class="con">
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
	</div>
    </div>


</body>
</html>
