<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="notice.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	NoticeDBBean db = NoticeDBBean.getInstance();
	ArrayList<NoticeBean> noticeList = db.listProfessorNotice(pageNum);
	int i, n_no, n_hit, n_fsize,number=0;
	String n_div, n_name, n_title, n_fname;
	Timestamp n_date;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
	<jsp:include page="../common/pro_menu.jsp"></jsp:include>
	<center>
	<hr>
		<h4>공지사항</h4>
			<table class="table table-hover">
			<tr>
				<td width="40">번호</td>
				<td width="80">첨부파일</td>
				<td width="80">구분</td>
				<td width="350">글제목</td>
				<td width="120">작성자</td>
				<td width="180">작성일</td>
				<td width="60">조회수</td>
			</tr>
			<%
				for(i=0; i<noticeList.size();i++){
					NoticeBean notice = noticeList.get(i);
					n_no=notice.getN_no();
					n_div=notice.getN_div();
					n_title=notice.getN_title();
					n_name=notice.getN_name();
					n_date=notice.getN_date();
					n_hit=notice.getN_hit();
					n_fname=notice.getN_fname();
					n_fsize=notice.getN_fsize();
					number++;
			%>
				<tr bgcolor="#f7f7f7" 
						onmouseover="this.style.backgroundColor='#eeeeef'" 
						onmouseout="this.style.backgroundColor='#f7f7f7'">
					<td><%= number %></td>
					<td>
							<%
								if(n_fsize > 0){
							%>
								<img src="../images/zip.gif">
							<%
								}
							%>
						</td>
					<td><%= n_div %></td>
					<td>
						<a href="hmno0104R.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>&code=2"><%= n_title %></a>
					</td>
					<td><%= n_name %></td>
					<td><%= sdf.format(n_date) %></td>
					<td><%= n_hit %></td>
				</tr>

			<%
				}
			%>
		</table>
	</center>
	<br>
	<br>	
	<center>
		<%= NoticeBean.pageNumber(4) %>
	</center>
		<jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
</body>
</html>