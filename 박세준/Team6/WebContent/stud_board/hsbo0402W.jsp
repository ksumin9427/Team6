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
	//String up = "C:\\Users\\�ڼ���\\OneDrive\\���� ȭ��\\�׸���ǻ��\\�ǻ� �����\\workspace\\magicWebApp\\upload_s\\";
	String up = "C:\\Users\\ParkSeJoon\\OneDrive\\���� ȭ��\\�׸���ǻ��\\�ǻ� �����\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Team6\\upload_s\\";
	String fname = board.getbs_fname();
	System.out.println("@@@### fname ===>"+fname);
	int re = db.deleteBoard(bs_id, bs_pwd);
	
	if(re == 1){
		if(fname != null){
			File file=new File(up+fname);
			file.delete();
		}
		response.sendRedirect("hsbo0101R.jsp");
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
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>













