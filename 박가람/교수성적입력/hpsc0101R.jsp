<%@page import="lecture.lecture1bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.ScoreDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//int id = (int)session.getAttribute("id");
	int id = 201101;
	
	ScoreDBBean db = ScoreDBBean.getInstance();
	ArrayList<lecture1bean> list = db.getLecture(id);
	int i, l_no=0, l_level=0, l_sem=0;
	String l_name = null;

	
%>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../login/style.css">
<title>Insert title here</title>
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
            <h1><img src="../images/kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                가산대학교</h1>
        </div>

        <ul class="main-ul">
            <li><a href="#">수업</a>
                <ul class="sub-ul">
                    <li><a href="#">강좌조회</a></li>
                    <li><a href="#">시간표조회</a></li>
                </ul>
            </li>
            <li><a href="#">성적</a>
                <ul class="sub-ul">
                    <li><a href="#">학생 조회</a></li>
                    <li><a href="#">성적입력 및 수정</a></li>
                </ul>
            </li>

            <li><a href="#">게시판</a>
                <ul class="sub-ul">
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">자유게시판</a></li>
                </ul>
            </li>
            <li><a href="#">마이페이지</a>
                <ul class="sub-ul">
                    <li><a href="#">개인신상조회</a></li>
                    <li><a href="#">학생조회</a></li>
                </ul>
            </li>
        </ul>
    </header>
    
    <form action="" method="post">
    	<table border="1" cellspacing="0" width="600">
    		<tr>
    			<th>강의번호</th>
    			<th>강의명</th>
    			<th>학년</th>
    			<th>학기</th>
    			<th></th>
    		</tr>
    		<%
    			for(i=0; i< list.size(); i++){
    				lecture1bean lecture = list.get(i);
    				l_no = lecture.getL_no();
    				l_name = lecture.getL_name();
    				l_level =lecture.getL_level();
    				l_sem = lecture.getL_sem();
    				
    		%>
    			<tr>
	    			<td><a href="hpsc0102W.jsp?lno=<%= l_no %>&lname=<%= l_name %>&lsem=<%= l_sem %>"><%= l_no %></a></td>
	    			<td><%= l_name %></td>
	    			<td><%= l_level %></td>
	    			<td><%= l_sem %></td>
	    			<td> <input type="button" value="성적 입력" onclick="location.href='hpsc0102W.jsp?lno=<%= l_no %>&lname=<%= l_name %>&lsem=<%= l_sem %>'"> </td>
    			</tr>
    		<%
    			}
    		%>
    	</table>
    </form>
    
    <footer>
        <ul>
            <li>부산 부산진구 중앙대로 688</li>
            <li>TEL : 051-912-1000</li>
            <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
        </ul>
    </footer>
</div>
</body>
</html>