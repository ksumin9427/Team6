<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int bs_id = Integer.parseInt(request.getParameter("bs_id"));

	BoardDBBean db=BoardDBBean.getInstance();
	BoardBean board = db.getBoard(bs_id, false);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="board.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>�� �� �� �� ��</h1>
		<form name="form" action="hsbo0502W.jsp?bs_id=<%= bs_id %>" method="post">
			<table>
				<tr>
					<td>�ۼ���</td>
					<td><input type="text" name="bs_name" value="<%= board.getbs_name() %>" > </td>
					<td>�̸���</td>
					<td><input type="text" name="bs_email" value="<%= board.getbs_email() %>" > </td>
				</tr>
				<tr>
					<td>������</td>
					<td colspan="3"><input type="text" size="55" name="bs_title" value="<%= board.getbs_title() %>"> </td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="65" name="bs_content"><%= board.getbs_content() %></textarea> 
					</td>
				</tr>
				<tr>
					<td>��&nbsp;&nbsp;ȣ</td>
					<td><input type="password" name="bs_pwd" maxlength="12" > </td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="�ۼ���" onclick="check_ok()">&nbsp;
						<input type="reset" value="�ٽ��ۼ�">
						<input type="button" value="�۸��" onclick="location.href='hsbo0101R.jsp?pageNum=<%= pageNum %>'" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>














