<%@page import="lecture.lecture1DBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//학생 코드 request 로 받을거
	int s_no = 1;
	//삭제할부분.
	int l_no = Integer.parseInt(request.getParameter("l_no"));
	int major_no = Integer.parseInt(request.getParameter("major_no"));
	lecture1DBbean dbbean = lecture1DBbean.getinstance();
	int re = dbbean.deletelecture(s_no, l_no);
	
	if (re == -1) {
		
		} else {
		 	dbbean.maxlecture2(l_no);
			response.sendRedirect("hsle0202W.jsp?major_no="+major_no);	
			
		}
%>