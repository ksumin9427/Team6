<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int code = Integer.parseInt(request.getParameter("code"));
	int id = Integer.parseInt(request.getParameter("id"));
	String jumin = request.getParameter("jumin");
	
	MemberDBBean db = MemberDBBean.getInstance();
	int re = db.findPW(code, id, jumin);
	
	if(re > 0){
%>
		<script>
			alert("��й�ȣ�� �ʱ�ȭ �Ǿ����ϴ�.(�ֹι�ȣ ��7�ڸ�)");
			document.location.href="hhlg0101R.html";
		</script>
<%
	}else{
%>
		<script>
			alert("��й�ȣ �ʱ�ȭ�� �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>