<%@page import="notice.NoticeBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String path = request.getRealPath("upload"); //�츮�� ����� upload���� ���� 
	int size = 1024 * 1024 * 10; //10�ް�
	int fileSize=0;
	String file = "";
	String oriFile ="";
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames(); 	//�����̸� ������ 
	String str = (String)files.nextElement(); 	//object > String 
	
	file = multi.getFilesystemName(str);
	if(file != null){  //���Ǿ����� ���Ͼȳ������϶� insert�ȵǰ� ������ 
		oriFile = multi.getOriginalFileName(str); 	//���������̸�
		fileSize = file.getBytes().length; 	//���ϻ����� 
	}
	
	NoticeBean notice = new NoticeBean();
	
	notice.setN_div(multi.getParameter("n_div"));
	notice.setN_name(multi.getParameter("n_name"));
	notice.setN_email(multi.getParameter("n_email"));
	notice.setN_title(multi.getParameter("n_title"));
	notice.setN_content(multi.getParameter("n_content"));
	notice.setN_pwd(multi.getParameter("n_pwd"));
	
	if(file != null){
		notice.setN_fname(file);
		notice.setN_fsize(fileSize);
		notice.setN_rfname(oriFile);
	}
	
	notice.setN_date(new Timestamp(System.currentTimeMillis()));
	NoticeDBBean db = NoticeDBBean.getInstance();
	
	if(db.insertNotice(notice) == 1){
		response.sendRedirect("hmno0103R.jsp");
	}else{
		response.sendRedirect("hmno1010W.jsp");
	}
%>
