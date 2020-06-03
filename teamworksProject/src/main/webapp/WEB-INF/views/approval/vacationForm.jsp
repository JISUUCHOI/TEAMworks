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
<!-- css 연결 -->
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/vacationForm.css">
<!-- js 연결 -->
<script src="${ pageContext.servletContext.contextPath }/resources/js/vacationForm.js" rel="javascript" type="text/javascript"></script>
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
	        	<!-- 결재선으로 선택된 값들 -->
	        	<input type="hidden" id="approver" name="approver">
	            <!-- 버튼들 -->
	            <div id="btns">
	                <button type="button" id="approveLineBtn" data-toggle="modal" data-target="#approveLineModal">결재선</button>
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
					            <div class="frequentLine">
					                <font>사용자 결재선</font>
					                <select name="freApproveLine" id="chooseApproveLine">
					                    <option value="freArroveLine1">결재선 즐겨찾기</option>
					                    <option value="freArroveLine2">경영지원팀 결재선</option>
					                    <option value="freArroveLine3">개발팀 결재선</option>
					                </select>
					                <button type="button" id="deleteBtn">삭제</button>
					            </div>
					            <div id="selectedEmp">
					                <table id="apRefEmpArea" style="margin:5px 0px 0px 15px;"></table>
					            </div>
					            <div class="frequentLine">
					                <font>사용자 결재선명</font>
					                <input id="enrollApproveLine">
					                <button type="button" id="enrollBtn">저장</button>
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
	
</body>
</html>