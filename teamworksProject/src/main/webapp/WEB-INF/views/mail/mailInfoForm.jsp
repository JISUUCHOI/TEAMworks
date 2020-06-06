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
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  	
  	<style>
        .outer{width: 1250px; float: left;}
        .inner{width: 600px;}
        .inner a{text-decoration:none;}
   	</style>

</head>
<body>
  <div class="outer" align="center">
        <div class="inner" align="left">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fas fa-envelope"></i> 메일정보관리</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                   <a href="">이메일 연동을 위한 방법 안내</a>
                </div>
                
            </div>
             
            <!-- /.row -->
            <div class="row">
            	<form id="form1" name="form1" role="form" action="mailInfoSave" method="post" >
            		<input type="hidden" name="emino" value="">
					<div class="panel panel-default">
	                    <div class="panel-body">
	                    	<div class="row form-group">
	                    		<label class="col-lg-6">연동할 메일서버 정보를 입력하세요.( Google / NAVER 사용 권장 ) <br/> 
	                    		입력한 정보를 저장하시면, 해당 서버에서 메일을 가져오는데 시간이 걸릴 수 있습니다.</label>
	                            
	                        </div>  
	                    	<div class="row form-group"> 
	                            <label class="col-lg-2">IMAP 서버주소</label>
	                            <div class="col-lg-4">
	                            	<input type="text" class="form-control" id="emiimap" name="emiimap" maxlength="30"  value="">
	                            </div>
	                            <label class="col-lg-1">포트</label>
	                            <div class="col-lg-1">
	                            	<input type="text" class="form-control" id="emiimapport" name="emiimapport" maxlength="5" value="">
	                            </div>
	                        </div> 
	                    	<div class="row form-group">
	                            <label class="col-lg-2">SMTP 서버주소</label>
	                            <div class="col-lg-4">
	                            	<input type="text" class="form-control" id="emismtp" name="emismtp" maxlength="30" value="">
	                            </div>
	                            <label class="col-lg-1">포트</label>
	                            <div class="col-lg-1">
	                            	<input type="text" class="form-control" id="emismtpport" name="emismtpport" maxlength="5"  value="">
	                            </div>
	                        </div> 
	                    	<div class="row form-group">
	                            <label class="col-lg-2">계정</label>
	                            <div class="col-lg-4">
	                            	<input type="text" class="form-control" id="emiuser" name="emiuser" maxlength="50" value="">
	                            </div>
	                        </div> 
	                    	<div class="row form-group">
	                            <label class="col-lg-2">비밀번호</label>
	                            <div class="col-lg-4">
	                            	<input type="password" class="form-control" id="emipw" name="emipw" maxlength="20" value="">
	                            </div>
                            </div>
                            <div class="row form-group">
	                            <label class="col-lg-2">외부 메일 연동을 위해 서비스를 이용하는 기간 동안 입력한 메일주소와 비밀번호가 보관됩니다.</label>
	                            <div class="checkbox col-lg-4">
                                    <label><input type="checkbox" value="">이용에 동의합니다.</label>
                                  </div>
	                        </div>  
	                    </div>
	                </div>
				</form>	
		        <button class="btn btn-primary" onclick="fn_formSubmit()">등록</button>
		        <button class="btn btn-danger" onclick="fn_delete()">삭제</button>
            </div>
            <!-- /.row -->
        </div> 
        <!-- /#page-wrapper -->
     </div>
	<script>
	
		function fn_formSubmit(){
			if (!confirm("저장 하시겠습니까?")) return;
			if ( ! chkInputValue("#emiimap", "IMAP 서버주소")) return false;
			if ( ! chkInputValue("#emiimapport", "IMAP 서버 포트")) return false;
			if ( ! chkInputValue("#emismtp", "SMTP 서버주소")) return false;
			if ( ! chkInputValue("#emismtpport", "SMTP 서버 포트")) return false;
			if ( ! chkInputValue("#emiuser", "계정 정보")) return false;
			if ( ! chkInputValue("#emipw", "비밀번호")) return false;
			
			$("#form1").submit();
		} 
		
		function fn_delete(){
			if (!confirm("삭제 하시겠습니까?")) return;
			$("#form1").attr("action", "mailInfoDelete");
			$("#form1").submit();
		}
	</script>   

</body>
</html>