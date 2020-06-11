<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안서작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	
	        <h4>⊙ 결재문서</h4>
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
	            	<input type="hidden" name="dsc" value="${ d.getDocSc() }">
	            </form><script>
   				    function postFormSubmit(num){
 					   if(num == 1){ 
		    			   $("#postForm").attr("action","updateProofForm.ap");
		 		    }else{ 
		 		    	$("#postForm").attr("action","deleteProof.ap");
						   if(confirm("삭제된 문서는 복구할수없습니다. 그래도 삭제하시겠습니까?")==true){
							   alert("삭제되었습니다.");
							   $("#postForm").submit();
						   }else{
							   return;
						   }
				    }			
				}
			    </script>
	            
	            <br><br><br>
	
	            <h1 style="text-align:center;">제증명 신청서</h1>
	            <br>
	
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
	                <tr width="1000">
	                    <td width="200" class="th">문서번호</td>
	                    <td width="200">${ d.getDocNo() }</td>
	                    <td width="200" class="th">기안일자</td>
	                    <td width="200">${ d.getDocDate() }</td>
	                </tr>
	                <tr>
	                    <td class="th">기안자</td>
	                    <td>${ d.getEmpName() }</td>
	                    <td class="th">마감일자</td>
	                    <td>${ d.getDocEnd() }</td>
	                </tr>
	                <tr>
	                    <td class="th">참조자</td>
	                    <td>${ d.getDocRefName() }</td>
	                    <td class="th">기안부서</td>
	                    <td>${ d.getDocDepartment() }</td>
	                </tr>
	                <tr>
	                    <td class="th">제목</td>
	                    <td colspan="3">${ d.getDocTitle() }</td>
	                </tr>
	            </table>
				
				<br><br>
				
                <table class="docContents">
	                <tr width="">
	                    <td width="150" class="th">증명서번호</td>
	                    <td width="150">${ d.getDocNo() }</td>
	                    <td width="150" class="th">증명서구분</td>
                        <td width="150">${ d.getDocSc() }</td>
                        <td width="150" class="th">신청일자</td>
	                    <td width="150">${ d.getDocDate() }</td>
	                </tr>
	                <tr>
	                    <td class="th">사원번호</td>
	                    <td>${ d.getEmpId() }</td>
	                    <td class="th">성명</td>
                        <td width="">${ d.getEmpName() }</td>
                        <td class="th">사업장</td>
                        <td width="">(주)팀웍스</td>
	                </tr>
	                <tr>
	                    <td class="th">부서</td>
	                    <td>${ d.getDocDepartment() }</td>
	                    <td class="th">직급</td>
                        <td>${ d.getJobName() }</td>
                        <td class="th"></td>
	                    <td></td>
                    </tr>
                    <tr>
	                    <td class="th">용도</td>
	                    <td colspan="5">${ d.getPfPurpose() }</td>
	                </tr>
                </table>
                
                <br><br>
	            <h4>결재의견</h4>
	            <hr>
                <br>
                
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
	
</body>
</html>