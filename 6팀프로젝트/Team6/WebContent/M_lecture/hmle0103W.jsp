<%@page import="mlecture.M_lectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="hmle.js" charset="utf-8"></script>
</head>
<body>
	<script type="text/javascript">
        function setParentText(){
             opener.document.getElementById("pInput").value = document.getElementById("cInput").value
             opener.document.getElementById("put1").value = document.getElementById("hidden1").value
        }
   	</script>

	<form action="hmle0103W.jsp" method="post" name="fr">
		<center>
			<h1>������ȸ</h1>
			<p><input type="text" name="name"> <input type="submit" value="��ȸ"></p>
			<%
				
				if(request.getParameter("name")!=null){
				String name =request.getParameter("name");
				M_lectureDBbean mdb = M_lectureDBbean.getinstance();
				ArrayList<M_lectureBean> list = mdb.majorlist(name);
					for(int i=0; i<list.size();i++){
						M_lectureBean m = list.get(i);
						%>	<input type="text" id="cInput" value="<%=m.getM_name()%>">
							<input type="hidden" id="hidden1" value="<%=m.getMajor_no()%>">
							<input type="button" value="�����ϱ�" onclick="setParentText()">
							<br><br>
						<%
					}
				}
			%>
    						<input type="button" value="â�ݱ�" onclick="window.close()">
    						<br><br>
		</center>
	</form>
</body>
</html>