<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.teamworks.employee.model.vo.Employee"%>
<%
	Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body{
		height:100%; 
		/* position:relative; */
		min-height:100%;
	}
	
	div{box-sizing:border-box;}
	#sidebarOuter{
		width:250px;
		height:auto !important;
		float:left;
		background:rgb(7, 53, 90);
	}
	
	/* 사이드바 */
    #sidebar{
    	/* position:absolute; */
        width:250px;
        height:100%;
        float:left;
       /*  margin-top:100px; */
        padding-top:20px;
        /* background:rgb(7, 53, 90); */
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
    .subCate>a:hover, #logout>a:hover, #messenger>a:hover, .category a:hover{
        color:deepskyblue;
    }
    .subCate>span{
        color:red;
    }
	.category a{text-decoration:none; color:white;}
</style>
</head>
<body>

	<div id="sidebarOuter">
		<!-- 사이드바 -->
        <div id="sidebar">
            
            <div class="category">예약</div>
            <div class="subCate" id="reservationList"><a href="showListView.re">예약 현황</a></div>
            <div class="subCate" id="myReservation"><a href="myResList.re?empId=${loginUser.empId }&currentPage=1">나의 예약 목록</a></div>
        </div>
    </div>

</body>
</html>