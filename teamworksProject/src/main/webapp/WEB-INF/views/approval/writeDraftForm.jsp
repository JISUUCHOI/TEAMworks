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
	                    <td colspan="3"><input type="text" id="titleIput"></td>
	                </tr>
	            </table>
	
	            <!--썸머노트-->
	            <div id="summernote"></div>
				<script>
				$(document).ready(function() {
					$('#summernote').summernote({
	      				  placeholder: '내용을 입력하세요',
	      				  tabsize: 2,
	      				  height: 300,
	      				  toolbar: [
	       				   ['style', ['style']],
	        				  ['font', ['bold', 'underline', 'clear']],
	       				   ['color', ['color']],
	        				  ['para', ['ul', 'ol', 'paragraph']],
	        				  ['table', ['table']],
	        				  ['insert', ['link', 'picture', 'video']],
	         				 ['view', ['fullscreen', 'codeview', 'help']]
	       				 ]
	    				  });
					
				});
   				   
   				</script>

	            
	
	            <!--파일첨부-->
	            <br><br>
	            <h4>⊙ 파일업로드</h4>
	            <hr>
	            <br>
	
	            <table id="fileTb">
	                <tr>
	                    <td width="600px">파일명</td>
	                    <td width="200px">크기</td>
	                </tr>
	            </table>
	            <div id="fileUpload">
	               	 이곳에 파일을 드래그 하세요.
	            </div>
	            <br>
	            <button type="button" id="fileUpBtn">파일첨부</button>
	
	        </form>
	
	    </div>
	</div>
</body>
</html>