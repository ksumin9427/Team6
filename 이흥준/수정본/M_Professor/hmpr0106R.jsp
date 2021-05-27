<%@page import="mprofessor.MProfessorBean"%>
<%@page import="mprofessor.MProfessorDBBean"%>
<%@page import="mlecture.M_lectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%response.setCharacterEncoding("euc-kr"); 
	int p_no =Integer.parseInt(request.getParameter("p_no"));
	int m_no = Integer.parseInt((String)session.getAttribute("id"));
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
   <jsp:include page="../common/m_menu.jsp"></jsp:include>
    <div >
    
    <section>
       <article>
           <div class="shead">
               <p class="shead2">교수관리 → 교수수정</p>
               <h2 class="shead3">교수 수정</h2>
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
           			<th width="400">교수명</th>
           			<td width="880"><input class="name" type="text" name="name" value="<%=mb.getP_name()%>"></td>
           		</tr>
           		<script type="text/javascript">
    
       			 var openWin;
    
        		 function openChild1()
        	{
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("hmpr0104R.jsp",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }
 
   </script>	
           		<tr>
           			<th>전공</th>
           			<td><input class="sarticle1in2" type="text" id="pInput" readonly value="<%=mb.getMajor_name()%>">
           			<input type="hidden" id="put1" name="major_no" value="<%=mb.getMajor_no()%>">
           			 <input type="button" value="검색" onclick="openChild1()">
           			 </td>
           		</tr>
           		<tr>
           		<tr>
           			<th>주민번호</th>
           			<td><input class="sarticle1in" type="number" name="jumin" maxlength="13" placeholder=" 주민번호 13자리 입력해주세요" value="<%=mb.getP_jumin()%>"></td>
           		</tr>
           		<tr>
           			<th>전화번호</th>
           			<td><input class="sarticle1in" type="text" name="tel" maxlength="13" placeholder=" -를 포함해서 적어주세요" value="<%=mb.getP_tel()%>"></td>
           		</tr>
           		<tr>
           			<th>EMAIL</th>
           			<td><input class="sarticle1in" type="email" name="email" value="<%=mb.getP_email()%>"></td>
           		</tr>
           		<tr>
           			<th>강의실</th>
           			<td><input class="name" type="text" name="room" width="20" value="<%=mb.getP_room()%>"></td>
           		</tr>
           		
          <%} %>
           </table>
           <center><a class="myButton" onclick="click_ok()">수정</a>
           <a class="myButton" onclick="location.href='hmpr0101R.jsp'">취소</a></center>
           </form>
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