<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
	     .outer{
				width:1250px;
				float:left;
				margin-left:200px;
			
			 }
        .wrap{
            width: 600px; 
            font-family: 'Nanum Gothic';
            border: 1px solid lightgray;
            border-radius: 20px;
            padding: 20px;
            margin-top: 10%;
            box-shadow: lightgrey 5px 5px 5px ;
            }
            #memberInfo{ 
                border-collapse: separate;
                border-spacing: 20px;
            }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="../common/sidebarMypage.jsp"/>
	<div class="outer" align="center">
        <div class="wrap inner">
            <h3>비밀번호 변경</h3>
            <form action="" method="post">
                <table id="memberInfo">
                    <tr>
                        <th>현재 비밀번호</th>
                        <td> <input type="password" class="form-control" required> </td>
                    </tr>
                    <tr>
                        <th>변경할 비밀번호</th>
                        <td> <input type="password" class="form-control" required></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td> <input type="password" class="form-control" required></td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-primary" style="margin-right: 30px;">변경</button>
                <button type="reset" class="btn">취소</button>

            </form>
        </div>
    </div>
</body>
</html>