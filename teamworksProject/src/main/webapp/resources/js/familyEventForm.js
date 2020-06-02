$(function(){
    $("#writeDoc>a").css("color", "deepskyblue");
});

/*참조자 모달용 스크립트*/
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