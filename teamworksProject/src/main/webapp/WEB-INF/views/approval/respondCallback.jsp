<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회수요청처리</title>
<style>
    #approveOuter{
        width:600px;
        height:260px;
        padding:10px 30px 10px 30px;
    }
    #chooseApprove, #chooseApprove tr, #chooseApprove th, #chooseApprove td {
        border: 1px solid lightgrey;
        border-collapse: collapse;
        font-size:13px;
    }
    #chooseApprove th{
        background:lightsteelblue;
        color:white;
        text-align:center;
    }
    #chooseApprove td{
        padding:10px 0px 10px 15px;
    }

    /* 버튼 */
    #btns{
        width:120px;
        height:40px;
        float:right;
    }
    #submitBtn{
        width:50px;
        height:28px;
        background: rgb(7, 53, 90);
        color:white;
        border:none;
        font-size:13px;
        margin-top:2px;
    }
    #submitBtn:hover{
        background:lightsteelblue;
        cursor:pointer;
    }
    #cancleBtn{
        width:50px;
        height:28px;
        background:white;
        border:1px solid rgb(7, 53, 90);
        font-size:12px;
        font-weight:600;
        cursor:pointer;
        margin-left:5px;
    }
</style>
</head>
<body>

    <div id="approveOuter">
        <h3 style="margin-top:10px">회수요청 승인/반려</h3>
        <br>

        <form action="">
            <table id="chooseApprove">
                <tr height="50px">
                    <th width="100px">회수요청<br>승인/반려</th>
                    <td width="480px">
                        <input type="radio" name="approve" value="approve"> 승인
                        <input type="radio" name="approve" value="refuse" style="margin-left:20px;"> 반려
                    </td>
                </tr>
                <tr height="80px">
                    <th>회수의견</th>
                    <td>
                        <textarea id="approveComment" cols="60" rows="3" style="resize:none"></textarea>
                    </td>
                </tr>
            </table>
            <br>
            <div id="btns">
                <button type="submit" id="submitBtn">확인</button>
                <button type="button" id="cancleBtn">취소</button>
            </div>
        </form>
    </div>
    
</body>
</html>
