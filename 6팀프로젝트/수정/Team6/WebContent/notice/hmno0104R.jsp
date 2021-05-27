<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int code=0;
	if(request.getParameter("code") != null){
		if(Integer.parseInt(request.getParameter("code")) == 1){
		code = 1;
		}else if(Integer.parseInt(request.getParameter("code")) == 2){
			code = 2;
			}
	}
	System.out.println("######### code ="+code);
	String pageNum = request.getParameter("pageNum");
	int n_no = Integer.parseInt(request.getParameter("n_no")); //�۹�ȣ ������ 
	
	NoticeDBBean db = NoticeDBBean.getInstance();
	NoticeBean notice = db.getNotice(n_no,true);
	
	int n_hit=0, n_fsize=0;
	String n_name="", n_div="", n_title="", n_content="", n_fname="";
	Timestamp n_date = null;
	
	if(notice != null){
		n_name = notice.getN_name();
		n_div = notice.getN_div();
		n_title = notice.getN_title();
		n_content = notice.getN_content();
		n_date = notice.getN_date();
		n_hit = notice.getN_hit();
		n_fname = notice.getN_rfname(); //���������̸��� n_fname�� ��´�. 
		n_fsize = notice.getN_fsize();
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
	<jsp:include page="../common/m_menu.jsp"></jsp:include>
	<div id="content1">
	<center>
		<hr>
		<br>
		<h4>�� �� �� �� ��</h4>
		<table class="table table-bordered">
			<tr align="center">
				<td width="100">�۹�ȣ</td>
				<td width="100"><%= n_no %> </td>
				<td width="100">����</td>
				<td width="100"><%= n_div %></td>
				<td width="100">��ȸ��</td>
				<td width="100"><%= n_hit %></td>
			</tr>
			<tr align="center">
				<td>�ۼ���</td>
				<td><%= n_name %> </td>
				<td>�ۼ���</td>
				<td colspan="3"><%= sdf.format(n_date) %> </td>
			</tr>
			<tr >
				<td width="100" align="center" >����</td>
				<td colspan="5">
					<%	
						if(n_fname != null){
						out.println("<p>÷������ " + "<a href='hmno0105R.jsp?fileN="+n_no+"'>"+n_fname+"</a></p>");
						}
					%>
				</td>
			</tr>
			<tr >
				<td width="100" align="center" >������</td>
				<td colspan="5"><%= n_title %> </td>
			</tr>
			<tr>
				<td width="100" align="center" >�۳���</td>
				<td colspan="5"><%= n_content %> </td>
			</tr>
			<tr>
				<td colspan="6"> 
				<%
					if(code == 1){
				%>
					<input type="button" value="�۸��" onclick="location.href='hsno0101R.jsp?pageNum=<%= pageNum %>'"> 
				<%
					}else if(code == 2){
				%>
					<input type="button" value="�۸��" onclick="location.href='hpno0101R.jsp?pageNum=<%= pageNum %>'"> 
				<%
					}else{
				%>
					<input type="button" value="�ۼ���" onclick="location.href='hmno0301W.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>'"> 
					<input type="button" value="�ۻ���" onclick="location.href='hmno0201R.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>'"> 
					<input type="button" value="�۸��" onclick="location.href='hmno0103R.jsp?pageNum=<%= pageNum %>'"> 
				<%
					}
				%>
				</td>
			</tr>
		</table>
	</center>
	</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>