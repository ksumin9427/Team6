<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="team6.*" %>
<%@page import="team6.BoardDBBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:useBean id="board" class="team6.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	
	board.setBs_date(new Timestamp(System.currentTimeMillis()));
	BoardDBBean db=BoardDBBean.getInstance();
	
	if(db.insertBoard(board) == 1){
		
		response.sendRedirect("hsbo0401R.jsp");
	}else{
		response.sendRedirect("hsbo0101W.jsp");
	}
%>