<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	
	<!--       <input id="content" type="text" name="content"/>
	        <input type="button" id="execute" value="QR코드생성"/> -->
	        <img id="img" src="qr.em?content=http://192.168.0.52:9191/teamworks/QRAtt.em" style="display:none" onload="this.style.display='block'"/>
	 
	    
	</div>
	
</body>
</html>