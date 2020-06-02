<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
      <!-- 나눔 고딕 폰트 -->
      <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800" rel="stylesheet">
      <!-- 아이콘 -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
    /*  */
    .attendanceOuter{width: 1100px;height: 100%;margin:auto;
                     margin-left: 80px;margin-top: 80px;
                     display: inline-block;
                    
                    }  
    .myat-board{width:1000px;margin: auto; float: left;margin-top:40px;}
    .at-search>span{font-size: 24px;font-weight: bold;} 
    tr *{text-align:center;}
    thead>tr>th{background-color: rgb(260, 260, 260);}
    </style>
</style>

</head>
<body>

<!-- 이쪽에 메뉴바 포함 할꺼임 -->
   <jsp:include page="../common/menubar.jsp"/>

   <div class="content">
     <!-- 왼쪽 사이드 바-->
    <jsp:include page="../employee/sidebarMyAttendance.jsp" />
       <!-- 오른쪽 ATTENDANCE-->
       <div class="attendanceOuter">
            <div class="at-search">
                <span >조회기간</span> <button tyep="button" class="btn btn-info">1개월</button>
                <input type="text" id="startDate">~<input type="text" id="endDate"> <button type="button" id="click-btn" class="btn btn-info">검색</button>
            </div>
            <div class="table-responsive myat-board">
                    <table  class="table table-bordered table-hover" align="center">
                        <thead>
                            <tr>
                                <th width="200">일자</th>
                                <th width="100">요일</th>
                                <th width="180">출근시간</th>
                                <th width="180">퇴근시간</th>
                                <th width="180">근무시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2020-03-25</td>
                                <td>수</td>
                                <td>08:22</td>
                                <td>18:00</td>
                                <td>08:13</td>
                            </tr>
                            <tr>
                                <td>2020-03-25</td>
                                <td>수</td>
                                <td>08:22</td>
                                <td>18:00</td>
                                <td>08:13</td>
                            </tr> 
                            <tr>
                                <td>2020-03-25</td>
                                <td>수</td>
                                <td>08:22</td>
                                <td>18:00</td>
                                <td>08:13</td>
                            </tr> 
                            <tr>
                                <td>2020-03-25</td>
                                <td>수</td>
                                <td>08:22</td>
                                <td>18:00</td>
                                <td>08:13</td>
                            </tr>
                        </tbody>
                    </table>                
            </div>
       </div>
   </div>
<script>
	
	$(document).ready(function () {
	        $.datepicker.setDefaults($.datepicker.regional['ko']); 
	        $('#datepicker').datepicker({
	            format: 'mm/dd/yyyy',
	            startDate: '-1d'
	        });
	        $( "#startDate" ).datepicker({
	             changeMonth: true, 
	             changeYear: true,
	             nextText: '다음 달',
	             prevText: '이전 달', 
	             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             dateFormat: "yymmdd",
	             maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	             onClose: function( selectedDate ) {    
	                  //시작일(startDate) datepicker가 닫힐때
	                  //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                 $("#endDate").datepicker( "option", "minDate", selectedDate );
	             }    
	
	        });
	        $( "#endDate" ).datepicker({
	             changeMonth: true, 
	             changeYear: true,
	             nextText: '다음 달',
	             prevText: '이전 달', 
	             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	             dateFormat: "yymmdd",
	             maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	             onClose: function( selectedDate ) {    
	                 // 종료일(endDate) datepicker가 닫힐때
	                 // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
	                 $("#startDate").datepicker( "option", "maxDate", selectedDate );
	             }    
	
	        });    
	});
	
	$('#click-btn').on('click', function(){
		var date = $('#dateRangePicker').val();
		alert(date);
	});
				
</script>


</body>
</html>