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
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
        .outer{
			width:1250px;
			float:left;
			margin-left:220px;
			margin-top:50px;
		
		 }

        .inner {
            width: 800px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarMail.jsp"/>

 	<div class="outer" align="center">
        <div class="inner" >
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12 text-left">
                        <h3 class="page-header"><i class="fas fa-envelope"></i> 받은메일</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4"></div>
                    <div class="col-xs-2">
                        <select class="form-control" name="" id="">
                            <option value="">읽음</option>
                            <option value="">읽지않음</option>
                        </select>
                    </div>
                    <div class="col-xs-2">
                        <select class="form-control" name="" id="">
                            <option value="">제목</option>
                            <option value="">보낸사람</option>
                        </select>
                    </div>
                    <div class="col-xs-2">
                        <div class="form-group input-group" style="width: 235px;">
                            <input type="text" class="form-control" placeholder="Search">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div>
                    </div> 
                </div>
                <div class="row" align="right">
                    <div class="col-xs-12">
                        <button class="btn btn-danger btn-sm" style="margin-right: 10px;">삭제</button>
                    </div>
                </div>
                <hr>
                <table class="table table-hover text-left">
                    <thead>
                        <tr>
                            <th width="80px">
                                <input type="checkbox" value="">
                            </th>
                            <th width="180px">보낸사람</th>
                            <th>제목</th>
                            <th width="150px">날짜</th>
                            <th width="50px">읽음</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>
                                <input type="checkbox" value="">
                            </th>
                            <td>
                                ipqi86@gmail.com
                            </td>
                            <td>
                                안녕하세요.
                            </td>
                            <td>
                                2020-05-06 18:17
                            </td>
                            <td>
                                <i class="far fa-envelope"></i>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <input type="checkbox" value="">
                            </th>
                            <td>
                                ipqi86@gmail.com
                            </td>
                            <td>
                                안녕하세요.
                            </td>
                            <td>
                                2020-05-06 18:17
                            </td>
                            <td>
                                <i class="far fa-envelope-open"></i>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <ul class="pagination">
                    <li class="previous"><a href="">&lt;</a></li>
                    <li><a href="">1</a></li>
                    <li><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li class="next"><a href="">&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>