<%@page import="lecture.LectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.ScoreDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int id =0;
	if(session.getAttribute("id") != null){
		id = Integer.parseInt((String)session.getAttribute("id"));
	}
	
	ScoreDBBean db = ScoreDBBean.getInstance();
	ArrayList<LectureBean> list = db.getLectureList(id);
	int i, l_no=0, l_level=0, l_sem=0, re=0;
	String l_name = null;
%>
<html>
<head>
<meta charset="EUC-KR">
    <link rel="stylesheet" type="text/css" href="../style.css">
<title>Insert title here</title>
<body>
    <div id="page">
	<jsp:include page="../common/pro_menu.jsp"></jsp:include>
	<center>
	<hr>
    <h4>강의목록</h4>
    <form action="" method="post">
    	<table class="table table-bordered table-striped">
		<tr>
    			<th>강의번호</th>
    			<th>강의명</th>
    			<th>학년</th>
    			<th>학기</th>
    			<th></th>
    		</tr>
    		<%
    			for(i=0; i< list.size(); i++){
    		    			lecture.LectureBean lecture = list.get(i);
    		    			l_no = lecture.getL_no();
    		    			l_name = lecture.getL_name();
    		    			l_level =lecture.getL_level();
    		    			l_sem = lecture.getL_sem();
    		    			re = db.existScore(l_no);
    		%>
    			<tr>
	    			<td><%= l_no %></td>
	    			<td><%= l_name %></td>
	    			<td><%= l_level %></td>
	    			<td><%= l_sem %></td>
	    	<%
	    		if(re == 1){
	    	%>
	    			<td> <input type="button" value="확정완료" onclick="location.href='hpsc0104R.jsp?l_no=<%= l_no %>&isConfirm=<%= re%>'"> </td>
	    	<%
	    		}else{
	    	%>
	    			<td> <input type="button" value="입력/수정" onclick="location.href='hpsc0102W.jsp?l_no=<%= l_no %>&l_sem=<%= l_sem %>'"> </td>
	    	<%
	    		}
	    	%>
    			</tr>
    		<%
    			}
    		%>
    	</table>
    </form>
    </center>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>
</div>
</body>
</html>