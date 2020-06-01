<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

     <div class="content">
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

     

    </div>

    <jsp:include page="../common/sidebarSample.jsp"/>

</body>
</html>
