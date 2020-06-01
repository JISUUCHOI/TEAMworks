<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.SimpleDateFormat"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Date today = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	String now = sf.format(today);
	
	Calendar week = Calendar.getInstance();
	week.add(Calendar.DATE, +7);
	String docEnd = new SimpleDateFormat("yyyy-MM-dd").format(week.getTime());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안서작성</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    /* 전체윤곽 */
    html, body{height:100%;}
    
    #vacationWrapper{
    	width:1250px;
    	height:100%;
    	float:left;
    }
    #draftOuter{
        width:800px;
        height:850px;
       	margin:auto;
       	margin-top:50px;
    }

    /* 버튼 */
	#btns{
	    width:200px;
	    float:right;
	}
	#approveLineBtn, #approveBtn{
	    width:60px;
	    height:28px;
	    background: rgb(7, 53, 90);
	    color:white;
	    border:none;
	    font-size:12px;
	}
	#approveLineBtn:hover, #approveBtn:hover, #refBtn:hover{
	    background:deepskyblue;
	    cursor:pointer;
	}
	#cancelBtn{
	    width:60px;
	    height:28px;
	    background:white;
	    border:1px solid rgb(7, 53, 90);
	    font-size:12px;
	    font-weight:600;
	    cursor:pointer;
	}
	
	/* 결재선 */
	#appoveLine{
	    float:right;
	}
	#approveLineTb, #approveLineTb tr, #approveLineTb td, #approveLineTb th{
	    border:1.2px solid lightgrey;
	    border-collapse: collapse;
	    font-size:12px;
	}
	#approveLineTb{
	    text-align:center;
	}
	
	/* 기안문서 */
	.docContents{margin:auto;}
	.docContents, .docContents tr, .docContents td{
	    border-collapse: collapse;
	    font-size:13px;
	}
	.docContents tr{
	    height:35px;
	    border-top:1px solid lightgrey;
	    border-bottom:1px solid lightgrey;
	}
	.th{
	    background:lightsteelblue;
	    color:white;
	    font-weight:600;
	    text-align:center;
	    font-size:13px;
	}
	#refSch, #apprveEndDate {
	    width:175px;
	    height:26px;
	    margin-left:10px;
	}
	#refBtn:hover{
		background:lightsteelblue;
		cursor:pointer;
	}
	#titleInput, #vcReason{
	    width:580px;
	    height:26px;
	    margin-left:10px;
	}
	#refBtn{
	    width:40px;
	    height:26px;
	    background: rgb(7, 53, 90);
	    border:none;
	    color:white;
	    margin-left:5px;
	    margin-right:10px;
	    font-size:12px;
	}
	.readInput{
		width:75px;
		border:none;
	}
    
    /* 휴가신청서 */
    #requestVacation input, #requestVacation span{
        height:26px;
        float:left;
        margin-left:10px;
    }
    #requestVacation select{
        margin-left:10px;
        height:25px;
        width:80px;
    }
    
    /* 참조 모달용 스타일!!!! */
    /* 전체윤곽 */
    #approveLineOuter{
        width:700px;
        height:500px;
        margin:auto;
    }
    /* 조직도 */
    #orgChart{
        width:50px;
        height:30px;
        float:left;
        border:none;
        background:rgb(7, 53, 90);
        color:white;
        font-family:'Handon3gyeopsal300g';
        cursor:pointer;
        font-size:12px;
        float:left;
    }
    #sch{
        width:50px;
        height:30px;
        border:1px solid rgb(7, 53, 90);
        background:white;
        color:rgb(7, 53, 90);
        font-family:'Handon3gyeopsal300g';
        cursor:pointer;
        font-size:12px;
    }

    #chart-container, #sch-container{
        width:300px;
        height:450px;
        border:1px solid rgb(7, 53, 90);
        font-family: 'Handon3gyeopsal300g';
        float:left;
        font-size:13px;
    }
    .tree1, .tree2, .tree3{cursor:pointer;}
    .tree1{
        margin:10px 0px 5px 15px;
    }
    .tree2{
        margin:10px 0px 5px 45px;
        display:none;
    }
    .tree31, .tree32{
        margin-top:2px;
        margin-left:50px;
        display:none;
    }
    .tree31>span, .tree32>span{
        line-height:180%;
    }
    /* 검색 */
    #schBox{
        width:270px;
        height:55px;
        border:1px solid rgb(7, 53, 90);
        margin:10px 10px 5px 13px;
        padding:10px 0px 0px 15px;
    }
    #schInput{
        width:150px;
        height:28px;
    }
    #schBtn{
        width:40px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:12px;
    }
    #schBtn:hover{
        background:lightsteelblue;
        cursor:pointer;
    }
    #empListArea{
        width:280px;
        height:300px;
        margin-left:10px;
    }

    #empList{
        margin-top:20px;
        margin-left:5px;
        text-align:center;
    }
    #empList, #empList>tbody>tr{
        border-top: 1px solid lightgrey;
        border-bottom: 1px solid lightgrey;
        border-collapse: collapse;
        font-size:12px;
    }
    #empList th{text-align:center;}
    #empList>thead>tr{
        border-top-style:groove;
        border-bottom-style:groove;
    }
    #empList tr{height:28px;}
    #empList>tbody>tr:hover{
        background:lightsteelblue;
        color:white;
    }
    .chk{margin-top:3px;}

    /* 선택/취소 */
    #chooseCancel{
        width:30px;
        height:100px;
        margin:140px 10px 0px 10px;
        float:left;
    }
    .choose{
        border-radius:50%;
        border:1.2px solid rgb(7, 53, 90);
        width:30px;
        height:30px;
        color:rgb(7, 53, 90);
        font-weight:600;
        text-align:center;
        line-height:1.5;
        margin-top:10px;
        cursor:pointer;
    }

    /* 참조자 */
    #refEmpList{
        width:340px;
        height:450px;
        border:1px solid rgb(7, 53, 90);
        font-family: 'Handon3gyeopsal300g';
        float:left;
    }
    #selectedEmp{
        width:310px;
        height:380px;
        border:1px solid rgb(7, 53, 90);
        margin:10px 10px 5px 13px;
        padding:10px 0px 0px 10px;
        font-size:13px;
    }
    .refedEmpName, .refedEmpDept{
    	cursor:pointer
    }
    
    /* 버튼 */
    #approveLineBtns{
        width:110px;
        height:30px;
        float:left;
        margin-top:10px;
        margin-left:530px;
    }
    #lineApplyBtn{
        width:50px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:13px;
        margin-top:2px;
    }
    #lineCancelBtn{
        width:50px;
        height:28px;
        background:white;
        border:1px solid rgb(7, 53, 90);
        font-size:12px;
        font-weight:600;
        cursor:pointer;
        margin-left:5px;
    }
    #lineApplyBtn:hover{
        background:lightsteelblue;
        cursor:pointer;
    }
    
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
    <jsp:include page="approvalSidebar.jsp"/>
    
	<div id="vacationWrapper">
	    <div id="draftOuter">
	
	        <h6>⊙ 기안문 작성</h6>
	        <hr>
	        <br>
	
	        <form id="docForm" action="requestVac.rap" method="post">
	            <!-- 버튼들 -->
	            <div id="btns">
	                <button type="button" id="approveLineBtn">결재선</button>
	                <button type="submit" id="approveBtn">결재요청</button>
	                <button type="button" id="cancelBtn">취소</button>
	            </div>
	            <br><br><br>
	
	            <h2 style="text-align:center;">휴가신청서</h2>
	            <input type="hidden" name="docSc" value="휴가신청서">
	            <br>
	
	            <!-- 결재선 -->
	            <div id="appoveLine">
	                <table id="approveLineTb">
	                    <tr height="20">
	                        <td rowspan="2" width="20">결<br>재</td>
	                        <td width="70">기안</td>
	                    </tr>
	                    <tr height="70">
	                        <td>${ emp.empName }</td>
	                    </tr>
	                </table>
	            </div>
	            <br><br><br><br><br><br><br><br>
	
	            <!-- 기안문서 -->
	            
	            <table class="docContents">
	                <tr>
	                    <td width="150" class="th">문서번호</td>
	                    <td width="250" style="text-align:center;">자동부여</td>
	                    <td width="150" class="th">기안일자</td>
	                    <td width="250" style="text-align:center;"><input type="text" class="readInput" name="docDate" value="<%= now %>" readonly></td>
	                </tr>
	                <tr>
	                    <td class="th">기안자</td>
	                    <td style="text-align:center;">
	                    	<input type="hidden" name="empId" value="${ loginUser.empId }">
	                    	${ emp.empName }
	                    </td>
	                    <td class="th">기안부서</td>
	                    <td style="text-align:center;"><input type="text" class="readInput" name="docDepartment" value="${ emp.deptName }" readonly></td>
	                </tr>
	                <tr>
	                    <td class="th">참조자</td>
	                    <td>
	                    	<input type="hidden" id="refedId" name="docReference">
	                        <input type="text" id="refSch"  readonly>
	                        <button type="button" id="refBtn" data-toggle="modal" data-target="#refEmp">참조</button>
	                    </td>
	                    <td class="th">마감일자</td>
	                    <td style="text-align:center;"><input type="text" class="readInput" name="docEnd" value="<%= docEnd %>" readonly></td>
	                </tr>
	                <tr>
	                    <td class="th">제목</td>
	                    <td colspan="3"><input type="text" id="titleInput" name="docTitle" required></td>
	                </tr>
	            </table>
				
				<br><br>
                
                <!-- 휴가신청서 -->
                <table class="docContents" id="requestVacation">
	                <tr width="800">
	                    <td width="150" class="th">휴가구분</td>
	                    <td width="250">
                            <select name="vcSq" id="vcSq">
                                <option value="연차">연차</option>
                                <option value="경조사">경조사</option>
                                <option value="병가">병가</option>
                                <option value="출산">출산</option>
                            </select>
	                    <td width="150" class="th">전일/반일 구분</td>
                        <td width="250">
                        	<select name="vcDay" id="vcDay">
	                            <option value="전일">전일</option>
	                            <option value="반일">반일</option>
                       		</select>
                       	</td>
	                </tr>
	                <tr>
	                    <td class="th">휴가 신청일</td>
                        <td style="padding-left:15px;"><%= now %></td>
                        <td class="th">일수</td>
                        <td><input type="text" id="vcDays" name="vcCount" onkeypress="numberOnly();" required /></td>
	                </tr>
	                <tr>
	                    <td class="th">휴가기간</td>
                        <td colspan="3"><input type="date" id="vcStartDate" name="vcStart" required><span>~</span><input type="date" id="vcEndDate" name="vcEnd" required></td>
	                </tr>
	                <tr>
	                    <td class="th">휴가사유</td>
	                    <td colspan="3"><input type="text" id="vcReason" name="vcContent" required></td>
	                </tr>
                </table>
	        </form>
	    </div>
	    
	    <!-- 참조 클릭 시 뜨는 모달 -->
	    <div class="modal fade" id="refEmp">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h6 class="modal-title">참조자</h6>
		            </div>
		
	                <!-- Modal Body -->
	                <div class="modal-body">
	                    <div id="approveLineOuter">
					        <button type="button" id="orgChart"">조직도</button>
					        <button type="button" id="sch">검색</button><br>
					        <div id="chart-container">
					            <div class="tree1" id="coName">(주)TEAMWORKS</div>
					           
					            <% int i = 1;%>
					            <c:forEach var="d" items="${ dept }">
					            	<div class="tree2 tree2<%= i %> dName">${ d.deptName }</div>
					            	<div class="tree3 tree3<%= i %>">
						            	<c:forEach var="l" items="${ list }">
						            		<c:choose>
						            			<c:when test="${ d.deptName eq l.deptName }">
						            					<input type="hidden" class="refedId" value="${ l.empId }">
						            					<input type="hidden" value="${ l.deptName }">
						                				<input type="checkbox" name="refChk" class="refChk" style="visibility:hidden">
						                				ㄴ<span class="refEmpName">${ l.empName }</span><span class="refEmpDept"> ${ l.jobName }</span><br>
						            			</c:when>
						            		</c:choose>
						            	</c:forEach>
					            	</div>
					           		<% i++; %>
					            </c:forEach>
					            
					        </div>
					        <div id="sch-container">
					            <div id="schBox">
					                <font>사원명</font>
					                <input name="keyword" type="search" id="schInput">
					                <button type="button" id="schBtn">검색</button>
					            </div>
					
					            <div id="empListArea">
					                <table id="empList">
					                    <thead>
					                        <tr>
					                            <th width="20"></th>
					                            <th width="85">부서</th>
					                            <th width="85">직급</th>
					                            <th width="60">사원명</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                        
					                    </tbody>
					                </table>
					            </div>
					        </div>
					
					        <div id="chooseCancel">
					            <div class="choose" id="chooseRef"> &gt; </div>
					            <div class="choose" id="cancelRef"> &lt; </div>
					        </div>
					
					        <div id="refEmpList">
					            <div style="margin:10px 0px 0px 20px; font-size:13px;">참조자</div>
					            <div id="selectedEmp">
					            	<table id="refEmpArea"></table>
					            </div>
					        </div>
					    </div>
	                </div>
	                
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                	<div id="approveLineBtns">
				            <button type="button" id="lineApplyBtn">적용</button>
				            <button type="button" id="lineCancelBtn">취소</button>
				        </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    
	</div>
	
	<script>
		$(function(){
			$("#approveDoc>a").css("color", "dimgray");
			$("#approveDoc").css("border-bottom-style", "groove");
			$("#writeDoc>a").css("color", "deepskyblue");
		});
		
		function numberOnly(){
			if(event.keyCode<48 || event.keyCode>57){
				event.returnValue=false;
				alert("숫자만 입력해주세요.");
			}
		}
		
		
		/* 참조자 모달용 스크립트 */
		$(function(){
			/* 조직도 참조자 선택 */
			$(".refEmpName").click(function(){
				
				var hiddenChk = $(this).prev();
				
				if(hiddenChk.is(":checked")){
					hiddenChk.prop("checked", false);
					$(this).css("background", "white");
					$(this).next().css("background", "white");
				}else{
					hiddenChk.prop("checked", true);
					$(this).css("background", "lightsteelblue");
					$(this).next().css("background", "lightsteelblue");
				}
				
			});
			
			/* 참조자 검색 시 */
			$("#schBtn").click(function(){
				
				$.ajax({
					url:"empSch.rap",
					data:{keyword:$("#schInput").val()},
					type:"post",
					success:function(schEmp){
						if(schEmp.length > 0) {
							
							var value ="";
							
							for(var i in schEmp){
								value += "<tr>" + 
					                            "<td>" + 
					                            	"<input type='hidden' class='refedId' value='" + schEmp[i].empId + "'>" +
					                            	"<input type='hidden' value='" + schEmp[i].deptName + "'>" +
					                           		"<input type='checkbox' name='refChk' class='chk'>" +
					                           		"<div style='visibility:hidden; height:0px;'>" + schEmp[i].empName + "</div></td>" +
					                            "<td>" + schEmp[i].deptName + "</td>" + 
					                            "<td>" + schEmp[i].jobName + "</td>" +
					                            "<td>" + schEmp[i].empName + "</td>" +
				                         "</tr>"
							}
							
							$("#empList tbody").html(value);
							
						}else {
							alert("올바른 검색어를 입력하세요.");
						}
						
					}, error:function(){
						alert("참조자 검색 실패");
					}
				});
				
			});
			
			/* 참조자 선택(왼쪽 => 오른쪽) */
			$("#chooseRef").click(function(){
				
				var refedEmp = [];
				var refedDept = [];
				var refedId = [];
				
				$("input:checkbox[name=refChk]:checked").each(function(){
					refedEmp.push($(this).next().text());
					refedDept.push($(this).prev().val());
					refedId.push($(this).prevAll(".refedId").val());
				});
				
				var value = "";
				
				for(var i=0; i<refedEmp.length; i++){
					value += "<tr>" +
								"<td>" + 
									"<span class='refedEmpId' style='display:none'>" + refedId[i] + " " + "</span>" +
									"<input type='checkbox' class='checkBox' name='checkBox' style='visibility:hidden'>" +
							 		"<span class='refedEmpName'>" + refedEmp[i] + " " + "</span>" + 
							 		"<span class='refedEmpDept'> | " + refedDept[i] + "</span>" + 
							 	"</td>" +
							 "</tr>";
				}
				
				$("#refEmpArea").html(value);
				
				$("input:checkbox[name=refChk]").prop("checked", false);
				$("input:checkbox[name=refChk]").nextAll().css("background", "white");
				
			});
			
			/* 참조자 오른쪽에서 삭제 */
			$("#cancelRef").click(function(){
				
				$("input:checkbox[name=checkBox]:checked").each(function(){
					$(this).parents('tr').remove();
				});
				
			});
			
			/* 추가된 참조자 선택 */
			$("#selectedEmp").on("click", ".refedEmpName", function(){	
				
				var hiddenChk2 = $(this).prev();
				
				if(hiddenChk2.is(":checked")){
					hiddenChk2.prop("checked", false);
					$(this).css("background", "white");
					$(this).next().css("background", "white");
				}else{
					hiddenChk2.prop("checked", true);
					$(this).css("background", "lightsteelblue");
					$(this).next().css("background", "lightsteelblue");
				}
				
			});
			
			/* 부서 클릭 시 */
			$("#selectedEmp").on("click", ".refedEmpDept", function(){	
				
				var hiddenChk = $(this).prevAll('.checkBox');
				
				if(hiddenChk.is(":checked")){
					hiddenChk.prop("checked", false);
					$(this).css("background", "white");
					$(this).siblings('.refedEmpName').css("background", "white");
				}else{
					hiddenChk.prop("checked", true);
					$(this).css("background", "lightsteelblue");
					$(this).siblings('.refedEmpName').css("background", "lightsteelblue");
				}
				
			});
			
			/* 적용 버튼 */
			$("#lineApplyBtn").click(function(){
				var refedEmp = $('.refedEmpName').text();
				var refedId = $('.refedEmpId').text();
				$("#refSch").val(refedEmp);
				$("#refedId").val(refedId);
				$("#schInput").val("");
				
				$('#empList>tbody>tr').remove();
				$('#refEmpArea tr').remove();
				$('#refEmp').modal("hide");
				
				$("input:checkbox[name=refChk]").prop("checked", false);
				$("input:checkbox[name=checkBox]").prop("checked", false);
				$('.tree3').slideUp();
				$('.tree2').slideUp();
			});

			/* 취소 버튼 */
			$("#lineCancelBtn").click(function(){
				$('#refEmpArea tr').remove();
				$('#empList>tbody>tr').remove();
				$("#schInput").val("");
				
				$("input:checkbox[name=refChk]").prop("checked", false);
				$("input:checkbox[name=checkBox]").prop("checked", false);
				$('.tree3').slideUp();
				$('.tree2').slideUp();
				
				$("#schInput").val("");
				$('#refEmp').modal("hide");
			});
			
		});
		
		 $(function(){
				
		       	/* 조직도 slideDown slideUp */
	            $(".tree1").click(function(){
	                var tree2 = $(this).nextAll(".tree2");
	                var tree31 = $(this).nextAll(".tree31");
	                var tree32 = $(this).nextAll(".tree32");

	                if(tree2.css("display") == "none") {
	                    tree2.slideDown();

	                }else {
	                    tree2.slideUp();
	                }

	                if (tree31.is(':hidden')) {
	                } else {
	                    tree31.slideUp('slow');
	                }

	                if (tree32.is(':hidden')) {
	                } else {
	                    tree32.slideUp('slow');
	                }
	            });
	        	
	            $(".tree21").click(function(){
	                var tree31 = $(this).nextAll(".tree31");

	                if(tree31.css("display") == "none") {
	                    tree31.slideDown();
	                }else{
	                    tree31.slideUp();
	                }
	            });

	            $(".tree22").click(function(){
	                var tree31 = $(this).nextAll(".tree32");

	                if(tree31.css("display") == "none") {
	                    tree31.slideDown();
	                }else{
	                    tree31.slideUp();
	                }
	            });

	            /* 조직도/검색 클릭 시  */
	            $("#chart-container").show();
	            $("#sch-container").hide();

	            $("#orgChart").click(function(){
	                $("#chart-container").show();
	                $("#sch-container").hide();
	                $("#orgChart").css("border", "none");
	                $("#orgChart").css("background", "rgb(7, 53, 90)");
	                $("#orgChart").css("color", "white");
	                $("#sch").css("border", "1px solid rgb(7, 53, 90)");
	                $("#sch").css("background", "white");
	                $("#sch").css("color", "rgb(7, 53, 90)");
	            });

	            $("#sch").click(function(){
	                $("#sch-container").show();
	                $("#chart-container").hide();
	                $("#sch").css("border", "none");
	                $("#sch").css("background", "rgb(7, 53, 90)");
	                $("#sch").css("color", "white");
	                $("#orgChart").css("border", "1px solid rgb(7, 53, 90)");
	                $("#orgChart").css("background", "white");
	                $("#orgChart").css("color", "rgb(7, 53, 90)");
	            });

	        });
		
		
	</script>
	
</body>
</html>