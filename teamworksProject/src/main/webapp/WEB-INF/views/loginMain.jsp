<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <!-- particles.css -->
   <link rel="stylesheet" media="screen" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">
   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <!-- Popper JS -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <!-- Latest compiled JavaScript -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   <!-- 나눔 고딕 폰트 -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800" rel="stylesheet">
   
  <style>

  	html {
  	height: 100%;
	}
	
	.loginbody {
      position: relative;
	    /* width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 150px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif; */
  		/* background-repeat: no-repeat; */
  	 /* background:linear-gradient(to bottom right, #0098FF, #6BA8D1);  */
	}
	
  	.card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	 }
 	#pwdChange{
    	text-decoration: none;
    	color: rgb(7, 53, 90);
  	}
  	#pwdChange:hover{ color: rgb(51, 102, 255);}
    </style>
</head>
<body>

	
<div id="particles-js" class="loginbody" align="center">

<c:choose>
	<c:when test="${ empty loginUser }">
    <div class="card align-middle" style="width:20rem; border-radius:20px; position: absolute; top:200px; left: 0; right: 0;;">
      <div class="card-title" style="margin-top:30px;">
        <h2 class="card-title text-center"><img src="${ pageContext.servletContext.contextPath }/resources/images/logo_blue.png" alt="" width="250px"></h2>
      </div>
      <div class="card-body" align="center">
        <form class="form-signin" method="POST" action="login.em">
         
          <label for="inputEmail" class="sr-only"></label>
          <input type="text" id="uid" class="form-control" name="empId" placeholder="사원번호" required autofocus autocomplete="off"><BR>
          <label for="inputPassword" class="sr-only"></label>
          <input type="password" id="upw" class="form-control" name="empPwd" placeholder="Password" required><br>
         
          <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button>
          
        </form>
          <br>
          <a id="pwdChange" onclick="searchPwd();">비밀번호 찾기</a>
      </div>
    </div>
    </c:when>
    <c:otherwise>
    	<jsp:forward page="main.jsp"/>
    </c:otherwise>
 </c:choose>   
  </div>
  <script>
  	function searchPwd(){
  		 window.open("searchPwd.em","예약등록창","width=500px,height=300px"); 
  	}
  </script>
  
<!-- scripts -->
<script src="${ pageContext.servletContext.contextPath }/resources/js/particles.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/app.js"></script>
<!-- stats.js -->
<script src="${ pageContext.servletContext.contextPath }/resources/js/stats.js"></script>

</body>
</html>