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
            <button data-toggle="collapse" data-target="#key"  onclick="authentication();" class="btn btn-success">이메일 인증</button>
            <div id="key" class="collapse" >
               
                    <table id="pwdForm1" width="80%">
                        <tr>
                            <td width="90%">
                                <input type="text" id="key2" class="form-control" placeholder="이메일에 전달된 인증키를 입력하세요.">
                            </td>
                            <td> <button type="button" onclick="confirmKey();" class="btn btn-success">확인</button></td>
                        </tr> 
                    </table>
               
            </div>
       </div>
       <div id="inner3" style="display:none;">
        <br>
        <h3>비밀번호 변경</h3>
            <table id="pwdForm2">
                <tr>
                    <th>변경할 비밀번호</th>
                    <td> <input type="password" id="pwd1" name="empPwd" class="form-control" autocomplete="new-password" required>
                        <div style="font-size:0.8em; color:gray">영문자, 숫자, 특수문자 포함하여 총 8자~15자로 입력하시오.</div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td> <input type="password" id="pwd2" class="form-control"  autocomplete="new-password" required>
                        <div style="font-size:0.8em; color:gray">위의 비밀번호와 일치하는 비밀번호를 입력하세요.</div>
                    </td>
                    <td></td>
                </tr>
                
            </table>
            <button type="button" onclick="validateANchange();" class="btn btn-primary" style="margin-right: 30px;">변경</button>
            <button type="reset" class="btn" onclick="window.close();">취소</button>

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
        		success:function(key){
        			alert("인증 번호를 발송했습니다. 인증키를 입력해주세요.");
        			// console.log(key);
        			authKey=key;
        			
        		},
        		error:function(){
        			console.log("인증 전송 실패 !!");
        		}
        	});
        	
        }
        
        function confirmKey(){
        	if(authKey==$("#key2").val()){
        		alert("인증키가 입치합니다. 비밀번호를 변경해 주세요.");
        		$("#inner1").css("display","none");
        		$("#inner2").css("display","none");
        		$("#inner3").css("display","block");
        	}else{
        		alert("인증키가 일치하지 않습니다. 다시 입력해주세요.");
        	}
        		
        }
        
        function validateANchange(){
        	
        	var result = validate();
        	
        	if(result){
        		$.ajax({
        			url:"changePwd.em",
        			data:{
        				empId:empId,
        				empPwd:$("#pwd1").val()
        			},
        			type:"post",
        			success:function(){
        				
        			},
        			error:function(){
        				console.log("비밀번호 변경 ajax 실패");
        			}
        		});
        	}
        	
        }
        
		function validate(){
    		
    		var pwd1 = document.getElementById("pwd1");
            var pwd2 = document.getElementById("pwd2");
    		
    		var regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
    		
    		if(!regExp.test(pwd1.value)){
                alert("유효한 비밀번호 입력하세요!!");
                pwd1.value = "";
                pwd1.focus();
                return false;
            }

            // 비밀번호값과 비밀번호확인 값이 일치하는지 검사 
            if(pwd1.value != pwd2.value){
                alert("동일한 비밀번호 확인값을 입력하세요!!");
                pwd2.value ="";
                pwd2.focus();
                return false;
            }
            return true;
    	}
   </script>  
</body>
</html>