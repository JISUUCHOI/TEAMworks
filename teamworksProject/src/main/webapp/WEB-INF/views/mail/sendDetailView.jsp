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
       		$("#sm>a").css("color", "deepskyblue");
       	});
     </script>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarMail.jsp"/>
  <div class="outer" align="center">
        <div class="inner">
            <div class="row">
                <div class="col-lg-12 text-left">
                    <h3 class="page-header"><i class="fas fa-envelope"></i>&nbsp; [제목] &nbsp;${mailList[0].mailTitle }</h3>
                </div>
            </div>
            <table class="table table-bordered">
                <tr>
                    <th width="100px">제목</th>
                    <td>${mailList[0].mailTitle }</td>
                </tr>
                <tr>
                    <th>받는사람</th>
                    <td>
                    <c:forEach var="m" items="${ mailList }">
                    	<c:if test="${ m.refType eq 'T' }">
		                    [${m.recipientsName}]&nbsp;${ m.recipientsEmail }
                    	</c:if>
                    </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>참조</th>
                    <td>
                    <c:forEach var="m" items="${ mailList }">
	                    	<c:if test="${ m.refType eq 'C' }">
			                    [${m.recipientsName}]&nbsp;${ m.recipientsEmail }
	                    	</c:if>
                    </c:forEach>
                    </td>
                </tr> 
                <tr>
                    <th>숨은참조</th>
                    <td>
                     <c:forEach var="m" items="${ mailList }">
                    	<c:if test="${ m.refType eq 'B' }">
		                    [${m.recipientsName}]&nbsp;${ m.recipientsEmail }
                    	</c:if>
                    </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                    	<c:choose>
                    		<c:when test="${ !empty attachList  }">
                    			<c:forEach var="a" items="${ attachList }">
                            			<a href="${ pageContext.servletContext.contextPath}/resources/mailUploadFiles/${ a.changeFileName }" download="${ a.originFileName }">${  a.originFileName }</a><br>
                            	</c:forEach>
                    		</c:when>
                    		<c:otherwise>
                    			첨부파일 없음
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </td>
                </tr>
                <tr height="300px">
                    <td colspan="2">
                        <div class="">
                        ${mailList[0].mailContent }
                        </div>
                    </td>
                </tr>
            </table>
            <div class="row">
                <div class="col-xs-10"></div>
                <div class="col-xs-1">
                    <button class="btn btn-default" onclick="location.href='slist.ma?currentPage=1'">목록</button>
                </div>
                <div class="col-xs-1">
                    <button class="btn btn-danger" onclick="deleteSmail();">삭제</button>
                </div>
            </div>
        </div>
    </div>
    <script>
    	function deleteSmail(){
    		var emailNo = ${ mailList[0].emailNo}
    		var empId = '${loginUser.empId}'
    		if(confirm("삭제하시겠습니까?")){
    	 		$.ajax({
        			url:"delSmail",
        			data:{emailNo:emailNo, empId:empId},
        			type:"post",
        			success:function(status){
        				if(status=="success"){
        					location.href="slist.ma?currentPage=1"
        				}else{
        					alert("아 실패했다.");
        				}
        			},
        			error:function(){
        				console.log("sendMailDelete ajax fail");
        			}
        			
      
        		});
    		}
    		
   
    	}
    	
    </script>
    
</body>
</html>