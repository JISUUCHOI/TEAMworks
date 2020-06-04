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

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <style>
        .outer{
			width:1250px;
			float:left;
			margin-left:220px;
			margin-top:50px;
		
		 }
        .inner{width: 900px;}
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
    </style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarBoard.jsp"/>
 <div class="outer" align="center">
        <div class="inner">
            <h4>작성하기</h4>
            <hr>
            <form id="boardEnrollForm" method="post" onSubmit="return false" enctype="multipart/form-data">
            	<input type="hidden" name="boardWriter" value=${ loginUser.empId }>
            	<input type="hidden" name="boardCategory" value="${ cat }">
                <table class="table" width="100%">
                    <tr>
                        <th>제목</th>
                        <td colspan="5"><input type="text" id="title" name="boardTitle" class="form-control" required></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td colspan="5">${loginUser.empName}</td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <textarea id="summernote" id="content" name="boardContent" required></textarea>
                          
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <div id="drageader" align="left">
                                <i class="fas fa-paperclip"></i> <span>파일 업로드</span>
                            </div>
                            <div id="dragAndDrop">
                                이곳에 파일을 드래그하세요.
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
                <br>
                <div style="float: right;">
                    <button type="button"  id="btn-upload-file" class="btn btn-info" style="margin-right: 50px;">등록</button>
                    <button type="reset" class="btn">취소</button>
                </div>
            </form>
           
        </div>
           
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
                    for(var i = 0; i < files.length; i++) {
                        var file = files[i];
                        // console.log(file);
                        var size = uploadFiles.push(file); //업로드 목록에 추가
                        preview(file, size - 1); //미리보기 만들기
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
                            for(var i = 0; i < files.length; i++) {
                                var file = files[i];
                                // console.log(file);
                                var size = uploadFiles.push(file); //업로드 목록에 추가
                                preview(file, size - 1); //미리보기 만들기
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

           $("#btn-upload-file").on("click", function(){
                var form = $("#boardEnrollForm");
                var formData = new FormData(form[0]);
                $.each(uploadFiles, function(i, file){
                  
                    formData.append('uploadFile', file, file.name);
                    
                });
                if($("#title").val()== "" || $("#content").val()== ""){
                	alert("제목과 내용을 입력해주세요.");
                }else{
               	   $.ajax({
                      	url:"insert.bo",
                      	data:formData,
                      	type:"post",
                      	contentType:false,
      					processData: false,
      					success:function(result){
      						if(result == "success"){
      							alert("게시글 등록 완료");
      							location.href="list.bo?currentPage=1&cat=" + ${cat};
      						}else if(result == "insertFail"){
      							alert("게시판 등록에 실패하셨습니다.");
      						}else{
      							alert("첨부파일 업로드에 실패하셨습니다.");
      						}
      					},
      					error:function(){
      						console.log("board ajax통신 실패");
      					}
                      });
                       
                }
                
             
                // for (var key of formData.keys()) {
                //     console.log(key);
                // }
                // for (var value of formData.values()) {
                //     console.log(value);
                // }
                //form.submit();
           });
        

        </script>
    </div>
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
   
</body>
</html>