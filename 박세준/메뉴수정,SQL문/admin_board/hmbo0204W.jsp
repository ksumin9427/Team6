<%@page import="java.io.File"%>
<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDBBean2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int bp_id = Integer.parseInt(request.getParameter("bp_id"));

	BoardDBBean2 db=BoardDBBean2.getInstance();
	
	BoardBean2 board=db.getBoard(bp_id, false);
	//String up = "C:\\Users\\�ڼ���\\OneDrive\\���� ȭ��\\�׸���ǻ��\\�ǻ� �����\\workspace\\magicWebApp\\upload_p\\";
	String up = "C:\\Users\\ParkSeJoon\\OneDrive\\���� ȭ��\\�׸���ǻ��\\�ǻ� �����\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Team6\\upload_p\\";
	String fname = board.getBp_fname();
	System.out.println("@@@### fname ===>"+fname);
	int re = db.ad_deleteBoard(bp_id);
	
	if(re == 1){
		if(fname != null){
			File file=new File(up+fname);
			file.delete();
		}
		response.sendRedirect("hmbo0201R.jsp");
	}else{
%>
		<script language="JavaScript" >
			alert("������ �����Ͽ����ϴ�.");
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













