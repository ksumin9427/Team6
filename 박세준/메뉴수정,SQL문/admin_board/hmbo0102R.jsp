<%@page import="myUtil.HanConv"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	int bid = Integer.parseInt(request.getParameter("bs_id"));
	BoardDBBean db=BoardDBBean.getInstance();
	BoardBean board = db.getBoard(bid, true);
	
	int bs_id=0, bs_hit=0, bs_fsize=0;
	String bs_name="", bs_email="", bs_title="", bs_content="", bs_fname="";
	Timestamp bs_date=null;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	if(board != null){
		bs_id = board.getbs_id();
		bs_name = board.getbs_name();
		bs_email = board.getbs_email();
		bs_title = board.getbs_title();
		bs_content = board.getbs_content();
		bs_date = board.getbs_date();
		bs_hit = board.getbs_hit();
		//b_fname = board.getB_fname();
		bs_fname = board.getbs_rfname();
		bs_fsize = board.getbs_fsize();
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>�� �� �� �� ��</h1>
		<table cellspacing="0" width="600" border="1">
			<tr align="center">
				<td width="100">�۹�ȣ</td>
				<td width="200"><%= bs_id %> </td>
				<td width="100">��ȸ��</td>
				<td width="200"><%= bs_hit %> </td>
			</tr>
			<tr align="center">
				<td width="100">�ۼ���</td>
				<td width="200"><%= bs_name %> </td>
				<td width="100">�ۼ���</td>
				<td width="200"><%= sdf.format(bs_date) %> </td>
			</tr>
			<tr>
				<td align="center">����</td>
				<td colspan="3">
					<%
						if(bs_fname==null){
							out.println("<p>÷������ ����</p>");
						}else{
							out.println("<p>÷������ "+"<a href='hmbo0105W.jsp?fileN="+bs_id+"'>"+bs_fname+"</a></p>");
						}
					%>
				</td>
			</tr>
			<tr >
				<td width="100" align="center" >������</td>
				<td colspan="3"><%= bs_title %> </td>
			</tr>
			<tr>
				<td width="100" align="center" >�۳���</td>
				<td colspan="3"><%= bs_content %> </td>
			</tr>
			<tr>
				<td colspan="4" align="right" >
					<input type="button" value="�ۻ���" onclick="location.href='hmbo0103W.jsp?bs_id=<%= bs_id %>&pageNum=<%= pageNum %>'" >
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="�۸��" onclick="location.href='hmbo0101R.jsp?pageNum=<%= pageNum %>'" >
				</td>
			</tr>
		</table>
	</center>
</body>
</html>



















