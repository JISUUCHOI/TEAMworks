<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회사 정보 관리</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
          font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
        .tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
        .tg .tg-7btt{border-color:inherit;font-weight:bold;text-align:center;vertical-align:top}
        .tg  {border-collapse:collapse;border-spacing:0;}
        .tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
         overflow:hidden;padding:20px 20px;word-break:normal;}
        .tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
        font-weight:normal;overflow:hidden;padding:20px 20px;word-break:normal;}
        .tg .tg-baqh{text-align:center;vertical-align:top}
        .tg .tg-amwm{font-weight:bold;text-align:center;vertical-align:top}
        .tg .tg-0lax{text-align:left;vertical-align:top}

       
        #t2{
            float: left;
        }
        #t3{
            float:left;
            margin: auto;
            vertical-align: middle;
            padding-bottom: 130px;
            padding-left:30px;
        }

    </style>
</head>
<body>

     <jsp:include page="../common/menubar.jsp"/>
     <jsp:include page="../common/sidebarMg.jsp"/>
     
  
        <div style="width:1250px; float:left; margin-left:25%;">
            
            <h1>회사 정보</h1>
            <hr align="left" style="border: solid 1px grey; width: 80%;">

            <div>
                <div id="t2">
                    <p style="font-size: 15px;"><b>회사 로고</b></p>
                    <img src="../../../resources/images/No-image-available.png">
                </div>
                
                <div id="t3" >
                 서비스 이용중 표시되는 로고를 등록 할 수 있습니다.<br>
                    <img src="../../../resources/icons/red_Exclamation_mark.png" width="30px">최대 사이즈 : 150*60 px, 용량 500KB 미만, 확장자 PNG
                    <br><button>등록</button>&nbsp;<button>삭제</button>
                    <!-- <input type="file"> 등록 누르면 팝업창으로 뜨게 설정하기 -->
                </div>
            </div>
          
         
            <div>

            <table id="infoTable" align="center" style="border: 1px solid black;">
                <table class="tg" style="width:800px;">
                    <thead>
                      <tr>
                        <th class="tg-7btt">회사명</th>
                        <th class="tg-c3ow">TEAMworks</th>
                        <th class="tg-7btt">대표자</th>
                        <th class="tg-c3ow">라공주</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="tg-7btt">회사주소</td>
                        <td class="tg-c3ow" colspan="3">서울특별시 강남구 테헤란로 14길 6 남도빌딩</td>
                      </tr>
                    </tbody>
                </table>
                <br><br>

                <b>사업장 정보</b>
                <button>사업장 정보 변경</button>
                
                <br>

                <table class="tg" style="width:800px;">
                    <thead>
                      <tr>
                        <th class="tg-amwm">사업자 등록번호</th>
                        <th class="tg-baqh">1234567890</th>
                        <th class="tg-amwm">종사업장번호</th>
                        <th class="tg-0lax"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="tg-amwm">사업장명</td>
                        <td class="tg-baqh">TEAMworks</td>
                        <td class="tg-amwm">대표자명</td>
                        <td class="tg-baqh">라공주</td>
                      </tr>
                      <tr>
                        <td class="tg-amwm">업태</td>
                        <td class="tg-baqh">12345ABC</td>
                        <td class="tg-amwm">업종</td>
                        <td class="tg-baqh">12345ABC</td>
                      </tr>
                      <tr>
                        <td class="tg-amwm">사업장 주소</td>
                        <td class="tg-baqh" colspan="3">서울특별시 강남구 테헤란로 14길 6 남도빌딩</td>
                      </tr>
                      <tr rowspan="3">
                        <td class="tg-amwm" >직인</td>
                        <td class="tg-0lax" colspan="3"><div><img src="../../../resources/images/No-image-available.png" width="70" height="70" style="float: left;"></div>
                            <div><img src="../../../resources/icons/red_Exclamation_mark.png" width="30"><p style="font-size: 11px;">최대 사이즈 : 70*70px, 용량 300Kb 미만, 확장자 PNG</p><br><button>등록</button>&nbsp;<button>삭제</button></div></td>
                      </tr>
                    </tbody>
                </table>
            </div>

        </div>

    
</body>
</html>