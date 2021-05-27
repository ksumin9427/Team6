<%@page import="mprofessor.MProfessorBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mprofessor.MProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	
    	//int m_no = Integer.parseInt( request.getParameter("m_no"));
    	// ������ ��ȣ�� �־�� ����ǰ� �� ����
    	request.setCharacterEncoding("EUC-KR");
    %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test.css">
<script type="text/javascript" charset="utf-8" src="hmpr.js"></script>
</head>
<body id="page">
    <div>
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
                    ������б�</h1>
            </div>
            <!-- <nav> -->
                <ul class="main-ul">
                    <li><a href="#">����</a>
                        <ul class="sub-ul">
                            <li><a href="#">��������</a></li>
                            <li><a href="#">������������</a></li>
                        </ul>
                    </li>
                    <li><a href="#">����</a>
                        <ul class="sub-ul">
                            <li><a href="#">������ȸ</a></li>
                            <li><a href="hsle0201W.jsp">������û</a></li>
                            <li><a href="#">������û Ȯ��/����</a></li>
                            <li><a href="hsle0401R.jsp">�ð�ǥ��ȸ</a></li>
                        </ul>
                    </li>
                    <li><a href="#">����</a>
                        <ul class="sub-ul">
                            <li><a href="#">���б� ������ȸ</a></li>
                            <li><a href="#">��ü ������ȸ</a></li>
                        </ul>
                    </li>

                    <li><a href="#">�Խ���</a>
                        <ul class="sub-ul">
                            <li><a href="#">��������</a></li>
                            <li><a href="#">�����Խ���</a></li>
                        </ul>
                    </li>
                </ul>
            <!-- </nav> -->

        </header>
    
    <section>
       <article>
           <div class="shead">
               <p class="shead2">�������� �� ��������Ʈ</p>
               <h2 class="shead3">���� ����Ʈ</h2>
           </div>
           <form action="hmpr0101R.jsp" method="post" name="fr">
           <div class="list">
               ���Ǹ���Ʈ 
               <select name="search">
                   <option value="01">�����˻�</option>
                   <option value="02">�̸��˻�</option>
               </select>
               <input type="text" name="lecturename">
			   <input type="submit" value="�˻�">
           </div>
           </form>
           <div class="lectureadd">
               <a href="hmpr0102R.jsp" class="myButton">�������</a>
           </div>
           <table class="sarticle">
               <tr>
               	   <th>����</th>
                   <th>�̸�</th>
                   <th>�������</th>
                   <th>��ȭ��ȣ</th>
                   <th>EMAIL</th>
                   <th>���ǽ�</th>
                   <th>����</th>
               </tr>
               <%
               		if(request.getParameter("search")!=null){
               			String selectke= request.getParameter("search");
               			String lecturename = request.getParameter("lecturename");
               			MProfessorDBBean mdb = MProfessorDBBean.getinstance();
               			ArrayList<MProfessorBean> list = mdb.listKeywords(selectke, lecturename);
               			for(int i=0;i<list.size();i++){
                     	   MProfessorBean pro = list.get(i);
                        %>
         	<tr>
         		<td class="sarticle2"><%=pro.getMajor_name() %></td>
         		<td class="sarticle3"><%=pro.getP_name() %></td>
         		<td class="sarticle4" ><%=pro.getP_jumin() %></td>
         		<td class="sarticle5"><%=pro.getP_tel() %></td>
         		<td class="sarticle6"><%=pro.getP_email() %></td>
         		<td class="sarticle7"><%=pro.getP_room() %></td>
         		<td class="sarticle8">
         			<a class="myButton" onclick="location.href='hmpr0106R.jsp?p_no=<%=pro.getP_no()%>'">����</a> 
         			<a class="myButton" onclick="location.href='hmpr0105R.jsp?p_no=<%=pro.getP_no()%>'">����</a>
         		</td>
         	</tr>
         	<%}}else{
         		
         		MProfessorDBBean mpdb = MProfessorDBBean.getinstance();
                ArrayList<MProfessorBean> list= mpdb.prolist();
                for(int i=0;i<list.size();i++){
             	   MProfessorBean pro = list.get(i);
             	   %>
 	<tr>
 		<td class="sarticle2"><%=pro.getMajor_name() %></td>
 		<td class="sarticle3"><%=pro.getP_name() %></td>
 		<td class="sarticle4" ><%=pro.getP_jumin() %></td>
 		<td class="sarticle5"><%=pro.getP_tel() %></td>
 		<td class="sarticle6"><%=pro.getP_email() %></td>
 		<td class="sarticle7"><%=pro.getP_room() %></td>
 		<td class="sarticle8">
 			<a class="myButton" onclick="location.href='hmpr0106R.jsp?p_no=<%=pro.getP_no()%>'">����</a> 
 			<a class="myButton" onclick="location.href='hmpr0105R.jsp?p_no=<%=pro.getP_no()%>'">����</a>
 		</td>
 	</tr>
         		<%}} %>               			
               	
               
               
               
               
           
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