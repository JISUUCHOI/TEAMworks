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
    body {font-family: Handon3gyeopsal300g;}
	     .outer{
				width:1250px;
				float:left;
				margin-left:200px;
			
			 }
        .wrap{
            width: 600px; 
            /* font-family: 'Nanum Gothic'; */
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
            <form action="updatePwd.em" method="post">
            	<input type="hidden" name="empId" value="${loginUser.empId}">
                <table id="memberInfo">
                    <tr>
                        <th>현재 비밀번호</th>
                        <td> <input type="password" class="form-control" id="oldPwd" autocomplete="current-password"  required> </td>
                        <td> <button type="button" class="btn btn-info" onclick="confirmPwd();">확인</button></td>
                    </tr>
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
                    <tr>
                    	<th colspan="3">비밀번호 변경 시 재로그인 하십시오.</th>
                    </tr>
                </table>
                <button type="submit"  onclick="return validate();" class="btn btn-primary" id="pwdBtn" style="margin-right: 30px;" disabled>변경</button>
                <button type="reset" class="btn">취소</button>

            </form>
        </div>
    </div>
    <script>
    	function confirmPwd(){
    		var empPwd = $("#oldPwd").val();
    		
    		$.ajax({
    			url:"confirmPwd.em",
    			data:{empPwd:empPwd, empId:'${loginUser.empId}'},
    			type:"post",
    			success:function(result){
    				if(result=="success"){
    					alert("비밀번호가 일치합니다. 새로운 비밀번호를 입력해주세요.");
    					$("#pwdBtn").removeAttr("disabled");
    					$("#oldPwd").attr("readonly", true);
    				}else{
    					alert("비밀번호가 일치 하지 않습니다."); 
    					$("#oldPwd").val("");
    					$("#oldPwd").focus();
    				}
    			},
    			error:function(){
    				console.log("비밀번호 확인 ajax 통신 실패 !");
    			}
    		});
    		
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