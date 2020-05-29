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
    <style>
	    #pwdForm1{
	        border-collapse: separate;
	        border-spacing: 20px;
	    }
	    #inner1, #inner2{
	        width: 500px;
	    }

     </style>
  
</head>
<body>
 <div class="outer" align="center">
        <div id="inner1" >
        <form onSubmit="return false">
            <table id="pwdForm1" width="60%">
                <tr>
                    <th style="text-align: center; color: rgb(7, 53, 90); font-size: 1.2em;">
                        	비밀번호 찾기
                    </th>
                </tr>
                <tr>
                    <th>
                        <input type="text" name="empId" id="empId" class="form-control" placeholder="사원번호" required>
                    </th>
                </tr>
           
                <tr>
                    <th>
                        <input type="email" name="email" id="email" class="form-control" placeholder="등록된 이메일을 입력하세요."required>
                    </th>
                </tr>
                <tr>
                    <th><button type="submit" onclick="checkId();" class="btn btn-info" style="width: 100%;">비밀번호 찾기</button></th>
                </tr>
                 <tr>
                    <th>등록된 이메일이나 사번을 모를 경우 경영지원팀으로 연락 바랍니다.</th>
                </tr>    
            </table>
            </form>
        </div>
      
       <div id="inner2" style="display:none;">
           <br>
           <br>
            <button data-toggle="collapse" data-target="#key" class="btn btn-success">이메일 인증</button>
            <div id="key" class="collapse" >
                <form action="">
                    <table id="pwdForm1" width="80%">
                        <tr>
                            <td width="90%">
                                <input type="text" class="form-control" placeholder="이메일에 전달된 인증키를 입력하세요.">
                            </td>
                            <td> <button class="btn btn-success">확인</button></td>
                        </tr> 
                    </table>
                </form>
            </div>
       </div>
    </div>
        
	<script>
  		 var empId;
  		 var email;
         function checkId(){
     		$.ajax({
     			url:"checkId.em",
     			type:"post",
     			data:{
     				empId:$("#empId").val(),
     				email:$("#email").val()
     			},
     			success:function(status){
     				if(status=="success"){
     					alert("확인되었습니다. 이메일 인증 후 새로운 비밀번호를 등록해 주세요.");
     					$("#inner1").css("display","none");
     					$("#inner2").css("display","block");
     					empId = $("#empId").val();
     					email = $("#email").val();
     				}else if(status=="fail"){
     					alert("이메일 정보가 일치 하지 않습니다. 이메일을 확인해주세요.");
     					
     				}else{
     					alert("조회되는 사원번호가 없습니다. 사원번호를 확인해주세요.");
     				}
     			},
     			error:function(){
     				console.log("checkId ajax실패");
     			}
     		})
     	}
          
        var authKey;
        
        function authentication(){
        	// console.log(empId);
        	// console.log(email);
        	$.ajax({
        		url:"auth.em",
        		type:"post",
        		data:{
        			email:email
        		},
        		success:function(authKey){
        			
        		},
        		error:function(){
        			console.log("인증 전송 실패 !!");
        		}
        	});
        	
        }
   </script>  
</body>
</html>