<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
 <%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="team6.*" %>
<%@page import="team6.BoardDBBean" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String path=request.getRealPath("team6upload");
	int size= 1024 * 1024 * 10;
	int fileSize=0;
	String file="";
	String oriFile="";
	
	MultipartRequest multi= new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str=(String)files.nextElement();
	
	file=multi.getFilesystemName(str);
	
	if(file != null){
		oriFile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
	}
	
	BoardBean board=new BoardBean();
	
	board.setBs_name(multi.getParameter("bs_name"));
	board.setBs_title(multi.getParameter("bs_title"));
	board.setBs_content(multi.getParameter("bs_content"));
	board.setBs_pwd(multi.getParameter("bs_pwd"));
	
	if(file != null){
	board.setBs_fname(file);
	board.setBs_fsize(fileSize);
	board.setBs_rfname(oriFile);
	}

	
	board.setBs_date(new Timestamp(System.currentTimeMillis()));
	BoardDBBean db=BoardDBBean.getInstance();
	
	if(db.insertBoard(board) == 1){
		
		response.sendRedirect("hsbo0401R.jsp");
	}else{
		response.sendRedirect("hsbo0101W.jsp");
	}
%>