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
    <!-- alertity js 라이브러리 JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
    <style>
    body {font-family: Handon3gyeopsal300g;}
        .outer{
			width:1250px;
			float:left;
			margin-left:200px;
			margin-top:0px;
		
		 }

        .inner {
            width: 800px;
        }
    </style>
</head>
<body>
	<script>
       	$(function(){
       		$("#topEmail").css("border-bottom-style","groove");
       		$("#topEmail a").css("color","dimgray");
       		$("#tm>a").css("color", "deepskyblue");
       	});
     </script>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarMail.jsp"/>

 	<div class="outer" align="center">
        <div class="inner" >
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12 text-left">
                        <h3 class="page-header"><i class="far fa-trash-alt"></i> 휴지통</h3>
                    </div>
                </div>
                <form action="trashSearch.ma" id="searchForm">
                	<input type="hidden" name="currentPage" value=1>
	                <div class="row">
	                    <div class="col-xs-4"></div>
	                    <div class="col-xs-2">
	                  
	                    </div>
	                    
	                    <div class="col-xs-2">
	                        <select class="form-control" name="condition" id="condition">
	                            <option value="title">제목</option>
	                            <option value="content">내용</option>
	                            <option value="sender">보낸사람</option>
	                        </select>
	                    </div>
	                    <div class="col-xs-2">
	                        <div class="form-group input-group" style="width: 235px;">
	                            <input type="text" name="keyword" class="form-control" value="${ sc.keyword }" placeholder="Search">
	                            <div class="input-group-btn">
	                                <button class="btn btn-default" type="submit">
	                                    <i class="glyphicon glyphicon-search"></i>
	                                </button>
	                            </div>
	                        </div>
	                    </div> 
	                </div>
                </form>
                 <script>
                	$(function(){
                		switch('${sc.condition}'){
                		case "title" : $("#condition option").eq(0).attr("selected" ,true); break; 
                		case "content" : $("#condition option").eq(1).attr("selected" ,true); break; 
                		case "sender" : $("#condition option").eq(2).attr("selected" ,true); break; 
                		}
                	});
                </script>
               <div class="row" align="right">
                	<div class="col-xs-2">
               		
                	</div>
                	<div class="col-xs-4"></div>
                    <div class="col-xs-6">
                     	<button class="btn btn-info btn-sm" id="revoke" style="margin-right: 10px;" onclick="revoke();" disabled>복구</button>
                        <!-- <button class="btn btn-danger btn-sm" id="comDelete" style="margin-right: 10px;" disabled>영구삭제</button> -->
                    </div>
                </div>
                
                <hr>
                <table class="table table-hover text-left" id="trashList">
                    <thead>
                            <tr>
                            <th width="50px">
                                <input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();" value="">
                            </th>
                            <th width="50px">읽음</th>
                            <th width="130px">메일</th>
                            <th>제목</th>
                            <th width="200px">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="t" items="${ tList }">
                    	    <tr>
                            <th>
                                <input type="checkbox" name="emailNo" value="${ t.emailNo }">
                            </th>
                            <c:choose>
                            	<c:when test="${ t.senderStatus=='N' }">
                            		<td>SENT</td>
                            	</c:when>
                            	<c:when test="${ t.readStatus == 'Y'}">
	                            	<td><i class="far fa-envelope-open"></i></td>
                            	</c:when>
                            	<c:otherwise>
                            		<td> <i class="far fa-envelope"  style="color:red"></i></td>
                            	</c:otherwise>
                            </c:choose>
                            <td>${ t.senderName }</td>
                            <c:choose>
                            	<c:when test="${ empty r.files }">
	                            	<td>${ t.mailTitle }</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>${ t.mailTitle } <i class="fas fa-paperclip"></i></td>
                            	</c:otherwise>
                            </c:choose>
                            <td>${ t.createDate }</td>
                          	
                    	</c:forEach> 
                    </tbody>
                </table>
                 <script>
	            	$(function(){
	            		$("#trashList tbody tr td").click(function(){
	            			 alertify.alert('Message','휴지통에서는 상세보기를 하실수 없습니다.<br> 상세보기를 원하 실 경우 복구를 진행하세요.');
	            		});	
	            	});
	            	
	            </script>
                
                <ul class="pagination">
            	<c:if test="${ pi.currentPage ne 1 }">
            		<c:choose>
            			<c:when test="${ empty sc }">
            				<li class="previous"><a href="trash.ma?currentPage=${ pi.currentPage - 1 }">&lt;</a></li>
            			</c:when>
            			<c:otherwise>
            					<c:url value="trashSearch.ma" var="searchUrl">
            								<c:param name="condition" value="${ sc.condition }"/>
											<c:param name="keyword" value="${ sc.keyword }"/>
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
	            					<li class=""><a href="trash.ma?currentPage=${ p }">${ p }</a></li>
	            				</c:when>
	            				<c:otherwise>
	            					<c:url value="trashSearch.ma" var="searchUrl">
	            								<c:param name="condition" value="${ sc.condition }"/>
												<c:param name="keyword" value="${ sc.keyword }"/>
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
							<li class="next"><a href="trash.ma?currentPage=${ pi.currentPage + 1 }">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<c:url value="trashSearch.ma" var="searchUrl">
         								<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="currentPage" value="${  pi.currentPage +1 }"/>
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
    <script>
	    function checkAll(){
	  		if( $("#th_checkAll").is(':checked')){
	  			$("input[name=emailNo]").prop("checked",true);
	  			$("#revoke").attr("disabled", false);
	  			$("#comDelete").attr("disabled", false);
	  		}else{
	  			$("input[name=emailNo]").prop("checked",false);
	  			$("#revoke").attr("disabled", true);
	  			$("#comDelete").attr("disabled", true);
	  		}
	  	}
	    
	    $(function(){
			$("input[name=emailNo]").click(function(){
				if($("input[name=emailNo]").is(":checked")){
					$("#revoke").attr("disabled", false);
		  			$("#comDelete").attr("disabled", false);
				}else{
					$("#revoke").attr("disabled", true);
		  			$("#comDelete").attr("disabled", true);
				}
			});
		});
	    
	    function revoke(){
	    	var emailNo = new Array();
			$("input[name=emailNo]:checked").each(function(){
				emailNo.push($(this).val());
			});
			
			if(emailNo==""){
				alert("항목을 선택해 주세요.");
			}else{
				$.ajax({
					url:"revoke",
					type:"post",
					data:{emailNo:emailNo},
					success:function(status){
						if(status="success"){
							location.href="trash.ma?currentPage=1";
						}else{
							alert("다시 시도해 주세요.");
						}
					},
					error:function(){
						console.log("ajax 통신 실패");
					}
				});
			}
	    }
	
    </script>
    
	    
	
</body>

</html>