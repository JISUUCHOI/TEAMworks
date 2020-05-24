<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재선</title>
<!-- jQuery-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
    @font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }
    @font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
    body{
        box-sizing:border-box;
    }
    /* 전체윤곽 */
    #approveLineOuter{
        width:650px;
        height:500px;
        padding:20px 20px 0 20px;
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
        width:250px;
        height:400px;
        border:1px solid rgb(7, 53, 90);
        font-family: 'Handon3gyeopsal300g';
        float:left;
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
        margin-left:70px;
        display:none;
    }
    .tree31>span, .tree32>span{
        line-height:180%;
    }
    
    /* 검색 */
    #schBox{
        width:202px;
        height:40px;
        border:1px solid rgb(7, 53, 90);
        margin:10px 10px 5px 13px;
        padding:10px 0px 0px 15px;
    }
    #schInput{
        width:100px;
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
        width:217px;
        height:300px;
        margin-left:13px;
    }
    .empList{
        margin-top:20px;
        margin-left:10px;
        text-align:center;
        /* margin:auto; */
    }
    .empList, .empList>tbody>tr{
        border-top: 1px solid lightgrey;
        border-bottom: 1px solid lightgrey;
        border-collapse: collapse;
        font-size:12px;
    }
    .empList th{text-align:center;}
    .empList>thead>tr{
        border-top-style:groove;
        border-bottom-style:groove;
    }
    .empList tr{height:28px;}
    .empList>tbody>tr:hover{
        background:lightsteelblue;
        color:white;
    }

    /* 선택/취소 */
    #chooseCancle{
        /* border:1px solid green; */
        width:30px;
        height:100px;
        margin:140px 10px 0px 10px;
        float:left;
        /* border:1px solid green; */
    }
    .choose{
        border-radius:50%;
        border:1.2px solid rgb(7, 53, 90);
        width:30px;
        height:30px;
        color:rgb(7, 53, 90);
        font-weight:600;
        text-align:center;
        line-height:2;
        margin-top:10px;
        cursor:pointer;
    }

    /* 결재선 */
    #approvalLine{
        width:340px;
        height:400px;
        border:1px solid rgb(7, 53, 90);
        font-family: 'Handon3gyeopsal300g';
        float:left;
    }
    .frequentLine{
        width:300px;
        height:40px;
        border:1px solid rgb(7, 53, 90);
        margin:10px 10px 5px 13px;
        padding:10px 0px 0px 10px;
    }
    #chooseApproveLine{
        margin-left:8px;
        width:150px;
        height:30px;
        font-size:13px;
    }
    #deleteBtn, #enrollBtn{
        width:40px;
        height:28px;
        margin-left:5px;
        background:white;
        border:1px solid rgb(7, 53, 90);
        font-size:12px;
        font-weight:600;
        cursor:pointer;
    }
    #selectedEmp{
        width:300px;
        height:200px;
        border:1px solid rgb(7, 53, 90);
        margin:10px 10px 5px 13px;
        padding:10px 0px 0px 10px;
    }
    #selectedEmpList, #selectedEmpList tr, #selectedEmpList td{
        border:1px solid lightgrey;
        border-collapse:collapse;
    }
    #selectedEmpList tr{
        height:25px;
    }
    #selectedEmpList td{
        padding-left:10px;
    }

    #enrollApproveLine{
        width:140px;
        height:28px;
        margin-left:5px;
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
    
    <div id="approveLineOuter">
        <button id="orgChart"">조직도</button>
        <button id="sch">검색</button><br>
        <div id="chart-container">
            <div class="tree1">(주)TEAMWORKS</div>
            <div class="tree2 tree21 fold1">경영지원팀</div>
            <div class="tree3 tree31">
                <span>ㄴ 이용석 부장</span><br>
                <span>ㄴ 이용석 사원</span><br>
                <span>ㄴ 이용석 사원</span><br>
                <span>ㄴ 이용석 사원</span><br>
                <span>ㄴ 이용석 사원</span><br>
            </div>
            <div class="tree2 tree22 fold2"> 개발팀</div>
            <div class="tree3 tree32">
                <span>ㄴ 최해성 부장</span><br>
                <span>ㄴ 최해성 사원</span><br>
                <span>ㄴ 최해성 사원</span><br>
                <span>ㄴ 최해성 사원</span><br>
                <span>ㄴ 최해성 사원</span><br>
            </div>
        </div>
        <div id="sch-container">
            <div id="schBox">
                <font>사원명</font>
                <input name="empName" type="search" id="schInput">
                <button type="submit" id="schBtn">검색</button>
            </div>

            <div id="empListArea">
                <table class="empList">
                    <thead>
                        <tr>
                            <th width="17"></th>
                            <th width="50">부서</th>
                            <th width="50">직급</th>
                            <th width="70">사원명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>개발팀</td>
                            <td>부장</td>
                            <td>최해성</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>개발팀</td>
                            <td>부장</td>
                            <td>최해성</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>개발팀</td>
                            <td>부장</td>
                            <td>최해성</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>개발팀</td>
                            <td>부장</td>
                            <td>최해성</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div id="chooseCancle">
            <div class="choose"> &gt; </div>
            <div class="choose"> &lt; </div>
        </div>

        <div id="approvalLine">
            <h4 style="margin-left:10px;">결재선 정보</h4>
            <div class="frequentLine">
                <font>사용자 결재선</font>
                <select name="freApproveLine" id="chooseApproveLine">
                    <option value="freArroveLine1">결재선 즐겨찾기</option>
                    <option value="freArroveLine2">경영지원팀 결재선</option>
                    <option value="freArroveLine3">개발팀 결재선</option>
                </select>
                <button type="button" id="deleteBtn">삭제</button>
            </div>
            <div id="selectedEmp">
                <table id="selectedEmpList">
                    <tr>
                        <td width="35"></td>
                        <td width="35">기안</td> 
                        <td width="100">홍길동</td>
                        <td width="70">경영지원팀</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>결재</td>
                        <td>가가가</td>
                        <td>개발팀</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>결재</td>
                        <td>나나나</td>
                        <td>개발팀</td>
                    </tr>
                    <tr>
                        <td>최종</td>
                        <td>결재</td>
                        <td>다다다</td>
                        <td>개발팀</td>
                    </tr>
                </table>

            </div>
            <div class="frequentLine">
                <font>사용자 결재선명</font>
                <input id="enrollApproveLine">
                <button type="button" id="enrollBtn">저장</button>
            </div>
        </div>

        <div id="approveLineBtns">
            <button id="lineApplyBtn">적용</button>
            <button id="lineCancelBtn">취소</button>
        </div>

    </div>

    <script>
        $(function(){

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