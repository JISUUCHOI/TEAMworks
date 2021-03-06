<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body{height:100%; min-height:1200px; position:relative;}
	
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
    	background-color:white;
        color:rgb(7, 53, 90);
        font-weight:bold;
    }

</style>
</head>
<body>
 	<!-- 사이드바 -->
    <div class="sidebarOuter">
        <div id="sidebar">
            
            <div class="category"></div>
            <div class="subCate" id="wm"><a href="sendForm.ma">편지쓰기</a></div>
            <div class="subCate" id="rm"><a href="rlist.ma?currentPage=1">받은 편지함</a></div>
            <div class="subCate" id="sm"><a href="slist.ma?currentPage=1">보낸 편지함</a></div>
            <div class="subCate" id="tm"><a href="trash.ma?currentPage=1">휴지통</a></div>
        </div>
    </div>
    
    <script>
    	
    	$(function(){
    		$.ajax({
    			url:"countMail",
    			data:{empId:'${loginUser.empId}'},
    			type:"post",
    			success:function(count){
    				if(count>0){
    					var count = "&nbsp;<span id='mailCount' class='badge'>"+count+"</span>";
    					$("#rm").append(count);
    				}
    			},
    			error:function(){
    				console.log("count failed")
    			}
    			
    		});
    	});
    </script>
</body>
</html>