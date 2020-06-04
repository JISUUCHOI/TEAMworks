<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드롭존</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/dropzone.css">
<script src="${ pageContext.servletContext.contextPath }/resources/js/dropzone.js" rel="javascript" type="text/javascript"></script>
</head>
<body>
	<form action="/file-upload" class="dropzone">
  		<div class="fallback">
   		   <input name="file" type="file" multiple />
 		</div>
	</form>
</body>
</html>


