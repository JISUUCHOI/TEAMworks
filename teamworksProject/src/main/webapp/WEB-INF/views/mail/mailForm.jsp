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
        .outer {
            width: 1250px;
            float: left;
        }

        .inner {
            width: 800px;
        }
    </style>
</head>
<body>
 	<div class="outer" align="center">
        <div class="inner">
            <div class="row">
                <div class="col-lg-12 text-left">
                    <h3 class="page-header"><i class="fas fa-envelope"></i> 메일보내기</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <form action="">
                <table class="table">
                    <tr>
                        <th width="150px">받는 사람</th>
                        <td>
                            <input type="email" name="" class="form-control">
                        </td>
                        <td width="50px">
                            <button type="button" class="btn btn-default">조직도</button>
                        </td>
                    </tr>
                    <tr>
                        <th width="150px">참조</th>
                        <td>
                            <input type="email" name="" class="form-control">
                        </td>
                        <td>
                            <button type="button" class="btn btn-default">조직도</button>
                        </td>
                    </tr>
                    <tr>
                        <th width="150px">숨은 참조</th>
                        <td>
                            <input type="email" name="" class="form-control">
                        </td>
                        <td>
                            <button type="button" class="btn btn-default">조직도</button>
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="2">
                            <input type="text" name="" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <th>파일첨부</th>
                        <td colspan="2">
                            <input type="file" name="">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <textarea name="" id="" cols="150" rows="15" class="form-control"></textarea>
                        </td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-primary">보내기</button>
            </form>
        </div>
    </div>
</body>
</html>