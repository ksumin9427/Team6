<%@page import="mlecture.M_lectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%response.setCharacterEncoding("euc-kr"); 
 	//String major ="";
 	//if(request.getParameter("major_no")!=null){
	//	major = request.getParameter("major_no");
 	//}
 %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test.css">
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
                <h1><img src="../image/kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
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
               <p class="shead2">���ǰ��� �� �����߰�</p>
               <h2 class="shead3">���� �߰�</h2>
           </div>
           <form action="hmle0102W.jsp" method="post">
           <table class="sarticle1">
           		<tr>
           			<th width="400">���Ǹ�</th>
           			<td width="880"><input class="sarticle1in" type="text" name="name"></td>
           		</tr>
           		<tr>
           			<th>�����г�</th>
           			<td>
           				<select name="level">
           					<option value="1">1�г�</option>
           					<option value="2">2�г�</option>
           					<option value="3">3�г�</option>
           					<option value="4">4�г�</option>
           				</select>
           			</td>
           		</tr>
           		<tr>
           			<th>�����б�</th>
           			<td><select name="sem">
           					<option value="1">1�б�</option>
           					<option value="2">2�б�</option>
           				</select></td>
           		</tr>
           		<tr>
           			<th>�����ο�</th>
           			<td><input class="sarticle1in" type="text" name="max"></td>
           		</tr>
           		<tr>
           			<th>��������</th>
           			<td><select name="day">
           					<option value="��">��</option>
           					<option value="ȭ">ȭ</option>
           					<option value="��">��</option>
           					<option value="��">��</option>
           					<option value="��">��</option>
           				</select></td>
           		</tr>
           		<tr>
           			<th>���۽ð�</th>
           			<td><select name="time">
           					<option value="9">09 : 00</option>
           					<option value="10">10 : 00</option>
           					<option value="11">11 : 00</option>
           					<option value="12">12 : 00</option>
           					<option value="13">13 : 00</option>
           					<option value="14">14 : 00</option>
           					<option value="15">15 : 00</option>
           					<option value="16">16 : 00</option>
           					<option value="17">17 : 00</option>
           				</select></td>
           		</tr>
           		<tr>
           			<th>�̼�����</th>
           			<td><input type="text" name="com"></td>
           		</tr>
           		<script type="text/javascript">
    
       			 var openWin;
    
        		 function openChild1()
        	{
            // window.name = "�θ�â �̸�"; 
            window.name = "parentForm";
            // window.open("open�� window", "�ڽ�â �̸�", "�˾�â �ɼ�");
            openWin = window.open("hmle0103W.jsp",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }
 
   </script>	
           		<tr>
           			<th>����</th>
           			<td><input class="sarticle1in2" type="text" id="pInput" readonly>
           			<input type="hidden" id="put1" name="major_no">
           			 <input type="button" value="�˻�" onclick="openChild1()">
           			 </td>
           		</tr>
           		<tr>
           		
           		
     <script type="text/javascript">
    
       			 var openWin2;
    
        		 function openChild2()
        	{
            // window.name = "�θ�â �̸�"; 
            window.name = "parentForm2";
            // window.open("open�� window", "�ڽ�â �̸�", "�˾�â �ɼ�");
            openWin = window.open("hmle0104W.jsp",
                    "childForm2", "width=570, height=350, resizable = no, scrollbars = no");    
        }
 
   </script>	
           			<th>��米��</th>
           			<td><input class="sarticle1in2" type="text" id="pInput2" readonly>
           			<input type="button" value="�˻�" onclick="openChild2()">
           			<input type="hidden" id="put2" name="professor_p_no">
           			</td>
           		</tr>	
           </table>
           <center><input type="submit" value="�����߰�">
           <input type="button" value="���"></center>
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