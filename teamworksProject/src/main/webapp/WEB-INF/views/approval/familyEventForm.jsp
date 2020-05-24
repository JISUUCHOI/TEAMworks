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
        #draftOuter{
            width:800px;
            height:1300px;
            /* float:left; */
            display:inline-block;
           	margin:auto;
            margin-top:50px;
            margin-left:500px;
            /* border:1px solid red; */
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
            text-align:center;
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
        #refSch{
            width:120px;
            height:20px;
            margin-left:10px;
        }
        #refBtn:hover{
        	background:lightsteelblue;
        	cursor:pointer;
        }
        #titleIput{
            width:600px;
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

        /* 파일첨부 */
        #fileTb{margin:auto;}
        #fileUpload{
            width:798px;
            height:100px;
            border:1px solid lightgrey;
            margin:auto;
            text-align:center;
            line-height:7;
            color:grey;
            font-size:12px;
        }
        #fileUpBtn{
            float:right;
            margin-right:20px;
        }
        #bodyWrapper{
        	width:1250px;
        	float:left;
        }
        
                #feName{
            width:120px;
            margin-left:10px;
            margin-right: 10px;
        }
        #fePrice{
            width:120px;
            margin-left:10px;
            margin-right: 10px;
        }
        #feDate{
            width: 120px;
            margin-left:10px;
            margin-right: 10px;
        }
        #fePlace{
            width:300px;
            margin-left:20px;
            margin-right: 20px;
        }
        #feAccount{
            width: 120px;
            margin-left:10px;
            margin-right: 10px;
        }
        #feAccountName{
            width: 120px;
            margin-left:10px;
            margin-right: 10px;
        }
        #bank{
            width: 60px;
            text-align:center;
        }
        #feSq{
            width: 60px;
            text-align:center;
        }
        #feRelation{
            width: 60px;
            text-align:center;
        }
        
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<jsp:include page="approvalSidebar.jsp"/>
	<div id="bodyWrapper">
	    <div id="draftOuter">
	
	        <h4>⊙ 기안문 작성</h4>
	        <hr>
	        <br>
	
	        <form id="docForm" action="">
	            <!-- 버튼들 -->
	            <div id="btns">
	                <button type="button" id="approveLineBtn">결재선</button>
	                <button type="submit" id="approveBtn">결재요청</button>
	                <button type="button" id="cancelBtn">취소</button>
	            </div>
	            <br><br><br>
	
	            <h1 style="text-align:center;">기안서</h1>
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
	                <tr width="1000">
	                    <td width="200" class="th">문서번호</td>
	                    <td width="200">자동부여</td>
	                    <td width="200" class="th">기안일자</td>
	                    <td width="200">2020.05.07</td>
	                </tr>
	                <tr>
	                    <td class="th">기안자</td>
	                    <td>이용석</td>
	                    <td class="th">기안부서</td>
	                    <td>개발팀</td>
	                </tr>
	                <tr>
	                    <td class="th">참조자</td>
	                    <td>
	                        <input type="text" id="refSch">
	                        <button type="button" id="refBtn">참조</button>
	                    </td>
	                    <td class="th">마감일자</td>
	                    <td>2020.06.07</td>
	                </tr>
	                <tr>
	                    <td class="th">제목</td>
	                    <td colspan="3"><input type="text" id="titleIput" placeholder="내용을 입력해주세요"></td>
	                </tr>
	            </table>
				
				<br><br>
				
	            <table class="docContents">
	                <tr width="">
	                    <td width="100" class="th">문서번호</td>
	                    <td width=""><input type="date" id="feDate"></td>
	                    <td width="100" class="th">경조구분</td>
                        <td width="100"><select name="feSq" id="feSq">
                             <option value="">결혼</option>
                             <option value="">환갑</option>
                             <option value="">칠순</option>
                             <option value="">사망</option>
                        </select>
                        </td>
                        <td width="100" class="th">가족관계</td>
	                    <td width="100"><select name="feRelation" id="feRelation">
                            <option value="">결혼</option>
                            <option value="">환갑</option>
                            <option value="">칠순</option>
                            <option value="">사망</option>
                        </select>
                        </td>
	                </tr>
	                <tr>
	                    <td class="th">대상자 성명</td>
	                    <td><input type="text" id="feName" placeholder="내용을 입력해주세요"></td>
	                    <td class="th">경조일자</td>
                        <td width=""><input type="date" id="feDate"></td>
                        <td width=""><input type="date" id="feDate"></td>
	                </tr>
	                <tr>
	                    <td class="th">신청금액</td>
	                    <td><input type="text" id="fePrice" placeholder="내용을 입력해주세요"></td>
	                    <td class="th">경조장소</td>
	                    <td colspan="3"><input type="text" id="fePlace" placeholder="내용을 입력해주세요"></td>
	                </tr>
	                <tr width="">
	                    <td width="" class="th">은행</td>
	                    <td width="100"><select name="bank" id="bank">
                            <option value="">신한</option>
                            <option value="">국민</option>
                            <option value="">농협</option>
                            <option value="">우리</option>
                        </select>
                        </td>
	                    <td width="" class="th">계좌번호</td>
                        <td><input type="text" id="feAccount" placeholder="내용을 입력해주세요"></td>
                        <td width="" class="th">예금주</td>
                        <td><input type="text" id="feAccountName" placeholder="내용을 입력해주세요"></td>
	                </tr>
	            </table>
	
	        </form>
	
	    </div>
	</div>
</body>
</html>