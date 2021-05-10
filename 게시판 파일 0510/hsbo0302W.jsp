<%@page import="java.io.File"%>
<%@page import="team6.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int bs_no = Integer.parseInt(request.getParameter("bs_no"));
	String bs_pwd = request.getParameter("bs_pwd");

	BoardDBBean db=BoardDBBean.getInstance();
	
	BoardBean board=db.getBoard(bs_no, false);
	
	String up = "C:\\javafiles\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\team6\\team6upload\\";
	String fname = board.getBs_fname();	
	int re = db.deleteBoard(bs_no, bs_pwd);
	
	
	
	if(re == 1){
		if(fname != null){
			File file=new File(up+fname);
			file.delete();
		}
		
		response.sendRedirect("hsbo0401R.jsp");
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
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>













