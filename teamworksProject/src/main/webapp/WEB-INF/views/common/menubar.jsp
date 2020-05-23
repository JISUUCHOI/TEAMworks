<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        @font-face { font-family: 'JSDongkang-Regular'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/JSDongkang-RegularA1.woff') format('woff'); font-weight: normal; font-style: normal; }
        @font-face { font-family: 'Handon3gyeopsal300g'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff') format('woff'); font-weight: normal; font-style: normal; }
        
        body{height:100%;}
        div{box-sizing:border-box;}
        
        /* 메뉴바 */
        #menubar{
            width:100%;
            height:100px;
            margin:auto;
            display:block;
        }
        .menu>a{text-decoration:none; color:black;}
        #logo{
            width:250px;
            height:100%;
            float:left;
            background:rgb(7, 53, 90);
            /* border:1px solid red; */
        }
        #logo>img{
            margin-top:30px;
            margin-left:10px;
        }
        #center{
            width:720px;
            height:30px;
            margin-top:60px;
            float:right;
        }
        .menu{
            width:100px;
            height:30px;
            text-align:center;
            font-family: 'Handon3gyeopsal300g';
            /* font-family: 'JSDongkang-Regular'; */
            font-size:18px;
            font-weight:600;
            color:black;
            display:table-cell;
            cursor:pointer;
            float:left;
        }

        @media (max-width:1100px) {
            #center{
                margin-top:0px;
                margin-left:250px;
                width:100%;
                height:100%;
                float:left;
            }
            .menu{
                width:100%;
                height:30px;
                margin-top:10px;
                float:left;
                display:block;
                text-align:left;
                padding-left:50px;
            }
        }

        .menu:hover{
            border-bottom-style:groove;
            color:dimgray;
        }
        .menu>a:hover{
            color:dimgray;
        }

        
        /* 메신저, 로그아웃 */
        #logout{
            margin-left:10px;
            display:inline-block;
        }
        #messenger{
            margin-left:100px;
            height:40px;
            display:inline-block;
        }
        #logout>a, #messenger>a{
            text-decoration:none;
            color:white;
            font-size:12px;
        }

    </style>

</head>
<body>
    
    <div id="menubarOuter">

        <!-- 메뉴바 -->
        <div id="menubar">
            <div id="logo">
                <img src="${ pageContext.servletContext.contextPath }/resources/images/logo_white.png" height="35px">               
            </div>
            <div id="center">
                <div class="menu" id="home"><a href="">홈</a></div>
                <div class="menu" id="approveDoc"><a href="">전자결재</a></div>
                <div class="menu" id="email"><a href="">메일</a></div>
                <div class="menu" id="board"><a href="">게시판</a></div>
                <div class="menu" id="calender"><a href="">일정</a></div>
                <div class="menu" id="book"><a href="">예약</a></div>
                <div class="menu" id="orgManage"><a href="">조직관리</a></div>
            </div>
        </div>

    </div>

</body>
</html>