<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="notice" class="notice.NoticeBean"></jsp:useBean>
<jsp:setProperty property="*" name="notice"/>
<%
	String pageNum = request.getParameter("pageNum");

	NoticeDBBean db = NoticeDBBean.getInstance();
	int re = db.editNotice(notice);
	
	if(re == 1){
		response.sendRedirect("hmno0103R.jsp?pageNum="+pageNum);
	}else if(re == 0){
%>
		<script language="JavaScript" >
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script language="JavaScript" >
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>
