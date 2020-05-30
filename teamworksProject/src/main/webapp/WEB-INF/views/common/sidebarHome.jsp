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
        html, body{height:100%; position:relative;}
	
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
	        color:red;
	    }
	</style>

</head>
<body>
 
 <!-- 사이드바 -->
 <div id="sidebarOuter">
    <div id="sidebar" align="center">
        <div id="messenger"><a href=""><img src="${ pageContext.servletContext.contextPath }/resources/icons/messenger.png" alt="" width="20px"> messenger</a></div>
        <div id="logout"><a href="logout.em">logout</a></div>
        
        <div class="row">
            <div class="col" style="width: 200px;">
                <div class="thumbnail">
                    <br>
                    <div class="profile" style="width: 100px; height: 100px; border-radius: 50%; overflow: hidden;">
                        <a href="">
                            <img class="" src="${ pageContext.servletContext.contextPath }/resources/images/sampleImg.jpg" alt="" width="100%">
                        </a>
                    </div>
                    <div class="caption">
                        <h5><b>강보람 대표이사</b></h5>
                        <h6>경영지원팀</h6>
                        <a href="myPage.em" class="btn btn-info">개인정보 수정</a>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="row">
            <div class="col" style="width: 200px;">
                <div class="thumbnail">
                    <br>
                    <span><b>출근시간</b></span> &nbsp;
                    <span style="color:rgb(7, 53, 90)">09:00:00</span><br>
                    <span><b>퇴근시간</b></span> &nbsp;
                    <span style="color:rgb(7, 53, 90)">09:00:00</span>
                    <div class="caption">
                        <button class="btn btn-info" id="startTime">출근</button> &nbsp; &nbsp;
                        <button class="btn btn-info">퇴근</button>
                    </div>
                </div>
            </div>
        </div>
         <script>
        	$(function(){
        		$("#startTime").click(function(){
        			$.ajax({
        				url:"attinsert.em",
        				data:{empId:"${loginUser.empId}"},
        				type:"post",
        				success:function(status){
        					console.log(status)
        					if(status == "success"){
        						
        					}
        					
        				},errorPage:function(){
        					console.log("출근 실패")
        				}
        			})
        		});
        	});
        </script>
        <div align="left">
            <div class="subCate"><a href="myAtt.em">내근태관리</a></div>
            <div class="subCate"><a href="">휴가현황</a></div>
        </div>
        
    </div>
    
 </div>
</body>
</html>
