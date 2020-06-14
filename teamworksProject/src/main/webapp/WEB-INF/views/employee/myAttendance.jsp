<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	
<style>
@font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }

	body {
	
	    font-family: Handon3gyeopsal300g;
	  
	}
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
    
         

                /* Search */
            .searchBox{border:none ;display: table;width: 800px;}
            .clearfix{float: left;}
            
            .searchBox tbody th{padding:20px 10px 20px 35px;font-size:14px;font-weight:bold;text-align:left;vertical-align:top;}
            .searchBox tbody td{padding:12px 10px 12px 25px;border:none;}
        
            .searchDate{overflow:hidden;*zoom:1;width: 120px;display: inline;float: left;}
            .searchDate  li{list-style:none;}
            .searchDate:after{display:block;clear:both;content:''}
            .searchDate li{position:relative;float:left;margin:0 7px 0 0}
            .searchDate li .chkbox2{display:block;text-align:center}
            .searchDate li .chkbox2 input{position:absolute;z-index:-1 ;background:red;}
            .searchDate li .chkbox2 label{display:block;width:72px;height:36px;font-size:14px;font-weight:bold;color:#fff;text-align:center;
            border-radius: 5px ;
            line-height:25px;text-decoration:none;cursor:pointer;background:#a5b0b6}
            .searchDate li .chkbox2.on label{background: rgb(7, 53, 90);}
        
            .demi{display:inline-block;margin:0 1px;vertical-align:middle}
            .inpType{padding-left:6px;height:24px;line-height:24px;height: 35px;width: 180px;}
            .btncalendar{display:inline-block;width:22px;height:22px;text-indent:-999em}
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
			<form action="schmyatt.em" id="schForm">

				<!-- search -->
				<table class="searchBox">
					<caption></caption>
					
					<tbody>
						<tr>
							<th>조회기간</th>
							<td>
									<ul class="searchDate">
										<li>
											<span class="chkbox2"> <input type="radio" class="btn btn-info"
													name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
													<label for="dateType5" class="btn btn-info">1개월</label>
											</span>
										</li>
									</ul>
									<div class="clearfix" >
										<!-- 시작일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="searchStartDate"
											id="searchStartDate"> <a href="#none"
											class="btncalendar dateclick">달력</a>
										</span> <span class="demi">~</span>
										<!-- 종료일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="searchEndDate"
											id="searchEndDate"> <a href="#none"
											class="btncalendar dateclick">달력</a>
										</span> 
										<span>
											  <input type="hidden" name="empId" value="${loginUser.empId}">
											<button type="submit" class="btn btn-info" id="submit">조회하기</button>
										</span>
									</div>
							</td>
						</tr>


						<tbody>
        
				</table>
 			</form>
		<div class="table-responsive myat-board">
							<table class="table table-bordered table-hover" align="center">
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
                            <c:choose>
                            <c:when test="${!empty list }">
                            	<c:forEach var="att" items="${list }">
                            <tr>
                                <td>${att.attDate }</td>
                                <td>
                                	<fmt:formatDate value="${att.attDate}" pattern="E"/> 
                                </td>
                                <td>${att.startTime }</td>
                                <td>${att.endTime }</td>
                                <td>${att.attTime }            </td>
                            </tr> 
                            	</c:forEach>
                            </c:when>
                            <c:otherwise>
                            	<tr>
                            		<td colspan="5">조회된 데이터가 없습니다</td>
                            		
                            	</tr>
                            </c:otherwise>
                            </c:choose>
                            
                        </tbody>
                    </table>                
            </div>
       
			</div>
   </div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

$(document).ready(function() {

    //datepicker 한국어로 사용하기 위한 언어설정
    $.datepicker.setDefaults($.datepicker.regional['ko']);     

    // Datepicker            
    $(".datepicker").datepicker({
        showButtonPanel: true,
        dateFormat: "yy-mm-dd",
        onClose : function ( selectedDate ) {
        
            var eleId = $(this).attr("id");
            var optionName = "";

            if(eleId.indexOf("StartDate") > 0) {
                eleId = eleId.replace("StartDate", "EndDate");
                optionName = "minDate";
            } else {
                eleId = eleId.replace("EndDate", "StartDate");
                optionName = "maxDate";
            }

            $("#"+eleId).datepicker( "option", optionName, selectedDate );        
            $(".searchDate").find(".chkbox2").removeClass("on"); 
        }
    }); 

    //시작일.
    /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
        // 시작일 datepicker가 닫힐때
        // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
        $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
        $(".searchDate").find(".chkbox2").removeClass("on");
    });
    */

    //종료일.
    /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
        // 종료일 datepicker가 닫힐때
        // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
        $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
        $(".searchDate").find(".chkbox2").removeClass("on");
    });
    */

    $(".dateclick").dateclick();    // DateClick
    $(".searchDate").schDate();        // searchDate
    
});

// Search Date
jQuery.fn.schDate = function(){
    var $obj = $(this);
    var $chk = $obj.find("input[type=radio]");
    $chk.click(function(){                
        $('input:not(:checked)').parent(".chkbox2").removeClass("on");
        $('input:checked').parent(".chkbox2").addClass("on");                    
    });
};

// DateClick
jQuery.fn.dateclick = function(){
    var $obj = $(this);
    $obj.click(function(){
        $(this).parent().find("input").focus();
    });
}    


function setSearchDate(start){

    var num = start.substring(0,1);
    var str = start.substring(1,2);

    var today = new Date();

    //var year = today.getFullYear();
    //var month = today.getMonth() + 1;
    //var day = today.getDate();
    
    var endDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#searchEndDate').val(endDate);
    
    if(str == 'd'){
        today.setDate(today.getDate() - num);
    }else if (str == 'w'){
        today.setDate(today.getDate() - (num*7));
    }else if (str == 'm'){
        today.setMonth(today.getMonth() - num);
        today.setDate(today.getDate() + 1);
    }

    var startDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#searchStartDate').val(startDate);
            
    // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
    $("#searchEndDate").datepicker( "option", "minDate", startDate );
    
    // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
    $("#searchStartDate").datepicker( "option", "maxDate", endDate );

}
</script>


</body>
</html>