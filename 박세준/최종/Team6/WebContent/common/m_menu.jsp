<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학생메뉴</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
        <header>
            <div class="top_bg">
                <div class="top-left-header">
                    <ul>
                        <li><a href="main.jsp">HOME</a></li>
                        <li><a href="../login/hhlg0103R.jsp">LOGOUT</a></li>
                    </ul>
                </div>
            </div>
            <div class="logo">
                <h1><img src="../images/kasanlogo2.jpg" alt="KASAN UNIVERSITY">
                    가산대학교</h1>
            </div>

            <ul class="main-ul">
                <li><a href="../users/hmst0101R.jsp">사용자 관리</a>
                    <ul class="sub-ul">
                        <li><a href="../users/hmst0101R.jsp">학생관리</a></li>
                        <li><a href="../M_Professor/hmpr0101R.jsp">교직원관리</a></li>
                    </ul>
                </li>
                <li><a href="../M_lecture/hmle01W.jsp">강의 관리</a>
                    <ul class="sub-ul">
                        <li><a href="../M_lecture/hmle0101W.jsp">강의개설</a></li>
                        <li><a href="../M_lecture/hmle01W.jsp">강의수정</a></li>
                    </ul>
                </li>
                <li><a href="../notice/hmno0103R.jsp">게시판관리</a>
                    <ul class="sub-ul">
	                    <li><a href="../admin_board/hmbo0101R.jsp">학생게시판</a></li>
	                    <li><a href="../admin_board/hmbo0201R.jsp">교수게시판</a></li>
                        <li><a href="../notice/hmno0103R.jsp">공지사항</a></li>
                    </ul>
                </li>
            </ul>
        </header>
        	<img src="../images/m_banner2.jpg" class="d-block w-100" alt="...">
        <br>
        <br>
</body>
</html>