<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
	Date currentDate = new Date();
	String oTime = mSimpleDateFormat.format(currentDate);
	Date startDate = mSimpleDateFormat.parse("2021-03-01");
	Date endDate = mSimpleDateFormat.parse("2021-09-01");
	currentDate = mSimpleDateFormat.parse(oTime);
	
	int comp1 = currentDate.compareTo(startDate);
	int comp2 = currentDate.compareTo(endDate);
	
	int c_sem;
	
	if((comp1>0||comp1==0) && comp2<0){
		c_sem = 1;
	}else{
		c_sem = 2;
	}
	
	int c_year = Calendar.getInstance().get(Calendar.YEAR);
	
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	//int c_stuno = Integer.parseInt(request.getParameter("c_stuno"));
	int c_stuno = 1;
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="team6";
	String password="1234";
	String selectQuery="select c_year, c_lno, c_score, c_sem"
			+ " from score"
			+ " where c_stuno = " + c_stuno + " and c_sem = " + c_sem + " and c_year = " + c_year
			+ " order by c_year, c_sem";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>������б� �л������ý���</title>
    <style>
    	td{
    		text-align: center;
    	}
    </style>
</head>
<body>
    <div id="page">
    <header>
        <div class="top_bg">
        <div class="top-left-header">
            <ul>
                <li><a href="gc.html">HOME</a></li>
                <li><a href="#">LOGOUT</a></li>
            </ul>
        </div>
    </div>
        <div class="logo">
            <h1><img src="kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
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
                    <li><a href="#">������û</a></li>
                    <li><a href="#">������û Ȯ��/����</a></li>
                    <li><a href="#">�ð�ǥ��ȸ</a></li>
                </ul>
            </li>
            <li><a href="hssc0101R.jsp" >����</a>
                <ul class="sub-ul">
                    <li><a href="hssc0201R.jsp">���б� ������ȸ</a></li>
                    <li><a href="hssc0101R.jsp">��ü ������ȸ</a></li>
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
    
    
    
    <table width="800" border="1" style="margin-left: auto;margin-right: auto;margin-top: 100px;margin-bottom: 50px;">
		<tr bgcolor="#00ff90">
			<td><h4>�⵵</h4></td>
			<td><h4>�б�</h4></td>
			<td><h4>�м���ȣ</h4></td>
			<td><h4>����</h4></td>
		</tr>
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con=DriverManager.getConnection(url, user, password);
				stmt = con.createStatement();
				rs = stmt.executeQuery(selectQuery);
				
				int x=1, sub_num=0, score=0, score_sum=0;
				double sub_ave=0;
				
				while(rs.next()){
					if(x==1){
		%>
						<tr>
							<td><%= rs.getInt("c_year") %> </td>
							<td><%= rs.getInt("c_sem") %> </td>
							<td><%= rs.getInt("c_lno") %> </td>
							<td><%= rs.getString("c_score") %> </td>				
						</tr>
		<%
						x=0;
					}else{
		%>
						<tr bgcolor="#def7f1">
							<td><%= rs.getInt("c_year") %> </td>
							<td><%= rs.getInt("c_sem") %> </td>
							<td><%= rs.getInt("c_lno") %> </td>
							<td><%= rs.getString("c_score") %> </td>				
						</tr>
		<%
						x=1;
					}

					sub_num++;
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
					
					score_sum += score;
				}
				
				sub_ave = (double)score_sum/sub_num;
		%>
				<tr bgcolor="#00ff90">
					<td colspan="2"><h4>�� ��� ����</h4></td>
					<td><h4>��ü ��� ����</h4></td>
					<td><h4>�����</h4></td>
				</tr>
				<tr>
					<td colspan="2"><%= sub_num %> </td>
					<td><%= sub_ave %> </td>
					<td><%= sub_ave*25 %> </td>				
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
    
    
    
    
   
    <footer>
    	<h2>��������</h2>
        <ul>
            <li>�λ� �λ����� �߾Ӵ�� 688</li>
            <li>TEL : 051-912-1000</li>
            <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
        </ul>
    </footer>
</div>
</body>
</html>