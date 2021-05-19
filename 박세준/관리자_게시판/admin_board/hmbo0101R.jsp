<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	BoardDBBean db=BoardDBBean.getInstance();
	ArrayList<BoardBean> boardList = db.listBoard(pageNum);
	int i, bs_id, bs_hit, bs_level, bs_fsize;
	String bs_name, bs_email, bs_title, bs_fname;
	Timestamp bs_date;
	
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


	<center>
		<h1 align="center" style="margin-left: auto;margin-right: auto;margin-top: 100px;margin-bottom: 50px;">�л� �Խ���</h1>
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
						BoardBean board = boardList.get(i);
						bs_id = board.getbs_id();
						bs_title = board.getbs_title();
						bs_name = board.getbs_name();
						bs_email = board.getbs_email();
						bs_date = board.getbs_date();
						bs_hit = board.getbs_hit();
						bs_level = board.getbs_level();
						bs_fname = board.getbs_fname();
						bs_fsize = board.getbs_fsize();
				%>
						<tr bgcolor="#f7f7f7" 
							onmouseover="this.style.backgroundColor='#eeeeef'" 
							onmouseout="this.style.backgroundColor='#f7f7f7'">
							<td align="center">
								<%= bs_id %>
							</td>
							<td>
								<%
									if(bs_fsize > 0){
								%>
										<img src="../images/zip.gif">
								<%
									}
								%>
							</td>
							<td>
								<%
									if(bs_level > 0){
										for(int j=0; j< bs_level; j++){
								%>
											&nbsp;
								<%
										}
								%>
										<img src="../images/AnswerLine.gif" width="16" height="16">
								<%
									}
								%>
								<a href="hmbo0102R.jsp?bs_id=<%= bs_id %>&pageNum=<%= pageNum %>"><%= bs_title %></a>
							</td>
							<td align="center">
								<a href="mailto:<%= bs_email %>"><%= bs_name %></a>
							</td>
							<td align="center">
								<%= sdf.format(bs_date) %>
							</td>
							<td align="center">
								<%= bs_hit %>
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
		<%= BoardBean.pageNumber(4) %>
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


















