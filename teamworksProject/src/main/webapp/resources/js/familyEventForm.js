$(function(){
    $("#writeDoc>a").css("color", "deepskyblue");
    
    $(document).ready(function() {
        $("#sidebarOuter").css('min-height', "900px");
    });
    
});

/*참조자 모달용 스크립트*/
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
	
    /* 조직도 참조자 선택 */
    /* 본인을 참조자로 선택하지 못하도록 */
    $(".refEmpName").click(function(){
    	var userId = $("#empId").val();
      	var clickedId = $(this).prevAll(".refedId").val();
    	
        var hiddenChk = $(this).prev();
        
        if(userId == clickedId){
        	hiddenChk.prop("checked", false);
            $(this).css("background", "white");
            $(this).next().css("background", "white");
        }else{
	        if(hiddenChk.is(":checked")){
	            hiddenChk.prop("checked", false);
	            $(this).css("background", "white");
	            $(this).next().css("background", "white");
	        }else{
	            hiddenChk.prop("checked", true);
	            $(this).css("background", "lightsteelblue");
	            $(this).next().css("background", "lightsteelblue");
	        }
        }
    });
    
    /* 참조자 검색 시 */
    $("#schBtn").click(function(){
        
    	var userId = $("#empId").val();
    	
        $.ajax({
            url:"empSch.rap",
            data:{keyword:$("#schInput").val()},
            type:"post",
            success:function(schEmp){
                if(schEmp.length > 0) {
                    
                    var value ="";
                    var userId = $("#empId").val();
                    
                    for(var i in schEmp){
                    	
                    	 if(userId == schEmp[i].empId){
                    	
	                        value += "<tr>" + 
	                                        "<td>" + 
	                                        	"<input type='hidden' class='refedJob' value='" + schEmp[i].jobName + "'>" +
	                                            "<input type='hidden' class='refedId' value='" + schEmp[i].empId + "'>" +
	                                            "<input type='hidden' value='" + schEmp[i].deptName + "'>" +
	                                            "<div style='visibility:hidden; height:0px;'>" + schEmp[i].empName + "</div></td>" +
	                                        "<td>" + schEmp[i].deptName + "</td>" + 
	                                        "<td>" + schEmp[i].jobName + "</td>" +
	                                        "<td>" + schEmp[i].empName + "</td>" +
	                                 "</tr>"
                                        
                    	 }else{
                    		 value += "<tr>" + 
				                             "<td>" + 
				                             	"<input type='hidden' class='refedJob' value='" + schEmp[i].jobName + "'>" +
				                                "<input type='hidden' class='refedId' value='" + schEmp[i].empId + "'>" +
				                                "<input type='hidden' value='" + schEmp[i].deptName + "'>" +
				                         		"<input type='checkbox' name='refChk' class='chk'>" +
				                                "<div style='visibility:hidden; height:0px;'>" + schEmp[i].empName + "</div></td>" +
				                             "<td>" + schEmp[i].deptName + "</td>" + 
				                             "<td>" + schEmp[i].jobName + "</td>" +
				                             "<td>" + schEmp[i].empName + "</td>" +
				                      "</tr>"
                    	 }
                                        
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
        var refedJob = [];
        
        $("input:checkbox[name=refChk]:checked").each(function(){
            refedEmp.push($(this).next().text());
            refedDept.push($(this).prev().val());
            refedId.push($(this).prevAll(".refedId").val());
            refedJob.push($(this).prevAll(".refedJob").val());
        });
        
        /*중복값 못 들어가도록 */
        var flag = true;
        
        $("#refEmpArea").find(".refedEmpName").each(function(index, item){
           
            for(var j=0; j<refedEmp.length; j++){
            	if(item.innerText == refedEmp[j]){
            		flag = false;
            	}
            }
        });
        
        if(flag){
        	for(var i=0; i<refedEmp.length; i++){
            	$("#refEmpArea").append("<tr>" +
    				                        "<td>" + 
    				                            "<span class='refedEmpId' style='display:none'>" + refedId[i] + " " + "</span>" +
    				                            "<input type='checkbox' class='checkBox' name='checkBox' style='visibility:hidden'>" +
    				                             "<span class='refedEmpName'>" + " " + refedEmp[i] + " " + refedJob[i] + "</span>" + 
    				                             "<span class='refedEmpDept'> | " + refedDept[i] + "</span>" + 
    				                         "</td>" +
    				                     "</tr>");
            	
            }
        }else{
        	console.log("못들어감");
        }
        
        
        /*
        var flag =[];
        
        $("#refEmpArea").find(".refedEmpName").each(function(index, item){
           
            for(var j=0; j<refedEmp.length; j++){
            	if(item.innerText == refedEmp[j]){
            		flag.push("0");
            	}else{
            		flag.push("1");
            	}
            }
            
        });
        
        console.log(flag[0]);
        console.log(flag[1]);
        
    	for(var i=0; i<refedEmp.length; i++){
    		if(flag[i] == 1){
            	$("#refEmpArea").append("<tr>" +
    				                        "<td>" + 
    				                            "<span class='refedEmpId' style='display:none'>" + refedId[i] + " " + "</span>" +
    				                            "<input type='checkbox' class='checkBox' name='checkBox' style='visibility:hidden'>" +
    				                             "<span class='refedEmpName'>" + refedEmp[i] + "</span>" + 
    				                             "<span class='refedEmpDept'> | " + refedDept[i] + "</span>" + 
    				                         "</td>" +
    				                     "</tr>");
    		 }else{
    	        	console.log("못들어감");
    	        }
        }
       */
        
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
    $("#refApplyBtn").click(function(){
    	/* 선택된 참조자 값 전달 */
    	$("input:checkbox[name=checkBox]").prop("checked", true);
   	 
   	 	var refedEmp = [];
   	 
	   	 $("input:checkbox[name=checkBox]:checked").each(function(){
	   		refedEmp.push($(this).next().text());
		 });
	   	 $("#refSch").val(refedEmp);
	
        var refedId = $('.refedEmpId').text();
        $("#refedId").val(refedId);

        /*모달 닫기*/
        $('#refEmp').modal("hide");
        
        $('.tree3').slideUp();
        $('.tree2').slideUp();
        $("input:checkbox[name=refChk]").prop("checked", false);
        $("#schInput").val("");
        $('#empList>tbody>tr').remove();
        
        $('#refEmpArea tr').remove();
        $("input:checkbox[name=checkBox]").prop("checked", false);
        
    });

    /* 취소 버튼 */
    $("#refCancelBtn").click(function(){
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



/* 결재선 모달용 스크립트 */
 $(function(){
	 
	   /* 결재선 조직도 slideDown slideUp */
     $(".apTree1").click(function(){
         var apTree2 = $(this).nextAll(".apTree2");
         var apTree31 = $(this).nextAll(".apTree31");
         var apTree32 = $(this).nextAll(".apTree32");

         if(apTree2.css("display") == "none") {
        	 apTree2.slideDown();

         }else {
        	 apTree2.slideUp();
         }

         if (apTree31.is(':hidden')) {
         } else {
        	 apTree31.slideUp('slow');
         }

         if (apTree32.is(':hidden')) {
         } else {
        	 apTree32.slideUp('slow');
         }
     });
     
     $(".apTree21").click(function(){
         var apTree31 = $(this).nextAll(".apTree31");

         if(apTree31.css("display") == "none") {
        	 apTree31.slideDown();
         }else{
        	 apTree31.slideUp();
         }
     });

     $(".apTree22").click(function(){
         var apTree31 = $(this).nextAll(".apTree32");

         if(apTree31.css("display") == "none") {
        	 apTree31.slideDown();
         }else{
        	 apTree31.slideUp();
         }
     });

     /* 결재선 조직도/검색 클릭 시  */
     $("#apChart-container").show();
     $("#apSch-container").hide();

     $("#apOrgChart").click(function(){
         $("#apChart-container").show();
         $("#apSch-container").hide();
         $("#apOrgChart").css("border", "none");
         $("#apOrgChart").css("background", "rgb(7, 53, 90)");
         $("#apOrgChart").css("color", "white");
         $("#apSch").css("border", "1px solid rgb(7, 53, 90)");
         $("#apSch").css("background", "white");
         $("#apSch").css("color", "rgb(7, 53, 90)");
     });

     $("#apSch").click(function(){
         $("#apSch-container").show();
         $("#apChart-container").hide();
         $("#apSch").css("border", "none");
         $("#apSch").css("background", "rgb(7, 53, 90)");
         $("#apSch").css("color", "white");
         $("#apOrgChart").css("border", "1px solid rgb(7, 53, 90)");
         $("#apOrgChart").css("background", "white");
         $("#apOrgChart").css("color", "rgb(7, 53, 90)");
     });
	 
	 
     /* 결재선 조직도 선택 */
     /* 본인을 결재자로 선택하지 못하도록 */
     $(".apRefEmpName").click(function(){
    	 var userId = $("#empId").val();
    	 var clickedId = $(this).prevAll(".apRefedId").val();
    	 
    	 var hiddenChk = $(this).prev();
    	 
    	 if(userId == clickedId){
    		 hiddenChk.prop("checked", false);
             $(this).css("background", "white");
             $(this).next().css("background", "white");
    	 }else{
    		 if(hiddenChk.is(":checked")){
                 hiddenChk.prop("checked", false);
                 $(this).css("background", "white");
                 $(this).next().css("background", "white");
             }else{
                 hiddenChk.prop("checked", true);
                 $(this).css("background", "lightsteelblue");
                 $(this).next().css("background", "lightsteelblue");
             }
    	 }
    	 
     });
	 

     /* 결재선 사원 검색 시 */
     $("#apSchBtn").click(function(){
         
         $.ajax({
             url:"empSch.rap",
             data:{keyword:$("#apSchInput").val()},
             type:"post",
             success:function(schEmp){
                 if(schEmp.length > 0) {
                     
                     var value ="";
                     var userId = $("#empId").val();
                     
                     for(var i in schEmp){
                    	 
                    	 if(userId == schEmp[i].empId){
                    		 value += "<tr>" + 
				                             "<td>" + 
				                             	 "<input type='hidden' class='apRefedJob' value='" + schEmp[i].jobName + "'>" +
				                                 "<input type='hidden' class='apRefedId' value='" + schEmp[i].empId + "'>" +
				                                 "<input type='hidden' value='" + schEmp[i].deptName + "'>" +
				                                    "<div style='visibility:hidden; height:0px;'>" + schEmp[i].empName + "</div></td>" +
				                             "<td>" + schEmp[i].deptName + "</td>" + 
				                             "<td>" + schEmp[i].jobName + "</td>" +
				                             "<td>" + schEmp[i].empName + "</td>" +
				                      "</tr>"
                    		 
                    	 }else{
	                         value += "<tr>" + 
	                                         "<td>" + 
	                                         	 "<input type='hidden' class='apRefedJob' value='" + schEmp[i].jobName + "'>" +
	                                             "<input type='hidden' class='apRefedId' value='" + schEmp[i].empId + "'>" +
	                                             "<input type='hidden' value='" + schEmp[i].deptName + "'>" +
	                                             "<input type='checkbox' name='apRefChk' class='chk'>" +
	                                             "<div style='visibility:hidden; height:0px;'>" + schEmp[i].empName + "</div></td>" +
	                                         "<td>" + schEmp[i].deptName + "</td>" + 
	                                         "<td>" + schEmp[i].jobName + "</td>" +
	                                         "<td>" + schEmp[i].empName + "</td>" +
	                                  "</tr>"
                    	 }
                    	 
                     }
                     
                     $("#apEmpList tbody").html(value);
                     
                 }else {
                     alert("올바른 검색어를 입력하세요.");
                 }
                 
             }, error:function(){
                 alert("결재선 사원 검색 실패");
             }
         });
         
     });
     
     /* 결재선선택(왼쪽 => 오른쪽) */
     $("#apChooseRef").click(function(){
         
         var apRefedEmp = [];
         var apRefedDept = [];
         var apRefedId = [];
         var apRefedJob = [];
         
         $("input:checkbox[name=apRefChk]:checked").each(function(){
             apRefedEmp.push($(this).next().text());
             apRefedDept.push($(this).prev().val());
             apRefedId.push($(this).prevAll(".apRefedId").val());
             apRefedJob.push($(this).prevAll(".apRefedJob").val());
         });
         
         /*중복값 못 들어가도록 */
         var flag2 = true;
         
         $("#apRefEmpArea").find(".apRefedEmpName").each(function(index, item){
            
             for(var j=0; j<apRefedEmp.length; j++){
             	if(item.innerText == apRefedEmp[j]){
             		flag2 = false;
             	}
             }
         });
         
         var c = $(".apRefedEmpName").length;
         if(c<4){
        	 if(flag2){
              	for(var i=0; i<apRefedEmp.length; i++){
                  	$("#apRefEmpArea").append("<tr>" +
     					             			"<td>" + 
     					             				"<span>" + "결재" + "</span>" +
     						                        "<span class='apRefedEmpId' style='display:none'>" + apRefedId[i] + "</span>" +
     						                        "<input type='checkbox' class='checkBox' name='checkBox' style='visibility:hidden'>" +
     						                        "<span class='apRefedEmpName'>" + apRefedEmp[i] + " " + apRefedJob[i] + "</span>" + 
     						                        "<span class='apRefedEmpDept'> | " + apRefedDept[i] + "</span>" + 
     						                     "</td>" +
          				                     "</tr>");
                  }
              }else{
              	console.log("못들어감");
              }
         }else{
        	 alert("결재선을 4개까지만 추가할 수 있습니다.");
         }
         
         $("input:checkbox[name=apRefChk]").prop("checked", false);
         $("input:checkbox[name=apRefChk]").nextAll().css("background", "white");
         
     });
     
     /* 결재선 오른쪽에서 삭제 */
     $("#apCancelRef").click(function(){
         
         $("input:checkbox[name=checkBox]:checked").each(function(){
             $(this).parents('tr').remove();
         });
         
     });
     
     /* 추가된 결재선 선택 */
     $("#apRefEmpArea").on("click", ".apRefedEmpName", function(){	
         console.log("클릭됨");
    	 
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
     $("#apSelectedEmp").on("click", ".apRefedEmpDept", function(){	
         
         var hiddenChk = $(this).prevAll('.checkBox');
         
         if(hiddenChk.is(":checked")){
             hiddenChk.prop("checked", false);
             $(this).css("background", "white");
             $(this).siblings('.apRefedEmpName').css("background", "white");
         }else{
             hiddenChk.prop("checked", true);
             $(this).css("background", "lightsteelblue");
             $(this).siblings('.apRefedEmpName').css("background", "lightsteelblue");
         }
         
     });
     
     /* 결재선 적용 버튼 */
     $("#lineApplyBtn").click(function(){
    	 
    	 /* 결재선으로 지정된 값들 넘기기 */
    	 $("input:checkbox[name=checkBox]").prop("checked", true);
    	 
    	 var line = [];
    	 
    	 $("input:checkbox[name=checkBox]:checked").each(function(){
    		 line.push($(this).prev().text());
	     });

    	 $("#approver").val(line);
    	 /* 결재선 지정되지 않으면, 결재요청 버튼 클릭 못하도록 */
    	 $("#approveBtn").attr("disabled", false);
    	 $("#line").val(line);
    	 
    	 /* 결재선 모달 닫기 */
    	 $('#approveLineModal').modal("hide");
    	 
    	 $('.apTree3').slideUp();
         $('.apTree2').slideUp();
         $("#apSchInput").val("");
         $('#apEmpList>tbody>tr').remove();
         $("input:checkbox[name=apRefChk]").prop("checked", false);
         
         $("input:checkbox[name=checkBox]").prop("checked", false);
         $('#apRefEmpArea tr').remove();
         
     });

     /* 결재선 취소 버튼 */
     $("#lineCancelBtn").click(function(){
    	 $('#approveLineModal').modal("hide");
    	 
    	 $('.apTree3').slideUp();
         $('.apTree2').slideUp();
         $("input:checkbox[name=apRefChk]").prop("checked", false);
         $("#apSchInput").val("");
         $('#apEmpList>tbody>tr').remove();
         
         $("input:checkbox[name=checkBox]").prop("checked", false);
         $('#apRefEmpArea tr').remove();
         
     });
     
     
     /*결재선 즐겨찾기 조회*/
     selectFreLineList();
     
     /* 결재선 즐겨찾기 저장 */
	 $("#enrollBtn").click(function(){
		 
		 /* 결재선 즐겨찾기 추가 전, 같은 이름 있는지 확인 */
		 $.ajax({
			url:"selectName.rap",
			data:{lineName:$("#lineName").val(),
				   empId:$("#empId").val()},
			type:"post",
			success:function(count){
				
				if(count > 0){
					alert("같은 결재선 즐겨찾기명이 있습니다. 다른 즐겨찾기명을 입력하세요.");
				}else{
					
					/* 결재선 즐겨찾기 추가 */
					 $("input:checkbox[name=checkBox]").prop("checked", true);
			    	 
			    	 var line = [];
			    	 
			    	 $("input:checkbox[name=checkBox]:checked").each(function(){
			    		 line.push($(this).prev().text());
				     });

			    	 $("#line").val(line);
					
					 $.ajax({
						url:"insertFreLine.rap",
						data:{lineName:$("#lineName").val(),
							 empId:$("#empId").val(),
							 approver:$("#line").val()},
						type:"post",
			 			success:function(status){
			 				
			 				if(status == "success"){
			 					selectFreLineList();
			 				}else{
			 					
			 				}
			 				
			 			}, error:function(){
			 				console.log("결재선 즐겨찾기 저장 ajax 통신 실패!");
			 			}
			 			
					 });
					 
					 $("#lineName").val("");
				}
				
			}, error:function(){
				console.log("결재선 즐겨찾기명 중복값 조회 ajax 통신 실패!");
			}
			 
		 });
		 
	 });
    	 
     
     /* 결재선 즐겨찾기 리스트 조회 */
     function selectFreLineList(){
    	 
    	 $.ajax({
    		url:"flist.rap",
    		data:{empId:$("#empId").val()},
    		type:"post",
    		success:function(count){
    			
    			var value = "";
    			
    			for(var i=0; i<count.length; i++){
    				value += "<option value='" + count[i].lineName + "'>"  + count[i].lineName + "</option>";
    			}
    			
    			$("#chooseApproveLine").html(value);
    			
    		}, error:function(){
    			console.log("결재선 즐겨찾기 리스트 조회용 ajax 통신실패!!");
    		}
    	 });
    	 
     }
     
     /* 결재선 즐겨찾기 리스트 선택시 결재라인 조회 */
     $(document).on("click", "#selectBtn", function(){
		 var lineName = $("#chooseApproveLine option:selected").val();
		 
		 $.ajax({
			url:"lineDetail.rap",
			data:{empId:$("#empId").val(),
				  lineName:lineName},
		    type:"post",
			success:function(f){
				
				var value = "";
				
				for(var i=0; i<f.length; i++){
                  	value += "<tr>" +
		             			"<td>" + 
		             				"<span>" + "결재" + "</span>" +
			                        "<span class='apRefedEmpId' style='display:none'>" + f[i].authorizedEmpid + "</span>" +
			                        "<input type='checkbox' class='checkBox' name='checkBox' style='visibility:hidden'>" +
			                        "<span class='apRefedEmpName'>" + f[i].empName + " " + f[i].jobName + "</span>" + 
			                        "<span class='apRefedEmpDept'> | " + f[i].deptName + "</span>" + 
			                     "</td>" +
		                     "</tr>";
                  }
				
				$("#apRefEmpArea").html(value);
			
			}, error:function(){
				console.log("결재선 즐겨찾기 조회용 ajax 통신실패!!");
			}
		 });
		 
	 });
    
     /* 결재선 즐겨찾기 삭제 */
     $(document).on("click", "#deleteBtn", function(){
		 var lineName = $("#chooseApproveLine option:selected").val();
		 
		 $.ajax({
			url:"lineDelete.rap",
			data:{empId:$("#empId").val(),
				  lineName:lineName},
			type:"post",
			success:function(status){
			
				console.log(status);
				
				if(status == "success"){
 					selectFreLineList();
 				}else{
 					
 				}
				
			}, error:function(){
				console.log("결재선 즐겨찾기 조회용 ajax 통신실패!!");
			}
		 });
		 
		 $('#apRefEmpArea tr').remove();
		 
	 });
     
 });