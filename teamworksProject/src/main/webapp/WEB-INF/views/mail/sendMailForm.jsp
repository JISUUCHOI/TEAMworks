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
        
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <style>
         .outer{
			width:1250px;
			float:left;
			margin-left:200px;
			margin-top:0px;
		
		 }
        .inner {
            width: 800px;
        }
         #dragAndDrop{
            background-color: rgb(242, 242, 242);
            width: 100%; height: 150px;
            text-align: center;
            line-height: 150px;
            vertical-align: middle;
            color: gray;
            position: relative;
        }
        #fileList{position: absolute; top:10px; width: 100%;}
        .list{background-color:rgb(230, 230, 230); height: 25px; text-align: left; padding: 0;line-height: 25px; border-bottom: 1px solid lightgray;}
        #filenames{display: inline-block; width: 90%;padding-left: 10px;}
        #close{ display: inline-block; width: 10%; color: red;}
        #close i:hover{cursor: pointer;}
        #dragFoot{
            background-color:rgb(230, 230, 230);
            width: 100%; height: 40px;
            padding: 5px;
        }
        #myfile{opacity: 0;}
        .visually-hidden {
            position: absolute !important;
            height: 1px;
            width: 1px;
            overflow: hidden;
            clip: rect(1px, 1px, 1px, 1px);
        }

        input.visually-hidden:focus + label {
            outline: thin dotted;
        }
        #fileLabel{
            border: 1px solid gray;
            border-radius: 3px;
            padding: 3px;
            margin-left: 10px;
            color: rgb(59, 64, 68);
            background-color: whitesmoke;
        }
           .tree{
          color:#393939;
        }
        .tree, .tree ul{
          list-style: none;
          padding-left:17px;
        }
        .tree *:before{
          width:17px;
          height:17px;
          display:inline-block;
        }
        .tree label{
          cursor: pointer;
          font-family: "Font Awesome 5 Free";
        }
        .tree label:before{
          content: '\f07c';
        }
        .tree a{
          text-decoration: none;
          color:#393939;
          font-family: "Font Awesome 5 Free";
        }
        .tree a:before{
          content:'\f007';
          font-family: "Font Awesome 5 Free";
        }
        .tree input[type="checkbox"] {
          display: none;
        }
        .tree input[type="checkbox"]:checked~ul {
          display: none;
        }
        .tree input[type="checkbox"]:checked+label:before{
          content:'\f07b';
          font-family: "Font Awesome 5 Free";
        }
        .col1, .col2, .col3{
            float: left;
        }
        .col1{margin-left:120px}
        /* div{border:1px solid red}  */
        .outline{ width: 300px; height: 420px; overflow-y:scroll; border:1px solid lightgrey; border-radius: 3px; padding: 10px;} 
        .col3{ width: 300px; padding-top: 45px;}
        #angle{border-collapse: separate; border-spacing: 10px;}
        .col2{padding-top: 80px;}
     	.tree a:hover{cursor:pointer}
     	
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarMail.jsp"/>
	<div class="outer" align="center">
        <div class="inner">
            <div class="row">
                <div class="col-lg-12 text-left">
                    <h3 class="page-header"><i class="fas fa-envelope"></i> 메일보내기</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <form action="" id="sendMailForm" method="post" onSubmit="return false" enctype="multipart/form-data">
            	<input type="hidden" name="sender" value="${ loginUser.email }">
            	<input type="hidden" name="senderId" value="${ loginUser.empId }">
                <table class="table">
                    <tr>
                        <th width="150px">받는 사람</th>
                        <td style="position:relative;">
                            <input type="text" id="to" name="strTo" class="form-control" value="" required onKeyUp="keywordSearch();"  autocomplete="off" >
                            <div id="suggest" style="position:absolute;z-index:99; background-color:white; width:95%; ">
						        <div id="suggestList"></div>
						   </div>
						</td>
                        <td width="50px">
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="far fa-address-book"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <th width="150px">참조</th>
                        <td style="position:relative;">
                            <input type="email" id="cc" name="strCc" class="form-control" value="" onKeyUp="keywordSearch1();"  autocomplete="off" >
                            <div id="suggest1" style="position:absolute;z-index:99; background-color:white; width:95%; ">
						        <div id="suggestList1"></div>
						   </div>
                        </td>
                        <td>
                          
                        </td>
                    </tr>
                    <tr>
                        <th width="150px">숨은 참조</th>
                        <td style="position:relative;">
                            <input type="email" id="bcc" name="strBcc" class="form-control" value="" onKeyUp="keywordSearch2();" autocomplete="off" >
                            <div id="suggest2" style="position:absolute;z-index:99; background-color:white; width:95%; ">
						        <div id="suggestList2"></div>
						   </div>
                        </td>
                        <td>
                           
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="2">
                            <input type="text" name="mailTitle" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                           <textarea id="summernote" name="mailContent"></textarea>
                        </td>
                    </tr>
                      <tr>
                        <td colspan="3">
                            <div id="drageader" align="left">
                                <i class="fas fa-paperclip"></i> <span>파일 첨부</span>
                            </div>
                            <div id="dragAndDrop">
                                	이곳에 파일을 드래그하세요. 최대 5개까지 첨부 가능합니다.
                                <div id="fileList">

                                </div>
                            </div>
                            <div id="dragFoot" align="left">
                                <input type="file" id="fileElem" multiple class="visually-hidden">
                                <label for="fileElem" id="fileLabel">파일 첨부</label>
                                <!-- <button class="btn btn-default btn-sm" id="fileSelect">파일첨부</button>
                                <input type="file" name="file" id="myfile" multiple/>   -->
                            </div>
                        </td>
                    </tr>
                </table>
                <button type="submit" id="sendMail-btn" class="btn btn-primary" style="margin-right:50px">발송</button>
                <button type="reset" id="reset" class="btn btn-danger">취소</button>
            </form>
        </div>
    </div>
    
    
    
    
       <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
  
      <!-- Modal content-->
      <div class="modal-content"  >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><i class="far fa-address-book"></i> &nbsp;&nbsp;이메일 주소 선택</h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col1">
                     <ul class="nav nav-tabs">  
                        <li class="active"><a href="">조직도</a></li>
                     </ul>
                    <div class="outline">
                        <ul class="tree">
                            <li>
                            <input type="checkbox" id="root">
                            <label for="root"> (주)TEAMWORKS</label>
                            <ul>
                            <c:forEach var="d" items="${ deptList }">
                             	<c:set var="i" value="${ i+1 }"/>
                             	<li>
                                    <input type="checkbox" id="node${i}">
                                    <label for="node${i}"> ${ d.deptName }</label>
                                    <ul id="select">
                                    	<c:forEach var="e" items="${ empList }">
                                    		<c:if test="${ d.deptCode eq e.deptCode }">
	                                        	<li>
	                                        	<input type="checkbox" name="check" value="">
	                                        	<input id="t1" type="hidden" name="empId" value="${ e.empId }">
	                                        	<input id="t3" type="hidden" name="email" value="${ e.email }">
	                                        	<input id="t5" type="hidden" name="empName" value="${ e.empName }">
	                                        	<a id="t4">${ e.empName }&nbsp;${ e.jobName }</a>
	                                        	</li>
                                    		</c:if>
                                    	</c:forEach>
                                    </ul>
                                </li>
                            </c:forEach>
                            </ul>
                            </li>
                        </ul>
                    </div>
            
                </div>
                <div class="col2">
                    <table id="angle">
                        <tr><td><button id="addTo" class="btn btn-default"><i class="fas fa-angle-right"></i></button></td></tr>
                        <tr><td><button id="removeTo" class="btn btn-default"><i class="fas fa-angle-left"></i></button></td></tr>
                        <tr height="45px"><td></td></tr>
                        <tr><td><button id="addCc" class="btn btn-default"><i class="fas fa-angle-right"></i></button></td></tr>
                        <tr><td><button id="removeCc" class="btn btn-default"><i class="fas fa-angle-left"></i></button></td></tr>
                        <tr height="43px"><td></td></tr>
                        <tr><td><button id="addBcc" class="btn btn-default"><i class="fas fa-angle-right"></i></button></td></tr>
                        <tr><td><button id="removeBcc" class="btn btn-default"><i class="fas fa-angle-left"></i></button></td></tr>
                    </table>
                </div>
                <div class="col3">
                    <table class="table table-bordered fixed">
                        <tr><td>수신</td></tr>
                        <tr height="100px">
                            <td  id="toList" style="overflow-y:scroll">
                            </td>
                        </tr>
                        <tr><td>참조</td></tr>
                        <tr height="100px">
                            <td id="ccList" style="overflow-y:scroll">
                            </td>
                        </tr>
                        <tr><td>숨은 참조</td></tr>
                        <tr height="100px">
                            <td id="bccList" style="overflow-y:scroll">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal-footer">
                       하나씩 선택해주세요.
          <button type="button" id="emailList" class="btn btn-default" data-dismiss="modal">적용</button>
        </div>
      </div>
  
    </div>
  </div>
    <!-- 조직도 관련  script -->
    <script>
    	
    	var ToEmail = new Array();
    	var ToName = new Array();
    	
    	var Cc = new Array();
		var CcName = new Array();
    
		var Bcc = new Array();
    	var BccName = new Array();
    	
    	var selected = new Array();
    	
    	$(function(){
    		$("#select a").on('click', function(){
    			if($(this).hasClass("selected")){
    				$(this).removeClass("selected");
    				$(this).siblings("input[name=check]").prop("checked", false);
    			 	$(this).siblings("input[name=email]").removeClass("selectedMail");
    				$(this).siblings("input[name=empId]").removeClass("selectedId");
    				$(this).siblings("input[name=empName]").removeClass("selectedName"); 
    				$(this).css("color", "black");
    			}else{
    			 	$(this).siblings("input[name=email]").addClass("selectedMail");
    				$(this).siblings("input[name=empId]").addClass("selectedId");
    				$(this).siblings("input[name=empName]").addClass("selectedName"); 
    				$(this).addClass("selected");
    				$(this).siblings("input[name=check]").prop("checked", true);
    				$(this).css("color", "blue");
    			}
    		});
    		/* To */		
    		$("#addTo").click(function(){
    			var mail = new Array();
    			var name = new Array();
    			
    			$("input[class=selectedName]").each(function(){
    				name.push($(this).val());
    				$(this).siblings("a").css("color", "black");
    			});
    			$("input[class=selectedMail]").each(function(){
    				mail.push($(this).val());
    				$(this).siblings("a").css("color", "black");
    			});
    			$("input[name=empId]").removeClass();
    			$("input[name=email]").removeClass();
    			$("input[name=empName]").removeClass();
    			$("a[class=selected]").removeClass();
    			if(ToEmail.length<1 && mail.length<=1){
    				if($.isEmptyObject(mail)){
    					alert("추가할 항목을 선택해주세요.");
    				}else{
    				// console.log(To);
    				// console.log(ToName);
    					var list = "";
        			 	for(var i=0; i<mail.length; i++){
        					ToName.push(name[i]);
        					ToEmail.push(mail[i]);
        					list +="<h5 id='toEmail'>"+ name[i] + " "+ mail[i]+"</h5>"
        				}
        				$("#toList").append(list);
    				}
    			}else{
					alert("받는 사람은 한명만 가능합니다.");
				}
    		});
    		
    		$("#removeTo").click(function(){
    			$("#toEmail").remove();
				ToName.length=0;
				ToEmail.length=0;
    		});
    	/* Cc */	
    		$("#addCc").click(function(){
    			var mail = new Array();
    			var name = new Array();
    			
    			$("input[class=selectedName]").each(function(){
    				name.push($(this).val());
    				$(this).siblings("a").css("color", "black");
    			});
    			$("input[class=selectedMail]").each(function(){
    				mail.push($(this).val());
    				$(this).siblings("a").css("color", "black");
    			});
    			$("input[name=empId]").removeClass();
    			$("input[name=email]").removeClass();
    			$("input[name=empName]").removeClass();
    			$("a[class=selected]").removeClass();
    			if(Cc.length <1  && mail.length<=1){
    				if($.isEmptyObject(mail)){
    					alert("추가할 항목을 선택해주세요.");
    				}else{
    				// console.log(To);
    				// console.log(ToName);
    					var list = "";
        			 	for(var i=0; i<mail.length; i++){
        					CcName.push(name[i]);
        					Cc.push(mail[i]);
        					list +="<h5 id='CcEmail'>"+ name[i] + " "+ mail[i]+"</h5>"
        				}
        				$("#ccList").append(list);
    				}
    			}else{
					alert("받는 사람은 한명만 가능합니다.");
				}
    		});
    		
    		$("#removeCc").click(function(){
    			$("#CcEmail").remove();
    			CcName.length=0;
    			Cc.length=0;
    		});
    		
    		/* Bcc */
    		
    		$("#addBcc").click(function(){
    			var mail = new Array();
    			var name = new Array();
    			
    			$("input[class=selectedName]").each(function(){
    				name.push($(this).val());
    				$(this).siblings("a").css("color", "black");
    			});
    			$("input[class=selectedMail]").each(function(){
    				mail.push($(this).val());
    				$(this).siblings("a").css("color", "black");
    			});
    			$("input[name=empId]").removeClass();
    			$("input[name=email]").removeClass();
    			$("input[name=empName]").removeClass();
    			$("a[class=selected]").removeClass();
    			if(Bcc.length <1  && mail.length<=1){
    				if($.isEmptyObject(mail)){
    					alert("추가할 항목을 선택해주세요.");
    				}else{
    				// console.log(To);
    				// console.log(ToName);
    					var list = "";
        			 	for(var i=0; i<mail.length; i++){
        					BccName.push(name[i]);
        					Bcc.push(mail[i]);
        					list +="<h5 id='BccEmail'>"+ name[i] + " "+ mail[i]+"</h5>"
        				}
        				$("#bccList").append(list);
    				}
    			}else{
					alert("받는 사람은 한명만 가능합니다.");
				}
    		});
    		
    		$("#removeBcc").click(function(){
    			$("#BccEmail").remove();
    			BccName.length=0;
    			Bcc.length=0;
    		});
    		
    		$("#emailList").click(function(){
    			document.getElementById("to").value=ToEmail;
    			document.getElementById("cc").value=Cc;
    			document.getElementById("bcc").value=Bcc;
    		});
    		
    	});
		
    	
    </script>
    
    
    
    <!-- 파일 관련 스크립트  -->
     <script>
         
            var uploadFiles = [];
            var $drop = $("#dragAndDrop");
            $drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
                $(this).addClass('drag-over');
            }).on("dragleave", function(e) { //드래그 요소가 나갔을때
                $(this).removeClass('drag-over');
            }).on("dragover", function(e) {
                e.stopPropagation();
                e.preventDefault();
            }).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
                e.preventDefault();
                $(this).removeClass('drag-over');
           
                var files = e.originalEvent.dataTransfer.files;
                //console.log(files.length);
                //console.log(uploadFiles.length);

	           	 if(files.length<6){
	                if(uploadFiles.length<5){ 
	                   	 if((uploadFiles.length+files.length)<6){
	                   		 for(var i = 0; i < files.length; i++) {
	                            var file = files[i];
	                             	// console.log(file);
	                            var size = uploadFiles.push(file); 
	                            preview(file, size - 1); 
	                         }
	                   	 }else{
	                   		 alert("최대 5개까지만 첨부가능합니다.");
	                   	 }
	                    	
	                	 }else{
	                    	alert("최대 5개까지만 첨부가능합니다.");
	                	 }
	               
	                }else{
	                    alert("최대 5개까지만 첨부가능합니다.");
	                }
	           
              
                // console.log(uploadFiles);
           
            });

        
            
            $(function(){
            	 $('input[type="file"]').on('change', function(e){
                     var files = this.files;
                     //console.log(files);
                     
                	   if(files.length<6){
                           if(uploadFiles.length<5){ 
 	                       	   if((uploadFiles.length+files.length)<6){
 	                       		   for(var i = 0; i < files.length; i++) {
 	                                      var file = files[i];
 	                                      // console.log(file);
 	                                      var size = uploadFiles.push(file); 
 	                                      preview(file, size - 1); 
 	                                  }
 	                       	   }else{
 	                       		   alert("한번에 최대 5개까지만 첨부가능합니다.");
 	                       	   }
                            
                           }else{
                               alert("최대 5개까지만 첨부가능합니다.");
                       }
                       }else{
                           alert("최대 5개까지만 첨부가능합니다.");
                       }
                    
                  
                });
            });

          
            function preview(file, idx){
                var reader  = new FileReader();
                reader.onload = (function(f, idx){
                    return function(e){
                        var div = '<div class="list"> \
                        <span id="filenames">'+ f.name +'</span><span id="close" align="center"><i data-idx="'+idx+'" class="far fa-minus-square minus"></i></span></div>'

                        $("#fileList").append(div);

                    };  
                })(file, idx);
                reader.readAsDataURL(file);
                
            }

           $("#fileList").on("click", ".minus", function(e){
               var $target = $(e.target);
               var idx = $target.attr('data-idx');
               console.log(idx);
               //uploadFiles[idx].upload = 'disable';
               uploadFiles.splice(idx,1);

               $target.parents(".list").remove();
           });

           $("#sendMail-btn").on("click", function(){
                var form = $("#sendMailForm");
                var formData = new FormData(form[0]);
                $.each(uploadFiles, function(i, file){
                  
                    formData.append('uploadFile', file, file.name);
                    
                });
                
                if($("#strTo").val()== ""){
                	alert("받는 사람은 필수 입력 사항입니다.");
                }else{
               	   $.ajax({
                      	url:"sendMail",
                      	data:formData,
                      	type:"post",
                      	contentType:false,
      					processData: false,
      					success:function(result){
      						if(result == "success"){
      							alert("메일 전송 완료");
      							location.href="slist.ma?currentPage=1";
      						}else if(result == "fail"){
      							alert("메일 전송 실패");
      						}
      					},
      					error:function(){
      						console.log("mail ajax통신 실패");
      					}
                      });
                       
                }   
               
           });
        </script>
    
    
     <script>
        $(document).ready(function() {
	    //여기 아래 부분
		    $('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		    });
    	});
    </script>
    
    <!-- 자동완성 To  -->
    <script>
		    var loopSearch=true;
		    function keywordSearch(){
				if(loopSearch==false)
					return;
			 	var value=$("#to").val();
				$.ajax({
					type : "get",
					async : true, //false인 경우 동기식으로 처리한다.
					url : "userMail",
					data : {keyword:value},
					success : function(data, textStatus) {
						var jsonInfo =data;
					    // console.log(jsonInfo);
						displayResult(jsonInfo);
					},
					error : function(data, textStatus) {
						alert("에러가 발생했습니다."+data);
					},
					complete : function(data, textStatus) {
						//alert("작업을완료 했습니다");
					}
				}); //end ajax	
			} 
			
			function displayResult(jsonInfo){
				var count = jsonInfo.length;
				if(count > 0) {
				    var html = '';
				    for(var i in jsonInfo){
				    	with(jsonInfo[i]){
						   html += "<span>"+empName+"</span><a href=\"javascript:select('"+email+"')\">"+email+"</a><br/>";
						   //html += "<a onclick=select('"+email+"');>"+empName+email+"</a><br/>";
				    	}
				    }
				    var listView = document.getElementById("suggestList");
				    listView.innerHTML = html;
				    show('suggest');
				}else{
				    hide('suggest');
				} 
			}
			
			function select(email) {
				//document.sendMailForm.to.value=selectedKeyword;
				//console.log(email);
				document.getElementById("to").value=email;
				 //$("#to").val()=email;
				 //loopSearch = false;
				 hide('suggest');
			}
				
			function show(elementId) {
				 var element = document.getElementById(elementId);
				 if(element) {
				  element.style.display = 'block';
				 }
				}
			
			function hide(elementId){
			   var element = document.getElementById(elementId);
			   if(element){
				  element.style.display = 'none';
			   }
			}
    </script>
    <!-- 자동완성 cc  -->
    <script>
		    var loopSearch=true;
		    function keywordSearch1(){
				if(loopSearch==false)
					return;
			 	var value=$("#cc").val();
				$.ajax({
					type : "get",
					async : true, //false인 경우 동기식으로 처리한다.
					url : "userMail",
					data : {keyword:value},
					success : function(data, textStatus) {
						var jsonInfo =data;
					    // console.log(jsonInfo);
						displayResult1(jsonInfo);
					},
					error : function(data, textStatus) {
						alert("에러가 발생했습니다."+data);
					},
					complete : function(data, textStatus) {
						//alert("작업을완료 했습니다");
					}
				}); //end ajax	
			} 
			
			function displayResult1(jsonInfo){
				var count = jsonInfo.length;
				if(count > 0) {
				    var html = '';
				    for(var i in jsonInfo){
				    	with(jsonInfo[i]){
						   html += "<span>"+empName+"</span><a href=\"javascript:select1('"+email+"')\">"+email+"</a><br/>";
						   //html += "<a onclick=select('"+email+"');>"+empName+email+"</a><br/>";
				    	}
				    }
				    var listView = document.getElementById("suggestList1");
				    listView.innerHTML = html;
				    show1('suggest1');
				}else{
				    hide1('suggest1');
				} 
			}
			
			function select1(email) {
				//document.sendMailForm.to.value=selectedKeyword;
				//console.log(email);
				document.getElementById("cc").value=email;
				 //$("#to").val()=email;
				 //loopSearch = false;
				 hide1('suggest1');
			}
				
			function show1(elementId) {
				 var element = document.getElementById(elementId);
				 if(element) {
				  element.style.display = 'block';
				 }
				}
			
			function hide1(elementId){
			   var element = document.getElementById(elementId);
			   if(element){
				  element.style.display = 'none';
			   }
			}
    </script>
    <!-- 자동 완성 bcc -->
    <script>
		    var loopSearch=true;
		    function keywordSearch2(){
				if(loopSearch==false)
					return;
			 	var value=$("#bcc").val();
				$.ajax({
					type : "get",
					async : true, //false인 경우 동기식으로 처리한다.
					url : "userMail",
					data : {keyword:value},
					success : function(data, textStatus) {
						var jsonInfo =data;
					    // console.log(jsonInfo);
						displayResult2(jsonInfo);
					},
					error : function(data, textStatus) {
						alert("에러가 발생했습니다."+data);
					},
					complete : function(data, textStatus) {
						//alert("작업을완료 했습니다");
					}
				}); //end ajax	
			} 
			
			function displayResult2(jsonInfo){
				var count = jsonInfo.length;
				if(count > 0) {
				    var html = '';
				    for(var i in jsonInfo){
				    	with(jsonInfo[i]){
						   html += "<span>"+empName+"</span><a href=\"javascript:select2('"+email+"')\">"+email+"</a><br/>";
						   //html += "<a onclick=select('"+email+"');>"+empName+email+"</a><br/>";
				    	}
				    }
				    var listView = document.getElementById("suggestList2");
				    listView.innerHTML = html;
				    show2('suggest2');
				}else{
				    hide2('suggest2');
				} 
			}
			
			function select2(email) {
				//document.sendMailForm.to.value=selectedKeyword;
				//console.log(email);
				document.getElementById("bcc").value=email;
				 //$("#to").val()=email;
				 //loopSearch = false;
				 hide2('suggest2');
			}
				
			function show2(elementId) {
				 var element = document.getElementById(elementId);
				 if(element) {
				  element.style.display = 'block';
				 }
				}
			
			function hide2(elementId){
			   var element = document.getElementById(elementId);
			   if(element){
				  element.style.display = 'none';
			   }
			}
    </script>
</body>
</html>