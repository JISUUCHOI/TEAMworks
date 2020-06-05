<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body{height:100%;}
	div{box-sizing:border-box;}
	
	#sidebarOuter{
		width:250px;
		height:100%;
		float:left;
        background:rgb(7, 53, 90);
	}
	
	/* 사이드바 */
    #sidebar{
        width:250px;
        height:100%;
        float:left;
        padding-top:20px;
    	position:absolute;
    }
    
    .category{
        width:300px;
        height:40px;
        line-height:2;
        margin-top:20px;
        padding-left:60px;
        /* font-family: 'Handon3gyeopsal300g'; */
        font-family: 'JSDongkang-Regular';
        color:white;
        font-size:20px;
    }
    .subCate{
        width:250px;
        height:35px;
        padding-left:60px;
        line-height:2;
        /* font-family: 'Handon3gyeopsal300g'; */
        font-family: 'JSDongkang-Regular';
        cursor:pointer;
        font-size:17px;
    }
    .subCate>a{text-decoration:none; color:white;}
    .subCate>a:hover, #logout>a:hover, #messenger>a:hover{
        color:deepskyblue;
    }
    .subCate>span{
        color:red;
    }

</style>
</head>
<body>

	<div id="sidebarOuter">
		<!-- 사이드바 -->
        <div id="sidebar">
            <div id="messenger"><a href=""><img src="${ pageContext.servletContext.contextPath }/resources/icons/messenger.png"width="20px"> messenger</a></div>
            <div id="logout"><a href="">logout</a></div>
            
            <div class="category">기안</div>
            <div class="subCate" id="writeDoc"><a href="formList.ap">기안문작성</a></div>
            <div class="subCate" id="requestApprove"><a href="docList.ap?approveStatus=11">결재요청함</a></div>
            <div class="subCate" id="callbackDoc"><a href="docList.rap?approveStatus=5&currentPage=1">결재회수함</a></div>
            <div class="category">결재</div>
            <div class="subCate" id="readyForApprove"><a href="docList.rap?approveStatus=0&currentPage=1">결재대기함</a> <span><b>1</b></span></div>
            <div class="subCate" id="pendingApprove"><a href="docList.rap?approveStatus=1&currentPage=1">결재진행함</a> <span><b>1</b></span></div>
            <div class="subCate" id="doneApprove"><a href="docList.rap?approveStatus=2&currentPage=1">완료문서함</a> <span><b>1</b></span></div>
            <div class="subCate" id="refuseApprove"><a href="docList.rap?approveStatus=3&currentPage=1">반려문서함</a> <span><b>1</b></span></div>
            <div class="subCate" id="refDoc"><a href="docList.ap?approveStatus=22">참조문서함</a> <span><b>1</b></span></div>
            <div class="subCate" id="requestCallback"><a href="docList.rap?approveStatus=4&currentPage=1">회수요청함</a> <span><b>1</b></span></div>
        </div>
   </div>
   
   <script>
	   $(function(){
		    $("#approveDoc>a").css("color", "dimgray");
		    $("#approveDoc").css("border-bottom-style", "groove");
	   });
   </script>

</body>
</html>