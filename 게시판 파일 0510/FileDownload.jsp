<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="team6.BoardDBBean"%>
<%@page import="team6.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		 int bsno = Integer.parseInt(request.getParameter("fileN"));
		 BoardDBBean db = BoardDBBean.getInstance(); 	
		 BoardBean board=db.getFileName(bsno);
		  
		  
		  String filename="";
		  String realFilename="";
		  if(board != null) {
			 filename= board.getBs_fname();
			realFilename = board.getBs_rfname();
		  } 
		  
		  String saveDirectory=application.getRealPath("/team6upload");
		  String path=saveDirectory+File.separator+filename;
		  
		  File file=new File(path);
		  long length = file.length();
		   realFilename=new String( realFilename.getBytes("ms949"), "8859_1" );
		   
		   response.setContentType("application/octet-stream");
		   response.setContentLength((int)length);
		   response.setHeader("Content-Disposition", "attachment;filename=" +realFilename);
		   
		  
		  BufferedInputStream bis =new BufferedInputStream(new FileInputStream(file));
		  BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		  
		  int data;
		  while((data = bis.read()) != -1){
			  bos.write(data);
			  bos.flush(); 
			  
		  }
		  	bis.close();
		  	bos.close();
		  
	%>	  
</body>
</html>