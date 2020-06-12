<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결재요청함</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<style>
	/* 전체 윤곽 */
	html, body{height:100%;}
	#docListWrapper{
		width:1250px;
		height:100%;
		float:left;
	}
	
	#docListOuter{
	    width:1000px;
	    height:670px;
	    margin:auto;
	    margin-top:50px;
	}
	/* 본문 */
	#docListArea{
	    width:1000px;
	}
	table th{text-align:center;}
	
	/* 검색 */
	#search, #search tr, #search th, #search td, .searchBox, .searchBox tr, .searchBox th, .searchBox td{
	    border:1px solid lightgrey;
	    border-collapse:collapse;
	    font-size:13px;
	}
	#search th, #docList th, .searchBox th{background:lightsteelblue; color:white;}
	#searchStartDate, #searchEndDate{margin:10px 0px 10px 15px;}
	
	#schCondition, #docCondition{
	    margin-left:15px;
	    width:80px;
	    height:30px;
	    float:left;
	    font-size:13px;
	}
	#keywordInp{
	    margin-left:10px;
	    width:200px;
	    height:25px;
	}
	#schButton{
	    width:40px;
	    height:28px;
	    background: rgb(7, 53, 90);
	    color:white;
	    border:none;
	    font-size:13px;
	    display:block;
	    margin:auto;
	}
	#schButton:hover{
	    background:lightsteelblue;
	    cursor:pointer;
	}
	
	/* 문서 리스트 */
	.docList tr{
	    height:40px;
	}
	.docList, .docList>tbody>tr{
	    border-top: 1px solid lightgrey;
	    border-bottom: 1px solid lightgrey;
	    border-collapse: collapse;
	    font-size:13px;
	}
	.docList>thead>tr{
	    border-top-style:groove;
	    border-bottom-style:groove;
	}
	.docList>tbody>tr:hover{
	    background:lightsteelblue;
	    color:white;
	    cursor:pointer;
	}
	
	/* 페이징바 */
	a, a:hover{
	    text-decoration:none;
	    color:black;
	    cursor:pointer;
	}
	
	/* 페이징바 */
	#pagingArea>a{
	    font-size:13px;
	}
	.page{
	    display:inline-block;
	    border:1px solid rgb(7, 53, 90);
	    color:rgb(7, 53, 90);
	    background:white;
	    width:20px;
	    height:20px;
	    text-align:center;
	}
	.able:hover{
		color:deepskyblue;
	    border-color:deepskyblue;
	    cursor:pointer;
	}
	
	/* Datepicker */
	input[type=text],input[type=password]{font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
    *{margin:0;padding:0;font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
    body{font-size:12px;color:#555;background:transparent;-webkit-user-select:none;-moz-user-select:none;-webkit-text-size-adjust:none;-moz-text-size-adjust:none;-ms-text-size-adjust:none}
    ol,ul{list-style:none} 
    table{table-layout:fixed;width:100%;border-collapse:collapse;border-spacing:0}
    caption{overflow:hidden;width:0;height:0;font-size:0;line-height:0;text-indent:-999em}
    img,fieldset{border:0}
    legend{height:0;visibility:hidden}
    em,address{font-style:normal}
    img{border:0 none;vertical-align:middle}
    a{color:#555;text-decoration:none}
    input,select{margin:0;padding:0;vertical-align:middle}
    button{margin:0;padding:0;font-family:inherit;border:0 none;background:transparent;cursor:pointer}
    button::-moz-focus-inner{border:0;padding:0}
    header,footer,aside,nav,section,article{display:block}

	.clearfix{*zoom:1}
	.clearfix:after{content:"";display:block;clear:both;overflow:hidden}
	
	/* Search */
	.searchDate{overflow:hidden;margin:10px 0px 0px 20px;*zoom:1}
	.searchDate:after{display:block;clear:both;content:''}
	.searchDate li{position:relative;float:left;margin:0 7px 0 0}
	.searchDate li .chkbox2{display:block;text-align:center}
	.searchDate li .chkbox2 input{position:absolute;z-index:-1}
	.searchDate li .chkbox2 label{display:block;width:60px;height:30px;font-size:12px;color:#fff;text-align:center;line-height:30px;text-decoration:none;cursor:pointer;background:rgb(7, 53, 90)}
	.searchDate li .chkbox2.on label{background:deepskyblue;}
	
	.demi{display:inline-block;margin:0 1px;vertical-align:middle}
	.inpType{padding-left:6px;height:24px;line-height:24px;border:1px solid #dbdbdb}
	.btncalendar{display:inline-block;width:22px;height:22px;text-indent:-999em}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>

	<div id="docListWrapper">
    
    <div id="docListOuter">

        <!-- 본문 -->
        <div id="docListArea">
            <h3>⊙ 결재요청함</h3><br>
            <hr>
            <br>
	            
            <!-- 검색 -->
            <form action="myDocSearch.rap" method="post">
            	<input type="hidden" name="empId" value="${ loginUser.empId }">
            	<input type="hidden" name="currentPage" value="1">
                <table id="search"  class="searchBox">
                    <tr>
	                    <th width="150">조회기간</th>
	                    <td width="850">
	                        <ul class="searchDate" class="searchBox">
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
	                            <li>
	                                <span class="chkbox2">
	                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
	                                    <label for="dateType7">6개월</label>
	                                </span>
	                            </li>
	                        </ul>
	                        
	                        <div class="clearfix">
	                            <!-- 시작일 -->
	                            <span class="dset">
	                                <input type="text" class="datepicker inpType" name="startDate" id="searchStartDate" value="${ asc.startDate }">
	                                <a href="#none" class="btncalendar dateclick">달력</a>
	                            </span>
	                            <span class="demi">~</span>
	                            <!-- 종료일 -->
	                            <span class="dset">
	                                <input type="text" class="datepicker inpType" name="endDate" id="searchEndDate" value="${ asc.endDate }">
	                                <a href="#none" class="btncalendar dateclick">달력</a>
	                            </span>
	                        </div>    
	                    </td>
	                </tr>
                    <tr height="50">
                        <th>결재상태</th>
                        <td>
                            <select name="docStatus" id="docCondition">
                                <option value="stand">대기</option>
                                <option value="pending">진행</option>
                                <option value="complete">완료</option>
                                <option value="refuse">반려</option>
                            </select>
                        </td>
                    </tr>
                    <tr height="50">
                        <th>문서검색</th>
                        <td>
                            <select name="condition" id="schCondition">
                                <option value="writer">기안자</option>
                                <option value="title">제목</option>
                                <option value="form">양식</option>
                            </select>
                            <input id="keywordInp" class="btn form-control form-control" type="text" name="keyword" value=${ asc.keyword }>
                        </td>
                    </tr>
                </table>
                <br>
                <button type="submit" id="schButton">검색</button>
            </form>
           
           <script>
            	$(function(){
            		switch('${asc.condition}'){
            		case "writer" : $("#schCondition option").eq(0).attr("selected", true); break;
            		case "title" : $("#schCondition option").eq(1).attr("selected", true); break;
            		case "form" : $("#schCondition option").eq(2).attr("selected", true); break;
            		}
            	});
            	
            	$(function(){
            		switch('${asc.docStatus}'){
            		case "stand" : $("#docCondition option").eq(0).attr("selected", true); break;
            		case "pending" : $("#docCondition option").eq(1).attr("selected", true); break;
            		case "complete" : $("#docCondition option").eq(2).attr("selected", true); break;
            		case "refuse" : $("#docCondition option").eq(3).attr("selected", true); break;
            		}
            	});
            </script>
           
            <br><br>

            <!-- 문서 리스트 -->
            <table class="docList">
                <thead>
                    <tr>
                        <th width="150">문서번호</th>
	                        <th width="100">문서분류</th>
	                        <th width="450">문서제목</th>
	                        <th width="70">기안자</th>
	                        <th width="80">기안부서</th>
	                        <th width="90">기안일</th>
	                        <th width="60">상태</th>
                    </tr>
                </thead>
               
                <tbody>
                	<c:forEach var="l" items="${ list }">
	                    <tr>
	                        <td style="text-align:center;">${ l.docNo }</td>
	                        <td style="text-align:center;">${ l.docSc }</td>
	                        <td style="padding-left:30px;">${ l.docTitle }</td>
	                        <td style="text-align:center;">${ l.empName }</td>
	                        <td style="text-align:center;">${ l.docDepartment}</td>
	                        <td style="text-align:center;">${ l.docDate }</td>
	                        <c:choose>
	                        	<c:when test="${ l.docStatus eq '0' }">
	                       			 <td style="text-align:center;">대기</td>
	                       		</c:when>
	                       		<c:when test="${ l.docStatus eq '1' }">
	                       			 <td style="text-align:center;">진행</td>
	                       		</c:when>
	                       		<c:when test="${ l.docStatus eq '2' }">
	                       			 <td style="text-align:center;">완료</td>
	                       		</c:when>
	                       		<c:when test="${ l.docStatus eq '3' }">
	                       			 <td style="text-align:center;">반려</td>
	                       		</c:when>
	                       		<c:otherwise>
		            				 <td style="text-align:center;">회수</td>
	        					</c:otherwise>
	                       	</c:choose>		 
	                    </tr>
                   </c:forEach>
                </tbody>
            </table>
            
            <script>
        	$(function(){
        		$(".docList tbody tr").click(function(){
        			location.href="docDetail.ap?docNo="+$(this).children().eq(0).text()+"&docSc="+$(this).children().eq(1).text();
        		});
        	});
  			</script>
            
            <br>
            
           <!-- 페이징바 -->
	            <div id="pagingArea" align="center">
	                
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
						</c:when>
						<c:when test="${ listCount eq 0 }">
						</c:when>
						<c:when test="${ !empty asc }">
							<c:url value="myDocSearch.rap" var='searchUrl'>
								<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
								<c:param name="empId" value="${ loginUser.empId }" />
								<c:param name="condition" value="${ asc.condition }" />
								<c:param name="keyword" value="${ asc.keyword }" />
								<c:param name="startDate" value="${ asc.startDate }" />
								<c:param name="endDate" value="${ asc.endDate }" />
							</c:url>
							<button class="page able" onclick="location.href='${ searchUrl }'">&lt;</button>
						</c:when>
						<c:otherwise>
							<button class="page able" onclick="location.href='myDocList.rap?currentPage=${ pi.currentPage - 1 }'">&lt;</button>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
							<c:when test="${ p eq pi.currentPage }">
								<button disabled class="page disable">${ p }</button>
							</c:when>
							<c:otherwise>
								 <c:choose>
									<c:when test="${ empty asc }">
										<button class="page able" onclick="location.href='myDocList.rap?currentPage=${ p }'">${ p }</button>
									</c:when>
									<c:otherwise>
										<c:url value="myDocSearch.rap" var='searchUrl'>
											<c:param name="currentPage" value="${ p }" />
											<c:param name="empId" value="${ loginUser.empId }" />
											<c:param name="condition" value="${ asc.condition }" />
											<c:param name="keyword" value="${ asc.keyword }" />
											<c:param name="startDate" value="${ asc.startDate }" />
											<c:param name="endDate" value="${ asc.endDate }" />
										</c:url>
										<button class="page able" onclick="location.href='${ searchUrl }'">${ p }</button>
									</c:otherwise> 
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
						</c:when>
						<c:when test="${ listCount eq 0 }">
						</c:when>
						<c:when test="${ !empty asc }">
							<c:url value="myDocSearch.rap" var='searchUrl'>
								<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
								<c:param name="empId" value="${ loginUser.empId }" />
								<c:param name="condition" value="${ asc.condition }" />
								<c:param name="keyword" value="${ asc.keyword }" />
								<c:param name="startDate" value="${ asc.startDate }" />
								<c:param name="endDate" value="${ asc.endDate }" />
							</c:url>
							<button class="page able" onclick="location.href='${ searchUrl }'">&gt;</button>
						</c:when>
						<c:otherwise>
							<button class="page able" onclick="location.href='myDocList.rap?currentPage=${ pi.currentPage + 1 }'">&gt;</button>
						</c:otherwise>
					</c:choose>
	            </div>
	        </div>
	
	    </div>
    </div>
    
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- datepicker 한국어로 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    
    <script>
	    // Datepicker
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

	    $(function(){
		    $(".disable").css("color", "deepskyblue");
			$(".disable").css("border", "1.3px solid deepskyblue");
			$(".disable").css("text-align", "center");
	    });
	    
   </script>
 
</body>
</html>
