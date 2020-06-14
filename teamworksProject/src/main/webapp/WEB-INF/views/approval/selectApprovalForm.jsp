<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안문작성양식</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
	html, body{height:100%;}	
	#formOuter{
		width:1250px;
		height:100%;
		float:left;
	}
    /* 본문 */
    #formListArea{
        width:1000px;
	    height:670px;
	    margin:auto;
	    margin-top:50px;
    }
    /* 조회버튼 */
    #schArea{
        width:180px;
        float:right;
    }
    #schInput{
        width:120px;
        height:28px;
        float:left;
    }
    #schButton{
        width:40px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:13px;
    }
    #schButton:hover{
        background:cornflowerblue;
        cursor:pointer;
    }

    /*양식 리스트*/
    .formList{margin:auto;}
    .formList tr{height:35px;}
    .formList, .formList>tbody>tr{
        border-top: 1px solid lightgrey;
        border-bottom: 1px solid lightgrey;
        border-collapse: collapse;
        font-size:13px;
    }
    .formList th{text-align:center;}
    .formList>thead>tr{
        border-top-style:groove;
        border-bottom-style:groove;
    }
    .formList>tbody>tr:hover{
        background:lightsteelblue;
        color:white;
    }

    .form, .frequency{
        cursor:pointer;
    }

    /* 페이징바 */
    #pagingArea>a{
        font-size:13px;
    }
    .page{
        text-decoration:none;
        color:rgb(7, 53, 90);
        display:inline-block;
        border:1px solid rgb(7, 53, 90);
        width:20px;
        height:20px;
        text-align:center;
        font-weight:500;
    }
    .page:hover{
        color:cornflowerblue;
        border-color:cornflowerblue;
        cursor:pointer;
    }

	input[type=text],input[type=password]{}
    *{margin:0;padding:0;font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
    body{font-size:12px;color:#555;background:transparent;-webkit-user-select:none;-moz-user-select:none;-webkit-text-size-adjust:none;-moz-text-size-adjust:none;-ms-text-size-adjust:none}
    ol,ul{list-style:none} 
    img{border:0 none;vertical-align:middle}
    
    .dlName{cursor:pointer;}
    .dlLike{cursor:pointer;}




	

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>

    <!-- 본문 -->
    <div id="formOuter">
    	<div id="formListArea">
	        <h3>⊙ 기안문 작성</h3>
	        <br>
	        <hr>
	        <br>
	
	        <form id="schArea" action="searchDoc.ap">
	            <input type="search" id="schInput" name="formSch">
	            <button type="submit" id="schButton">검색</button>
	            
	        </form>
	
	        <br><br><br>
	        <table class="formList">
	            <thead>
	                <tr height="30">
	                    <th width="100">No.</th>
	                    <th width="100">즐겨찾기</th>
	                    <th width="100">구분</th>
	                    <th width="700">양식명</th>
	                </tr>
	            </thead>
	            <tbody>
                	<c:forEach var="d" items="${ list }">
	                    <tr>
	                        <td style="text-align:center;">${ d.dlNo }</td>
	                        <c:choose>
	                        	<c:when test="${ d.dlLike  eq '0'}">
	                        		<td style="text-align:center;" class="dlLike"><i class="far fa-star"></i></td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td style="text-align:center;" class="dlLike"><i class="fas fa-star"></i></td>
	                        	</c:otherwise>	
	                        </c:choose>	
	                        <td style="padding-left:30px;">${ d.dlForm }</td>
	                        <td style="text-align:center;" class="dlName">${ d.dlName }</td> 
	                    </tr>
                   </c:forEach>
	            </tbody>
	        </table>
	        <br><br><br>
	        

	        <script>

        	$(function(){
        		$(".dlName").click(function(){
        			location.href="insertDoc.ap?doc=" + $(this).text();
        		});
        	});	
        	
        	$(function(){
        		$(".dlLike").click(function(){
        			location.href="insertDoc.ap?doc=" + $(this).text();
        		});
        	});	

  			</script>

	
	        <!-- 페이징바 -->
	        <div id="pagingArea" align="center">
	            <a class="page">&lt;</a>
	            <a class="page">1</a>
	            <a class="page">2</a>
	            <a class="page">3</a>
	            <a class="page">4</a>
	            <a class="page">&gt;</a>
	        </div>
	
		</div>
    </div>
    
    <!-- form 클릭시 이동 
    <script>
    	$(function(){
    		$(".form").click(function(){
    			
    			a.href="writeDaft.ap";   			
    		});
    	});
    </script>
    	-->

	<script>
		$(function(){
			$("#approveDoc>a").css("color", "dimgray");
			$("#approveDoc").css("border-bottom-style", "groove");
			$("#writeDoc>a").css("color", "deepskyblue");
		});	
	</script>
	
	

</body>
</html>

