<%@page import="kr.co.koo.izone.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("user_id");
	MemberDAO dao = MemberDAO.getInstance();
	boolean flag = dao.confirmId(id);
	if(flag){
%>
	<script>
		alert('회원가입을 축하합니다');
		location.href='/izone';
	</script>
	<%}else{ %>
	<script>
		alert('회원가입에 실패했습니다');
		location.href='/izone';
	</script>	
<%} %>

  