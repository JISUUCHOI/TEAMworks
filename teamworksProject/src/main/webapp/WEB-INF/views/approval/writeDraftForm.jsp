<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.SimpleDateFormat"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   Date date = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd");
%>
<html>
<head>
<meta charset="UTF-8">
<title>기안서작성</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- css 연결 -->
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/writeDraftForm.css">
<!-- js 연결 -->
<script src="${ pageContext.servletContext.contextPath }/resources/js/writeDraftForm.js" rel="javascript" type="text/javascript"></script>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>
	<div id="bodyWrapper">
	    <div id="draftOuter">
	
	        <h6>⊙ 기안문 작성</h6>
	        <hr>
	        <br>
	
	        <form id="docForm" method="post" action="draftInsert.ap" enctype="multipart/form-data">
	            <!-- 결재선으로 선택된 값들 -->
	        	<input type="hidden" id="approver" name="approver">
	            <!-- 버튼들 -->
	            <div id="btns">
	                <button type="button" id="approveLineBtn" data-toggle="modal" data-target="#approveLineModal">결재선</button>
	                <button type="submit" id="approveBtn" disabled>결재요청</button>
	                <button type="reset" id="cancelBtn" onclick="history.back();">취소</button>
	            </div>
	            <br><br><br>
	
	            <h1 style="text-align:center;">기안서</h1>
	            <input type="hidden" name="docSc" value="기안서">
	            <br>
	
	            <!-- 결재선 -->
	            <div id="appoveLine">
	                <table id="approveLineTb">
	                    <tr height="20">
	                        <td rowspan="2" width="20">결<br>재</td>
	                        <td width="70">기안</td>
	                    </tr>
	                    <tr height="70">
	                        <td>${ loginUser.empName }</td>
	                    </tr>
	                </table>
	            </div>
	            <br><br><br><br><br><br><br><br>
	
	            <!-- 기안문서 -->
	            <table class="docContents">
	                <tr width="1000">
	                    <td width="200" class="th">문서번호</td>
	                    <td width="200">자동부여</td>
	                    <td width="200" class="th">기안일자</td>
	                    <td width="200"><jsp:useBean id="docDate" class="java.util.Date" />
										<fmt:formatDate value="${docDate}" pattern="yyyy-MM-dd" var="docDate" /><c:out value="${docDate}"/>
										<input type="hidden" id="docDate" name="docDate" value="${ docDate}">
	                </tr>
	                <tr>
	                    <td class="th">기안자</td>
	                    <td>${ loginUser.empName }</td>
	                    <input type="hidden" id="empId" name="empId" value="${ loginUser.empId }">
	                    <td class="th">기안부서</td>
	                    <td>${ loginUser.deptName }</td>
	                    <td><input type="hidden" id="docDepartment" name="docDepartment" value="${ loginUser.deptName }" readonly></td>
	                </tr>
	                <tr>
	                    <td class="th">참조자</td>
	                    <td>
	                    	<input type="hidden" id="refedId" name="docReference">
	                        <input type="text" id="refSch" name="docRefName" readonly>
	                        <button type="button" id="refBtn" data-toggle="modal" data-target="#refEmp">참조</button>
	                    </td>
	                    <td class="th">마감일자</td>
	                    <td><jsp:useBean id="docEnd" class="java.util.Date"/>
							<jsp:setProperty name="docEnd" property="date" value="${docEnd.date + 7}"/>
							<fmt:formatDate value="${docEnd}" pattern="yyyy-MM-dd" var="docEnd"/><c:out value="${docEnd}"/>
							<input type="hidden" id="docEnd" name="docEnd" value="${ docEnd}">
	                </tr>
	                <tr>
	                    <td class="th">제목</td>
	                    <td colspan="3"><input type="text" id="titleInput" name="docTitle" placeholder="내용을 입력해주세요" required></td>
	                </tr>
	            </table>
	
	            <!--썸머노트-->
	            <textarea id="summernote" name="docContent"></textarea>
	            
				
				
				<script>
				$(document).ready(function() {
					$('#summernote').summernote({						
      				 	placeholder: '내용을 입력하세요',
	      				tabsize: 2,
	      				height: 300,
	      				toolbar: [
	       				 ['style', ['style']],
	        			 ['font', ['bold', 'underline', 'clear']],
	       				 ['color', ['color']],
	        		 	 ['para', ['ul', 'ol', 'paragraph']],
	        		 	 ['table', ['table']],
	        			 ['insert', ['link']],
	         			 ['view', ['fullscreen', 'codeview', 'help']]
	       				]
	    			  });

					//
					$('.fileUpload').on("dragover drop",
							function(e) {
								$(this).css("background", "#BBBBFF");
									e.preventDefault();
									})
							.on("drop", function(e) {
										$("#upfile").prop("files", e.originalEvent.dataTransfer.files).closest("form");
								displayAttachFile();
								$(this).css("background", "#FFFFFF");
					});

					
					$('.fileUpload').click(function(e) {
						e.preventDefault();
						$('#upfile').click();
					});

					$('#upfile').change(function(e) {
						displayAttachFile();
					});

					var displayAttachFile = function() {

						if ($("#upfile").val() != '') {
							var html = "";

							var files = $('#upfile')[0].files;

							html = '<table>';

							var contentHTML = "";
							for (var i = 0; i < files.length; i++) {
								var originName = files[i].name;
								var size = 0
								if (files[i].size != 0) {
									size = Math.floor(Math.log(files[i].size) / Math.log(1024));
								}

								contentHTML = contentHTML
										+ '<tr><td width="600px">'
										+ originName
										+ '</td>'
										+ '<td width="200px">'
										+ size
										+ 'mb</td></tr>';

							}

							html = html + contentHTML;
							html = html + '</table>'

							$('.fileUpLoad').html(html);

						} else {
							var html = "이곳에 파일을 드래그 하세요.";
							$('.fileUpLoad').html(html);
						}
					};

					  
				});  
				
				function sendFile(file, el) {
					var form_data = new FormData();
					form_data.append('file', file);
					$.ajax({
						data: form_data,
						type : "post",
						url: 'summer_image',
						cache :false,
						contentType : false,
						enctype : 'multipart/form-data',
						processData : false,
						success : function(img_name) {
							$(el).summernote('editor.insertImage', img_name);
						}
					});
				}
				$(function() {
					$('#docContent').summernote({
						 	placeholder: '최대 500자 작성 가능합니다.',
					        height: 300,
					        lang: 'ko-KR',
					        callbacks: {
					        	onImageUpload: function(files, editor, welEditable) {
					        		for(var i = files.length -1; i>=0; i--) {
					        			sendFile(files[i], this);
					        		}
					        	}
					        }
					 });
				});
   				</script>

	            
	
	            <!--파일첨부-->
	            <br><br>
	            <h4>⊙ 파일업로드</h4>
	            <hr>
	            <br>
	
	            <table id="fileTb">
	                <tr>
	                    <td width="600px">파일명</td>
	                    <td width="200px">크기</td>
	                </tr>
	            </table>
	            <div id="fileUpload" class="fileUpLoad"> 
	               	 <b>이곳을 클릭하거나 파일을 드래그 하세요.</b>
	            </div>
	            <br>
				<input type="file" multiple="multiple" id="upfile" name="uploadFile" style="display:none;">
	            	
	        </form>
	    </div>
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
					        <button type="button" id="orgChart">조직도</button>
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
					            					<input type="hidden" class="refedJob" value="${ l.jobName }">
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
					            	<table id="refEmpArea" style="font-size:13px;"></table>
					            </div>
					        </div>
					    </div>
	                </div>
	                
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                	<div id="referenceBtns">
				            <button type="button" id="refApplyBtn">적용</button>
				            <button type="button" id="refCancelBtn">취소</button>
				        </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 결재선 모달 -->
	    <div class="modal fade" id="approveLineModal">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h6 class="modal-title">결재선</h6>
		            </div>
		
	                <!-- Modal Body -->
	                <div class="modal-body">
	                    <div id="approveLineOuter">
					        <button type="button" id="apOrgChart">조직도</button>
					        <button type="button" id="apSch">검색</button><br>
					        <div id="apChart-container">
					            <div class="apTree1" id="apCoName">(주)TEAMWORKS</div>
					           
					            <% int j = 1;%>
					            <c:forEach var="d" items="${ dept }">
					            	<div class="apTree2 apTree2<%= j %>">${ d.deptName }</div>
					            	<div class="apTree3 apTree3<%= j %>">
						            	<c:forEach var="l" items="${ list }">
						            		<c:choose>
						            			<c:when test="${ d.deptName eq l.deptName }">
					            					<input type="hidden" class="apRefedJob" value="${ l.jobName }">
					            					<input type="hidden" class="apRefedId" value="${ l.empId }">
					            					<input type="hidden" value="${ l.deptName }">
					                				<input type="checkbox" name="apRefChk" class="apRefChk" style="visibility:hidden">
					                				ㄴ<span class="apRefEmpName">${ l.empName }</span><span class="apRefEmpDept"> ${ l.jobName }</span><br>
						            			</c:when>
						            		</c:choose>
						            	</c:forEach>
					            	</div>
					           		<% j++; %>
					            </c:forEach>
					            
					        </div>
					        <div id="apSch-container">
					            <div id="apSchBox">
					                <font>사원명</font>
					                <input name="apKeyword" type="search" id="apSchInput">
					                <button type="button" id="apSchBtn">검색</button>
					            </div>
					
					            <div id="apEmpListArea">
					                <table id="apEmpList">
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
					
					        <div id="apChooseCancel">
					            <div class="apChoose" id="apChooseRef"> &gt; </div>
					            <div class="apChoose" id="apCancelRef"> &lt; </div>
					        </div>
							
							<div id="approvalLine">
								<div style="margin:10px 0px 0px 20px; font-size:13px;">결재선 정보</div>
					            <div id="deleteLine">
					                <font>사용자 결재선</font>
					                <select name="freApproveLine" id="chooseApproveLine"></select><br>
					                <div id="freLineBtns">
						                <button type="button" id="selectBtn">조회</button>
						                <button type="button" id="deleteBtn">삭제</button>
					                </div>
					            </div>
					            <div id="apSelectedEmp">
					                <table id="apRefEmpArea" style="margin:5px 0px 0px 15px;"></table>
					            </div>
					            <div id="frequentLine">
					                <font>사용자 결재선명</font>
					                <input type="hidden" id="line">
					                <input id="lineName" name="lineName">
					                <button type="submit" id="enrollBtn">저장</button>
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

	
</body>
</html>
