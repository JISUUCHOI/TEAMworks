<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<Style>
	#mainOuter{
		width:1250px;
		float:left;
	}
</Style>
</head>
<body>
   	<jsp:include page="menubar.jsp"/>
	
	<!-- 메인용 사이드바로 고쳐야함!!  -->
	<jsp:include page="sidebarHome.jsp"/>
	
	<div id="mainOuter">
		<h1>${ msg }</h1>
	
	</div>
</body>
</html>