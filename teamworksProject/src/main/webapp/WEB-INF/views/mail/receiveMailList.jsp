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
            width: 800px;
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
                <form action="search.ma" id="searchForm">
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
               		  	<select class="form-control input-sm" name="readStatus" id="readCondition">
                            <option value="all">전체</option>
                            <option value="Y">읽음</option>
                            <option value="N">읽지않음</option>
	                    </select>
                	</div>
                	<div class="col-xs-4"></div>
                    <div class="col-xs-6">
                     	<button class="btn btn-success btn-sm" id="read" onclick="changeReadStatus();" style="margin-right: 10px;" disabled>읽음</button>
                        <button class="btn btn-danger btn-sm" id="delete" onclick="deleteMail();" style="margin-right: 10px;" disabled>삭제</button>
                    </div>
                </div>
                <script>
                	$(function(){
                		switch('${sc.readStatus}'){
                		case "all" : $("#readCondition option").eq(0).attr("selected" ,true); break; 
                		case "Y" : $("#readCondition option").eq(1).attr("selected" ,true); break; 
                		case "N" : $("#readCondition option").eq(2).attr("selected" ,true); break; 
                		}
                	});
                </script>
                <hr>
                <table id="receiveList" class="table table-hover text-left">
                    <thead>
                        <tr>
                            <th width="50px">
                                <input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();" value="">
                            </th>
                            <th width="50px">읽음</th>
                            <th width="180px">보낸사람</th>
                            <th>제목</th>
                            <th width="200px">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="r" items="${ rList }">
                    	    <tr>
                            <th>
                                <input type="checkbox" name="emailNo" value="${ r.emailNo }">
                            </th>
                            <c:choose>
                            	<c:when test="${ r.readStatus == 'Y'}">
	                            	<th><i class="far fa-envelope-open"></i></th>
                            	</c:when>
                            	<c:otherwise>
                            		<th> <i class="far fa-envelope"  style="color:red"></i></th>
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
                <script>
                	$(function(){
                		$("#receiveList tbody tr td").click(function(){
                			$(this).sibings().childred()
                			location.href=""
                		});
                	});
                	
                </script>
                
                <ul class="pagination">
            	<c:if test="${ pi.currentPage ne 1 }">
            		<c:choose>
            			<c:when test="${ empty sc }">
            				<li class="previous"><a href="rlist.ma?currentPage=${ pi.currentPage - 1 }">&lt;</a></li>
            			</c:when>
            			<c:otherwise>
            					<c:url value="search.ma" var="searchUrl">
            						<c:choose>
            							<c:when test="${empty sc.condition && empty sc.keyword}">
            								<c:param name="readStatus" value="${  sc.readStatus }"/>
											<c:param name="currentPage" value="${  pi.currentPage -1 }"/>
            							</c:when>
            							<c:when test="${!empty sc.condition && !empty sc.keyword && empty sc.readStatus}">
	         									<c:param name="condition" value="${ sc.condition }"/>
												<c:param name="keyword" value="${ sc.keyword }"/>
												<c:param name="currentPage" value="${  pi.currentPage -1 }"/>
	         							</c:when>
            							<c:otherwise>
            								<c:param name="condition" value="${ sc.condition }"/>
											<c:param name="keyword" value="${ sc.keyword }"/>
											<c:param name="readStatus" value="${  sc.readStatus }"/>
											<c:param name="currentPage" value="${  pi.currentPage -1 }"/>
            							</c:otherwise>
            						</c:choose>
										
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
										<c:choose>
	            							<c:when test="${empty sc.condition && empty sc.keyword}">
	            								<c:param name="readStatus" value="${  sc.readStatus }"/>
												<c:param name="currentPage" value="${ p }"/>
	            							</c:when>
	            							<c:when test="${!empty sc.condition && !empty sc.keyword && empty sc.readStatus}">
	         									<c:param name="condition" value="${ sc.condition }"/>
												<c:param name="keyword" value="${ sc.keyword }"/>
												<c:param name="currentPage" value="${ p }"/>
	         								</c:when>
		            						<c:otherwise>
	            								<c:param name="condition" value="${ sc.condition }"/>
												<c:param name="keyword" value="${ sc.keyword }"/>
												<c:param name="readStatus" value="${  sc.readStatus }"/>
												<c:param name="currentPage" value="${ p }"/>
	            							</c:otherwise>
            							</c:choose>
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
								<c:choose>
         							<c:when test="${empty sc.condition && empty sc.keyword}">
         								<c:param name="readStatus" value="${  sc.readStatus }"/>
										<c:param name="currentPage" value="${  pi.currentPage +1 }"/>
         							</c:when>
         							<c:when test="${!empty sc.condition && !empty sc.keyword && empty sc.readStatus}">
         								<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="currentPage" value="${  pi.currentPage +1 }"/>
         							</c:when>
         							<c:otherwise>
         								<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="readStatus" value="${  sc.readStatus }"/>
										<c:param name="currentPage" value="${  pi.currentPage +1 }"/>
         							</c:otherwise>
        							</c:choose>
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
		$(function(){
			$("#readCondition").change(function(){
				if(${empty sc.keyword}){
					if($("#readCondition").val() =="all"){
						location.href="rlist.ma?currentPage=1";
					}else{
						location.href="search.ma?currentPage=1&readStatus="+$("#readCondition").val();
						
					}	
					
				}else{
					if($("#readCondition").val() =="all"){
						// $("#searchForm").submit();
						location.href="rlist.ma?currentPage=1";
					}else{
						var hidden = "<input type='hidden' name='readStatus' value='"+$("#readCondition").val()+"'>";
						$("#searchForm").append(hidden);
						$("#searchForm").submit();
						
					}
				}
					
				
			});
		});
		
		function checkAll(){
	  		if( $("#th_checkAll").is(':checked')){
	  			$("input[name=emailNo]").prop("checked",true);
	  			$("#read").attr("disabled", false);
	  			$("#delete").attr("disabled", false);
	  		}else{
	  			$("input[name=emailNo]").prop("checked",false);
	  			$("#read").attr("disabled", true);
	  			$("#delete").attr("disabled", true);
	  		}
	  	}
		
		$(function(){
			$("input[name=emailNo]").click(function(){
				if($("input[name=emailNo]").is(":checked")){
					$("#read").attr("disabled", false);
		  			$("#delete").attr("disabled", false);
				}else{
					$("#read").attr("disabled", true);
		  			$("#delete").attr("disabled", true);
				}
			});
		});
		
		function changeReadStatus(){
			var emailNo = new Array();
			$("input[name=emailNo]:checked").each(function(){
				emailNo.push($(this).val());
			});
			
			//console.log(emailNo);
			if(emailNo==""){
				alert("항목을 선택해 주세요.");
			}else{
				$.ajax({
					url:"changeRead",
					type:"post",
					data:{emailNo:emailNo},
					success:function(status){
						if(status="success"){
							location.href="rlist.ma?currentPage=1";
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
		
		function deleteMail(){
			var emailNo = new Array();
			$("input[name=emailNo]:checked").each(function(){
				emailNo.push($(this).val());
			});
			
			if(emailNo==""){
				alert("항목을 선택해 주세요.");
			}else{
				if(confirm("삭제하시겠습니까? 삭제된 항목은 휴지통으로 이동합니다.")){
					
					$.ajax({
						url:"deleteMail",
						type:"post",
						data:{emailNo:emailNo},
						success:function(status){
							if(status="success"){
								location.href="rlist.ma?currentPage=1";
							}else{
								alert("다시 시도해 주세요.");
							}
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});
				}else{
					$("input[name=emailNo]").prop("checked",false);
				}
				
			}
		}
		
		
	</script>
</body>

</html>