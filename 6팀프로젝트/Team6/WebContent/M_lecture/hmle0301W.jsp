<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int l_no =  Integer.parseInt(request.getParameter("l_no")) ;
	M_lectureDBbean dBbean = M_lectureDBbean.getinstance();
	int re =dBbean.mlecdelete(l_no);
	if(re==1){
		%>
			<script>
				alert("�����ϰڽ��ϴ�.");
				location.href='hmle01W.jsp';
			</script>
		<%
	}else{
		%>
		<script>
			alert("�����߽��ϴ�..");
			history.go(-1);
		</script>
	<%
	}
%>