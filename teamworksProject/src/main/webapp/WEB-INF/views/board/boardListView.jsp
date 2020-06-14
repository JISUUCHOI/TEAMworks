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
body {font-family: Handon3gyeopsal300g;}
     .outer{
			width:1250px;
			float:left;
			margin-left:220px;
			margin-top:20px;
		
		 }
    .inner{width: 900px;}
    /* #searchForm>*{float: left; margin: 10px;} */
</style>
</head>
<body>
	<script>
       	$(function(){
       		$("#topBoard").css("border-bottom-style","groove");
       		$("#topBoard a").css("color","dimgray");
       		$("#boardMenu>a").css("color", "deepskyblue");
       	});
       </script>
<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="sidebarBoard.jsp"/>
  <div class="outer" align="center">
        <br>
        <div class="inner">
        <h4 align="left"><i class="far fa-list-alt"></i>&nbsp;&nbsp;<b>자유게시판</b></h4>
            <hr>
           <form action="search.bo" class="form-inline" style="float: right;">
         	<input type="hidden" name="cat" value="2"> 
         	<input type="hidden" name="currentPage" value="1"> 
            <div class="form-group input-group" style="width: 180px;">
                <span  class="input-group-addon"><i class="far fa-calendar-alt"></i></span>
                <input id="startDate" type="text" name="start" value="${ sc.start }" class="form-control"  readonly > 
            </div>
            <div class="form-group">~</div>
            <div class="input-group" style="width: 180px;">
                <span class="input-group-addon"><i class="far fa-calendar-alt"></i></span>
                <input id="endDate"  type="text" name="end" value="${sc.end}" class="form-control" readonly> 
            </div>
            <div  class="form-group" id="searchArea">
                <select class="form-control" name="condition" id=""  style="width: 120px;">
                    <option value="writer">작성자</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                 </select>
              </div>
              <div class="form-group input-group"style="width: 235px;">
                <input type="text" class="form-control" name="keyword" value="${ sc.keyword }" placeholder="Search">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </div>
          </div>
        </form>
        </div>
       <script type="text/javascript">
       		$(function(){
       			switch('${sc.condition}'){
       			case "writer": $("#searchArea option").eq(0).attr("selected", true);  break;
				case "title":  $("#searchArea option").eq(1).attr("selected", true);  break;
				case "content": $("#searchArea option").eq(2).attr("selected", true);  break;
				 
       			}
       		});
       </script>
        <br><br>
     
        <div class="inner">
       
	         <div align="right">
	         	<button onclick="location.href='enrollForm.bo?cat=2'" class="btn btn-info">글쓰기</button>
	         </div>
         
            <hr>
            
           
            <table id="boardList" class="table table-hover text-center">
                <thead>
                    <tr>
                        <td width="60px"><b>NO</b></td>
                        <td><b>제목</b></td>
                        <td width="100px"><b>작성자</b></td>
                        <td width="130px"><b>등록일</b></td>
                        <td width="80px"><b>조회</b></td>
                        <td width="80px"><b>추천</b></td>
                        <td width="80px"><b><i class="fas fa-paperclip"></i></b></td>
                    </tr>
                </thead>
              <tbody>
              	<c:forEach var="b" items="${ list }">
                    <tr>
                        <td>${ b.boardNo }</td>
                        <c:choose>
                        	<c:when test="${ b.rcount ne 0}">
                        		<td>${ b.boardTitle } <span style="color:rgb(255, 80, 80)">(${ b.rcount })</span></td>
                        	</c:when>
                        	<c:otherwise>
                        		<td>${ b.boardTitle }</td>
                        	</c:otherwise>
                        </c:choose>
                        <td>${ b.empName }</td>
                        <td>${ b.createDate }</td>
                        <td>${ b.count }</td>
                        <td>${ b.like }</td>
                        <c:choose>
                        	<c:when test="${ !empty b.boardFiles }">
                        		<td><i class="fas fa-paperclip"></i></td>
                        	</c:when>
                        	<c:otherwise>
                        		<td></td>
                        	</c:otherwise>	
                        </c:choose>
                    </tr>
                  </c:forEach>
                </tbody>
            </table>
              <script>
            	$(function(){
            		$("#boardList tbody tr").click(function(){
            			
            			location.href="detail.bo?bno="+ $(this).children().eq(0).html();
            			
            		});
            	});
            	
            </script>
            <br>
            <ul class="pagination">
            	<c:if test="${ pi.currentPage ne 1 }">
            		<c:choose>
            			<c:when test="${ empty sc }">
            				<li class="previous"><a href="list.bo?currentPage=${ pi.currentPage - 1 }&cat=2">&lt;</a></li>
            			</c:when>
            			<c:otherwise>
            					<c:url value="search.bo" var="searchUrl">
										<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="start" value="${ sc.start }"/>
										<c:param name="end" value="${ sc.end }"/>
										<c:param name="cat" value="2"/>
										<c:param name="currentPage" value="${  pi.currentPage -1 }"/>
								</c:url>
            				<li class="previous">
            				<a href="${ searchUrl }">&lt;</a>
            				</li>
            			</c:otherwise>
            		</c:choose>
            	
            	</c:if>
            	
            	 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            	 	<c:choose>
            	 		<c:when test="${ p eq pi.currentPage }">
            	 			<li class="disabled"><a href="">${ p }</a></li>
            	 		</c:when>
            	 		<c:otherwise>
            	 			<c:choose>
	            	 			<c:when test="${ empty sc }">
	            					<li class=""><a href="list.bo?currentPage=${ p }&cat=2">${ p }</a></li>
	            				</c:when>
	            				<c:otherwise>
	            					<c:url value="search.bo" var="searchUrl">
										<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="start" value="${ sc.start }"/>
										<c:param name="end" value="${ sc.end }"/>
										<c:param name="cat" value="2"/>
										<c:param name="currentPage" value="${ p }"/>
									</c:url>
	            					<li class="">
	            						<a href="${searchUrl}">${ p }</a>
	            					</li>
	            				</c:otherwise>
            				</c:choose>
            	 		</c:otherwise>
            	 	</c:choose>
            	 </c:forEach>
            	
            	<c:if test="${ pi.currentPage ne pi.maxPage }">
            		<c:choose>
						<c:when test="${ empty sc }">
							<li class="next"><a href="list.bo?currentPage=${ pi.currentPage + 1 }&cat=2">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<c:url value="search.bo" var="searchUrl">
										<c:param name="condition" value="${ sc.condition }"/>
										<c:param name="keyword" value="${ sc.keyword }"/>
										<c:param name="start" value="${ sc.start }"/>
										<c:param name="end" value="${ sc.end }"/>
										<c:param name="cat" value="2"/>
										<c:param name="currentPage" value="${  pi.currentPage + 1  }"/>
							</c:url>
							<li class="next">
							<a href="${ searchUrl }">&gt;</a>
							</li>
						</c:otherwise>        		
            		</c:choose>
            	</c:if>
            </ul>
        </div>
         <br><br><br>
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