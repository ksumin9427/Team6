<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	System.out.println("@@@### pageNum ===>"+pageNum);
	
	int bp_id = Integer.parseInt(request.getParameter("bp_id"));
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>�� �� �� �� ��</h1>
		<form name="form" action="hmbo0204W.jsp?bp_id=<%= bp_id %>" method="post">
			<table>
				<tr>
					<td colspan="2" align="left">
						<b>>> �����Ͻðڽ��ϱ�? <<
						</b>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="�ۻ���">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="�۸��" onclick="location.href='hmbo0201R.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>





















