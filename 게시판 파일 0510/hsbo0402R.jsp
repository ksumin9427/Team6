<%@page import="java.io.PrintWriter" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="team6.*" %>
<%@page import="team6.BoardDBBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	int bsno = Integer.parseInt(request.getParameter("bs_no"));
	BoardDBBean db=BoardDBBean.getInstance();
	BoardBean board = db.getBoard(bsno, true);
	
	int bs_no=0, bs_hit=0, bs_fsize=0;
	String bs_name="", bs_title="", bs_content="", bs_fname="";
	Timestamp bs_date=null;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	if(board != null){
		bs_no = board.getBs_no();
		bs_name = board.getBs_name();
		
		bs_title = board.getBs_title();
		bs_content = board.getBs_content();
		bs_date = board.getBs_date();
		bs_hit = board.getBs_hit();
		bs_fname = board.getBs_fname();
		bs_fsize = board.getBs_fsize();
	}
%>
<html>
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" type="text/css" href="style.css">
<title>������б� �л������ý���</title>
<style>
	section{
	position: absolute;
	top: 280px;
	right: 25%;
	width: 50%;
	height: 50%;
	margin: 1px;
	padding: 1px;
	
}

footer {
	clear: both;
	position: absolute;
	bottom: 0;
}

tr {
padding:2px;

}

table tr td{
padding:2px;
margin:1px; 
border-top: 1px solid #ccc ;
border-bottom: 1px solid #ccc;

}

table tr th{
padding:1px;
margin:1px; 
border-top: 1px solid #ccc ;
border-bottom: 1px solid #ccc;
}
 #leftline{
 border-left: 1px solid #ccc;
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
						<li><a href="hsbo0401R.jsp">�����Խ���</a></li>
					</ul></li>
			</ul>
			<!-- </nav> -->
		</header>
		
	
	<section>
	<center>
	
		<table cellspacing="0" width="650">
	
			<tr align="center">
				<th width="100" height="3" >��ȣ</td>
				<td width="50" height="3"><%= bs_no %> </td>
				<th width="100" height="3">�ۼ���</td>
				<td width="50" height="3"><%= bs_name %> </td>
				<th width="100" height="3">�ۼ���</td>
				<td width="100" height="3"><%= sdf.format(bs_date) %> </td>
				<th width="100" height="3">��ȸ��</td>
				<td width="50" height="3"><%= bs_hit %> </td>
			</tr>
			
			<tr >
				<th width="100" height="3" >����</th>
				<td colspan="8" width="100" height="3">
					<%
						out.println("<a href='FileDownload.jsp?fileN="+bs_no+"'>"+bs_fname+"</a></p>");
					%>
				</td>
			</tr>
		
			<tr >
				<th width="100" height="3" align="center" >����</td>
				<td colspan="7"><%= bs_title %> </td>
			</tr>
			
			<tr>
				<th width="100" align="center">����</td>
				<td colspan="7"><textarea align="center" disabled  style="min-height: 300px; min-width: 550px; text-align:left;" ><%= bs_content %></textarea></td>
			</tr>
			
			<tr>
				<td colspan="8" align="right" >
					<input type="button" value="����" onclick="location.href='hsbo0201W.jsp?bs_no=<%= bs_no %>&pageNum=<%=pageNum %>'" >
					
					<input type="button" value="����" onclick="location.href='hsbo0301W.jsp?bs_no=<%= bs_no %>&pageNum=<%=pageNum %>'" >
					
					<input type="button" value="�亯" onclick="location.href='hsbo0101W.jsp?bs_no=<%= bs_no %>&pageNum=<%=pageNum %>'" >
					
					<input type="button" value="���" onclick="location.href='hsbo0401R.jsp?pageNum=<%=pageNum %>'" >
				</td>
			</tr>
			
		</table>

	</center>
	</section>
	
	
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



















