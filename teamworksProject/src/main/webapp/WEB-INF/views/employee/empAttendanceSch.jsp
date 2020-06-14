<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 나눔 고딕 폰트 -->
      <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800" rel="stylesheet">
      <!-- 아이콘 -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
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
    /*  */
    .attendanceOuter{width: 1100px;height: 100%;margin:auto;
                     margin-left:300px;margin-top: 40px;
                     display: inline-block;
                    
                    }  
    .title{font-size: 24px;font-weight: bold; border-bottom:2px solid rgb(224, 224, 224) ;}
    .at-board{width:1000px;margin: auto; float: left;margin-top:40px;}
    .at-search>span{font-size: 24px;font-weight: bold;} 
    tr *{text-align:center;}
    thead>tr>th{background-color: rgb(260, 260, 260);}
    .form-control{width: 150px;}
    .select{float: left;}
    .custom-select{height: 30px;}
    #searchForm{margin-left: 80px;margin-top: 20px;}
    .selectdate>button{float: left;margin-left: 5px;}
    
    		.clearfix{*zoom:1}
            .clearfix:after{content:"";display:block;clear:both;overflow:hidden}

            /* Search */
            
        
            .searchDate{overflow:hidden;margin-bottom:10px;*zoom:1}
            .searchDate:after{display:block;clear:both;content:''}
            .searchDate li{position:relative;float:left;margin:0 7px 0 0; list-style:none;}
            .searchDate li .chkbox2{display:block;text-align:center}
            .searchDate li .chkbox2 input{position:absolute;z-index:-1}
            .searchDate li .chkbox2 label{display:block;width:72px;
            height:36px;font-size:14px;border-radius: 5px ;font-weight:bold;margin-top:10px;
            color:#fff;text-align:center;line-height:35px;text-decoration:none;cursor:pointer;background:#a5b0b6}
            .searchDate li .chkbox2.on label{background:#ec6a6a}
        
            .demi{display:inline-block;margin:0 1px;vertical-align:middle}
            .inpType{padding-left:6px;height:24px;line-height:24px;border:1px solid #dbdbdb}
            .btncalendar{display:inline-block;width:22px;height:22px;text-indent:-999em}
    </style>
    
</head>
<body>
   <!-- 이쪽에 메뉴바 포함 할꺼임 -->
  <jsp:include page="../common/menubar.jsp" />
  <jsp:include page="../common/sidebarMg.jsp" />
   <div class="content">
     <!-- 왼쪽 사이드 바-->
   
    
       <!-- 오른쪽 ATTENDANCE-->
       <div class="attendanceOuter">
            <div class="title">
            <span>사원별 근태 현황</span> 
            </div>
            <form id="searchForm" action="empAttSch.em" method="get">
            <input type="hidden" name="currentPage" value="1"> 
                <table class="table-bordered searchBox">
                    <tr>
                        <th width="160"height="40">검색기간</th>
                        <td width="380" class="selectdate">
                           <ul class="searchDate">
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
                                    <label for="dateType1">당일</label>
                                </span>
                            </li>                     
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
                                    <label for="dateType3">1주</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
                                    <label for="dateType5">1개월</label>
                                </span>
                            </li>
                            <li>
                                <span class="chkbox2">
                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
                                    <label for="dateType6">3개월</label>
                                </span>
                            </li>
                            
                        </ul> 
                      	<div class="clearfix" >
										<!-- 시작일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="searchStartDate"
											id="searchStartDate"value="${seac.startDate}"> <a href="#none"
											class="btncalendar dateclick">달력</a>
										</span> <span class="demi">~</span>
										<!-- 종료일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="searchEndDate"
											id="searchEndDate" value="${seac.endDate}"> <a href="#none"
											class="btncalendar dateclick">달력</a>
										</span> 
									
						</div>
						</td>
                    </tr>
                    <tr height="40">
                        <th>부서</th>
                        <td>
                            <div class="select" >
                                <select class="form-control" name="condition">
                                    <option value="deptAll">부서</option>
                                    <option value="ManagementSupport">경영지원팀</option>
                                    <option value="Development">개발팀</option>
                                </select>
                            </div>
                            <script>
							$(function(){
								switch('${condition}'){
								case "deptAll": $("#searchArea option").eq(0).attr("selected",true);break;
								case "ManagementSupport" : $("#searchArea option").eq(1).attr("selected",true);break;
								case "Development":$("#searchArea option").eq(2).attr("selected",true);break;
								
								}			
							});
						
							</script>
                        </td>
                    </tr>
                    	
                    <tr height="40">
                        <th>사원명</th>
                        <td  style="float: left;border:none"> 
                            <input type="text" class="form-control" name="empName" value="${seac.empName }" style="display: inline;margin-top: 2px;"placeholder="이름을 입력해주세요">
                            <input type="hidden" name="empId" value="${loginUser.empId }">
                           
                        </td>
                    </tr>
                   
                </table>
                <br>
                <button type="submit" class="searchBtn btn btn-secondary" style="margin-left: 378px;">검색</button>
                <button type="reset" class="btn btn-secondary"> 검색 초기화</button>
               
                
            </form>
            
            <div class="table-responsive at-board">
                    <table  class="table table-bordered table-hover table-condensed" align="center">
                        <thead>
                            <tr>
                                <th width="80">사번</th>
                                <th width="80">성명</th>
                                <th width="80">직급</th>
                                <th width="80">부서</th>
                                <th width="200">출근시간</th>
                                <th width="200">퇴근시간</th>
                                <th width="80">근로시간</th>
                                <th width="80">구분</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                             <c:choose>
                            <c:when test="${!empty list }">
                            	<c:forEach var="sea" items="${list }">
                            <tr>
                                 <td>${sea.empId}</td>
                                <td>${sea.empName }</td>
                                <td>${sea.jobName }</td>
                                <td>${sea.deptName }</td>
                                <td>${sea.attDate } ${sea.startTime }</td>
                                <td>${sea.attDate } ${sea.endTime }</td>
                                <td>${sea.attTime }</td>
                               	<c:if test="${'0' eq  sea.atType}">
                                <td>정상출근</td>
                                </c:if>
                                <c:if test="${'1' eq sea.atType}" >
                                <td>지각</td>
                                </c:if>
                                 <c:if test="${'2' eq sea.atType}" >
                                <td>조퇴</td>
                                </c:if>
                                <c:if test="${null eq sea.atType }">
                                <td>대기</td>
                                </c:if>
                            </tr> 
                            	</c:forEach>
                            </c:when>
                            <c:otherwise>
                            	<tr>
                            		<td colspan="8">조회된 데이터가 없습니다</td>
                            		
                            	</tr>
                            </c:otherwise>
                            </c:choose>  
                            
                        </tbody>
                    </table>
     		 <ul class="pagination">
            	<c:if test="${ pi.currentPage ne 1 }">
            		<c:choose>
            			<c:when test="${ empty seac }">
            				<li class="previous"><a href="empAttSch.em?currentPage=${ pi.currentPage - 1 }">&lt;</a></li>
            			</c:when>
            			<c:otherwise>
            					<c:url value="empAttSch.em" var="searchUrl">
										<c:param name="condition" value="${ seac.condition }"/>
										<c:param name="empName" value="${ seac.empName }"/>
										<c:param name="searchStartDate" value="${ seac.startDate }"/>
										<c:param name="searchEndDate" value="${ seac.endDate }"/>
										<c:param name="currentPage" value="${ pi.currentPage -1  }"/>
									</c:url>
            				<li class="previous">
            				<a href="${ searchUrl }">&lt;</a>
            				</li>
            			</c:otherwise>
            		</c:choose>
            	
            	</c:if>
            	
            	 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            	 	<c:choose>
            	 		<c:when test="${ p eq pi.currentPage }">
            	 			<li class="disabled"><a href="">${ p }</a></li>
            	 		</c:when>
            	 		<c:otherwise>
            	 			<c:choose>
	            	 			<c:when test="${ empty seac }">
	            					<li class=""><a href="empAttSch.em?currentPage=${ p }">${ p }</a></li>
	            				</c:when>
	            				<c:otherwise>
	            					<c:url value="empAttSch.em" var="searchUrl">
										<c:param name="condition" value="${ seac.condition }"/>
										<c:param name="empName" value="${ seac.empName }"/>
										<c:param name="searchStartDate" value="${ seac.startDate }"/>
										<c:param name="searchEndDate" value="${ seac.endDate }"/>
										<c:param name="currentPage" value="${ p }"/>
									</c:url>
	            					<li class="">
	            						<a href="${searchUrl}">${ p }</a>
	            					</li>
	            				</c:otherwise>
            				</c:choose>
            	 		</c:otherwise>
            	 	</c:choose>
            	 </c:forEach>
            	
            	<c:if test="${ pi.currentPage ne pi.maxPage }">
            		<c:choose>
						<c:when test="${ empty seac }">
							<li class="next"><a href="empAttSch.em?currentPage=${ pi.currentPage + 1 }">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<c:url value="empAttSch.em" var="searchUrl">
										<c:param name="condition" value="${ seac.condition }"/>
										<c:param name="empName" value="${ seac.empName }"/>
										<c:param name="searchStartDate" value="${ seac.startDate }"/>
										<c:param name="searchEndDate" value="${ seac.endDate }"/>
										<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
									</c:url>
							<li class="next">
							<a href="${ searchUrl }">&gt;</a>
							</li>
						</c:otherwise>        		
            		</c:choose>
            	</c:if>
            </ul>
        </div>
	
            
           
	
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

