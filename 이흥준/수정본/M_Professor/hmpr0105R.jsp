<%@page import="mprofessor.MProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta charset="EUC-KR">
<%
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	MProfessorDBBean db = MProfessorDBBean.getinstance();
	int re= db.deletempro(p_no);
	if(re==1){
		%>
	
			<script>
				alert("�����Ǿ����ϴ�.");
				location.href="hmpr0101R.jsp";
			</script>
		<%
	}else{
		%>
		
		<script>
			alert("������ �����Ͽ����ϴ�.");
			location.href="hmpr0101R.jsp";
		</script>
	<%
	}
%>