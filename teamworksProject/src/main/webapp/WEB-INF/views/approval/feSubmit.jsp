<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문서</title>
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
        width:200px;
        float:right;
    }
    #modifyBtn, #deleteBtn{
        width:60px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:12px;
    }
    #modifyBtn:hover, #deleteBtn:hover, #refBtn:hover{
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
           	    <!-- 나중에 status값 반려값으로 바꾸기 반려문서아니면 버튼안보이게 -->
           	    <c:choose>
           	    	<c:when test="${ d.docStatus eq 0 }">
           	    		<button type="button" id="modifyBtn" onclick="postFormSubmit(1);">수정</button>
              			<button type="submit" id="deleteBtn" onclick="postFormSubmit(2);">삭제</button>
              		</c:when>	
              	</c:choose>
                <button type="button" id="listBtn" onclick="history.back();">목록</button>
            </div>
            <form action="" id="postForm" method="post">
            	<input type="hidden" name="dno" value="${ d.getDocNo() }">
	        </form>
	        <script>
   			    function postFormSubmit(num){
 				   if(num == 1){ 
	    			   $("#postForm").attr("action","updateProofForm.ap");
	 		    }else{ 
	 		    	$("#postForm").attr("action","deleteProof.ap");
					   if(confirm("삭제된 문서는 복구할수없습니다. 그래도 삭제하시겠습니까?")==true){
						  $("#postForm").submit();
					   }else{
						   return;
					   }
			    }			
			}
		    </script>
            <br><br><br>

            <h1 style="text-align:center;">경조비 신청서</h1>
            <br><br><br>

            <!-- 결재선 -->
            <div id="appoveLine">
                <table id="approveLineTb">
                    <tr height="20">
                        <td rowspan="3" width="20">결<br>재</td>
                           <td width="70">기안</td>
                           <td width="70">이사</td>

                    </tr>
                    <tr height="">
                           <td>이용석</td>
                           <td>최해성</td>
                       </tr>
                       <tr height="">
                           <td>승인(날짜)</td>
                           <td>진행</td>

                    </tr>
                </table>
            </div>
            <br><br><br><br><br><br><br><br>

            <!-- 기안문서 -->
            <table class="docContents">
                <tr width="800">
                    <td width="200" class="th">문서번호</td>
                   	<td width="200">${ d.getDocNo() }</td>
                    <td width="200" class="th">기안일자</td>
                    <td width="200">${ d.getDocDate() }</td>
                </tr>
                <tr>
                    <td class="th">기안자</td>
                    <td>${ d.getEmpName() }</td>
                    <td class="th">기안부서</td>
                    <td>${ d.getDocEnd() }</td>
                </tr>
                <tr>
                    <td class="th">참조자</td>
                    <td>${ d.getDocRefName() }</td>
                    <td class="th">마감일자</td>
                    <td>${ d.getDocDepartment() }</td>
                </tr>
                <tr>
                    <td class="th">제목</td>
                    <td colspan="3">${ d.getDocTitle() }</td>
                </tr>
            </table>
			
			<br><br>
			
               <table class="docContents">
                <tr width="800">
                    <td width="200" class="th">경조구분</td>
                    <td width="200">${ d.getFeSq() }</td>
                    <td width="200" class="th">신청일자</td>
                    <td width="200">${ d.getFeStart() }</td>
                </tr>
                <tr>
                    <td class="th">경조기간</td>
                    <td>${ d.getFeStart() } ~ ${ d.getFeEnd() }</td>
                    <td class="th">가족관계/대상자</td>
                    <td>${ d.getFeRelation() }</td>
                </tr>
                <tr>
                    <td class="th">경조장소</td>
                    <td>${ d.getFePlace() }</td>
                    <td class="th">신청금액</td>
                    <td>${ d.getFePrice() }</td>
                </tr>
            </table>
               
            <br><br><br>
            <h6>결재의견</h6>
            <hr>
            <div id="Opinion">
             <table id="paymentOpinion">
                 <tr height="20" id="aa">
                        <td width="80">결재</td>
                        <td width="120">결재자</td>
                        <td width="100">부서</td>
                        <td width="160">결재일시</td>
                        <td width="320">의견</td>
                 </tr>
                 <tr height="">
                        <td>승인</td>
                        <td>최해성 이사</td>
                        <td>개발팀</td>
                        <td>2020.05.06 23:11</td>
                        <td>승인합니다</td>
                    </tr>

             </table>
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
					        
				        	<input type="hidden" name="docNo" value="">
				        	<input type="hidden" name="docSc" value="">
				        	<input type="hidden" name="approverEmpid" value="">
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