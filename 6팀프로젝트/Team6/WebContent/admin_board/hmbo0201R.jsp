<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	BoardDBBean2 db=BoardDBBean2.getInstance();
	ArrayList<BoardBean2> boardList = db.listBoard(pageNum);
	int i, bp_id, bp_hit, bp_level, bp_fsize;
	String bp_name, bp_email, bp_title, bp_fname;
	Timestamp bp_date;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <title>������б� �����������ý���</title>
</head>
<body>
	<div id="page">
    <header>
        <div class="top_bg">
        <div class="top-left-header">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">LOGOUT</a></li>
            </ul>
        </div>
    </div>
        <div class="logo">
            <h1><img src="kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                ������б�</h1>
        </div>
        
    
       <!-- <nav> -->
        <ul class="main-ul">
            <li><a href="#">����� ����</a>
                <ul class="sub-ul">
                    <li><a href="#">�л� ����</a></li>
                    <li><a href="#">������ ����</a></li>
                </ul>
            </li>
            <li><a href="#">���� ����</a>
                <ul class="sub-ul">
                    <li><a href="#">���� ����</a></li>
                    <li><a href="#">���� ����</a></li>
                    
                </ul>
            </li>
            <li><a href="#">�Խ��� ����</a>
                <ul class="sub-ul">
                    <li><a href="hmbo0101R.jsp">�л��Խ���</a></li>
                    <li><a href="hmbo0201R.jsp">�����Խ���</a></li>
                    <li><a href="#">��������</a></li>
                </ul>
            </li>
            
            
        </ul>
    <!-- </nav> -->


        	
    </header>


	<center style="">
		<h1 align="center" style="margin-left: auto;margin-right: auto;margin-top: 100px;margin-bottom: 50px;">���� �Խ���</h1>
		<div class="container">
			<table class="table table-hover">
				<tr>
					<td align="center">��ȣ</td>
					<td>÷������</td>
					<td>������</td>
					<td align="center">�ۼ���</td>
					<td align="center">�ۼ���</td>
					<td align="center">��ȸ��</td>
				</tr>
				<%
					for(i=0; i<boardList.size(); i++){
						BoardBean2 board = boardList.get(i);
						bp_id = board.getBp_id();
						bp_title = board.getBp_title();
						bp_name = board.getBp_name();
						bp_email = board.getBp_email();
						bp_date = board.getBp_date();
						bp_hit = board.getBp_hit();
						bp_level = board.getBp_level();
						bp_fname = board.getBp_fname();
						bp_fsize = board.getBp_fsize();
				%>
						<tr bgcolor="#f7f7f7" 
							onmouseover="this.style.backgroundColor='#eeeeef'" 
							onmouseout="this.style.backgroundColor='#f7f7f7'">
							<td align="center">
								<%= bp_id %>
							</td>
							<td>
								<%
									if(bp_fsize > 0){
								%>
										<img src="../images/zip.gif">
								<%
									}
								%>
							</td>
							<td>
								<%
									if(bp_level > 0){
										for(int j=0; j< bp_level; j++){
								%>
											&nbsp;
								<%
										}
								%>
										<img src="../images/AnswerLine.gif" width="16" height="16">
								<%
									}
								%>
								<a href="hmbo0202R.jsp?bp_id=<%= bp_id %>&pageNum=<%= pageNum %>"><%= bp_title %></a>
							</td>
							<td align="center">
								<a href="mailto:<%= bp_email %>"><%= bp_name %></a>
							</td>
							<td align="center">
								<%= sdf.format(bp_date) %>
							</td>
							<td align="center">
								<%= bp_hit %>
							</td>
						</tr>
				<%
					}
				%>
			</table>
		</div>
	</center>
	<br>
	<br>
	<center>
		<%= BoardBean2.pageNumber(4) %>
	</center>
	
	<footer>
        <ul>
            <li>�λ� �λ����� �߾Ӵ�� 688</li>
            <li>TEL : 051-912-1000</li>
            <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
        </ul>
    </footer>
</div>
</body>
</html>


















