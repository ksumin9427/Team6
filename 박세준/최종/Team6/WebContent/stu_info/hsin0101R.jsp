<%@page import="member.StudentBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int code;
	String id=null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
		code = ((Integer)(session.getAttribute("code"))).intValue();
	}
	MemberDBBean db = MemberDBBean.getInstance();
	StudentBean student = db.getStudent(id);
	
	int s_no=0, s_level=0, s_status=0, major_no=0;
	String s_pwd=null, s_name=null, s_jumin=null, s_tel=null, s_email=null,status=null;
	if(student != null){
		s_no = student.getS_no();
		s_pwd = student.getS_pwd();
		s_name = student.getS_name();
		s_level = student.getS_level();
		s_jumin = student.getS_jumin();
		s_tel = student.getS_tel();
		s_email = student.getS_email();
		major_no = student.getMAJOR_no();
		s_status = student.getS_status();
		if(s_status == 1){
			status = "재학";
		}else if(s_status == 2){
			status = "휴학";
		}else if(s_status == 3){
			status = "졸업";
		}
	}
	String major = db.getMajorName(id);
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>학적사항</title>
	<script type="text/javascript" src="confirm.js" charset="utf-8" ></script>
	<link rel="stylesheet" href="../style.css" media="(min-width:670px)">
</head>
<body>
	<div id="page">
		<jsp:include page="../common/stu_menu.jsp"></jsp:include>
		<br>
		<br>
		      <table class="thead">
                    <center><h1 class="tname">학생정보</h1></center>
                    <tr>
                        <td colspan="2"><img src="../images/zzz.png" width="190px" height="210px"></td>
                    </tr>
                      
                </table>		
			<table class="tbody">
				<tr>
					<td>학번:</td>
					<td><%= s_no %></td>
				</tr>
				<tr>
					<td>이름:</td>
					<td><%= s_name %></td>
				</tr>
				<tr>
					<td>학적:</td>
					<td><%= status %></td>
				</tr>
				<tr>
					<td>전공:</td>
					<td><%= major %></td>
				</tr>
				<tr>
					<td>학년:</td>
					<td><%= s_level %></td>
				</tr>
				<tr>
					<td>생년월일:</td>
					<td><%= s_jumin.substring(0, 2)+"."+s_jumin.substring(2,4)+"."+s_jumin.substring(4,6) %></td>
				</tr>
				<tr>
					<td>전화번호:</td>
					<td><%= s_tel %></td>
				</tr>
				<tr>
					<td>E-mail</td>
					<td><%= s_email %></td>
				</tr>
				<tr>
					<td><input type="button" value="수정"
						onclick="confirm(<%= s_pwd%>)"></td>
				</tr>
			</table>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>