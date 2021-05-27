<%@page import="mlecture.M_lectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
int m_no = Integer.parseInt((String)session.getAttribute("id"));
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test.css">
</head>
<body id="page">
    <jsp:include page="../common/m_menu.jsp"></jsp:include>
    <div >
    <section>
       <article>
           <div class="shead">
               <p class="shead2">강의관리 → 강의리스트</p>
               <h2 class="shead3">강의 관리</h2>
           </div>
           <form action="hmle01W.jsp" method="post">
           <div class="list">
               강의리스트 
               <select name="search">
                   <option value="01">전공검색</option>
                   <option value="02">강의명</option>
               </select>
               <input type="text" name="lecturename">
               <input type="submit" value="조회">
           </div>
           </form>
           <div class="lectureadd">
               <a href="hmle0101W.jsp" class="myButton">강의추가</a>
           </div>
           <table class="sarticle">
               <tr>
                   <th>강의명</th>
                   <th>상태</th>
                   <th>수강인원/잔여인원</th>
                   <th>관리</th>
               </tr>
              <% 
          	request.setCharacterEncoding("EUC-KR");
              M_lectureDBbean mdb = M_lectureDBbean.getinstance();
              ArrayList<M_lectureBean> list=null;
             if(request.getParameter("search")!=null){
          	String search = request.getParameter("search");
          	String lecturename = request.getParameter("lecturename");
          	list= mdb.listKeywords(search, lecturename);
             for(int i=0;i<list.size();i++){
			M_lectureBean bean = list.get(i);
			String mname = bean.getM_name();
          	int l_no = bean.getL_no();
          	String l_name = bean.getL_name() ;
          	int l_max = bean.getL_max();
          	%>
	<tr>
		<td class="sarticle2"><%=l_name%></td>
		<td class="sarticle3">진행</td>
		<td class="sarticle4" ><%=l_max %></td>
		<td class="sarticle5">
			<a class="myButton" onclick="location.href='hmle0201W.jsp?l_no=<%=l_no%>'">수정</a> 
			<a class="myButton" onclick="location.href='hmle0301W.jsp?l_no=<%=l_no%>'">삭제</a>
	</tr>
	
	<%}}else{
		list=mdb.listlecture();
		 for(int i=0;i<list.size();i++){
				M_lectureBean bean = list.get(i);
	          	int l_no = bean.getL_no();
	          	String l_name = bean.getL_name() ;
	          	int l_max = bean.getL_max();
		%>
		 <tr>
		<td class="sarticle2"><%=l_name%></td>
		<td class="sarticle3">진행</td>
		<td class="sarticle4" ><%=l_max %></td>
		<td class="sarticle5">
			<a class="myButton" onclick="location.href='hmle0201W.jsp?l_no=<%=l_no%>'">수정</a> 
			<a class="myButton" onclick="location.href='hmle0301W.jsp?l_no=<%=l_no%>'">삭제</a>
	</tr>
     <%
	}}
	%>
           </table>
       </article>
    </section>



    
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