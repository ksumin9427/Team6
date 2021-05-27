<%@page import="myUtil.HanConv"%>
<%@page import="member.StudentBean"%>
<%@page import="lecture.LectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.ScoreDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int l_no = Integer.parseInt(request.getParameter("l_no"));
	int l_sem = Integer.parseInt(request.getParameter("l_sem"));
	
	ScoreDBBean db = ScoreDBBean.getInstance();
	
	ArrayList<StudentBean> studentList = db.getStudentList(l_no);
	int i, s_no=0;
	String s_name="", score="";
	
	//exam입력되있으면 목록으로 감
	if(db.getExam(studentList.get(0).getS_no(), l_no) != null){
		response.sendRedirect("hpsc0104R.jsp?l_no="+l_no);
	}
	
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
	<h4>성적 입력</h4>
    <form action="hpsc0103R.jsp?l_no=<%=l_no%>&l_sem=<%=l_sem%>" method="post">
    	<table class="table table-striped table-bordered">
    		<tr>
		    	<td colspan="5"> 강의번호: <%=l_no%> </td>
		    </tr>
    		<tr>
    			<th>학번</th>
    			<th>이름</th>
    			<th>중간</th>
    			<th>기말</th>
    			<th>과제</th>
    		</tr>
    		<%
    			for(i=0; i < studentList.size(); i++){
    		    				StudentBean student = studentList.get(i);
    		    				s_no = student.getS_no();
    		    				s_name = student.getS_name();
    		%>
    				<tr>
    					<td><%= s_no %></td>
    					<td><%= s_name %></td>
    					<td> <input type="text" name="midEx<%= i %>"> </td>
    					<td> <input type="text" name="finalEx<%= i %>"> </td>
    					<td> <input type="text" name="task<%= i %>"> </td>
    				</tr>
    		<%
    			}
    		%>
    			<tr>
    				<td colspan="5"> 
    					<input type="submit" value="입력"> 
    					<input type="button" value="목록" onclick="location.href='hpsc0104R.jsp?l_no=<%= l_no%>'"> 
    				</td>
    			</tr>
    	</table>
    </form>
    
    	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
</body>
</html>