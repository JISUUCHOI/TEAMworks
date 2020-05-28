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

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
		 .outer{
			width:1250px;
			float:left;
			margin-left:220px;
		
		 }
	     .wrap{
	         width: 900px; 
	         font-family: 'Nanum Gothic';
	         border: 1px solid lightgray;
	         border-radius: 20px;
	         padding: 20px;
	         margin-top: 20px;
	         box-shadow: lightgrey 5px 5px 5px ;
	         }
	      #memberInfo{ 
	         border-collapse: separate;
	         border-spacing: 20px;
	      }
	</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>
<jsp:include page="../common/sidebarMypage.jsp"/>

<div class="outer" align="center">

        <div class="inner wrap">
            <h3>기본정보</h3>
            <form id="myPageForm" action="update.em" method="post" enctype="multipart/form-data">
                 <table id="memberInfo" class="">
                     <hr>
                     <tr>
                         <th width="100px">사 진</th>
                         
                         <td>    
                             <div style="border:1px solid lightgray; width:100px; height:100px; border-radius: 50%; overflow: hidden;">
                                 <c:choose>
                                 	<c:when test="${ empty loginUser.originName }">
                                 		<a id="empImg" href="" data-toggle="modal" data-target="#insertProfile">
                                 		<img class="card-imtg-top" src="${ pageContext.servletContext.contextPath }/resources/images/No-image-available.png" alt="" width="100%" height="100%" ></a>
                                 		
                                 	</c:when>
                                 	<c:otherwise>
                                 		<a id="empImg" href=""  data-toggle="modal" data-target="#updateProfile">
                                 		<img class="card-imtg-top" src="${ pageContext.servletContext.contextPath }/resources/empUploadFiles/${loginUser.changeName}" alt="" width="100%" height="100%" ></a>
                             	 		
                             	 	</c:otherwise>
                             	 </c:choose>
                             </div>
                         </td>
                         <td width="200px"></td>
                         <td width="100px"></td>
                     </tr>
                     <tr>
                         <th>이 름</th>
                         <td>${ loginUser.empName }</td>
                         <td></td>
                         <td></td>
                     </tr>
                     <tr>
                         <th>부 서</th>
                         <td>${ loginUser.deptName }</td>
                         <td></td>
                         <td></td>
                     </tr>
                     <tr>
                         <th>직 급</th>
                         <td>${ loginUser.jobName }</td>
                         <td></td>
                         <td></td>
                     </tr>
                     <tr>
                         <th>우편번호</th>
                         <td colspan="1">
                             <input  class="form-control" type="text" id="postcode" name="postcode" placeholder="우편번호" disabled>
                         </td>
                         <td>
                             <input class="btn btn-info" type="button" onclick="daumPostCode();" value="우편번호 찾기">
                             
                         </td>
                     </tr>
                     <tr>
                         <th>도로명주소</th>
                         <td colspan="3"><input class="form-control" type="text" id="address" name="empAdd" value="${ loginUser.empAdd }" placeholder="주소" readonly></td>
                     </tr>
                     <tr>
                         <th>상세주소</th>
                         <td colspan="3">
                             <input class="form-control" type="text" id="detailAddress" name="empAddDetail" value="${ loginUser.empAddDetail }" placeholder="상세주소">
                             <input type="hidden" id="extraAddress" placeholder="참고항목">
                         </td>
                     </tr>
                     <tr>
                         <th>EMAIL</th>
                         <td colspan="2"> <input type="email" class="form-control" name="email" value="${ loginUser.email }"></td>
                         <td></td>
                     </tr>
                     <tr>
                         <th>연락처</th>
                         <td colspan="2"> <input type="text" class="form-control" name="phone" value="${loginUser.phone}"></td>
                         <td></td>
                     </tr>
                     <tr>
                         <th>생년월일</th>
                         <td colspan="2"></td>
                         <td></td>
                     </tr>
                 </table>
                 <br>
                 <button type="submit" id="submitBtn" class="btn btn-primary" style="margin-right: 40px;">저장</button>
                 <button type="reset" class="btn">취소</button>
             </form>
        </div>
   
    </div>
    
 <!-- 프로필 이미지 Modal -->
	<div id="insertProfile" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">프로필 이미지 등록</h4>
				</div>
				<form action="profile.em" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" name="changeName" value="${loginUser.changeName}">
						<input type="hidden" name="empId" value="${loginUser.empId}">
						<input type="file" class="" name="empProfile" accept=".jpg,.jpeg,.png,.gif,.bmp">
					</div>
					<div class="modal-footer">
						<button type="submit" id="modalBtn" class="btn btn-default">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="updateProfile" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">프로필 이미지 등록</h4>
				</div>
				<form action="updateProfile.em" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" name="changeName" value="${loginUser.changeName}">
						<input type="hidden" name="empId" value="${loginUser.empId}">
						<input type="file" class="" name="empProfile" accept=".jpg,.jpeg,.png,.gif,.bmp">
					</div>
					<div class="modal-footer">
						<button type="submit" id="modalBtn" class="btn btn-default">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	<script>
    	$(function(){
    		/* $("#modalBtn").click(function(){
    			$("#submitBtn").click();
    		}); */
    		
    	});
    </script> 

  
<script>
    
    function daumPostCode(){
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
            }).open();

   	 }
    
   
</script>
</body>
</html>