<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.SimpleDateFormat"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   Date date = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd");
%>
<html>
<head>
<meta charset="UTF-8">
<title>기안서작성</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <style>
        /* 전체윤곽 */
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
        #titleInput{
            width:600px;
            height:20px;
            margin-left:10px;
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
        
	/* 참조 모달용 스타일!!!! */
    /* 전체윤곽 */
    #approveLineOuter{
        width:700px;
        height:500px;
        margin:auto;
    }
    /* 조직도 */
    #orgChart{
        width:50px;
        height:30px;
        float:left;
        border:none;
        background:rgb(7, 53, 90);
        color:white;
        font-family:'Handon3gyeopsal300g';
        cursor:pointer;
        font-size:12px;
        float:left;
    }
    #sch{
        width:50px;
        height:30px;
        border:1px solid rgb(7, 53, 90);
        background:white;
        color:rgb(7, 53, 90);
        font-family:'Handon3gyeopsal300g';
        cursor:pointer;
        font-size:12px;
    }

    #chart-container, #sch-container{
        width:300px;
        height:450px;
        border:1px solid rgb(7, 53, 90);
        font-family: 'Handon3gyeopsal300g';
        float:left;
        font-size:13px;
    }
    .tree1, .tree2, .tree3{cursor:pointer;}
    .tree1{
        margin:10px 0px 5px 15px;
    }
    .tree2{
        margin:10px 0px 5px 45px;
        display:none;
    }
    .tree31, .tree32{
        margin-top:2px;
        margin-left:50px;
        display:none;
    }
    .tree31>span, .tree32>span{
        line-height:180%;
    }
    /* 검색 */
    #schBox{
        width:270px;
        height:55px;
        border:1px solid rgb(7, 53, 90);
        margin:10px 10px 5px 13px;
        padding:10px 0px 0px 15px;
    }
    #schInput{
        width:150px;
        height:28px;
    }
    #schBtn{
        width:40px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:12px;
    }
    #schBtn:hover{
        background:lightsteelblue;
        cursor:pointer;
    }
    #empListArea{
        width:280px;
        height:300px;
        margin-left:10px;
    }

    #empList{
        margin-top:20px;
        margin-left:5px;
        text-align:center;
    }
    #empList, #empList>tbody>tr{
        border-top: 1px solid lightgrey;
        border-bottom: 1px solid lightgrey;
        border-collapse: collapse;
        font-size:12px;
    }
    #empList th{text-align:center;}
    #empList>thead>tr{
        border-top-style:groove;
        border-bottom-style:groove;
    }
    #empList tr{height:28px;}
    #empList>tbody>tr:hover{
        background:lightsteelblue;
        color:white;
    }
    .chk{margin-top:3px;}

    /* 선택/취소 */
    #chooseCancel{
        width:30px;
        height:100px;
        margin:140px 10px 0px 10px;
        float:left;
    }
    .choose{
        border-radius:50%;
        border:1.2px solid rgb(7, 53, 90);
        width:30px;
        height:30px;
        color:rgb(7, 53, 90);
        font-weight:600;
        text-align:center;
        line-height:1.5;
        margin-top:10px;
        cursor:pointer;
    }

    /* 참조자 */
    #refEmpList{
        width:340px;
        height:450px;
        border:1px solid rgb(7, 53, 90);
        font-family: 'Handon3gyeopsal300g';
        float:left;
    }
    #selectedEmp{
        width:310px;
        height:380px;
        border:1px solid rgb(7, 53, 90);
        margin:10px 10px 5px 13px;
        padding:10px 0px 0px 10px;
        font-size:13px;
    }
    .refedEmpName, .refedEmpDept{
    	cursor:pointer
    }
    
    
    /* 버튼 */
    #approveLineBtns{
        width:110px;
        height:30px;
        float:left;
        margin-top:10px;
        margin-left:530px;
    }
    #lineApplyBtn{
        width:50px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:13px;
        margin-top:2px;
    }
    #lineCancelBtn{
        width:50px;
        height:28px;
        background:white;
        border:1px solid rgb(7, 53, 90);
        font-size:12px;
        font-weight:600;
        cursor:pointer;
        margin-left:5px;
    }
    #lineApplyBtn:hover{
        background:lightsteelblue;
        cursor:pointer;
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
	
	        <form id="docForm" method="post" action="draftInsert.ap" enctype="multipart/form-data">
	            <!-- 버튼들 -->
	            <div id="btns">
	                <button type="button" id="approveLineBtn">결재선</button>
	                <button type="submit" id="approveBtn">결재요청</button>
	                <button type="button" id="cancelBtn">취소</button>
	            </div>
	            <br><br><br>
	
	            <h1 style="text-align:center;">기안서</h1>
	            <input type="hidden" name="docSc" value="기안서">
	            <br>
	
	            <!-- 결재선 -->
	            <div id="appoveLine">
	                <table id="approveLineTb">
	                    <tr height="20">
	                        <td rowspan="2" width="20">결<br>재</td>
	                        <td width="70">기안</td>
	                    </tr>
	                    <tr height="70">
	                        <td>${ loginUser.empName }</td>
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
	                    <td width="200"><jsp:useBean id="docDate" class="java.util.Date" />
										<fmt:formatDate value="${docDate}" pattern="yyyy-MM-dd" var="docDate" /><c:out value="${docDate}"/>
										<input type="hidden" id="docDate" name="docDate" value="${ docDate}">
	                </tr>
	                <tr>
	                    <td class="th">기안자</td>
	                    <td>${ loginUser.empName }</td>
	                    <input type="hidden" id="empId" name="empId" value="${ loginUser.empId }">
	                    <td class="th">기안부서</td>
	                    <td>${ loginUser.deptName }</td>
	                    <td><input type="hidden" id="docDepartment" name="docDepartment" value="${ loginUser.deptName }" readonly></td>
	                </tr>
	                <tr>
	                    <td class="th">참조자</td>
	                    <td>
	                    	<input type="hidden" id="refedId" name="docReference">
	                        <input type="text" id="refSch"  readonly>
	                        <button type="button" id="refBtn" data-toggle="modal" data-target="#refEmp">참조</button>
	                    </td>
	                    <td class="th">마감일자</td>
	                    <td><jsp:useBean id="docEnd" class="java.util.Date"/>
							<jsp:setProperty name="docEnd" property="date" value="${docEnd.date + 7}"/>
							<fmt:formatDate value="${docEnd}" pattern="yyyy-MM-dd" var="docEnd"/><c:out value="${docEnd}"/>
							<input type="hidden" id="docEnd" name="docEnd" value="${ docEnd}">
	                </tr>
	                <tr>
	                    <td class="th">제목</td>
	                    <td colspan="3"><input type="text" id="titleInput" name="docTitle" placeholder="내용을 입력해주세요" required></td>
	                </tr>
	            </table>
	
	            <!--썸머노트-->
	            <textarea id="summernote" name="docContent"></textarea>
	            
				
				
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
	        			 ['insert', ['link']],
	         			 ['view', ['fullscreen', 'codeview', 'help']]
	       				]
	    			  });

					$('.fileUpload').on("dragover drop",
							function(e) {
								$(this).css("background", "#BBBBFF");
									e.preventDefault();
									})
							.on("drop", function(e) {
										$("#upfile").prop("files", e.originalEvent.dataTransfer.files).closest("form");
								displayAttachFile();
								$(this).css("background", "#FFFFFF");
					});

					//
					$('.fileUpload').click(function(e) {
						e.preventDefault();
						$('#upfile').click();
					});

					$('#upfile').change(function(e) {
						displayAttachFile();
					});

					var displayAttachFile = function() {

						if ($("#upfile").val() != '') {
							var html = "";

							var files = $('#upfile')[0].files;

							html = '<table>';

							var contentHTML = "";
							for (var i = 0; i < files.length; i++) {
								var fileName = files[i].name;
								var size = 0
								if (files[i].size != 0) {
									size = Math
											.floor(Math
													.log(files[i].size)
													/ Math
															.log(1024));
								}

								contentHTML = contentHTML
										+ '<tr><td width="600px">'
										+ fileName
										+ '</td>'
										+ '<td width="200px">'
										+ size
										+ 'mb</td></tr>';

							}

							html = html + contentHTML;
							html = html + '</table>'

							$('.fileUpLoad').html(html);

						} else {
							var html = "이곳에 파일을 드래그 하세요.";
							$('.fileUpLoad').html(html);
						}
					};

					  
				});  
				
				function sendFile(file, el) {
					var form_data = new FormData();
					form_data.append('file', file);
					$.ajax({
						data: form_data,
						type : "post",
						url: 'summer_image',
						cache :false,
						contentType : false,
						enctype : 'multipart/form-data',
						processData : false,
						success : function(img_name) {
							$(el).summernote('editor.insertImage', img_name);
						}
					});
				}
				$(function() {
					$('#docContent').summernote({
						 	placeholder: '최대 500자 작성 가능합니다.',
					        height: 300,
					        lang: 'ko-KR',
					        callbacks: {
					        	onImageUpload: function(files, editor, welEditable) {
					        		for(var i = files.length -1; i>=0; i--) {
					        			sendFile(files[i], this);
					        		}
					        	}
					        }
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
	            <div id="fileUpload" class="fileUpLoad"> 
	               	 이곳에 파일을 드래그 하세요.
	            </div>
	            <br>
				<input type="file" multiple="multiple" id="upfile"
					name="uploadFile">
	            
	
	        </form>
	    </div>
	</div>
	    <!-- 참조 클릭 시 뜨는 모달 -->
	    <div class="modal fade" id="refEmp">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
		            <!-- Modal Header -->
		            <div class="modal-header">
		                <h6 class="modal-title">참조자</h6>
		            </div>
		
	                <!-- Modal Body -->
	                <div class="modal-body">
	                    <div id="approveLineOuter">
					        <button type="button" id="orgChart"">조직도</button>
					        <button type="button" id="sch">검색</button><br>
					        <div id="chart-container">
					            <div class="tree1" id="coName">(주)TEAMWORKS</div>
					           
					            <% int i = 1;%>
					            <c:forEach var="d" items="${ dept }">
					            	<div class="tree2 tree2<%= i %> dName">${ d.deptName }</div>
					            	<div class="tree3 tree3<%= i %>">
						            	<c:forEach var="l" items="${ list }">
						            		<c:choose>
						            			<c:when test="${ d.deptName eq l.deptName }">
						            					<input type="hidden" class="refedId" value="${ l.empId }">
						            					<input type="hidden" value="${ l.deptName }">
						                				<input type="checkbox" name="refChk" class="refChk" style="visibility:hidden">
						                				ㄴ<span class="refEmpName">${ l.empName }</span><span class="refEmpDept"> ${ l.jobName }</span><br>
						            			</c:when>
						            		</c:choose>
						            	</c:forEach>
					            	</div>
					           		<% i++; %>
					            </c:forEach>
					            
					        </div>
					        <div id="sch-container">
					            <div id="schBox">
					                <font>사원명</font>
					                <input name="keyword" type="search" id="schInput">
					                <button type="button" id="schBtn">검색</button>
					            </div>
					
					            <div id="empListArea">
					                <table id="empList">
					                    <thead>
					                        <tr>
					                            <th width="20"></th>
					                            <th width="85">부서</th>
					                            <th width="85">직급</th>
					                            <th width="60">사원명</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                        
					                    </tbody>
					                </table>
					            </div>
					        </div>
					
					        <div id="chooseCancel">
					            <div class="choose" id="chooseRef"> &gt; </div>
					            <div class="choose" id="cancelRef"> &lt; </div>
					        </div>
					
					        <div id="refEmpList">
					            <div style="margin:10px 0px 0px 20px; font-size:13px;">참조자</div>
					            <div id="selectedEmp">
					            	<table id="refEmpArea"></table>
					            </div>
					        </div>
					    </div>
	                </div>
	                
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                	<div id="approveLineBtns">
				            <button type="button" id="lineApplyBtn">적용</button>
				            <button type="button" id="lineCancelBtn">취소</button>
				        </div>
	                </div>
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
	
	<script>
		
		
		<!-- 참조자 모달용 스크립트 -->
		$(function(){
			/* 조직도 참조자 선택 */
			$(".refEmpName").click(function(){
				
				var hiddenChk = $(this).prev();
				
				if(hiddenChk.is(":checked")){
					hiddenChk.prop("checked", false);
					$(this).css("background", "white");
					$(this).next().css("background", "white");
				}else{
					hiddenChk.prop("checked", true);
					$(this).css("background", "lightsteelblue");
					$(this).next().css("background", "lightsteelblue");
				}
				
			});
			
			/* 참조자 검색 시 */
			$("#schBtn").click(function(){
				
				$.ajax({
					url:"empSch.rap",
					data:{keyword:$("#schInput").val()},
					type:"post",
					success:function(schEmp){
						if(schEmp.length > 0) {
							
							var value ="";
							
							for(var i in schEmp){
								value += "<tr>" + 
					                            "<td>" + 
					                            	"<input type='hidden' class='refedId' value='" + schEmp[i].empId + "'>" +
					                            	"<input type='hidden' value='" + schEmp[i].deptName + "'>" +
					                           		"<input type='checkbox' name='refChk' class='chk'>" +
					                           		"<div style='visibility:hidden; height:0px;'>" + schEmp[i].empName + "</div></td>" +
					                            "<td>" + schEmp[i].deptName + "</td>" + 
					                            "<td>" + schEmp[i].jobName + "</td>" +
					                            "<td>" + schEmp[i].empName + "</td>" +
				                         "</tr>"
							}
							
							$("#empList tbody").html(value);
							
						}else {
							alert("올바른 검색어를 입력하세요.");
						}
						
					}, error:function(){
						alert("참조자 검색 실패");
					}
				});
				
			});
			
			/* 참조자 선택(왼쪽 => 오른쪽) */
			$("#chooseRef").click(function(){
				
				var refedEmp = [];
				var refedDept = [];
				var refedId = [];
				
				$("input:checkbox[name=refChk]:checked").each(function(){
					refedEmp.push($(this).next().text());
					refedDept.push($(this).prev().val());
					refedId.push($(this).prevAll(".refedId").val());
				});
				
				var value = "";
				
				for(var i=0; i<refedEmp.length; i++){
					value += "<tr>" +
								"<td>" + 
									"<span class='refedEmpId' style='display:none'>" + refedId[i] + " " + "</span>" +
									"<input type='checkbox' class='checkBox' name='checkBox' style='visibility:hidden'>" +
							 		"<span class='refedEmpName'>" + refedEmp[i] + " " + "</span>" + 
							 		"<span class='refedEmpDept'> | " + refedDept[i] + "</span>" + 
							 	"</td>" +
							 "</tr>";
				}
				
				$("#refEmpArea").html(value);
				
				$("input:checkbox[name=refChk]").prop("checked", false);
				$("input:checkbox[name=refChk]").nextAll().css("background", "white");
				
			});
			
			/* 참조자 오른쪽에서 삭제 */
			$("#cancelRef").click(function(){
				
				$("input:checkbox[name=checkBox]:checked").each(function(){
					$(this).parents('tr').remove();
				});
				
			});
			
			/* 추가된 참조자 선택 */
			$("#selectedEmp").on("click", ".refedEmpName", function(){	
				
				var hiddenChk2 = $(this).prev();
				
				if(hiddenChk2.is(":checked")){
					hiddenChk2.prop("checked", false);
					$(this).css("background", "white");
					$(this).next().css("background", "white");
				}else{
					hiddenChk2.prop("checked", true);
					$(this).css("background", "lightsteelblue");
					$(this).next().css("background", "lightsteelblue");
				}
				
			});
			
			/* 부서 클릭 시 */
			$("#selectedEmp").on("click", ".refedEmpDept", function(){	
				
				var hiddenChk = $(this).prevAll('.checkBox');
				
				if(hiddenChk.is(":checked")){
					hiddenChk.prop("checked", false);
					$(this).css("background", "white");
					$(this).siblings('.refedEmpName').css("background", "white");
				}else{
					hiddenChk.prop("checked", true);
					$(this).css("background", "lightsteelblue");
					$(this).siblings('.refedEmpName').css("background", "lightsteelblue");
				}
				
			});
			
			/* 적용 버튼 */
			$("#lineApplyBtn").click(function(){
				var refedEmp = $('.refedEmpName').text();
				var refedId = $('.refedEmpId').text();
				$("#refSch").val(refedEmp);
				$("#refedId").val(refedId);
				$("#schInput").val("");
				
				$('#empList>tbody>tr').remove();
				$('#refEmpArea tr').remove();
				$('#refEmp').modal("hide");
				
				$("input:checkbox[name=refChk]").prop("checked", false);
				$("input:checkbox[name=checkBox]").prop("checked", false);
				$('.tree3').slideUp();
				$('.tree2').slideUp();
			});

			/* 취소 버튼 */
			$("#lineCancelBtn").click(function(){
				$('#refEmpArea tr').remove();
				$('#empList>tbody>tr').remove();
				$("#schInput").val("");
				
				$("input:checkbox[name=refChk]").prop("checked", false);
				$("input:checkbox[name=checkBox]").prop("checked", false);
				$('.tree3').slideUp();
				$('.tree2').slideUp();
				
				$("#schInput").val("");
				$('#refEmp').modal("hide");
			});
			
		});
		
		
        $(function(){
			
	       	/* 조직도 slideDown slideUp */
            $(".tree1").click(function(){
                var tree2 = $(this).nextAll(".tree2");
                var tree31 = $(this).nextAll(".tree31");
                var tree32 = $(this).nextAll(".tree32");

                if(tree2.css("display") == "none") {
                    tree2.slideDown();

                }else {
                    tree2.slideUp();
                }

                if (tree31.is(':hidden')) {
                } else {
                    tree31.slideUp('slow');
                }

                if (tree32.is(':hidden')) {
                } else {
                    tree32.slideUp('slow');
                }
            });
        	
            $(".tree21").click(function(){
                var tree31 = $(this).nextAll(".tree31");

                if(tree31.css("display") == "none") {
                    tree31.slideDown();
                }else{
                    tree31.slideUp();
                }
            });

            $(".tree22").click(function(){
                var tree31 = $(this).nextAll(".tree32");

                if(tree31.css("display") == "none") {
                    tree31.slideDown();
                }else{
                    tree31.slideUp();
                }
            });

            /* 조직도/검색 클릭 시  */
            $("#chart-container").show();
            $("#sch-container").hide();

            $("#orgChart").click(function(){
                $("#chart-container").show();
                $("#sch-container").hide();
                $("#orgChart").css("border", "none");
                $("#orgChart").css("background", "rgb(7, 53, 90)");
                $("#orgChart").css("color", "white");
                $("#sch").css("border", "1px solid rgb(7, 53, 90)");
                $("#sch").css("background", "white");
                $("#sch").css("color", "rgb(7, 53, 90)");
            });

            $("#sch").click(function(){
                $("#sch-container").show();
                $("#chart-container").hide();
                $("#sch").css("border", "none");
                $("#sch").css("background", "rgb(7, 53, 90)");
                $("#sch").css("color", "white");
                $("#orgChart").css("border", "1px solid rgb(7, 53, 90)");
                $("#orgChart").css("background", "white");
                $("#orgChart").css("color", "rgb(7, 53, 90)");
            });

        });
    </script>
	
</body>
</html>