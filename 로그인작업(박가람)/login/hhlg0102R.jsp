<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	MemberDBBean db = MemberDBBean.getInstance();
	
	int check = db.userCheck(id, pwd);
	if(check == 1){ //학생 
		session.setAttribute("id", id);
		response.sendRedirect("hhma01R.jsp?code="+check);
	}else if(check == 2){ //교수 
		session.setAttribute("id", id);
		response.sendRedirect("hhma01R.jsp?code="+check);
	}else if(check == 3){ //관리자 
		session.setAttribute("id", id);
		response.sendRedirect("hhma01R.jsp?code="+check);
	}else if(check == 0){
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%		
	}else{
%>
		<script>
			alert("아이디가 맞지 않습니다.");
			history.go(-1);
		</script>
<%		
	}
%>