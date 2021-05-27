<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int n_no = Integer.parseInt(request.getParameter("n_no"));

	NoticeDBBean db = NoticeDBBean.getInstance();
	NoticeBean notice = db.getNotice(n_no, false);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="notice.js" charset="utf-8" ></script>
</head>
<body>
	<div id="page">
	<jsp:include page="../common/m_menu.jsp"></jsp:include>
	<div id="content1">
	<center>
		<hr>
		<br>
		<h4>�� �� �� ��</h4>
		<br>
		<form name="form" action="hmno0302R.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>" method="post"> 
			<table class="table">
				<tr>
					<td>����</td>
					<td colspan="3">
						<input type="radio" name="n_div" value="�л�">�л�&nbsp;&nbsp;
						<input type="radio" name="n_div" value="����">����&nbsp;&nbsp;
						<input type="radio" name="n_div" value="������">������
					</td>
				</tr>
				<tr>
					<td>�ۼ���</td>
					<td><input type="text" name="n_name" value="<%= notice.getN_name() %>"> </td>
					<td>�̸���</td>
					<td><input type="text" name="n_email" value="<%= notice.getN_email() %>"> </td>
				</tr>
				<tr>
					<td>������</td>
					<td colspan="3">
						<input type="text" size="55" name="n_title" value="<%= notice.getN_title() %>"></td>								
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="150" name="n_content">
						<%= notice.getN_content() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td>��&nbsp;&nbsp;ȣ</td>
					<td colspan="3">
						<input type="password" name="n_pwd" size="12">
					</td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="�ۼ���" onclick="check_ok()">&nbsp;
						<input type="reset" value="�ٽ��ۼ�">
						<input type="button" value="���" onclick="location.href='hmno0103R.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
	</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
</body>
</html>