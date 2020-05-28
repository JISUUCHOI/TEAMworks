<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;width: 500px;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:15px 19px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:15px 19px;word-break:normal;}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-uzvj{border-color:inherit;font-weight:bold;text-align:center;vertical-align:middle}
.tg .tg-0lax{border-color:inherit;text-align:center;vertical-align:middle}
</style>
</head>
<body>

     <jsp:include page="../common/menubar.jsp"/>

     <div class="content">
         <div>
            <table class="tg">
                <thead>
                    <tr>
                      <th class="tg-uzvj">사원번호</th>
                      <th class="tg-9wq8">0000</th>
                      <th class="tg-uzvj">성명</th>
                      <th class="tg-9wq8">라공주</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="tg-uzvj">주민등록번호</td>
                      <td class="tg-9wq8">9011221234567</td>
                      <td class="tg-uzvj">생년월일</td>
                      <td class="tg-9wq8">901122</td>
                    </tr>
                    <tr>
                      <td class="tg-uzvj">핸드폰</td>
                      <td class="tg-9wq8">01012344321</td>
                      <td class="tg-uzvj">E-Mail</td>
                      <td class="tg-9wq8">iqqi12@kh.com</td>
                    </tr>
                    <tr>
                      <td class="tg-uzvj">자택전화</td>
                      <td class="tg-9wq8">0313214321</td>
                      <td class="tg-uzvj">회사전화</td>
                      <td class="tg-9wq8">1112222</td>
                    </tr>
                  </tbody>
                </table>
    
                <table class="tg" >
                      <tr>
                        <th class="tg-0lax" rowspan="2"><b>자택주소</b></th>
                        <th class="tg-0lax"><button>우편번호 검색 api 집어넣고</button></th>
                      </tr>
                      <tr>
                        <td class="tg-0lax">상세주소</td>
                      </tr>
                </table>

                <table>
                  <div style="float: left;">
                    <tr>
                      <th>사업장</th>
                      <th>모름</th>
                    </tr>
                    <tr>
                      <th>직급</th>
                      <th>
                        <select name="jobcode" id="jobcode">
                          <option value="1">사장</option>
                          <option value="2">이사</option>
                          <option value="3">부장</option>
                          <option value="4">차장</option>
                          <option value="5">과장</option>
                          <option value="6">대리</option>
                          <option value="7">사원</option>
                        </select>
                      </th>
                    </tr>
                    <th>재직구분</th>
                    <th>
                      <select>
                        <option>재직</option>
                        <option>퇴직</option>
                      </select>
                    </th>
                  </div>
                  <div style="float: right;">
                    <tr>
                      <th>부서</th>
                      <th>
                        <select>
                          <option>개발팀</option>
                          <option>인사팀</option>
                          <option>행정팀</option>
                        </select>
                      </th>
                    </tr>
                    <tr>
                      <th>입사일자</th>
                      <th>날짜 선택</th>
                    </tr>
                    <tr>
                      <th>퇴직일자</th>
                      <th>날짜 선택</th>
                    </tr>
                    <tr>
                      <th>급여 계약 기준</th>
                      <th>
                        <select>
                          <option>연봉제</option>
                          <option>기간제</option>
                        </select>
                      </th>
                    </tr>
                  </div>

                </table>

         </div>
        

    </div>

    <jsp:include page="../common/sidebarSample.jsp"/>

</body>
</html>
