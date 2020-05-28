<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEAMWORKS</title>
<Style>
	#mainOuter{
		width:1250px;
		float:left;
	}
	.content{width: 1440px;height: 1500px;}
        .content_1{
            border: 4px solid rgb(7, 53, 90);
            float: left;
            height: 630px;
            width: 250px;
            margin-left: 20px;
            margin-top: 40px;
            
            text-align: center;
            }
        .content_2{float: left;height: 100%;width: 1000px;
            margin-left: 80px;margin-top: 40px;}
        .content_1 >.my-info{text-align: center;margin-left: 20px;margin-top: 30px;}
        .my-info{border:1px solid rgb(51, 51, 51); height: 250px; width: 200px;}
        .attendance{border:1px solid rgb(51, 51, 51);height: 200px;
                     width: 200px;margin-left: 20px;margin-top: 30px;}
        .attendance-time{margin-top: 30px;}
        .attendance-time ul{list-style: none;padding-left: 0px;font-size: 18px;font-weight: bold;}
        .btn-check button{border: none; background: white;color: rgb(127, 127, 127);
                        border-radius: 3px;border: 2px solid rgb(127, 127, 127);
                        margin: 10px;}
        .my-info>.photo-info{vertical-align: middle;margin: auto;margin-top: 15px;}
        .photo-info{border:1px solid red; height: 100px;width: 100px;text-align: center;}
        .myinfo{border: none;background: white;border: 2px solid rgb(127, 127, 127);
                border-radius: 3px;width: 150px;height: 40px;}
       .table *{text-align:center;}
       #weekDiv{display: table; float: left;}
       .calendarColumn{display: table-cell;}
       .panel{width: 150px;height: 200px; margin-left:5px;}
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
</Style>
</head>
<body>

	<jsp:include page="common/menubar.jsp"/>
	
	<!-- 메인용 사이드바로 고쳐야함!!  -->

	
	
	<div id="mainOuter">
		 <div class="content">
     <!-- 왼쪽 사이드 바-->
    	<jsp:include page="common/sidebarHome.jsp"/>
       <!-- 오른쪽 메인-->
       <!-- 최근 일정 -->
       <div class="content_2">
           <div>
               <div class="col-lg-12">
                   <h1 class="page-header">
                   <a href="#"><i class="fa fa-angle-left fa-fw"></i></a>
                   
                   <c:out value="${month}"/>5월 <c:out value="${week}"/>4째주
                   <a href="#"><i class="fa fa-angle-right fa-fw"></i></a>
                   </h1>
               </div>
               <div  id="weekDiv">
                   <div class="calendarColumn" >
                       <div class="panel panel-primary">
                           <div class="panel-heading" style="text-align:center">
                             	  월 일 
                           </div> 
                           <div class="panel-body"> 
                                       <div class="calendarDay" >
                                                 
                                       </div>                
                           </div> 
                       </div>
                   </div>
               </div>

               <div class="calendarColumn" >
                   <div class="panel panel-default">
                       <div class="panel-heading" style="text-align:center">
                		           월 일 
                       </div> 
                       <div class="panel-body">    
                                   <div class="calendarDay" >                
                                   </div>           
                       </div> 
                   </div>
               </div>

               <div class="calendarColumn" >
                   <div class="panel panel-default">
                       <div class="panel-heading" style="text-align:center">
                    	       월 일 
                       </div> 
                       <div class="panel-body">   
                                   <div class="calendarDay" >       
                                   </div>                   
                       </div> 
                   </div>
               </div><div class="calendarColumn" >
                   <div class="panel panel-default">
                       <div class="panel-heading" style="text-align:center">
                           	월 일 
                       </div> 
                       <div class="panel-body">      
                                   <div class="calendarDay" >
                                   </div>
                       </div> 
                   </div>
               </div>


           </div>

          
           <!-- 공지 사항 -->
           <div>
               <span style="font-weight: bold;;">공지사항</span><a href="#" style="float: right;">+more</a>
               <br>
               <table  class="table table-bordered table-hover" align="center">
                   <thead>
                       <tr>
                           <th width="90">NO.</th>
                           <th width="300">제목</th>
                           <th width="210">등록일자</th>
                           <th width="210">등록자</th>
                         
                       </tr>
                   </thead>
                   <tbody>
                       <tr>
                           <td>4</td>
                           <td>산사람은살아야지</td>
                           <td>2020-05-05</td>
                           <td>라대표</td>
                       </tr>
                       <tr>
                           <td>4</td>
                           <td>산사람은살아야지</td>
                           <td>2020-05-05</td>
                           <td>라대표</td>
                       </tr>
                       <tr>
                           <td>4</td>
                           <td>산사람은살아야지</td>
                           <td>2020-05-05</td>
                           <td>라대표</td>
                       </tr>
                   </tbody>
               </table>

           </div>
           <!-- 휴가 신청 내역 -->
           <div>
               <span style="font-weight: bold;">자유게시판</span><a href="#" style="float: right;">+more</a>
               <br>
               <table  class="table table-bordered table-hover" align="center">
                   <thead>
                       <tr>
                           <th width="90">NO.</th>
                           <th width="300">제목</th>
                           <th width="210">등록일자</th>
                           <th width="210">등록자</th>
                         
                       </tr>
                   </thead>
                   <tbody>
                       <tr>
                           <td>4</td>
                           <td>산사람은살아야지</td>
                           <td>2020-05-05</td>
                           <td>라대표</td>
                       </tr>
                       <tr>
                           <td>4</td>
                           <td>산사람은살아야지</td>
                           <td>2020-05-05</td>
                           <td>라대표</td>
                       </tr>
                       <tr>
                           <td>4</td>
                           <td>산사람은살아야지</td>
                           <td>2020-05-05</td>
                           <td>라대표</td>
                       </tr>
                     
                   </tbody>
               </table>

           </div>

           
           </div>
       </div>

   </div>
	
	</div>
	
</body>
</html>