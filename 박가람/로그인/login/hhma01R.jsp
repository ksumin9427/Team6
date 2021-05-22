<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int code=0;
	String id=null;
	String name=null;
	if(request.getParameter("code") != null){ //세션으로 하니까 오류남 
		code = Integer.parseInt(request.getParameter("code"));
		id = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
	}
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>가산대학교 HOME</title>
 
    <!-- 1. 데스크탑용 외부 스타일시트 적용 -->
    <link rel="stylesheet" href="style.css" media="(min-width:670px)">
</head>
<body>
    <div id="page">
        <header>
            <div class="top_bg">
            <div class="top-left-header">
                <ul>
                    <li><a href="#">HOME</a></li>
                    <%
                    	if(id == null){
                    %>
	                    	<li><a href="hhlg0101R.html">LOGIN</a></li>
                    <%
                    	}else{
                    %>
	                		<li><a href="hhlg0103R.jsp">LOGOUT</a></li>
                    <%
                    	}
                   		if(code == 1){
                    %>
	                		<li><a href="#">학생페이지로</a></li>
                    <%
                   		}else if(code == 2){
                    %>
	                		<li><a href="../pro-score/profe.html">교직원페이지로</a></li>
                    <%
                   		}else if(code == 3){
                    %>
        	                <li><a href="../notice/hmma01R.html">관리자페이지로</a></li>
                    <%
                   		}
                    %>
            
                </ul>
            </div>
        </div>
            <div class="logo">
                <h1><img src="../images/kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                    가산대학교</h1>
            </div>
            <!-- <nav> -->
                <ul class="main-ul">
                    <li><a href="#">학적</a>
                        <ul class="sub-ul">
                            <li><a href="#">학적사항</a></li>
                            <li><a href="#">개인정보수정</a></li>
                        </ul>
                    </li>
                    <li><a href="#">수업</a>
                        <ul class="sub-ul">
                            <li><a href="#">강좌조회</a></li>
                            <li><a href="#">수강신청</a></li>
                            <li><a href="#">수강신청 확인/정정</a></li>
                            <li><a href="#">시간표조회</a></li>
                        </ul>
                    </li>
                    <li><a href="#">성적</a>
                        <ul class="sub-ul">
                            <li><a href="#">현학기 성적조회</a></li>
                            <li><a href="#">전체 성적조회</a></li>
                        </ul>
                    </li>
        
                    <li><a href="#">게시판</a>
                        <ul class="sub-ul">
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">자유게시판</a></li>
                        </ul>
                    </li>
                </ul>
            <!-- </nav> -->
    
        </header>

 
            <article id="content">
                <section id="main1">
                    <img src="../images/main.JPG" alt="main img" id="m_img">
                </section>

                 <section>
                    <ul id="banner">
                      <li><a href="#"><img src="../images/banner1.JPG" alt="banner1" id="m_img"></a></li>
                      <li><a href="#"><img src="#" alt="banner2"id="m_img"></a></li>
                    </ul>
                 </section>
             </article>


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