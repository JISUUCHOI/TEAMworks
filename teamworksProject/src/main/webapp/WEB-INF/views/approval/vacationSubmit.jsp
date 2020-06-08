<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    
    #bodyWrapper{
    	width:1250px;
    	height:100%;
    	float:left;
    }
    
    #draftOuter{
        width:800px;
        height:1300px;
       	margin:auto;
        margin-top:50px;
    }

    /* 버튼 */
    #btns{
        width:140px;
        float:right;
    }
    #approveBtn{
        width:60px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:12px;
        float:right;
    }
    #approveBtn:hover, #refBtn:hover{
        background:deepskyblue;
        cursor:pointer;
    }
    #listBtn{
        width:60px;
        height:28px;
        background:white;
        border:1px solid rgb(7, 53, 90);
        font-size:12px;
        font-weight:600;
        cursor:pointer;
        float:right;
        margin-left:10px;
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
        text-align:center;
        font-size:13px;
    }
    .docContents tr, #fileTb{
        height:35px;
        border-top:1px solid lightgrey;
        border-bottom:1px solid lightgrey;
    }
    .th, #fileTb{
        background:lightsteelblue;
        color:white;
        font-weight:600;
        text-align:center;
        font-size:13px;
    }
    #refSch{
        width:120px;
        height:20px;
        margin-left:10px;
    }
    #refBtn:hover{
    	background:lightsteelblue;
    	cursor:pointer;
    }
    #titleIput{
        width:600px;
        height:20px;
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

    
    #feName{
       width:120px;
       margin-left:10px;
       margin-right: 10px;
    }
    #fePrice{
        width:120px;
        margin-left:10px;
        margin-right: 10px;
    }
    #feDate{
        width: 120px;
        margin-left:10px;
        margin-right: 10px;
    }
    #fePlace{
        width:300px;
        margin-left:20px;
        margin-right: 20px;
    }
    #feAccount{
        width: 120px;
        margin-left:10px;
        margin-right: 10px;
    }
    #feAccountName{
        width: 120px;
        margin-left:10px;
        margin-right: 10px;
    }
    #bank{
        width: 60px;
        text-align:center;
    }
    #feSq{
        width: 60px;
        text-align:center;
    }
    #feRelation{
        width: 60px;
        text-align:center;
    }
    #pfSq{
        width: 100px;
        text-align:center;
    }
    #vcDay{
        width: 70px;
        text-align:center;
    }
    #pfDate{
        width: 120px;
        margin-left:10px;
        margin-right: 10px;
    }
    #paymentOpinion, #paymentOpinion tr, #paymentOpinion td, #paymentOpinion th{
        border:1.2px solid lightgrey;           
        border-collapse: collapse;
        font-size:12px;
        text-align:center;
    }
    #aa{
        background:lightsteelblue;
    }
    
    /* 결재/반려용 모달 */
    #approveOuter{
        width:460px;
        height:150px;
    }
    #chooseApprove, #chooseApprove tr, #chooseApprove th, #chooseApprove td {
        border: 1px solid lightgrey;
        border-collapse: collapse;
        font-size:13px;
    }
    #chooseApprove th{
        background:lightsteelblue;
        color:white;
        text-align:center;
    }
    #chooseApprove td{
        padding:10px 0px 10px 15px;
    }

    /* 버튼 */
    #modalBtns{
        width:120px;
        height:40px;
        float:right;
    }
    #submitBtn{
        width:50px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:13px;
        margin-top:2px;
    }
    #submitBtn:hover{
        background:deepskyblue;
        cursor:pointer;
    }
    #cancelBtn{
        width:50px;
        height:28px;
        background:white;
        border:1px solid rgb(7, 53, 90);
        font-size:12px;
        font-weight:600;
        cursor:pointer;
        margin-left:5px;
    }
    
    
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>
	<div id="bodyWrapper">
	    <div id="draftOuter">
	
	        <h6>⊙ 결재문서</h6>
	        <hr>
	        <br>
	
            <!-- 버튼들 -->
            <div id="btns">
            
            	<button type="button" id="listBtn" onclick="prePage();">목록</button>
            
            	<c:choose>
	            	<c:when test="${ loginUser.empId eq approveEmpid }">
	                	<button type="button" id="approveBtn" data-toggle="modal" data-target="#responseApprove">결재</button>
	                </c:when>
	                <c:otherwise>
	                </c:otherwise>
                </c:choose>
                
            </div>
            <br><br><br>

            <h1 style="text-align:center;">${ d.get(0).getDocSc() }</h1>
            <br><br><br>
	
            <!-- 결재선 -->
            <<div id="appoveLine">
                <table id="approveLineTb">
                    <tr height="20">
                        <td rowspan="2" width="20">결<br>재</td>
                           <td width="80">기안</td>
                           <c:forEach var="d" items="${ d }">
                           	<td width="80">결재</td>
                           </c:forEach>
                    </tr>
                    <tr height="70">
                        <td>최해성</td>
                        <c:forEach var="d" items="${ d }">
                           	<td>
                           		${ d.approverName }<br>${ d.approveReject } 
	                           	<c:choose>
	                           		<c:when test="${ d.approveReject eq '승인' }">
	                           			<br>(${ d.approveDate })
	                           		</c:when>
	                           		<c:otherwise>
	                           		</c:otherwise>
	                           	</c:choose>
                           	</td>
                        </c:forEach>
                    </tr>
                </table>
            </div>
            <br><br><br><br><br><br><br><br>

            <!-- 기안문서 -->
            <table class="docContents">
                <tr width="1000">
                    <td width="200" class="th">문서번호</td>
                   	<td width="200">${ d.get(0).getDocNo() }</td>
                    <td width="200" class="th">기안일자</td>
                    <td width="200">${ d.get(0).getDocDate() }</td>
                </tr>
                <tr>
                    <td class="th">기안자</td>
                    <td>${ d.get(0).getEmpName() }</td>
                    <td class="th">기안부서</td>
                    <td>${ d.get(0).getDocDepartment() }</td>
                </tr>
                <tr>
                    <td class="th">참조자</td>
                    <td>${ d.get(0).getDocReference() }</td>
                    <td class="th">마감일자</td>
                    <td>${ d.get(0).getDocEnd() }</td>
                </tr>
                <tr>
                    <td class="th">제목</td>
                    <td colspan="3">${ d.get(0).getDocTitle() }</td>
                </tr>
            </table>
			
			<br><br>
			
               <table class="docContents">
                <tr width="1000">
                    <td width="200" class="th">휴가구분</td>
                    <td width="200">${ d.get(0).getVcSq() }</td>
                    <td width="200" class="th">전일/반일 구분</td>
                    <td width="200">${ d.get(0).getVcDay() }</td>
                </tr>
                <tr>
                    <td class="th">휴가시작일</td>
                    <td>${ d.get(0).getVcStart() }</td>
                    <td class="th">휴가종료일</td>
                    <td>${ d.get(0).getVcEnd() }</td>
                </tr>
                <tr>
                    <td class="th">휴가사용일수</td>
                    <td>${ d.get(0).getVcCount() }</td>
                    <td class="th">휴가 사유</td>
                    <td>${ d.get(0).getVcContent() }</td>
                </tr>
            </table>
               
            <br><br><br>
            <h6>결재의견</h6>
            <hr>
            <div id="Opinion">
                <c:choose>
	                 <c:when test="${ count eq 0 }">
	                 </c:when>
	                 <c:otherwise>
		                <table id="paymentOpinion">
		                    <tr height="35" id="aa">
	                            <td class="th" width="80">결재</td>
	                            <td class="th" width="120">결재자</td>
	                            <td class="th" width="100">부서</td>
	                            <td class="th" width="160">결재일시</td>
	                            <td class="th" width="340">의견</td>
		                    </tr>
		                    
		                    <!-- 코멘트 개수 세어오기 -->
		                    <c:forEach var="i" begin="0" end="${ count - 1 }">
			                    <tr height="35">
		                            <td>${ d.get(i).getApproveReject() }</td>
		                            <td>${ d.get(i).getApproverName() } ${ d.get(i).getJobName() }</td>
		                            <td>${ d.get(i).getDeptName() }</td>
		                            <td>${ d.get(i).getApproveDate() }</td>
		                            <td>${ d.get(i).getApproveComment() }</td>
		                        </tr>
	                        </c:forEach>
		                </table>
	                </c:otherwise>
                </c:choose>
            </div>
            
	    </div>
	</div>
	
	<!-- 결재/반려용 모달 -->
	<div class="modal fade" id="responseApprove">
        <div class="modal-dialog">
            <div class="modal-content">
	            <!-- Modal Header -->
	            <div class="modal-header">
	                <h6 class="modal-title">결재처리</h6>
	            </div>
	
				<form action="updateApprove.rap" method="post">
	                <!-- Modal Body -->
	                <div class="modal-body">
		                <div id="approveOuter">
					        
				        	<input type="hidden" name="docNo" value="${ d.get(0).getDocNo() }">
				        	<input type="hidden" name="docSc" value="${ d.get(0).getDocSc() }">
				        	<input type="hidden" name="approverEmpid" value="${ loginUser.empId }">
				            <table id="chooseApprove">
				                <tr height="50px">
				                    <th width="100px">결재처리</th>
				                    <td width="360px">
				                        <input type="radio" name="approveReject" value="승인"> 승인
				                        <input type="radio" name="approveReject" value="반려" style="margin-left:20px;"> 반려
				                    </td>
				                </tr>
				                <tr height="80px">
				                    <th>결재의견</th>
				                    <td>
				                        <textarea name="approveComment" cols="55" rows="3" style="resize:none" required></textarea>
				                    </td>
				                </tr>
				            </table>
				            <br>
					        
					    </div>
	                </div>
	                
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                	<div id="modalBtns">
			                <button type="submit" id="submitBtn">결재</button>
			                <button type="reset" id="cancelBtn">취소</button>
			            </div>
	                </div>
                </form>
                
            </div>
        </div>
    </div>
	
	<script>
		$(function(){
			var approveStatus = "${ status }";
			
			switch(approveStatus){
				case '0': $("#readyForApprove>a").css("color", "deepskyblue"); break;
				case '1': $("#pendingApprove>a").css("color", "deepskyblue"); break;
				case '2': $("#doneApprove>a").css("color", "deepskyblue"); break;
				case '3': $("#refuseApprove>a").css("color", "deepskyblue"); break;
				case '4': $("#requestCallback>a").css("color", "deepskyblue"); break;
				case '5': $("#callbackDoc>a").css("color", "deepskyblue"); break;
			}
			
			/* 결재 모달 취소버튼 클릭 시  */
			$("#cancelBtn").click(function(){
				$('#responseApprove').modal("hide");
			});
			
		});
		
		/* 목록버튼 클릭시  */
		function prePage(){
			history.back();
		} 
	</script>
	
</body>
</html>