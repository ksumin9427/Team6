<%@page import="team6.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int bs_no = Integer.parseInt(request.getParameter("bs_no"));
	String bs_pwd = request.getParameter("bs_pwd");

	BoardDBBean db=BoardDBBean.getInstance();
	int re = db.deleteBoard(bs_no, bs_pwd);
	
	if(re == 1){
		response.sendRedirect("hsbo0401R.jsp");
	}else if(re == 0){
%>
		<script language="JavaScript" >
			alert("��й�ȣ�� ���� �ʽ��ϴ�.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script language="JavaScript" >
			alert("������ �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>













