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
<link rel="stylesheet" href="tree_fontello/css/fontello.css">
<style>
  .tree{
    color:#393939;
  }
  .tree, .tree ul{
    list-style: none;
    padding-left:17px;
  }
  .tree *:before{
    width:17px;
    height:17px;
    display:inline-block;
  }
  .tree label{
    cursor: pointer;
  }
  .tree label:before{
    content:'\f256';
    font-family: fontello;
  }
  .tree a{
    text-decoration: none;
    color:#393939;
  }
  .tree a:before{
    content:'\e800';
    font-family: fontello;
  }
  .tree input[type="checkbox"] {
    display: none;
  }
  .tree input[type="checkbox"]:checked~ul {
    display: none;
  }
  .tree input[type="checkbox"]:checked+label:before{
    content:'\f255';
    font-family: fontello;
  }
</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    <jsp:include page="../common/sidebarMg.jsp"/>


     <div class="content">
     <h1>직급 관리</h1>
     <hr align="left" style="border: solid 1px grey; width: 90%;">
     
		  <ul class="tree">
		    <li>
		      <input type="checkbox" id="root">
		      <label for="root">전체</label>
		      <ul>
		        <li><a href="">TEAMworks</a></li>
		        <li>
		          <input type="checkbox" id="node3">
		          <label for="node3">node3</label>
		          <ul>
		            <li><a href="">경영지원팀</a></li>
		            <li><a href="">개발팀</a></li>
		          </ul>
		        </li>
		      </ul>
		    </li>
		  </ul>
		
		
		
	<!-- <div class="tree_box">
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
	</div> -->
     

    </div>


</body>
</html>
