<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int n_no = Integer.parseInt(request.getParameter("n_no"));
	String pageNum = request.getParameter("pageNum");

%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="notice.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>�� �� �� �� ��</h1>
		<form name="form" action="hmno0202R.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>" method="post">
			<table>
				<tr>
					<td colspan="2" align="left">
						<b>>> ��ȣ�� �Է��ϼ���. <<
						</b>
					</td>
				</tr>
				<tr>
					<td width="80">
						��&nbsp;&nbsp;ȣ
					</td>
					<td>
						<input name="n_pwd" type="password" size="12">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="�ۻ���" onclick="delete_ok()">&nbsp;
						<input type="reset" value="�ٽ��ۼ�">&nbsp;
						<input type="button" value="�۸��" onclick="location.href='hmno0103R.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>