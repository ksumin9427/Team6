<%@page import="myUtil.HanConv"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int code = Integer.parseInt(request.getParameter("code"));
	String name = HanConv.toKor(request.getParameter("name")); //�̸� ������ �ѱ�ó�� 
	String email = request.getParameter("email");
	
	System.out.println(code + name + email);
	MemberDBBean db = MemberDBBean.getInstance();
	int re = db.findID(code, name, email);
	if(re > 0){
%>
		<script>
			alert('ȸ������ ���̵�� '+<%= re %>+' �Դϴ�.');
			location.href="hhlg0101R.html";
		</script>
<%
	}else{
%>
		<script>
			alert('�Է��Ͻ� ������ ȸ���� �����ϴ�.');
			history.go(-1);
		</script>
<%
	}
%>
