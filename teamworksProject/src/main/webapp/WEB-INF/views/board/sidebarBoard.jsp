<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body{height:100%; position:relative;}
	
	div{box-sizing:border-box;}
	#sidebarOuter{
		width:250px;
		height:700px;
		float:left;
	}
	
	/* 사이드바 */
    #sidebar{
    	position:absolute;
        width:250px;
        height:100%;
        float:left;
       /*  margin-top:100px; */
        padding-top:20px;
        background:rgb(7, 53, 90);
    }
    
    .category{
        width:300px;
        height:40px;
        line-height:2;
        margin-top:20px;
        padding-left:60px;
        /* font-family: 'Handon3gyeopsal300g'; */
        font-family: 'JSDongkang-Regular';
        color:white;
        font-size:20px;
    }
    .subCate{
        width:250px;
        height:35px;
        padding-left:60px;
        line-height:2;
        /* font-family: 'Handon3gyeopsal300g'; */
        font-family: 'JSDongkang-Regular';
        cursor:pointer;
        font-size:17px;
    }
    .subCate>a{text-decoration:none; color:white;}
    .subCate>a:hover, #logout>a:hover, #messenger>a:hover{
        color:deepskyblue;
    }
    .subCate>span{
        color:red;
    }

</style>
</head>
<body>
  <!-- 사이드바 -->
    <div class="sidebarOuter">
        <div id="sidebar">
            <div id="messenger"><a href=""><img src="${ pageContext.servletContext.contextPath }/resources/icons/messenger.png"width="20px"> messenger</a></div>
            <div id="logout"><a href="logout.em">logout</a></div>
            
            <div class="category"></div>
            <div class="subCate"><a href="">공지사항</a></div>
            <div class="subCate"><a href="">자유게시판</a></div>
          
        </div>
    </div>
    
</body>
</html>