<%@page import="lecture.LectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//������ �μ�Ʈ �ϴ��ڵ�
	int s_no = 1; //�л���ȣ �޾ƿÿ���
	int l_no = Integer.parseInt(request.getParameter("l_no"));
	int major_no = Integer.parseInt(request.getParameter("major_no"));
	lecture.LectureDBBean dbbean = lecture.LectureDBBean.getinstance();
	if(dbbean.confirmlecture(l_no)==1){
%>
		<script>
			alert("��û ���ǰ� �ߺ� �Ǿ����ϴ�.");
			history.back();  
		</script>
<%	
	}else{
		int re=	dbbean.insertlecture(s_no, l_no);
		if(re==1){
			dbbean.maxlecture(l_no);
			response.sendRedirect("hsle0202W.jsp?major_no="+major_no);		
		}else{
		%>
			<script>
				alert("��û ����");
				history.back(); 
			</script>
		<%	
	}
}
%>

