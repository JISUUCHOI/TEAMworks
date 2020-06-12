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
<!-- css 연결 -->
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/writeDraftForm.css">
<!-- js 연결 -->
<script src="${ pageContext.servletContext.contextPath }/resources/js/writeDraftForm.js" rel="javascript" type="text/javascript"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>
    #paymentOpinion, #paymentOpinion tr, #paymentOpinion td, #paymentOpinion th{
        border:1.2px solid lightgrey;           
        border-collapse: collapse;
        font-size:12px;
        text-align:center;
    }
    #aa{
        background:lightsteelblue;
    }  
    /* 버튼 */
    #btns{
        width:200px;
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
        margin-left:70px;
    }
    #modifyBtn, #deleteBtn{
        width:60px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:12px;
        float:right;
    }
    #modifyBtn:hover, #deleteBtn:hover, #approveBtn:hover, #refBtn:hover{
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
    #draftContent{
    	height:250px;
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

    /* 결재 모달 버튼 */
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
	              	
	                <button type="button" id="listBtn" onclick="history.back();">목록</button>
	                
	                <!-- 나중에 status값 반려값으로 바꾸기 반려문서아니면 버튼안보이게 -->
	           	    <c:choose>
	           	    	<c:when test="${ d.get(0).docStatus eq 3 and loginUser.empId eq d.get(0).getEmpId() }">
	              			<button type="submit" id="deleteBtn" onclick="postFormSubmit(2);">삭제</button>
	           	    		<button type="button" id="modifyBtn" onclick="postFormSubmit(1);">수정</button>
	              		</c:when>	
	              	</c:choose>
	                
	                <c:choose>
		            	<c:when test="${ loginUser.empId eq approveEmpid }">
		                	<button type="button" id="approveBtn" data-toggle="modal" data-target="#responseApprove">결재</button>
		                </c:when>
		                <c:otherwise>
		                </c:otherwise>
                	</c:choose>
	            </div>
	            
	           	<form action="" id="postForm" method="post">
	            	<input type="hidden" name="dno" value="${ d.get(0).getDocNo() }">
	            	<input type="hidden" name="fileName" value="${ d.get(0).changeName }">
	            	<input type="hidden" name="dsc" value="${ d.get(0).getDocSc() }">
	            </form><script>
   				    function postFormSubmit(num){
 					   if(num == 1){ 
 						  $("#postForm").attr("action","updateForm.ap");
 						  $("#postForm").submit();
		 		   	   }else{ 						   
		 		    	$("#postForm").attr("action","deleteDraft.ap");
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
	
	            <h1 style="text-align:center;">기안서</h1>
	            <br><br><br>
	
	            <!-- 결재선 -->
	            <div id="appoveLine">
	                <table id="approveLineTb">
                    <tr height="20">
                        <td rowspan="2" width="20">결<br>재</td>
                           <td width="80">기안</td>
                           <c:forEach var="d" items="${ d }">
                           	<td width="80">결재</td>
                           </c:forEach>
                    </tr>
                    <tr height="70">
                        <td>${ d.get(0).getEmpName() }</td>
                        <c:forEach var="d" items="${ d }">
                           	<td>
                           		${ d.approverName }<br>${ d.approveReject } 
	                           	<c:choose>
	                           		<c:when test="${ d.approveReject eq '승인' }">
	                           			<br>(${ d.approveDate })
	                           		</c:when>
	                           		<c:when test="${ d.approveReject eq '반려' }">
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
	                    <td class="th">마감일자</td>
	                    <td>${ d.get(0).getDocEnd() }</td>
	                </tr>
	                <tr>
	                    <td class="th">참조자</td>
	                    <td>${ d.get(0).getDocRefName() }</td>
	                    <td class="th">기안부서</td>
	                    <td>${ d.get(0).getDocDepartment() }</td>
	                </tr>
	                <tr>
	                    <td class="th">문서제목</td>
	                    <td colspan="3">${ d.get(0).getDocTitle() }</td>
                    </tr>
                    <tr>
                    	<td class="th">내용</td>
	                    <td colspan="4" id="draftContent">${ d.get(0).getDocContent() }</td>
                    </tr>
                    <tr>
	                    <td class="th">첨부파일</td>
	                    <c:choose>
	                    	<c:when test="${ !empty d.get(0).originName }">	
	                    		<td colspan="3" id="draftFile"><a href="${ pageContext.servletContext.contextPath }/resources/approveUploadFiles/${ d.get(0).changeName }" download="${ d.get(0).originName }">${ d.get(0).originName }</a></td>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<td colspan="3" id="draftFile">첨부파일이 없습니다.</td>
	                    	</c:otherwise>	
	                    </c:choose>
                    </tr>

                </table>

                <br><br>
	            <h6>결재의견</h6>
	            <hr>
                
                <div id="Opinion">
                <c:choose>
	                 <c:when test="${ count lt 1 }">
	                 	<br><br><br><br><br>
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
			<br><br><br><br><br>
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
				        	<input type="hidden" name="empId" value="${ d.get(0).getEmpId() }">s
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
			
			/* 결재 모달 취소버튼 클릭 시  */
			$("#cancelBtn").click(function(){
				$('#responseApprove').modal("hide");
			});
			
		});
		
	</script>
	
</body>
</html>
