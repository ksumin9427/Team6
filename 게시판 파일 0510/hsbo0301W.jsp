<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	String pageNum = request.getParameter("pageNum");
	int bs_no = Integer.parseInt(request.getParameter("bs_no"));
%>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="style.css">
<title>가산대학교 학생지원시스템</title>
	
<style>
	section{
	position: absolute;
	top: 350px;
	right: 25%;
	width:50%;
	height:50%;
	margin: 5px;
}

footer {
	clear: both;
	position: absolute;
	bottom: 0;
}

tr td{
padding:2px;
 
}

#box{
	border: 2px solid #EAEAEA;
	width: 310PX;
	height: 100PX;
	
}
</style>
	<script type="text/javascript" src="board.js" charset="utf-8"></script>
</head>


<body>
	<div id="page">
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
				<h1>
					<img src="kasanlogo2.jpg" alt="KASAN UNIVERSITY"> 가산대학교
				</h1>
			</div>


			<!-- <nav> -->
			<ul class="main-ul">
				<li><a href="#">학적</a>
					<ul class="sub-ul">
						<li><a href="#">학적사항</a></li>
						<li><a href="#">개인정보수정</a></li>
					</ul></li>
				<li><a href="#">수업</a>
					<ul class="sub-ul">
						<li><a href="#">강좌조회</a></li>
						<li><a href="#">수강신청</a></li>
						<li><a href="#">수강신청 확인/정정</a></li>
						<li><a href="#">시간표조회</a></li>
					</ul></li>
				<li><a href="#">성적</a>
					<ul class="sub-ul">
						<li><a href="#">현학기 성적조회</a></li>
						<li><a href="#">전체 성적조회</a></li>
					</ul></li>

				<li><a href="#">게시판</a>
					<ul class="sub-ul">
						<li><a href="#">공지사항</a></li>
						<li><a href="hsbo0401R.jsp">자유게시판</a></li>
					</ul></li>
			</ul>
			<!-- </nav> -->
		</header>
		
	<section>
	<center>
	<div id="box">
		<form name="form" action="hsbo0302W.jsp?bs_no=<%= bs_no %>" method="post">
			<table width="300" height="100" cellspacing="0">
			
				<tr>
					<td colspan="2" align="center">
						<b> 비밀번호를 입력해주세요. 
						</b>
					</td>
				</tr>
				<tr>
					<td width="80" align="center">
						비밀번호
						<input name="bs_pwd" type="password" size="12">
					</td>
				</tr>
				<tr tr align="right">
					<td colspan="2">
						<input type="button" value="삭제" onclick="delete_ok()">
						<input type="reset" value="취소">
						<input type="button" value="목록" onclick="location.href='hsbo0401R.jsp?pageNum=<%=pageNum %>'">
					</td>
				</tr>
			
		</table>
		</form>
		</div>
	</center>
	</section>	
	
	<footer>
		<ul>
			<li>부산 부산진구 중앙대로 688</li>
			<li>TEL : 051-912-1000</li>
			<li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
		</ul>
	</footer>
	</div>
	
</body>
</html>





















