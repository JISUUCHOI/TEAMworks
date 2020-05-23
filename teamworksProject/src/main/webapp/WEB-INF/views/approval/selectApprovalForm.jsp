<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안문작성양식</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	#formOuter{
		width:1420px;
		position:relative;
	}
    /* 본문 */
    #formListArea{
        width:1000px;
        display:inline-block;
        position:absolute;
        margin:auto;
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
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>

    <!-- 본문 -->
    <div id="formOuter">
    	<div id="formListArea">
	        <h4>⊙ 기안문 작성</h4>
	        <hr>
	        <br>
	
	        <form id="schArea" action="">
	            <input type="search" id="schInput" name="formSch">
	            <button type="submit" id="schButton">검색</button>
	            
	        </form>
	
	        <br><br><br>
	        <table class="formList">
	            <thead>
	                <tr height="30">
	                    <th width="50">No.</th>
	                    <th width="70">즐겨찾기</th>
	                    <th width="80">구분</th>
	                    <th width="600">양식명</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr height="30">
	                    <td style="text-align:center;">1</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">문서결재</td>
	                    <td style="padding-left:40px;" class="form">기안서</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">2</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">경영지원</td>
	                    <td style="padding-left:40px;" class="form">경조비 신청서</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">3</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">경영지원</td>
	                    <td style="padding-left:40px;" class="form">휴가 신청서</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">4</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">경영지원</td>
	                    <td style="padding-left:40px;" class="form">제증명 신청서</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">5</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">문서결재</td>
	                    <td style="padding-left:40px;" class="form">양식1</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">6</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">문서결재</td>
	                    <td style="padding-left:40px;" class="form">양식2</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">7</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">문서결재</td>
	                    <td style="padding-left:40px;" class="form">양식3</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">8</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">문서결재</td>
	                    <td style="padding-left:40px;" class="form">양식4</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">9</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">문서결재</td>
	                    <td style="padding-left:40px;" class="form">양식5</td>
	                </tr>
	                <tr height="30">
	                    <td style="text-align:center;">10</td>
	                    <td style="text-align:center;" class="frequency">☆</td>
	                    <td style="text-align:center;">문서결재</td>
	                    <td style="padding-left:40px;" class="form">양식6</td>
	                </tr>
	            </tbody>
	        </table>
	        <br><br>
	
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

	<script>
		$(function(){
			$("#approveDoc>a").css("color", "dimgray");
			$("#approveDoc").css("border-bottom-style", "groove");
			$("#writeDoc>a").css("color", "deepskyblue");
		});	
	</script>

</body>
</html>