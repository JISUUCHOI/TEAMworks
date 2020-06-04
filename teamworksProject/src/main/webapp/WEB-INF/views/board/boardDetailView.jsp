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
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
         .outer{
			width:1250px;
			float:left;
			margin-left:220px;
			margin-top:50px;
		
		 }
        .inner{width: 900px;}
        .inner2{width: 900px; background-color:rgb(212, 239, 240); padding: 20px; border-radius: 5px;}
        .recommend{
            border: 1px solid lightblue; 
            border-radius: 5px;
            width: 60px; height: 60px;
            padding: 3px;
        }
        .recommend>a{
            text-decoration: none;
        }
        #tables *{margin: 5px;}
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarBoard.jsp"/>
 <div class="outer" align="center">
        <div class="inner">
            <h4>공지사항</h4>
            
            <br>
            <table class="table text-center">
                <tr>
                    <td>
                    	<c:if test="${ loginUser.empId eq b.empId }">
                        	<button type="button" class="btn btn-primary btn-sm" style="margin-right: 20px;" onclick="postFormSubmit(1);">수정</button>
                        	<button type="button" class="btn btn-danger btn-sm"  style="margin-right: 20px;" onclick="postFormSubmit(2);">삭제</button>  
                     	</c:if>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                  <button style="float: right;" class="btn btn-default" onclick="location.href='list.bo?currentPage=1&cat='+${b.boardCategory}">목록</button>
                	</td>
                </tr>
                <tr>
                    <td colspan="5"></td>
                </tr>
                <tr>
                    <td><b>제목</b></td>
                    <td colspan="3">${ b.boardTitle }</td>
                    <td rowspan="2" align="center" width="200px">
                        <div class="recommend" id="recommend">
                            <a id="recommend" href="#a" class="" > 							
                                <p class="num"><span id="recommendCount">0+</span></p>							   
                                <p class="doc"><i class="far fa-thumbs-up"></i> 추천</p>
                            </a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="200px"><b>작성자</b></td>
                    <td align="left">${ b.empName }</td>
                    <td width="200px"><b>등록일</b></td>
                    <td align="left">${ b.createDate }</td>
                </tr>
                <tr>
                    <td colspan="5" align="left" height="300px">
                       ${b.boardContent}
                    </td>
                </tr>
                <tr>
                    <td colspan="5"  align="left">
                        <div>
                       	 <b>첨부파일</b> <br>
                            <c:choose>
                            	<c:when test="${ !empty attachList}">
                            		<c:forEach var="a" items="${ attachList }">
                            			<a href="${ pageContext.servletContext.contextPath}/resources/boardUploadFiles/${ a.baChangeName }" download="${ a.baOriginName }">${ a.baOriginName }</a><br>
                            		</c:forEach>
                            	</c:when>
                            	<c:otherwise>
                            		첨부파일이 없습니다.
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="inner2">
            <table id="replyTables" width="800px">
                <thead>
                <tr>
                    <td><i class="far fa-comments" style="color: rgb(43, 93, 228);"></i><span id="rCount">0</span></td>
                </tr>
                    <tr>
                        <th colspan="2"> 
                            <textarea class="form-control" name="" id="replyContent" cols="30" rows="2" style="resize: none; width: 100%;"></textarea>
                        </th>
                      
                    </tr>
                    <tr>
                        <td style="text-align: right;">
                            <button type="button" id="addReply" class="btn btn-info"><i class="fas fa-comment-dots"></i></button>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
              
    </div>
     <form id="postForm" action="" method="post">
       	<input type="hidden" name="bno" value="${ b.boardNo }">
       	<input type="hidden" name="cat" value="${ b.boardCategory }">
     </form>
     <script>
     	function postFormSubmit(num){
     		if(num == 1){ // 수정하기
   				$("#postForm").attr("action","updateForm.bo");
   			}else{ // 삭제하기
   				$("#postForm").attr("action","delete.bo");
   			}
   			
   			$("#postForm").submit();
     	}
     	$(document).ready(function() {
			$.ajax({
				url:"confirmLike.bo",
				data:{boardNo:${ b.boardNo}, empId:'${loginUser.empId}'},
				type:"post",
				success:function(result){
					if(result =="y"){
						$("#recommendCount").text("1+");
					}else{
						$("#recommendCount").text("0+");
					}
				},
				error:function(){
					console.log("ajax실패");
				}
			});
     		
			selectReplyList();
     	});
     	
     	function selectReplyList(){
     		
     		$.ajax({
     			url:"rlist.bo",
     			data:{bno:${b.boardNo}},
     			type:"post",
     			success:function(list){
     				
     				var value="";
     				for(var i in list){
     					value+="<tr><td><hr><input type='hidden' name='replyNo' value='"+ list[i].replyNo + "'></td></tr>" +
     						   "<tr>"+ 
     						    	"<td>"+list[i].empName+ " | " + list[i].deptName+  " | " + list[i].createDate +
     									"<span><i class='far fa-edit'></i> <i class='far fa-trash-alt'></i> </span>"+
     								"</td>"+
     							"</tr>"+
     							"<tr>" +
     								"<td>" + list[i].replyContent + "</td>"+
     							"</tr>"
     				
     				}
     				
     				$("#rCount").text(list.length);
     				$("#replyTables>tbody").html(value);
     				
     			},
     			error:function(){
     				console.log("통신 실패");
     			}
     			
     		});
     	}
     	
     	$(function(){
     		$("#recommend").on('click',function(){
     			if(confirm("추천하시겠습니까?")){
     				$.ajax({
     					url:"like.bo",
     					data:{boardNo:${ b.boardNo}, empId:'${loginUser.empId}'},
     					type:"post",
     					success:function(result){
     						if(result=="success"){
     							$("#recommendCount").text("");
     							$("#recommendCount").text("1+");
     						}else if(result=="fail"){
     							alert("이미 추천하셨습니다.");
     						}else{
     							alert("오류입니다.");
     						}
     						
     					},
     					error:function(){
     						console.log("추천 ajax통신 실패");
     					}
     					
     				});
     			}
     		});
     		
     		$("#addReply").click(function(){
     			$.ajax({
     				url:"rinsert.bo",
     				data:{
     					replyWriter:"${loginUser.empId}",
     					replyContent:$("#replyContent").val(),
     					refBoardNo:${b.boardNo}
     				},
     				success:function(status){
     					if(status=="success"){
     						$("#replyContent").val("");
     						selectReplyList();
     					}else{
     						alert("댓글 등록 실패!!");
     					}
     				},
     				error:function(){
     					console.log("댓글 insert ajax 통신 실패");
     				}
     			});
     		});
     	});
     </script>
</body>
</html>