<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	//int c_stuno = Integer.parseInt(request.getParameter("c_stuno"));
	int c_stuno = 1;
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="team6";
	String password="1234";
	String selectQuery="select c_year, lecture_l_no, c_score, c_sem, l_com, l_name, l_unit"
			+ " from score, lecture"
			+ " where lecture_l_no = l_no and student_s_no = " + c_stuno
			+ " order by c_year, c_sem";
	String selectQuery2="select c_year, c_score, c_sem, l_unit"
			+ " from score, lecture"
			+ " where lecture_l_no = l_no and student_s_no = " + c_stuno
			+ " order by c_year, c_sem";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../style.css">
    <title>������б� �л������ý���</title>
    <style>
    	td{
    		text-align: center;
    	}
    </style>
</head>
<body>
    <div id="page">
    
	<jsp:include page="../common/stu_menu.jsp"></jsp:include>    
    
	<h1 align="center" style="margin-left: auto;margin-right: auto;margin-top: 100px;margin-bottom: 0px;">��ü ������ȸ</h1>
    <table width="800" border="1" style="margin-left: auto;margin-right: auto;margin-top: 50px;margin-bottom: 50px;">
		<tr bgcolor="#00ff90">
			<td><h4>�⵵</h4></td>
			<td><h4>�б�</h4></td>
			<td><h4>��û����</h4></td>
			<td><h4>�������</h4></td>
			<td><h4>�������</h4></td>
		</tr>
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con=DriverManager.getConnection(url, user, password);
				stmt = con.createStatement();
				rs = stmt.executeQuery(selectQuery2);

				boolean start=true;
				int year_temp=0, sem_temp=0, unit=0, unit_sum=0, score=0, score_sum=0, all_unit=0, all_score=0;
				double sub_ave=0, all_sub=0;							
				
				while(rs.next()){
					if(start){
						start = false;
						year_temp = rs.getInt("c_year");
						sem_temp = rs.getInt("c_sem");			
						unit = rs.getInt("l_unit");
						unit_sum += unit;
						all_unit += unit;
						char sco = rs.getString("c_score").charAt(0);
						
						switch (sco) {
						case 'A':
							score = 4;
							break;
						case 'B':
							score = 3;
							break;
						case 'C':
							score = 2;
							break;
						case 'D':
							score = 1;
							break;

						default:
							score = 0;
							break;
						}
						
						score_sum += unit*score;
						all_score += unit*score;
					}else{
						if(year_temp != rs.getInt("c_year")){
							sub_ave = (double)score_sum/unit_sum;
		%>
							<tr>
								<td><%= year_temp %> </td>
								<td><%= sem_temp %> </td>
								<td><%= unit_sum %> </td>
								<td><%= unit_sum %> </td>				
								<td><%= sub_ave %> </td>				
							</tr>
		<%
							unit=0;
							unit_sum=0;	
							score=0;
							score_sum=0;
	
							year_temp = rs.getInt("c_year");
							sem_temp = rs.getInt("c_sem");
							unit = rs.getInt("l_unit");
							unit_sum += unit;
							all_unit += unit;
							char sco = rs.getString("c_score").charAt(0);
							
							switch (sco) {
							case 'A':
								score = 4;
								break;
							case 'B':
								score = 3;
								break;
							case 'C':
								score = 2;
								break;
							case 'D':
								score = 1;
								break;

							default:
								score = 0;
								break;
							}
							
							score_sum += unit*score;
							all_score += unit*score;
						}
						else if(sem_temp != rs.getInt("c_sem")){
							sub_ave = (double)score_sum/unit_sum;
		%>
							<tr>
								<td><%= year_temp %> </td>
								<td><%= sem_temp %> </td>
								<td><%= unit_sum %> </td>
								<td><%= unit_sum %> </td>				
								<td><%= sub_ave %> </td>				
							</tr>
		<%	
							unit=0;
							unit_sum=0;	
							score=0;
							score_sum=0;
		
							year_temp = rs.getInt("c_year");
							sem_temp = rs.getInt("c_sem");
							unit = rs.getInt("l_unit");
							unit_sum += unit;
							all_unit += unit;
							char sco = rs.getString("c_score").charAt(0);
							
							switch (sco) {
							case 'A':
								score = 4;
								break;
							case 'B':
								score = 3;
								break;
							case 'C':
								score = 2;
								break;
							case 'D':
								score = 1;
								break;

							default:
								score = 0;
								break;
							}
							
							score_sum += unit*score;
							all_score += unit*score;
						}else{
							year_temp = rs.getInt("c_year");
							sem_temp = rs.getInt("c_sem");
							unit = rs.getInt("l_unit");
							unit_sum += unit;
							all_unit += unit;
							char sco = rs.getString("c_score").charAt(0);
							
							switch (sco) {
							case 'A':
								score = 4;
								break;
							case 'B':
								score = 3;
								break;
							case 'C':
								score = 2;
								break;
							case 'D':
								score = 1;
								break;

							default:
								score = 0;
								break;
							}
							
							score_sum += unit*score;
							all_score += unit*score;
						}
					}
				}
				all_sub = (double)all_score/all_unit;
		%>
				<tr>
					<td><%= year_temp %> </td>
					<td><%= sem_temp %> </td>
					<td><%= unit_sum %> </td>
					<td><%= unit_sum %> </td>				
					<td><%= sub_ave %> </td>				
				</tr>
		<%
				

		%>
				<tr bgcolor="#00ff90">
					<td colspan="2"><h4>���������</h4></td>
					<td colspan="2"><h4>��ü�������</h4></td>
					<td><h4>�����</h4></td>
				</tr>
				<tr>
					<td colspan="2"><%= all_unit %> </td>
					<td colspan="2"><%= all_sub %> </td>
					<td><%= all_sub*25 %> </td>				
				</tr>			
		<%				
			}catch(SQLException se){
				se.printStackTrace();
			}finally{
				try{
					if(rs != null)rs.close();
					if(stmt != null)stmt.close();
					if(con != null)con.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
		%>
	</table>
    <table width="800" border="1" style="margin-left: auto;margin-right: auto;margin-top: 50px;margin-bottom: 50px;">
		<tr bgcolor="#00ff90">
			<td width="100"><h4>�⵵</h4></td>
			<td width="50"><h4>�б�</h4></td>
			<td width="150"><h4>�̼�����</h4></td>
			<td width="150"><h4>�м���ȣ</h4></td>
			<td width="250"><h4>�������</h4></td>
			<td width="50"><h4>����</h4></td>
			<td width="50"><h4>����</h4></td>
		</tr>
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con=DriverManager.getConnection(url, user, password);
				stmt = con.createStatement();
				rs = stmt.executeQuery(selectQuery);
				
				int x=1;
				
				while(rs.next()){
					if(x==1){						
		%>
						<tr>
							<td><%= rs.getInt("c_year") %> </td>
							<td><%= rs.getInt("c_sem") %> </td>
							<td><%= rs.getString("l_com") %> </td>
							<td><%= rs.getInt("lecture_l_no") %> </td>
							<td><%= rs.getString("l_name") %> </td>
							<td><%= rs.getInt("l_unit") %> </td>
							<td><%= rs.getString("c_score") %> </td>				
						</tr>
		<%
						x=0;
					}
					else{						
		%>
						<tr bgcolor="#def7f1">
							<td><%= rs.getInt("c_year") %> </td>
							<td><%= rs.getInt("c_sem") %> </td>
							<td><%= rs.getString("l_com") %> </td>
							<td><%= rs.getInt("lecture_l_no") %> </td>
							<td><%= rs.getString("l_name") %> </td>
							<td><%= rs.getInt("l_unit") %> </td>
							<td><%= rs.getString("c_score") %> </td>				
						</tr>
		<%
						x=1;
					}
				}				
			}catch(SQLException se){
				se.printStackTrace();
			}finally{
				try{
					if(rs != null)rs.close();
					if(stmt != null)stmt.close();
					if(con != null)con.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
		%>
	</table>
       
    <jsp:include page="../common/footer.jsp"></jsp:include>

</div>
</body>
</html>