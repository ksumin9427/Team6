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
                <li><a href="../stu_info/hsin0101R.jsp">정보</a>
                    <ul class="sub-ul">
                        <li><a href="../stu_info/hsin0101R.jsp">개인정보조회</a></li>
                    </ul>
                </li>
                <li><a href="../lecture/hsle0101R.jsp">수업</a>
                    <ul class="sub-ul">
                        <li><a href="../lecture/hsle0101R.jsp">강의조희</a></li>
                        <li><a href="../lecture/hsle0201W.jsp">수강신청</a></li>
                        <li><a href="../lecture/hsle0401R.jsp">시간표조회</a></li>
                    </ul>
                </li>
                <li><a href="../score/hssc0101R.jsp">성적</a>
                    <ul class="sub-ul">
                        <li><a href="../score/hssc0101R.jsp">전체 성적조회</a></li>
                        <li><a href="../score/hssc0201R.jsp">현학기 성적조회</a></li>
                    </ul>
                </li>

                <li><a href="../notice/hsno0101R.jsp">게시판</a>
                    <ul class="sub-ul">
                        <li><a href="../notice/hsno0101R.jsp">공지사항</a></li>
                        <li><a href="../stud_board/hsbo0101R.jsp">자유게시판</a></li>
                    </ul>
                </li>
            </ul>
        </header>
        	<img src="../images/s_banner1.jpg" class="d-block w-100" alt="...">
</body>
</html>