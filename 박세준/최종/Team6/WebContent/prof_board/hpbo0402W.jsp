<%@page import="java.io.File"%>
<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDBBean2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int bp_id = Integer.parseInt(request.getParameter("bp_id"));
	String bp_pwd = request.getParameter("bp_pwd");

	BoardDBBean2 db=BoardDBBean2.getInstance();
	
	BoardBean2 board=db.getBoard(bp_id, false);
	
	String fname = board.getBp_fname();
	
	String saveDirectory = application.getRealPath("/upload_p");
	String path = saveDirectory + File.separator + fname;
	
	System.out.println("@@@### fname ===>"+fname);
	int re = db.deleteBoard(bp_id, bp_pwd);
	
	if(re == 1){
		if(fname != null){
			File file=new File(path);
			file.delete();
		}
		response.sendRedirect("hpbo0101R.jsp");
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













