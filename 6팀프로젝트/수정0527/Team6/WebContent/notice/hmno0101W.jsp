<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� ����</title>
	<script type="text/javascript" src="notice.js" charset="utf-8" ></script>
</head>
<body>
<div id="page">
	<jsp:include page="../common/m_menu.jsp"></jsp:include>
	<div id="content1">
	<center>
		<hr>
		<br>
		<h4>�� �� �� �� �� �� ��</h4>
		<br>
		<form name="form" action="hmno0102R.jsp?pageNum=<%= pageNum %>" method="post" enctype="multipart/form-data"> 
			<table class="table" >
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
					<td><input type="text" name="n_name"> </td>
					<td>�̸���</td>
					<td><input type="text" name="n_email"> </td>
				</tr>
				<tr>
					<td>������</td>
					<td colspan="3">
						<input type="text" size="55" name="n_title"></td>								
				</tr>
				<tr>
					<td>��  ��</td>
					<td colspan="3">
						<input type="file" name="n_fname">
					</td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="10" cols="150" name="n_content"></textarea></td>
				</tr>
				<tr>
					<td>��&nbsp;&nbsp;ȣ</td>
					<td colspan="3">
						<input type="password" name="n_pwd" size="12">
					</td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="���" onclick="check_ok()">&nbsp;
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