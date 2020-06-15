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
		<div class="inner" align="left">
		       <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fas fa-envelope"></i> 메일정보관리</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
            </div>
             
            <!-- /.row -->
            <div class="row" align="center">
            	
            		<input type="hidden" name="emino" value="">
					<div class="panel panel-default">
	                    <div class="panel-body">
	                    	 
	                    	<div class="row form-group"> 
	                            <label class="col-lg-2">IMAP 서버주소</label>
	                            <div class="col-lg-8">
									<input type="text" class="form-control" id="emismtp" name="emismtp" maxlength="30" value="${ empMailInfo.emIsmtp }" readonly>
	                            </div>
	                            
	                        </div> 
	                    	<div class="row form-group">
	                            <label class="col-lg-2">SMTP 서버주소</label>
	                            <div class="col-lg-8">
	                            	<input type="text" class="form-control" id="emIimap" name="emismtp" maxlength="30" value="${ empMailInfo.emIimap }" readonly>
	                            </div>
	                          
	                        </div> 
	                    	<div class="row form-group">
	                            <label class="col-lg-2">계정</label>
	                            <div class="col-lg-8">
	                            	<input type="text" class="form-control" id="emiuser" name="emIuserId" maxlength="50" value="${ empMailInfo.emIuserId }" readonly>
	                            </div>
	                        </div> 
	                      
	                    </div>
	                </div>
					
		        <button class="btn btn-primary" onclick="location.href='InfoForm.ma'">메일 정보 등록 및 삭제</button>
            </div>                     
		</div>
	</div>
</body>
</html>