<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>참조문서함</title>
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
	    width:800px;
	    height:670px;
	    margin:auto;
	    margin-top:50px;
	}
	/* 본문 */
	#docListArea{
	    width:800px;
	}
	table th{text-align:center;}
	
	/* 검색 */
	#search, #search tr, #search th, #search td{
	    border:1px solid lightgrey;
	    border-collapse:collapse;
	    font-size:13px;
	}
	#search th, #docList th{background:lightsteelblue; color:white;}
	#periodBtns, #periodInp{margin:10px 0px 10px 15px;}
	
	.period{
	    width:45px;
	    height:28px;
	    background: rgb(7, 53, 90);
	    color:white;
	    border:none;
	    font-size:13px;
	}
	
	.schCondition{
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
	.docList tr{
	    height:30px;
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
	    border:1px solid lightgrey;
	    width:20px;
	    height:20px;
	    text-align:center;
	}
	.page:hover{
	    color:lightsteelblue;
	    border-color:lightsteelblue;
	    cursor:pointer;
	}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>

	<div id="docListWrapper">
    
    <div id="docListOuter">

        <!-- 사이드 바 -->
        <div id="approvalDocSide">
            
        </div>

        <!-- 본문 -->
        <div id="docListArea">
		            <h4>⊙ 참조문서함</h4>
	            <hr>
	            <br>
            <!-- 검색 -->
            <form action="docSearch.ap">
                <table id="search">
                    <tr height="90">
                        <th width="100">기안일</th>
                        <td width="700">
                            <div id=periodBtns>
                                <input type="button" class="period" name="period" value="1주일">
                                <input type="button" class="period" name="period" value="1개월">
                                <input type="button" class="period" name="period" value="3개월">
                                <input type="button" class="period" name="period" value="6개월">
                            </div>
                            <div id=periodInp>
                                <input type="date" name="startDt" id="startDt"> ~ <input type="date" name="endDt" id="endDt">
                            </div>
                        </td>
                    </tr>
                    <tr height="50">
                        <th>결재상태</th>
                        <td>
                            <select name="status" class="schCondition">
                                <option value="대기">대기</option>
                                <option value="진행">진행</option>
                                <option value="완료">완료</option>
                                <option value="반려">반려</option>
                            </select>
                        </td>
                    </tr>
                    <tr height="50">
                        <th>문서검색</th>
                        <td>
                            <select name="condition" class="schCondition">
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
            <table class="docList">
                <thead>
                    <tr>
                        <th width="120">품의번호</th>
                        <th width="70">문서분류</th>
                        <th width="280">문서제목</th>
                        <th width="70">기안자</th>
                        <th width="70">기안부서</th>
                        <th width="100">기안일</th>
                        <th width="90">상태</th>
                    </tr>
                </thead>
               
                <tbody>
                	<c:forEach var="d" items="${ list }">
	                    <tr>
	                        <td style="text-align:center;">${ d.docNo }</td>
	                        <td style="text-align:center;">${ d.docSc }</td>
	                        <td style="padding-left:30px;">${ d.docTitle }</td>
	                        <td style="text-align:center;">${ d.empName }</td>
	                        <td style="text-align:center;">${ d.docDepartment}</td>
	                        <td style="text-align:center;">${ d.docDate }</td>
	                        <c:choose>
	                        	<c:when test="${ d.docStatus eq '0' }">
	                       			 <td style="text-align:center;">대기</td>
	                       		</c:when>
	                       		<c:when test="${ d.docStatus eq '1' }">
	                       			 <td style="text-align:center;">진행</td>
	                       		</c:when>
	                       		<c:when test="${ d.docStatus eq '2' }">
	                       			 <td style="text-align:center;">완료</td>
	                       		</c:when>
	                       		<c:when test="${ d.docStatus eq '3' }">
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
             <div id="pagingArea">
                <ul class="pagination">
                	
                </ul>
            </div>
       </div>
   </div>
   </div>

   
 
</body>
</html>











