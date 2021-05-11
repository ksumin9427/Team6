<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="team6.*"%>
<%@page import="team6.BoardDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
	pageNum = "1";
}

BoardDBBean db = BoardDBBean.getInstance();
ArrayList<BoardBean> boardList = db.listBoard(pageNum);
int i, bs_no, bs_hit, bs_level, bs_fsize;
String bs_name, bs_title, bs_fname;
Timestamp bs_date;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<html>
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" type="text/css" href="style.css">
<title>가산대학교 학생지원시스템</title>

<style>

<style>
header {
	position: relative;
}

section {
	position: absolute;
	top: 250px;
	right: 25%;
	width: 50%;
	height: 50%;
	margin: 5px;
}


.line{
border-top: 1px solid #ccc ;
border-bottom: 1px solid #ccc;

}


.writetop{
	padding:5px;
	text-align: right;
	
}

table tr th {
	background-color: #EAEAEA;
	border-bottom: 1px solid #ccc;
}

table tr td  {
	border-bottom: 1px solid #ccc;
} 

table tr td a {
	text-decoration: none;
}


footer {
	clear: both;
	position: absolute;
	bottom: 0;
}
</style>

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

		<center>
			<div>
			<section>
					<div>
					<h2>자유 게시판 목록</h2>
					</div>
					
					
					<table width="880"  >
						<tr>
							<td align="right"><a href="hsbo0101W.jsp?pageNum=<%=pageNum%>">글쓰기</a></td>
						</tr>
					</table>

					<table class="line" cellspacing="0" width="880">
						<tr>
							<th width="40" align="center">번호</th>
							<th width="90" align="center" >파일</th>
							<th width="440" align="center">제목</th>
							<th width="120" align="center">작성자</th>
							<th width="130" align="center">작성일</th>
							<th width="60" align="center">조회수</th>
						</tr>


						<%
							for (i = 0; i < boardList.size(); i++) {
							BoardBean board = boardList.get(i);
							bs_no = board.getBs_no();
							bs_title = board.getBs_title();
							bs_name = board.getBs_name();
							bs_date = board.getBs_date();
							bs_hit = board.getBs_hit();
							bs_level = board.getBs_level();
							bs_fname = board.getBs_fname();
							bs_fsize =board.getBs_fsize();
						%>

						<td align="center">
							<%=bs_no%>
						</td>
						<td align="center">
							<%
								if(bs_fsize > 0){
							%>
									<img src="files.png" width="13" >
							<%
								}
							%>
						</td>
						
						
						<td>
							<%
								if (bs_level > 0) {
								for (int j = 0; j < bs_level; j++) {
							%> &nbsp; <%
 	}
 %> 					 <%
 	}
 %> 					<a href="hsbo0402R.jsp?bs_no=<%=bs_no%>&pageNum=<%=pageNum%>"><%=bs_title%></a>
						</td>
						<td align="center">
							<%=bs_name%>
						</td>
						<td align="center">
							<%=sdf.format(bs_date)%>
						</td>
						<td align="center">
							<%=bs_hit%>
						</td>
						</tr>
						<%
							}
						%>
					</table>
				<br> <br>
			<center>
					<%=BoardBean.pageNumber(4)%>
			</center>	
					
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


















