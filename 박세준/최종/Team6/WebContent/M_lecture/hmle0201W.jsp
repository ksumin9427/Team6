<%@page import="mlecture.M_lectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%response.setCharacterEncoding("euc-kr");
 int l_no =Integer.parseInt(request.getParameter("l_no"));
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
    <jsp:include page="../common/m_menu.jsp"></jsp:include>
    <div >
    
    <section>
       <article>
           <div class="shead">
               <p class="shead2">강의관리 → 강의수정</p>
               <h2 class="shead3">강의 수정</h2>
           </div>
           <form action="hmle0202W.jsp?l_no=<%= l_no%>" method="post">
           <table class="sarticle1">
           <%
           		M_lectureDBbean bbean = M_lectureDBbean.getinstance();
           		ArrayList<M_lectureBean> list = bbean.listlecture(l_no);
           		for(int i=0;i<list.size();i++){
           		M_lectureBean lrb=	list.get(i);
           		
           %>
           		<tr>
           			<th width="400">강의명</th>
           			<td width="880"><input class="sarticle1in" type="text" name="name" value="<%=lrb.getL_name()%>"></td>
           		</tr>
           		<tr>
           			<th>수강학년</th>
           			<td>
           				<select name="level">
           					<option value="1">1학년</option>
           					<option value="2">2학년</option>
           					<option value="3">3학년</option>
           					<option value="4">4학년</option>
           				</select>
           			</td>
           		</tr>
           		<tr>
           			<th>수강학기</th>
           			<td><select name="sem">
           					<option value="1">1학기</option>
           					<option value="2">2학기</option>
           				</select></td>
           		</tr>
           		<tr>
           			<th>수강인원</th>
           			<td><input class="sarticle1in" type="text" name="max" value="<%=lrb.getL_max()%>"></td>
           		</tr>
           		<tr>
           			<th>수강요일</th>
           			<td><select name="day">
           					<option value="월">월</option>
           					<option value="화">화</option>
           					<option value="수">수</option>
           					<option value="목">목</option>
           					<option value="금">금</option>
           				</select></td>
           		</tr>
           		<tr>
           			<th>시작시간</th>
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
           			<th>이수구분</th>
           			<td>
           			<input type="text" name="com" value="<%=lrb.getL_com()%>">
           			</td>
           		</tr>
           		<script type="text/javascript">
    
       			 var openWin;
    
        		 function openChild1()
        	{
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("hmle0103W.jsp",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }
 
   </script>	
           		<tr>
           			<th>전공</th>
           			<td><input class="sarticle1in2" type="text" id="pInput" readonly value="<%=lrb.getM_name()%>">
           			<input type="hidden" id="put1" name="major_no" value="<%=lrb.getMajor_no()%>">
           			 <input type="button" value="검색" onclick="openChild1()">
           			 </td>
           		</tr>
           		<tr>
           		
           		
     <script type="text/javascript">
    
       			 var openWin2;
    
        		 function openChild2()
        	{
            // window.name = "부모창 이름"; 
            window.name = "parentForm2";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("hmle0104W.jsp",
                    "childForm2", "width=570, height=350, resizable = no, scrollbars = no");    
        }
 
   </script>	
           			<th>담당교수</th>
           			<td><input class="sarticle1in2" type="text" id="pInput2" readonly value="">
           			<input type="button" value="검색" onclick="openChild2()">
           			<input type="hidden" id="put2" name="professor_p_no" value="<%=lrb.getL_no()%>">
           			</td>
           		</tr>	
           </table>
           		<%} %>	
           <center><input type="submit" value="수정완료">
           <input type="button" value="취소" onclick="location.href='hmle01W.jsp'"></center>
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