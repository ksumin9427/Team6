<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDBBean2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int bp_id = Integer.parseInt(request.getParameter("bp_id"));

	BoardDBBean2 db=BoardDBBean2.getInstance();
	BoardBean2 board = db.getBoard(bp_id, false);
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
		<form name="form" action="hpbo0502W.jsp?bp_id=<%= bp_id %>" method="post">
			<table>
				<tr>
					<td>�ۼ���</td>
					<td><input type="text" name="bp_name" value="<%= board.getBp_name() %>" > </td>
					<td>�̸���</td>
					<td><input type="text" name="bp_email" value="<%= board.getBp_email() %>" > </td>
				</tr>
				<tr>
					<td>������</td>
					<td colspan="3"><input type="text" size="55" name="bp_title" value="<%= board.getBp_title() %>"> </td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="65" name="bp_content"><%= board.getBp_content() %></textarea> 
					</td>
				</tr>
				<tr>
					<td>��&nbsp;&nbsp;ȣ</td>
					<td><input type="password" name="bp_pwd" maxlength="12" > </td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="�ۼ���" onclick="check_ok()">&nbsp;
						<input type="reset" value="�ٽ��ۼ�">
						<input type="button" value="�۸��" onclick="location.href='hpbo0101R.jsp?pageNum=<%= pageNum %>'" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>














