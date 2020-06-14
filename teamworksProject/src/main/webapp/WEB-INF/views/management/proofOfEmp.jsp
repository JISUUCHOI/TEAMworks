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
    <script src="${ pageContext.servletContext.contextPath }/resources/js/html2canvas.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/jspdf.min.js"></script>
    <style>
         body {
            margin: 0;
            padding: 0;
            font: 12pt "Tahoma";
        }
        * {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
        .page {
            width: 21cm;
            min-height: 29.7cm;
            padding: 0;
            margin: 1cm auto;
            border-radius: 5px;
            background: white;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .subpage {
            padding: 1cm;
            height: 256mm;
        }
        @page {
            size: A4 landscape;
            margin: 0;
            /*size: landscape;*/
        }
        @media print {
            .page {
                margin: 0;
                border: initial;
                border-radius: initial;
                width: initial;
                min-height: initial;
                box-shadow: initial;
                background: initial;
                page-break-after: always;
            }
        } 
        #tableContent{table-layout: fixed;} 
   </style>
</head>
<body>
  <div class="book" id="pdfDiv">
  <button type="button" class="btn btn-primary" id="savePdf" >PDF 저장</button>
        <div class="page">
      		<br><br><br><br><br>
            <h1 align="center">재직증명서</h1>
            <br><br>
            <div class="subpage" id="content">
                <table id="tableContent" class="table table-bordered" style="text-align: center;">
                    <tr height="50px">
                        <th width="130px">성명</th>
                        <td width="130px">${emp.empName }</td>
                        <th>주민등록번호</th>
                        <td>${emp.empNo }</td>
                    </tr>
                    <tr height="50px">
                        <th>소속</th>
                        <td>${emp.deptName }</td>
                        <th>직위</th>
                        <td>${emp.jobName }</td>
                    </tr>
                    <tr height="50px">
                        <th>주소</th>
                        <td colspan="3">${emp.empAdd} ${emp.empAddDetail}</td>
                    </tr>
                    <tr height="50px">
                        <th>재직기간</th>
                        <td colspan="3"> <span>${emp.hireDate}</span>~<span id=today></span></td>
                    </tr>
                    <tr height="50px">
                        <th>사용용도</th>
                        <td colspan="3">${ p.pfPurpose }</td>
                    </tr>
                </table>
                <br>
                <br><br><br>
                <h4 align="center">상기와 같이 재직하고 있음을 증명함</h4>
                <br>
                <br><br>
                <h4 align="center" id="todayDate"></h4>
                <br>
                <br><br><br>
                <h4 align="right">주식회사 TEAMWorks</h4>
                <h4 align="right">대표이사 강보람</h4>
            </div>
        </div>
    </div> 
    
    <script>
    	
    	$(function(){
    		var today = new Date();
    		var dd = today.getDate();
    		var mm = today.getMonth()+1; //January is 0!
    		var yyyy = today.getFullYear()
    		if(dd<10) {
    		    dd='0'+dd
    		} 

    		if(mm<10) {
    		    mm='0'+mm
    		} 
    		today = yyyy+'-'+mm+'-'+dd;
    		$("#today").text(today);
    		$("#todayDate").text(today);
    	});
    </script>
   <script>
$(document).ready(function() {
	$('#savePdf').click(function() { // pdf저장 button id
		
	    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
		
	    // 캔버스를 이미지로 변환
	    var imgData = canvas.toDataURL('image/png');
		     
	    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
	    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    var imgHeight = canvas.height * imgWidth / canvas.width;
	    var heightLeft = imgHeight;
	    var margin = 10; // 출력 페이지 여백설정
	    var doc = new jsPDF('p', 'mm');
	    var position = 0;
	       
	    // 첫 페이지 출력
	    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	    heightLeft -= pageHeight;
	         
	    // 한 페이지 이상일 경우 루프 돌면서 출력
	    while (heightLeft >= 20) {
	        position = heightLeft - imgHeight;
	        doc.addPage();
	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	        heightLeft -= pageHeight;
	    }
	    // 파일 저장
	    doc.save('file-name.pdf');
		
	    });
	    opener.parent.location.reload();
	});
	
	
})

</script>
   
</body>

</html>