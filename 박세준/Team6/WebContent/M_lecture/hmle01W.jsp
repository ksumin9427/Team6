<%@page import="mlecture.M_lectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test.css">
</head>
<body id="page">
    <div >
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
                        <li><a href="#">������û</a></li>
                        <li><a href="#">������û Ȯ��/����</a></li>
                        <li><a href="#">�ð�ǥ��ȸ</a></li>
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
               <p class="shead2">���ǰ��� �� ���Ǹ���Ʈ</p>
               <h2 class="shead3">���� ����</h2>
           </div>
           <form action="hmle0101W.jsp" method="post">
           <div class="list">
               ���Ǹ���Ʈ 
               <select name="search">
                   <option value="01">�����˻�</option>
                   <option value="02">���Ǹ�</option>
               </select>
               <input type="text" name="lecturename">
               <input type="submit">
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
          	int l_no = bean.getL_no();
          	String l_name = bean.getL_name() ;
          	int l_max = bean.getL_max();
          	%>
	<tr>
		<td class="sarticle2"><%=l_name%></td>
		<td class="sarticle3">����</td>
		<td class="sarticle4" ><%=l_max %></td>
		<td class="sarticle5">
			<a class="myButton" onclick="location.href='M_lecture3.jsp?l_no=<%=l_no%>'">������</a>
			<a class="myButton" onclick="location.href='hmle0201W.jsp?l_no=<%=l_no%>'">����</a> 
			<a class="myButton" onclick="location.href='M_lecture3.jsp?l_no=<%=l_no%>'">����</a>
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
			<a class="myButton" onclick="location.href='M_lecture3.jsp?l_no=<%=l_no%>'">������</a>
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