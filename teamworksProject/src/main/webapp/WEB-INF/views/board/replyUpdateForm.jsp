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
	#inner{
		margin-top:20px;
	}
	#btns{
		margin: 10px;
	}
	#btns>button{
		margin-right:20px;
	}
</style>
</head>
<body>
	<div id="outer" align="center">
		<div id="inner">
	    	<textarea class="form-control" name="replyContent" id="replyContent" cols="30" rows="2" style="resize: none; width: 90%;">${ updateReply.replyContent }</textarea>	
			<div id="btns" align="right">
				<button class="btn btn-info btn-sm" id="updateReply">수정</button>
				<button onclick="window.close();" class="btn btn-default btn-sm">취소</button>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			
			$("#updateReply").click(function(){
				$.ajax({
					url:"updateReply.bo",
					data:{
						replyNo:${updateReply.replyNo},
						replyContent:$("#replyContent").val()
					},
					type:"post",
					success:function(result){
						if(result=="success"){
							opener.parent.location.reload();
							window.close();
						}else{
							alert("수정에 실패하였습니다.");
						}
					},
					error:function(){
						console.log("ajax 실패");
					}
				});
			
			});
			
		});
	</script>
</body>
</html>