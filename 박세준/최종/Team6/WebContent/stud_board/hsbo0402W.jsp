<%@page import="java.io.File"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int bs_id = Integer.parseInt(request.getParameter("bs_id"));
	String bs_pwd = request.getParameter("bs_pwd");

	BoardDBBean db=BoardDBBean.getInstance();
	
	BoardBean board=db.getBoard(bs_id, false);
	
	String fname = board.getbs_fname();
	
	String saveDirectory = application.getRealPath("/upload_s");
	String path = saveDirectory + File.separator + fname;
	
	System.out.println("@@@### fname ===>"+fname);
	int re = db.deleteBoard(bs_id, bs_pwd);
	
	if(re == 1){
		if(fname != null){
			File file=new File(path);
			file.delete();
		}
		response.sendRedirect("hsbo0101R.jsp");
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













