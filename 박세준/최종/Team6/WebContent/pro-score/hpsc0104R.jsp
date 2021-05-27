<%@page import="lecture.ScoreDBBean"%>
<%@page import="myUtil.HanConv"%>
<%@page import="lecture.ExamBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int l_no = Integer.parseInt(request.getParameter("l_no"));
	
	//성적확정유무 확인
	int isConfirm = 0;
	if(request.getParameter("isConfirm") != null){
		isConfirm = 1;
	}
	
	ScoreDBBean db = ScoreDBBean.getInstance();
	ArrayList<ExamBean> examList = db.getExamList(l_no);
	int i, s_no=0, midEx=0, finalEx=0, task=0, total=0; 
	String s_name="", score="";
%>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../login/style.css">
<title>Insert title here</title>
	<script type="text/javascript" src="score.js" charset="UTF-8" ></script>
</head>
<body>
    <div id="page">
	<jsp:include page="../common/pro_menu.jsp"></jsp:include>
	<center>
	<hr>

	<table class="table table-bordered table-striped">
		<tr>
		    <td colspan="8"> 강의번호: <%=l_no%> </td>
		</tr>
    	<tr>
    		<th>학번</th>
    		<th>이름</th>
    		<th>중간</th>
    		<th>기말</th>
    		<th>과제</th>
    		<th>합계</th>
    		<th>성적</th>
    	<% 
    		if(isConfirm != 1){
    	%>
    		<th></th>
    	<%
    		}
    	%>
    	</tr>
    	<%
    		for(i=0; i< examList.size(); i++){
    			ExamBean exam = examList.get(i);
    			s_no = exam.getS_no();
    			s_name = exam.getS_name();
    			midEx = exam.getMidEx();
    			finalEx = exam.getFinalEx();
    			task = exam.getTask();
    			total = exam.getTotal();
    			score = exam.getScore();
    	%>
    		<tr>
    			<td> <%= s_no %> </td>
    			<td> <%= s_name %> </td>
    			<td> <%= midEx %> </td>
    			<td> <%= finalEx %> </td>
    			<td> <%= task %> </td>
    			<td> <%= total %> </td>
    			<td> <%= score %> </td>
    	<% 
    		if(isConfirm != 1){
    	%>
    			<td> <input type="button" value="수정" onclick="location.href='hpsc0201W.jsp?s_no=<%= s_no%>&l_no=<%=l_no%>'"> </td>
    	<%
    		}
    	%>
    		</tr>
    	<%
    		}
    	%>
	</table>
	<% 
    		if(isConfirm != 1){
    	%>
			<input type="button" value="성적 확정" onclick="location.href='hpsc0301W.jsp?l_no=<%= l_no %>'">
    	<%
    		}
    	%>
	<input type="button" value="처음으로" onclick="location.href='hpsc0101R.jsp'">
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
</body>
</html>