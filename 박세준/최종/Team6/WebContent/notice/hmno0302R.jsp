<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
