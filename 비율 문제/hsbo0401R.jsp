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
int i, bs_no, bs_hit, bs_level;
String bs_name, bs_title;
Timestamp bs_date;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html>
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" type="text/css" href="style.css">
<title>������б� �л������ý���</title>

<style>

header{
	position: relative;
}

section{
	position: absolute;
	border: 1px solid black;
	top: 280px;
	width:50%;
	height:50%;
}

table {
	border-collapse: collapse;
}

table tr th {
	background-color: #EAEAEA;
}

table tr td a {
	text-decoration: none;
}

.boardsection {
	
	 left: 25%;
	 float: left; 
	/* ���̵�ٸ� �ø��� ���ؼ� �÷�Ʈ��� 
            	���߿� Ǫ�Ͱ� �ö���� �� ����Ʈ ���̵忡�� �е� ���*/
	padding: 15px;
	/* �е��� �ִ� ����� �ٴ´� */
	
}


footer {
	clear: both; 
	position: absolute;
	bottom:0;
	
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
					<img src="kasanlogo2.jpg" alt="KASAN UNIVERSITY"> ������б�
				</h1>
			</div>


			<!-- <nav> -->
			<ul class="main-ul">
				<li><a href="#">����</a>
					<ul class="sub-ul">
						<li><a href="#">��������</a></li>
						<li><a href="#">������������</a></li>
					</ul></li>
				<li><a href="#">����</a>
					<ul class="sub-ul">
						<li><a href="#">������ȸ</a></li>
						<li><a href="#">������û</a></li>
						<li><a href="#">������û Ȯ��/����</a></li>
						<li><a href="#">�ð�ǥ��ȸ</a></li>
					</ul></li>
				<li><a href="#">����</a>
					<ul class="sub-ul">
						<li><a href="#">���б� ������ȸ</a></li>
						<li><a href="#">��ü ������ȸ</a></li>
					</ul></li>

				<li><a href="#">�Խ���</a>
					<ul class="sub-ul">
						<li><a href="#">��������</a></li>
						<li><a href="list.jsp">�����Խ���</a></li>
					</ul></li>
			</ul>
			<!-- </nav> -->
		</header>

		<center>
			<div>
			<section class="boardsection" >

					<h1>�л� �Խ��� ���</h1>
					<table width="600">
						<tr>
							<td align="right"><a href="write.jsp?pageNum=<%=pageNum%>">��
									�� ��</a></td>
						</tr>
					</table>


					<table width="800" border="1" cellspacing="0">


						<tr>
							<th width="40" align="center">��ȣ</th>
							<th width="450" align="center">����</th>
							<th width="120" align="center">�ۼ���</th>
							<th width="130" align="center">�ۼ���</th>
							<th width="60" align="center">��ȸ��</th>
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
						%>

						<td align="center"><%=bs_no%></td>
						<td>
							<%
								if (bs_level > 0) {
								for (int j = 0; j < bs_level; j++) {
							%> &nbsp; <%
 	}
 %> 					<img src="../images/AnswerLine.gif" width="16" height="16"> <%
 	}
 %> 					<a href="show.jsp?bs_no=<%=bs_no%>&pageNum=<%=pageNum%>"><%=bs_title%></a>
						</td>
						<td align="center"><%=bs_name%></td>
						<td align="center"><%=sdf.format(bs_date)%></td>
						<td align="center"><%=bs_hit%></td>
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
</div>

	<footer>
		<ul>
			<li>�λ� �λ����� �߾Ӵ�� 688</li>
			<li>TEL : 051-912-1000</li>
			<li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
		</ul>
	</footer>
	</div>
	
	
</body>
</html>


















