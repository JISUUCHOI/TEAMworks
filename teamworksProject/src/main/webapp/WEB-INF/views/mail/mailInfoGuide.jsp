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
    body {font-family: Handon3gyeopsal300g;}
        .outer{
			width:1250px;
			float:left;
			margin-left:200px;
			margin-top:50px;
		
		 }

        .inner {
            width: 800px;
        }
        .alert a{
        	text-decoration:none;
        }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarMail.jsp"/>

	<div class="outer" align="center">
		<div class="inner">
			 <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-envelope-o fa-fw"></i> 메일정보관리</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             
            <!-- /.row -->
            <div class="row">
					<div class="panel panel-default">
	                    <div class="panel-body">
	                    	<div class="alert alert-info">
                                	등록된 메일 서버 정보가 없습니다.<p>&nbsp;</p>
	                    		먼저, 서버 정보를 등록해 주세요 <p>&nbsp;</p> <a href="InfoList.ma" class="alert-link">메일 정보 등록하러 가기</a>.
                            </div>
	                    </div>
	                </div>
            </div>
		</div>
	</div>

</body>
</html>