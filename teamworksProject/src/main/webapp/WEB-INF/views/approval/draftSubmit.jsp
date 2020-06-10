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
    #draftContent{
    	height:250px;
    }
</style>
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
	            	<input type="hidden" name="fileName" value="${ d.changeName }">
	            </form><script>
   				    function postFormSubmit(num){
 					   if(num == 1){ 
 						  $("#postForm").attr("action","updateProofForm.ap");
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
	            <br>
	
	            <!-- 결재선 -->
	            <div id="appoveLine">
	                <table id="approveLineTb">
	                    <tr height="20">
	                        <td rowspan="3" width="20">결<br>재</td>
                            <td width="70">기안</td>
                            <td width="70">팀장</td>
                            <td width="70">이사</td>
                            <td width="70">사장</td>
	                    </tr>
	                    <tr height="">
                            <td>최해성</td>
                            <td>이용석</td>
                            <td>김용명</td>
                            <td>최지수</td>
                        </tr>
                        <tr height="">
                            <td>승인(날짜)</td>
                            <td>승인(날짜)</td>
                            <td>진행</td>
                            <td>미결</td>
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
	                    <td class="th">문서제목</td>
	                    <td colspan="3">${ d.getDocTitle() }</td>
                    </tr>
                        <tr>
                    	<td class="th">내용</td>
	                    <td colspan="4" id="draftContent">${ d.getDocContent() }</td>
                    </tr>
                    <tr>
	                    <td class="th">첨부파일</td>
	                    <c:choose>
	                    	<c:when test="${ !empty d.originName }">	
	                    		<td colspan="3" id="draftFile"><a href="${ pageContext.servletContext.contextPath }/resources/approveUploadFiles/${ d.changeName }" download="${ d.originName }">${ d.originName }</a></td>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<td colspan="3" id="draftFile">첨부파일이 없습니다.</td>
	                    	</c:otherwise>	
	                    </c:choose>
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