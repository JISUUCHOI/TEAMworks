<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안서작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
	/* 전체윤곽 */
	html, body{height:100%;}
	
	#familyEventWrapper{
		width:1250px;
		height:100%;
		float:left;
	}
	#draftOuter{
	    width:800px;
	    height:850px;
	   	margin:auto;
	    margin-top:50px;
	}
	
	/* 버튼 */
	#btns{
	    width:200px;
	    float:right;
	}
	#approveLineBtn, #approveBtn, #fileUpBtn{
	    width:60px;
	    height:28px;
	    background: rgb(7, 53, 90);
	    color:white;
	    border:none;
	    font-size:12px;
	}
	#approveLineBtn:hover, #approveBtn:hover, #fileUpBtn:hover, #refBtn:hover{
	    background:deepskyblue;
	    cursor:pointer;
	}
	#cancelBtn{
	    width:60px;
	    height:28px;
	    background:white;
	    border:1px solid rgb(7, 53, 90);
	    font-size:12px;
	    font-weight:600;
	    cursor:pointer;
	}
	
	/* 결재선 */
	#appoveLine{
	    float:right;
	}
	#approveLineTb, #approveLineTb tr, #approveLineTb td, #approveLineTb th{
	    border:1.2px solid lightgrey;
	    border-collapse: collapse;
	    font-size:12px;
	}
	#approveLineTb{
	    text-align:center;
	}
	
	/* 기안문서 */
	.docContents{margin:auto;}
	.docContents, .docContents tr, .docContents td{
	    border-collapse: collapse;
	    font-size:13px;
	}
	.docContents tr, #fileTb{
	    height:35px;
	    border-top:1px solid lightgrey;
	    border-bottom:1px solid lightgrey;
	}
	.th, #fileTb{
	    background:lightsteelblue;
	    color:white;
	    font-weight:600;
	    text-align:center;
	    font-size:13px;
	}
	#refSch, #apprveEndDate{
	    width:120px;
	    height:20px;
	    margin-left:10px;
	}
	#refBtn:hover{
		background:lightsteelblue;
		cursor:pointer;
	}
	#titleInput{
	    width:580px;
	    height:20px;
	    margin-left:10px;
	}
	#refBtn{
	    width:40px;
	    height:26px;
	    background: rgb(7, 53, 90);
	    border:none;
	    color:white;
	    margin-left:5px;
	    margin-right:10px;
	    font-size:12px;
	}
	
	/* 경조비신청서 */
	#familyEventTb input, #familyEventTb span{
	    height:20px;
	    float:left;
	    margin-left:10px;
	}
	#familyEventTb select{
	    margin-left:10px;
	    height:25px;
	    width:70px;
	}
	#feName, #fePrice, #feDate, #feStartDate, #feEndDate, #feAccountName{
	    width:120px;
	}
	#fePlace{
	    width:300px;
	}
	#feAccount{
	    width: 170px;
	}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>
	
	<div id="familyEventWrapper">
		<div id="draftOuter">
	
	        <h4>⊙ 기안문 작성</h4>
	        <hr>
	        <br>
	
	        <form id="docForm" action="insertFe.ap" method="post">
	            <!-- 버튼들 -->
	            <div id="btns">
	                <button type="button" id="approveLineBtn">결재선</button>
	                <button type="submit" id="approveBtn">결재요청</button>
	                <button type="button" id="cancelBtn">취소</button>
	            </div>
	            <br><br><br>
	
	            <h1 style="text-align:center;">경조비신청서</h1>
	            <br>
	
	            <!-- 결재선 -->
	            <div id="appoveLine">
	                <table id="approveLineTb">
	                    <tr height="20">
	                        <td rowspan="2" width="20">결<br>재</td>
	                        <td width="70">기안</td>
	                    </tr>
	                    <tr height="70">
	                        <td>최해성</td>
	                    </tr>
	                </table>
	            </div>
	            <br><br><br><br><br><br><br><br>
	
	            <!-- 기안문서 -->
	            <table class="docContents">
	                <tr>
	                    <td width="200" class="th">문서번호</td>
	                    <td width="200" style="text-align:center;">자동부여</td>
	                    <td width="200" class="th">기안일자</td>
	                    <td width="200" style="text-align:center;">2020.05.07</td>
	                </tr>
	                <tr>
	                    <td class="th">기안자</td>
	                    <td style="text-align:center;">이용석</td>
	                    <td class="th">기안부서</td>
	                    <td style="text-align:center;">개발팀</td>
	                </tr>
	                <tr>
	                    <td class="th">참조자</td>
	                    <td>
	                        <input type="text" id="refSch">
	                        <button type="button" id="refBtn">참조</button>
	                    </td>
	                    <td class="th">마감일자</td>
	                    <td><input type="date" id="apprveEndDate"></td>
	                </tr>
	                <tr>
	                    <td class="th">제목</td>
	                    <td colspan="3"><input type="text" id="titleInput"></td>
	                </tr>
	            </table>
				
				<br><br>
                
                <!-- 경조비신청서 -->
	            <table class="docContents" id="familyEventTb">
	                <tr width="">
	                    <td width="100" class="th">신청일자</td>
	                    <td width="150"><input type="date" id="feDate"></td>
	                    <td width="100" class="th">경조구분</td>
                        <td width="200">
                            <select name="familyEvent" id="feSq">
                                <option value="marriage">결혼</option>
                                <option value="sixty">환갑</option>
                                <option value="seventy">칠순</option>
                                <option value="funeral">사망</option>
                            </select>
                        </td>
                        <td width="100" class="th">가족관계</td>
	                    <td width="150">
                            <select name="relation" id="feRelation">
                                <option value="oneself">본인</option>
                                <option value="parents">부모님</option>
                                <option value="spouse">배우자</option>
                                <option value="children">자녀</option>
                                <option value="siblings">형제자매</option>
                            </select>
                        </td>
	                </tr>
	                <tr>
	                    <td class="th">대상자 성명</td>
	                    <td><input type="text" id="feName"></td>
	                    <td class="th">경조일자</td>
                        <td colspan="2"><input type="date" id="feStartDate"> <span>~</span> <input type="date" id="feEndDate"></td>
	                </tr>
	                <tr>
	                    <td class="th">신청금액</td>
	                    <td><input type="text" id="fePrice"></td>
	                    <td class="th">경조장소</td>
	                    <td colspan="3"><input type="text" id="fePlace"></td>
	                </tr>
	                <tr>
	                    <td class="th">은행</td>
	                    <td>
                            <select name="bank" id="bank">
                                <option value="">신한</option>
                                <option value="">국민</option>
                                <option value="">농협</option>
                                <option value="">우리</option>
                            </select>
                        </td>
	                    <td class="th">계좌번호</td>
                        <td><input type="text" id="feAccount"></td>
                        <td class="th">예금주</td>
                        <td><input type="text" id="feAccountName"></td>
	                </tr>
	            </table>
	        </form>
	
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