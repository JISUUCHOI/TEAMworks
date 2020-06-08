<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
        integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
        .outer{
			width:1250px;
			float:left;
			margin-left:200px;
			margin-top:0px;
		
		 }

        .inner {
            width: 900px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarMail.jsp"/>

 	<div class="outer" align="center">
        <div class="inner" >
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12 text-left">
                        <h3 class="page-header"><i class="fas fa-envelope"></i> 받은 편지함</h3>
                    </div>
                </div>
                <form>
	                <div class="row">
	                    <div class="col-xs-4"></div>
	                    <div class="col-xs-2">
	                  
	                    </div>
	                    <div class="col-xs-2">
	                        <select class="form-control" name="" id="">
	                            <option value="writer">제목</option>
	                            <option value="content">내용</option>
	                            <option value="sender">보낸사람</option>
	                        </select>
	                    </div>
	                    <div class="col-xs-2">
	                        <div class="form-group input-group" style="width: 235px;">
	                            <input type="text" class="form-control" placeholder="Search">
	                            <div class="input-group-btn">
	                                <button class="btn btn-default" type="submit">
	                                    <i class="glyphicon glyphicon-search"></i>
	                                </button>
	                            </div>
	                        </div>
	                    </div> 
	                </div>
                </form>
                <div class="row" align="right">
                	<div class="col-xs-2">
               		  	<select class="form-control input-sm" name="" id="">
                            <option value="">읽음</option>
                            <option value="">읽지않음</option>
	                    </select>
                	</div>
                	<div class="col-xs-4"></div>
                    <div class="col-xs-6">
                        <button class="btn btn-danger btn-sm" style="margin-right: 10px;">삭제</button>
                    </div>
                </div>
                <hr>
                <table class="table table-hover text-left">
                    <thead>
                        <tr>
                            <th width="80px">
                                <input type="checkbox" value="">
                            </th>
                            <th width="50px">읽음</th>
                            <th width="180px">보낸사람</th>
                            <th>제목</th>
                            <th width="150px">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="r" items="${ rList }">
                    	    <tr>
                            <th>
                                <input type="checkbox" value="${ r.emailNo }">
                            </th>
                            <c:choose>
                            	<c:when test="${ r.readStatus == 'Y'}">
	                            	<th><i class="far fa-envelope-open"></i></th>
                            	</c:when>
                            	<c:otherwise>
                            		<th> <i class="far fa-envelope"></i></th>
                            	</c:otherwise>
                            </c:choose>
                            <td>${ r.senderName }</td>
                            <c:choose>
                            	<c:when test="${ empty r.files }">
	                            	<td>${ r.mailTitle }</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>${ r.mailTitle } <i class="fas fa-paperclip"></i></td>
                            	</c:otherwise>
                            </c:choose>
                            <td>${ r.createDate }</td>
                          	
                    	</c:forEach> 
                    </tbody>
                </table>
                
                
                <ul class="pagination">
            	<c:if test="${ pi.currentPage ne 1 }">
            		<c:choose>
            			<c:when test="${ empty sc }">
            				<li class="previous"><a href="rlist.ma?currentPage=${ pi.currentPage - 1 }">&lt;</a></li>
            			</c:when>
            			<c:otherwise>
            					<c:url value="search.ma" var="searchUrl">
										<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="start" value="${ sc.start }"/>
										<c:param name="end" value="${ sc.end }"/>
										<c:param name="cat" value="2"/>
										<c:param name="currentPage" value="${  pi.currentPage -1 }"/>
								</c:url>
            				<li class="previous">
            				<a href="${ searchUrl }">&lt;</a>
            				</li>
            			</c:otherwise>
            		</c:choose>
            	
            	</c:if>
            	
            	 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            	 	<c:choose>
            	 		<c:when test="${ p eq pi.currentPage }">
            	 			<li class="disabled"><a href="">${ p }</a></li>
            	 		</c:when>
            	 		<c:otherwise>
            	 			<c:choose>
	            	 			<c:when test="${ empty sc }">
	            					<li class=""><a href="rlist.ma?currentPage=${ p }">${ p }</a></li>
	            				</c:when>
	            				<c:otherwise>
	            					<c:url value="search.ma" var="searchUrl">
										<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="start" value="${ sc.start }"/>
										<c:param name="end" value="${ sc.end }"/>
										<c:param name="cat" value="2"/>
										<c:param name="currentPage" value="${ p }"/>
									</c:url>
	            					<li class="">
	            						<a href="${searchUrl}">${ p }</a>
	            					</li>
	            				</c:otherwise>
            				</c:choose>
            	 		</c:otherwise>
            	 	</c:choose>
            	 </c:forEach>
            	
            	<c:if test="${ pi.currentPage ne pi.maxPage }">
            		<c:choose>
						<c:when test="${ empty sc }">
							<li class="next"><a href="rlist.ma?currentPage=${ pi.currentPage + 1 }">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<c:url value="search.ma" var="searchUrl">
										<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="start" value="${ sc.start }"/>
										<c:param name="end" value="${ sc.end }"/>
										<c:param name="cat" value="2"/>
										<c:param name="currentPage" value="${  pi.currentPage + 1  }"/>
							</c:url>
							<li class="next">
							<a href="${ searchUrl }">&gt;</a>
							</li>
						</c:otherwise>        		
            		</c:choose>
            	</c:if>
            </ul>
            </div>
        </div>
    </div>
</body>
</html>