<%@page import="pro.ProfessorBean"%>
<%@page import="pro.ProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_no = Integer.parseInt(request.getParameter("p_no")); //나중에 교수 번호를 request로 받아서 페이지를 넘어가게할예정입니다.
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" media="(min-width:670px)">
<script type="text/javascript" charset="utf-8" src="pro.js"></script>
</head>
<body id="page">
	 <jsp:include page="../common/pro_menu.jsp"></jsp:include>
    	<div >
        <section>
            <article>
                <table class="thead">
                    <div><h1 class="tname">교수정보페이지</h1></div>
                    <tr>
                        <td colspan="2"><img src="../images//zzz.png" width="190px" height="210px"></td>
                    </tr>
                            <%
                            	ProfessorDBBean prodb = ProfessorDBBean.getinstance();
                                                                                    	ProfessorBean pro= prodb.listpro(p_no);
                                                                                    	if(pro != null){
                            %>
                    <tr>
                        <td width="35" height="19">이름</td>
                        <td><%=pro.getP_name() %></td>
                    </tr>
                </table>
                    <span>
                        <span>
                        	<form action="hpin0202W.jsp?p_no=<%=pro.getP_no() %>" method="post" name="fr">
	                            <table class="tbody">
	                                <tr>
	                                    <td>
	                                        교수번호
	                                    </td>
	                                    <td><%=pro.getP_no() %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        이름
	                                    </td>
	                                    <td><%=pro.getP_name() %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        전공
	                                    </td>
	                                    <td><%
	                                    	String major =prodb.majorname(pro.getMajor_no());
	                                    	out.println(major);
	                                    %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        생년월일
	                                    </td>
	                                    <td><%=pro.getP_jumin() %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        전화번호
	                                    </td>
	                                    <td><input type="text" name="tel" value="<%=pro.getP_tel() %>" maxlength="13"></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        이메일
	                                    </td>
	                                    <td><input type="text" name="email" value="<%=pro.getP_email() %>"> </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        담당강의
	                                    </td>
	                                    <td> <%
	                                       		String lec =prodb.lecturename(pro.getP_no());
	                                    		out.println(lec);
	                                        %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        강의실
	                                    </td>
	                                    <td><%=pro.getP_room() %></td>
	                                </tr>
	                                <%} %>
	                                <tr>
	                                	<td><a class="button" onclick="click_ok()"> 수정완료</a></td>
	                                </tr>
	                            </table>
                            </form>
                        </span>
                    </span>
                </article>
            </section>
            
        <footer id="foot">
            <ul>
                <li>부산 부산진구 중앙대로 688</li>
                <li>TEL : 051-912-1000</li>
                <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
            </ul>
        </footer>


    </div>
</body>
</html>