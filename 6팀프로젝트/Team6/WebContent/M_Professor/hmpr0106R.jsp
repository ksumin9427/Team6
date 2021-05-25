<%@page import="mprofessor.MProfessorBean"%>
<%@page import="mprofessor.MProfessorDBBean"%>
<%@page import="mlecture.M_lectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%response.setCharacterEncoding("euc-kr"); 
	int p_no =Integer.parseInt(request.getParameter("p_no"));
 %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test.css">
<script type="text/javascript" charset="utf-8" src="hmpr.js" ></script>
<style>
	.sarticle1{
    margin-top: 30px;
    margin-bottom: 40px;
}
.sarticle1 tr th{
    background-color: #e7e6e6;
}
.sarticle1 th,td{
    border-left: 1px solid #dcdcdc;
    border-right: 1px solid #dcdcdc;
    border-top: 1px solid black;
    border-bottom: 1px solid black;
}
.sarticle1 th{
 	height: 50px;
}
.sarticle1 td{
 	padding-left: 25px;
}
td input {
	height: 28px;
}
.sarticle1in{
	width: 320px;
}
.sarticle1in2{
	width: 200px;
}
</style>
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
        </header>
    
    <section>
       <article>
           <div class="shead">
               <p class="shead2">�������� �� ��������</p>
               <h2 class="shead3">���� ����</h2>
           </div>
           <form action="hmpr0107R.jsp" method="post" name="fr">
           <table class="sarticle1">
           		<%MProfessorDBBean db = MProfessorDBBean.getinstance();
           		ArrayList<MProfessorBean> list = db.prolist2(p_no);
 				for(int i=0;i<list.size();i++){
 					MProfessorBean mb= list.get(i);
 				
           		%>
           		<input type="hidden" name="p_no" value="<%=mb.getP_no()%>"> 
           		<tr>
           			<th width="400">������</th>
           			<td width="880"><input class="name" type="text" name="name" value="<%=mb.getP_name()%>"></td>
           		</tr>
           		<script type="text/javascript">
    
       			 var openWin;
    
        		 function openChild1()
        	{
            // window.name = "�θ�â �̸�"; 
            window.name = "parentForm";
            // window.open("open�� window", "�ڽ�â �̸�", "�˾�â �ɼ�");
            openWin = window.open("hmpr0104R.jsp",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }
 
   </script>	
           		<tr>
           			<th>����</th>
           			<td><input class="sarticle1in2" type="text" id="pInput" readonly value="<%=mb.getMajor_name()%>">
           			<input type="hidden" id="put1" name="major_no" value="<%=mb.getMajor_no()%>">
           			 <input type="button" value="�˻�" onclick="openChild1()">
           			 </td>
           		</tr>
           		<tr>
           		<tr>
           			<th>�ֹι�ȣ</th>
           			<td><input class="sarticle1in" type="number" name="jumin" maxlength="13" placeholder=" �ֹι�ȣ 13�ڸ� �Է����ּ���" value="<%=mb.getP_jumin()%>"></td>
           		</tr>
           		<tr>
           			<th>��ȭ��ȣ</th>
           			<td><input class="sarticle1in" type="text" name="tel" maxlength="13" placeholder=" -�� �����ؼ� �����ּ���" value="<%=mb.getP_tel()%>"></td>
           		</tr>
           		<tr>
           			<th>EMAIL</th>
           			<td><input class="sarticle1in" type="email" name="email" value="<%=mb.getP_email()%>"></td>
           		</tr>
           		<tr>
           			<th>���ǽ�</th>
           			<td><input class="name" type="text" name="room" width="20" value="<%=mb.getP_room()%>"></td>
           		</tr>
           		
          <%} %>
           </table>
           <center><a class="myButton" onclick="click_ok()">����</a>
           <a class="myButton" onclick="location.href='hmpr0101R.jsp'">���</a></center>
           </form>
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