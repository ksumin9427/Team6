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
               <p class="shead2">���ǰ��� �� ���Ǹ���Ʈ</p>
               <h2 class="shead3">���� ����</h2>
           </div>
           <form action="hmle01W.jsp" method="post">
           <div class="list">
               ���Ǹ���Ʈ 
               <select name="search">
                   <option value="01">�����˻�</option>
                   <option value="02">���Ǹ�</option>
               </select>
               <input type="text" name="lecturename">
               <input type="submit" value="��ȸ">
           </div>
           </form>
           <div class="lectureadd">
               <a href="hmle0101W.jsp" class="myButton">�����߰�</a>
           </div>
           <table class="sarticle">
               <tr>
                   <th>���Ǹ�</th>
                   <th>����</th>
                   <th>�����ο�/�ܿ��ο�</th>
                   <th>����</th>
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
		<td class="sarticle3">����</td>
		<td class="sarticle4" ><%=l_max %></td>
		<td class="sarticle5">
			<a class="myButton" onclick="location.href='hmle0201W.jsp?l_no=<%=l_no%>'">����</a> 
			<a class="myButton" onclick="location.href='hmle0301W.jsp?l_no=<%=l_no%>'">����</a>
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
		<td class="sarticle3">����</td>
		<td class="sarticle4" ><%=l_max %></td>
		<td class="sarticle5">
			<a class="myButton" onclick="location.href='hmle0201W.jsp?l_no=<%=l_no%>'">����</a> 
			<a class="myButton" onclick="location.href='hmle0301W.jsp?l_no=<%=l_no%>'">����</a>
	</tr>
     <%
	}}
	%>
           </table>
       </article>
    </section>



    
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