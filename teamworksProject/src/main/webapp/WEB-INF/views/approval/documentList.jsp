<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결재문서보관함</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	#search, #search tr, #search th, #search td{
	    border:1px solid lightgrey;
	    border-collapse:collapse;
	    font-size:13px;
	}
	#search th{background:lightsteelblue; color:white;}
	#periodBtns, #periodInp{margin:10px 0px 10px 15px;}
	
	.period{
	    width:45px;
	    height:28px;
	    background: rgb(7, 53, 90);
	    color:white;
	    border:none;
	    font-size:13px;
	}
	
	#schCondition{
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
	#schButton:hover, .period:hover{
	    background:lightsteelblue;
	    cursor:pointer;
	}
	
	/* 문서 리스트 */
	#docList tr{
	    height:40px;
	}
	#docList, #docList>tbody>tr{
	    border-top: 1px solid lightgrey;
	    border-bottom: 1px solid lightgrey;
	    border-collapse: collapse;
	    font-size:13px;
	}
	#docList>thead>tr{
	    border-top-style:groove;
	    border-bottom-style:groove;
	}
	#docList>tbody>tr:hover{
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
	.page:hover{
	    /* color:lightsteelblue;
	    border-color:lightsteelblue; */
	    /* color:deepskyblue;
	    border-color:deepskyblue;
	    cursor:pointer; */
	}
	.able:hover{
		color:deepskyblue;
	    border-color:deepskyblue;
	    cursor:pointer;
	}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>

	<div id="docListWrapper">

	    <div id="docListOuter">
	
	        <!-- 본문 -->
	        <div id="docListArea">
	            <!-- 조건:대기/진행/완료/반려/회수요청/회수 -->
	            <c:choose>
					<c:when test="${ sts eq 0 }">
			            <h4>⊙ 결재대기함</h4>
		        	</c:when>
		        	<c:when test="${ sts eq 1 }">
			            <h4>⊙ 결재진행함</h4>
		        	</c:when>
		        	<c:when test="${ sts eq 2 }">
			            <h4>⊙ 결재완료함</h4>
		        	</c:when>
		        	<c:when test="${ sts eq 3 }">
			            <h4>⊙ 반려문서함</h4>
		        	</c:when>
		        	<c:when test="${ sts eq 4 }">
			            <h4>⊙ 회수요청함</h4>
		        	</c:when>
		        	<c:otherwise>
			            <h4>⊙ 결재회수함</h4>
		        	</c:otherwise>
		        </c:choose>
	            <hr>
	            <br>
	
	            <!-- 검색 -->
	            <form action="">
	                <table id="search">
	                    <tr height="90">
	                        <th width="150">기안일</th>
	                        <td width="850">
	                            <div id=periodBtns>
	                                <input type="button" class="period" name="period" value="1주일">
	                                <input type="button" class="period"" name="period" value="1개월">
	                                <input type="button" class="period" name="period" value="3개월">
	                                <input type="button" class="period" name="period" value="6개월">
	                            </div>
	                            <div id=periodInp>
	                                <input type="date" name="startDt" id="startDt"> ~ <input type="date" name="endDt" id="endDt">
	                            </div>
	                        </td>
	                    </tr>
	                    <tr height="50">
	                        <th>문서검색</th>
	                        <td>
	                            <select name="condition" id="schCondition">
	                                <option value="writer">기안자</option>
	                                <option value="title">제목</option>
	                                <option value="content">내용</option>
	                                <option value="form">양식</option>
	                            </select>
	                            <input id="keywordInp" class="btn form-control form-control" type="text" name="keyword">
	                        </td>
	                    </tr>
	                </table>
	                <br>
	                <button type="submit" id="schButton">검색</button>
	            </form>
	           
	            <br><br>
	
	            <!-- 문서 리스트 -->
	            <table id="docList">
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
	                <!-- 조건절:대기/진행/완료/반려/회수/회수요청, 반복문 -->
	                <tbody>
	                	<c:forEach var="l" items="${ list }">
		                    <tr>
		                        <td style="text-align:center;" class="docNo">${ l.docNo }</td>
		                        <td style="text-align:center;" class="docSc">${ l.docSc }</td>
		                        <td style="padding-left:30px;" class="docTitle">${ l.docTitle }</td>
		                        <td style="text-align:center;">${ l.empName }</td>
		                        <td style="text-align:center;">${ l.docDepartment}</td>
		                        <td style="text-align:center;">${ l.docDate }</td>
		                        <c:choose>
		                        	<c:when test="${ l.approveStatus eq 0 }">
				                        <td style="text-align:center;">대기</td>
		                        	</c:when>
		                        	<c:when test="${ l.approveStatus eq 1 }">
				                        <td style="text-align:center;">진행</td>
		                        	</c:when>
		                        	<c:when test="${ l.approveStatus eq 2 }">
				                        <td style="text-align:center;">완료</td>
		                        	</c:when>
		                        	<c:when test="${ l.approveStatus eq 3 }">
				                        <td style="text-align:center;">반려</td>
		                        	</c:when>
		                        	<c:when test="${ l.approveStatus eq 4 }">
				                        <td style="text-align:center;">회수요청</td>
		                        	</c:when>
		                        </c:choose>
		                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	            <br>
	            
	            <script>
	            	$(function(){
	            		$(".docTitle").click(function(){
	            			location.href="detailDoc.rap?docNo=" + $(this).prevAll(".docNo").text() +
	            										"&docSc=" + $(this).prevAll(".docSc").text();
	            		});
	            	});
	            
	            </script>
	            
	
	            <!-- 페이징바 -->
	            <div id="pagingArea" align="center">
	                
	                
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
						</c:when>
						<c:when test="${ listCount eq 0 }">
						</c:when>
						<c:otherwise>
							<button class="page able" onclick="location.href='docList.rap?approveStatus=${ sts }&currentPage=${ pi.currentPage - 1 }'">&lt;</button>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:choose>
							<c:when test="${ p eq pi.currentPage }">
								<button disabled class="page disable">${ p }</button>
							</c:when>
							<c:otherwise>
		                		<button class="page able" onclick="location.href='docList.rap?approveStatus=${ sts }&currentPage=${ p }'">${ p }</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
						</c:when>
						<c:when test="${ listCount eq 0 }">
						</c:when>
						<c:otherwise>
							<button class="page able" onclick="location.href='docList.rap?approveStatus=${ sts }&currentPage=${ pi.currentPage + 1 }'">&gt;</button>
						</c:otherwise>
					</c:choose>
	            </div>
	        </div>
	
	    </div>
    </div>
    
    <script>
		$(function(){
			$("#approveDoc>a").css("color", "dimgray");
			$("#approveDoc").css("border-bottom-style", "groove");
			
			$(".disable").css("color", "deepskyblue");
			$(".disable").css("border", "1.3px solid deepskyblue");
			$(".disable").css("text-align", "center");
			
			var sts = "${sts}";
			
			switch(sts){
			case '0': $("#readyForApprove>a").css("color", "deepskyblue"); break;
			case '1': $("#pendingApprove>a").css("color", "deepskyblue"); break;
			case '2': $("#doneApprove>a").css("color", "deepskyblue"); break;
			case '3': $("#refuseApprove>a").css("color", "deepskyblue"); break;
			case '4': $("#requestCallback>a").css("color", "deepskyblue"); break;
			case '5': $("#callbackDoc>a").css("color", "deepskyblue"); break;
			}
			
		});	
	</script>
    
</body>
</html>