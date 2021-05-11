<%@page import="java.io.File"%>
<%@page import="team6.*" %>
<%@page import="team6.BoardDBBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	String pageNum = request.getParameter("pageNum");

	int bs_no = Integer.parseInt(request.getParameter("bs_no"));

	BoardDBBean db=BoardDBBean.getInstance();
	BoardBean board = db.getBoard(bs_no, false);
	//
	String up = "C:\\javafiles\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\team6\\team6upload\\";
	String fname = board.getBs_fname();
	
	if(fname != null){
		File file=new File(up+fname);
		file.delete();
	}
	//
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
		
		<form name="form" action="hsbo0202W.jsp?bs_no=<%= bs_no %>" method="post">
		
			<table width="550" height="300">
				<tr>
					<td width="100">�ۼ���</td>&nbsp;
					<td><input type="text" name="bs_name" value="<%= board.getBs_name() %>" size="10" > </td>
					
				</tr>
				<tr>
					<td width="100">����</td>
					<td colspan="3"><input type="text" size="55" name="bs_title" value="<%= board.getBs_title() %>"> </td>
				</tr>
				
				<tr>
					<td width="100">����</td>
					<td colspan="3">
						<input type="file" name="bs_fname">
					</td>
				</tr>
			
				<tr>
					<td colspan="4">
						<textarea align="center" name="bs_content" style="min-height: 300px; min-width: 550px; text-align:left;" ><%=board.getBs_content() %></textarea>
					</td>
				</tr>
				
				<tr>
					<td width="180">��й�ȣ&nbsp;</td>
					<td><input type="password" name="bs_pwd" maxlength="12" > </td>
				</tr>
				
				<tr align="right">
					<td colspan="4">
						<input type="button" value="����" onclick="check_ok()">
						<input type="reset" value="���">
						<input type="button" value="���" onclick="location.href='hsbo0401R.jsp?pageNum=<%=pageNum %>'" >
					</td>
				</tr>
			</table>
		</form>
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














