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

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha256-siyOpF/pBWUPgIcQi17TLBkjvNgNQArcmwJB8YvkAgg=" crossorigin="anonymous" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha256-tz3ebpf1UY2wJOfYAEYo/iIElWlm+JNP7cOGtloSAWM=" crossorigin="anonymous"></script>
<style>
     .outer{
			width:1250px;
			float:left;
			margin-left:220px;
		
		 }
    .inner{width: 900px;}
    /* #searchForm>*{float: left; margin: 10px;} */
</style>
</head>
<body>
  <div class="outer" align="center">
        <br>
        <div class="inner">
           <form action="" class="form-inline" style="float: right;">
            <div class="form-group input-group" style="width: 180px;">
                <span  class="input-group-addon"><i class="far fa-calendar-alt"></i></span>
                <input id="startDate" type="text" id="start" class="form-control"  readonly > 
            </div>
            <div class="form-group">~</div>
            <div class="input-group" style="width: 180px;">
                <span class="input-group-addon"><i class="far fa-calendar-alt"></i></span>
                <input id="endDate"  type="text" class="form-control" readonly> 
            </div>
            <div  class="form-group">
                <select class="form-control" name="" id=""  style="width: 120px;">
                    <option value="">작성자</option>
                    <option value="">제목</option>
                    <option value="">내용</option>
                 </select>
              </div>
              <div class="form-group input-group"style="width: 235px;">
                <input type="text" class="form-control" placeholder="Search">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </div>
          </div>
        </form>
            
        </div>
        <br><br>
     
        <div class="inner">
            <hr>
            <h4>공지사항</h4>
            <hr>
            <table class="table table-hover text-center">
                <thead>
                    <tr>
                        <td width="60px"><b>NO</b></td>
                        <td><b>제목</b></td>
                        <td width="100px"><b>작성자</b></td>
                        <td width="100px"><b>등록일</b></td>
                        <td width="80px"><b>조회</b></td>
                        <td width="80px"><b>추천</b></td>
                        <td width="80px"><b><i class="fas fa-paperclip"></i></b></td>
                    </tr>
                </thead>
              <tbody>
                    <tr>
                        <td>1</td>
                        <td>공지사항입니다.</td>
                        <td>강보람</td>
                        <td>2020-05-01</td>
                        <td>0</td>
                        <td>0</td>
                        <td><i class="fas fa-paperclip"></i></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <ul class="pagination">
                <li class="previous"><a href="">&lt;</a></li>
                <li><a href="">1</a></li>
                <li><a href="">2</a></li>
                <li><a href="">3</a></li>
                <li class="next"><a href="">&gt;</a></li>
            </ul>
        </div>
    </div>

    <script>
        $(function() {	
            $('#startDate').datepicker({
                format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
                autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
                clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
                disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
                immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
                multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
                multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
                templates : {
                    leftArrow: '&laquo;',
                    rightArrow: '&raquo;'
                }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
                showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
                todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
                toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
                weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
                language : "ko",	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
               
                
            });//datepicker end
          
           
            $('#endDate').datepicker({
                format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
                autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
                clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
                disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
                immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
                multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
                multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
                templates : {
                    leftArrow: '&laquo;',
                    rightArrow: '&raquo;'
                }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
                showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
                todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
                toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
                weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
                language : "ko",	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
               
            });//datepicker end

            $("#endDate").change(function(){
                if($("#startDate").val()>$("#endDate").val()){
                    alert("검색 기간을 다시 설정해주세요.");
                    $("#endDate").val("");
                    $("#endDate").focus();
                }                    

            });
      
        });//ready end
    </script>
</body>
</html>