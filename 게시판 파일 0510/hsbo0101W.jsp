<%@page import="team6.*" %>
<%@page import="team6.BoardDBBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	int bs_no=0, bs_ref=1, bs_step=0, bs_level=0;
	String bs_title="";
	
	
	if(request.getParameter("bs_no") != null){ 
		bs_no = Integer.parseInt(request.getParameter("bs_no"));
		
	}
	
	BoardDBBean db=BoardDBBean.getInstance();
	BoardBean board = db.getBoard(bs_no, false);
	
	if(board != null){ 
		bs_title = board.getBs_title();
		bs_ref = board.getBs_ref();
		bs_step = board.getBs_step();
		bs_level = board.getBs_level();
	}
%>
<html>
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" type="text/css" href="style.css">
<title>가산대학교 학생지원시스템</title>
	
<style>
	section{
	position: absolute;
	top: 280px;
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


</style>
	<script type="text/javascript" src="board.js" charset="utf-8" ></script>
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
		
		<form name="form" action="hsbo0102W.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="bs_no" value="<%= bs_no %>" >
			<input type="hidden" name="bs_ref" value="<%= bs_ref %>" >
			<input type="hidden" name="bs_step" value="<%= bs_step %>" >
			<input type="hidden" name="bs_level" value="<%= bs_level %>" >
			
			
			<table width="550" height="300">
				<tr>
					<td width="100">작성자</td>
					<td><input type="text" name="bs_name" size="10"> </td>
					
				</tr>
				<tr>
					<td width="100">제 목</td>
					<td colspan="3">
						<%
							if(bs_no == 0){
								%>
									<input type="text" size="55" name="bs_title"> 
								<%
							}else{
								%>
									<input type="text" size="55" name="bs_title" value="[RE]:<%= bs_title %>"> 
								<%
							}
						%>
					</td>
				</tr>
				
				<tr>
					<td width="100">파일</td>
					<td colspan="3">
						<input type="file" name="bs_fname">
					</td>
				</tr>
				
				<tr>
					<td colspan="4">
					<textarea style="min-height: 300px; min-width: 550px; text-align:left;" name="bs_content"></textarea>
					</td>
				</tr>
				
				<tr>
					<td width="180">비밀번호&nbsp;</td>
					<td><input type="password" name="bs_pwd" maxlength="12" ></td>
				</tr>
				<tr align="right" >
					<td colspan="4">
						<input type="button" value="확인" onclick="check_ok()">
						<input type="reset" value="취소">
						<input type="button" value="목록" onclick="location.href='hsbo0401R.jsp?pageNum=<%=pageNum %>'" >
					</td>
				</tr>
			</table>
		</form>
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














