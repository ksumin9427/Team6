<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>교직원 메뉴</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
        <header>
            <div class="top_bg">
                <div class="top-left-header">
                    <ul>
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">LOGOUT</a></li>
                    </ul>
                </div>
            </div>
            <div class="logo">
                <h1><img src="../images/kasanlogo2.jpg" alt="KASAN UNIVERSITY">
                    가산대학교</h1>
            </div>

            <ul class="main-ul">
                <li><a href="#">정보</a>
                    <ul class="sub-ul">
                        <li><a href="../Professor/hpin0101R.jsp">개인정보조회</a></li>
                    </ul>
                </li>
                <li><a href="#">성적</a>
                    <ul class="sub-ul">
                        <li><a href="../pro-score/hpsc0101R.jsp">성적입력 및 수정</a></li>
                    </ul>
                </li>

                <li><a href="hpbo0101R.jsp">게시판</a>
                    <ul class="sub-ul">
                        <li><a href="#">공지사항</a></li>
                        <li><a href="../prof_board/hpbo0101R.jsp">자유게시판</a></li>
                    </ul>
                </li>
            </ul>
        </header>
        <img src="../images/p_banner1.jpg" class="d-block w-100" alt="...">
        
</body>
</html>