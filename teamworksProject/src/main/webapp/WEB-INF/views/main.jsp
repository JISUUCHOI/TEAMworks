<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEAMWORKS</title>
 <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <!-- 아이콘 -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha256-siyOpF/pBWUPgIcQi17TLBkjvNgNQArcmwJB8YvkAgg=" crossorigin="anonymous" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha256-tz3ebpf1UY2wJOfYAEYo/iIElWlm+JNP7cOGtloSAWM=" crossorigin="anonymous"></script>
<Style>
@font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }

	body {
	
	    font-family: Handon3gyeopsal300g;
	  
	}

	#mainOuter{
		width:1250px;
		float:left;
	}
	.content{width: 1440px;}
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
                 	 <c:set var="today" value="<%=new java.util.Date()%>" />
					 <fmt:formatDate value="${today}" type="both" pattern="yyyy년MM월dd일(E)" />		
                   </h1>
               </div>
               <div  id="weekDiv">
               	
               </div>
           </div>

          
           <!-- 공지 사항 -->
           <div>
               <span style="font-weight: bold;;">공지사항</span><a href="list.bo?currentPage=1&cat=1" style="float: right;">+more</a>
               <br>
               <table id="noticeList"  class="table table-bordered table-hover" align="center">
                   <thead>
                       <tr>
                          <td width="60px"><b>NO</b></td>
                        <td><b>제목</b></td>
                        <td width="100px"><b>작성자</b></td>
                        <td width="100px"><b>등록일</b></td>
                        <td width="80px"><b>조회</b></td>
                        <td width="80px"><b>추천</b></td>
                        <td width="80px"><b><i class="fas fa-paperclip"></i></b></td>
                         
                       </tr>
                   </thead>
                   <tbody>
                      
                   </tbody>
               </table>

           </div>
           <!-- 휴가 신청 내역 -->
           <div>
               <span style="font-weight: bold;">자유게시판</span><a href="list.bo?currentPage=1&cat=2" style="float: right;">+more</a>
               <br>
               <table id="boardList" class="table table-bordered table-hover" align="center">
                   <thead>
                      <tr>
                        <td width="60px"><b>NO</b></td>
                        <td><b>제목</b></td>
                        <td width="100px"><b>작성자</b></td>
                        <td width="100px"><b>등록일</b></td>
                        <td width="80px"><b>조회</b></td>
                        <td width="80px"><b>추천</b></td>
                        <td width="80px"><b><i class="fas fa-paperclip"></i></b></td>
                   	 </tr>
                   </thead>
                   <tbody>
                      
	                     
                   </tbody>
               </table>
               

           </div>

           
           </div>
       </div>

   </div>
	<script type="text/javascript">
		
		$(function(){
			// 일정표 조회용
			$.ajax({
				url:"mainschedule.sc",
				data:{empId:"${loginUser.empId}"},
				success:function(list){
					console.log(list);
					var value="";
					
					for(var i in list.weeks){
						 value +="<div class='calendarColumn' >"+
				                    "<div class='panel panel-primary'>"+
			                           "<div class='panel-heading' style='text-align:center'>"+
			                          		list.weeks[i].weeks
			                           +"</div>"+
			                           "<div class='panel-body'>" +
			                           		"<div class='calendarDay' >";
												 for(var j in list.mvs ){
						                      	  		if(list.weeks[i].weeks == list.mvs[j].week){
						                      	  			value +="<p style='background:#5bc0de;color:white;text-align: center'>"+ list.mvs[j].schTitle + "</p>";
						                      	  		}
						                         }                         
			                         value +="</div>"+             
			                          "</div>" +
				                    "</div>"+
				            		"</div>";
					}
					console.log(value);
					$("#weekDiv").html(value);
					
				},errorPage:function(){
					console.log("실패실패 스케줄 불러오기 실패")
				}
			});
			// 일반게시판 조회용
			$.ajax({
				url:"mainlist.bo",
				data:{empId:"${loginUser.empId}"},
			
				success:function(list){
					//console.log(list);
					var value= "";
					
					for(var i in list){
						   value +=  "<tr>" +
										   "<td>"+list[i].boardNo+"</td>";
						                     if(list[i].rcount != 0){
						                    	 value += "<td>"+ list[i].boardTitle  + "("+ list[i].rcount  + ")" +"</td>";
						                     }else{
						                   		 value +="<td>"+list[i].boardTitle+"</td>";
						                     }
					            value+=  "<td>"+list[i].empName+"</td>"+
					                     "<td>"+list[i].createDate+"</td>"+
					                     "<td>"+list[i].count+"</td>"+
					                     "<td>"+list[i].like+"</td>";
					                     if(list[i].boardFiles != null ){
					                    	 value += "<td>"+"<i class='fas fa-paperclip' >"+"</i> "+ "</td>";
					                     }else{
					                    	
					                    	value += "<td>"+''+"</td>";
					                     }
					                     
			                         + "</tr>";
			                    
					}
					//console.log(value);
					$("#boardList tbody").html(value);
					$("#boardList tbody tr").click(function(){
		    			
		    			location.href="detail.bo?bno="+ $(this).children().eq(0).html();
		    			
		    			});
					
					
				},errorPage:function(){
					console.log("메인페이지 게시판 조회")
				}
			});
			// 공지게시판 불러오기
			$.ajax({
				url:"mainnotice.bo",
				data:{empId:"${loginUser.empId}"},
			
				success:function(list){
					//console.log(list);
					var value= "";
					
					for(var i in list){
						value += "<tr>" +
	                     "<td>"+list[i].boardNo+"</td>";
	                     if(list[i].rcount != 0){
	                    	 value += "<td>"+ list[i].boardTitle  + "("+ list[i].rcount  + ")" +"</td>";
	                     }else{
	                   		 value +="<td>"+list[i].boardTitle+"</td>";
	                     }
	                     
	            value+=  "<td>"+list[i].empName+"</td>"+
	                     "<td>"+list[i].createDate+"</td>"+
	                     "<td>"+list[i].count+"</td>"+
	                     "<td>"+list[i].like+"</td>";
	                     
	                     
	                     if(list[i].boardFiles != null ){
	                    	 value += "<td>"+"<i class='fas fa-paperclip' >"+"</i> "+ "</td>";
	                     }else{
	                    	
	                    	value += "<td>"+''+"</td>";
	                     }
	                     
                  		 + "</tr>";
					}
					console.log(value);
					$("#noticeList tbody").html(value);
					$("#noticeList tbody tr").click(function(){
            			
            			location.href="detail.bo?bno="+ $(this).children().eq(0).html();
            			
            		});
					
					
				},errorPage:function(){
					console.log("메인페이지 게시판 조회")
				}
			});
			
			
	
		});
		
		$(document).ready(function(){
			$("#sidebarOuter").css("min-height", "850px");
		});
			
	</script>

	
</body>
</html>