<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureBean"%>
<%@page import="lecture.LectureDBBean"%>
<%@page import="lecture.LectureBean"%>
<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	//�л� �ڵ� request �� ������
                   		 int s_no = 20180001;
                    	request.setCharacterEncoding("EUC-KR");
                		String selectke =request.getParameter("selectke"); 
                	    String lecturename =request.getParameter("lecturename");
    %>
<html>
<head>
<meta charset="EUC-KR">
 <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript" src="lecture1.js" charset="utf-8"></script>
    <title>������б� �л������ý���</title>
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
                <h1><img src="image/kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
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
                             <li><a href="hsle0101R.jsp">������ȸ</a></li>
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
                        <li><a href="test.jsp">�ð�ǥ��ȸ</a></li>
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
            <div>
                <div class="lhead">
                    <div class="lhead_head2">
                    <form action="hsle0202W.jsp" method="post" name="fr1">
                            <p>
                               &nbsp;&nbsp;&nbsp; <strong>Ű���� �˻�</strong>&nbsp;
                               <select name="selectke">
                                   <option value="01">���Ǹ�˻�</option>
                                   <option value="02">�����̸��˻�</option>
                                   <option value="03">���ǹ�ȣ</option>
                                   <option value="04">���ǿ���</option>
                               </select>
                               <input type="text" name="lecturename">
                               <a class="button" onclick="click_ok()">��ȸ</a>  
                           </p>
                       </form> 
                    	<form action="hsle0202W.jsp" method="post" name="fr">
	                        <p>
	                            &nbsp;&nbsp;&nbsp; <strong>�������� �˻�</strong>&nbsp;
	                            <select id="luni01" name="major_no" >
	                            		<option value="11">��ǻ�Ͱ��а�</option>
		                                <option value="12">����а�</option>
		                                <option value="13">ü���а�</option>
	                            </select>
	                            <a class="button" onclick="click_ok()">�˻�</a>  
	                        </p>
                        </form>
                         
                    </div>
                </div>
                <div class="lmain" style="width:100%; height:500px;	 overflow:auto">
                    <table style="width:100%;  border="0" overflow:auto">
                        <tr class="lcolor">
                            <td>��û</td>
                            <td>���ǹ�ȣ</td>
                            <td>���Ǹ�</td>
                            <td>�г�</td>
                            <td>����</td>
                            <td>��米��</td>
                            <td>���ǿ���</td>
                            <td>���ǽð�</td>
                            <td>���������ο�</td>
                            <td>�̼�����</td>
                        </tr>
                        <%
                        	//�����ͺ��̽��� �ִ� �����͵��� �ҷ����� ���� ���� ���� �ڵ��Դϴ�.
                                                                                                                        lecture.LectureDBBean lb2 = lecture.LectureDBBean.getinstance();
                                                                                                                        ArrayList<lecture.LectureBean> list;
                                                                                                                        if(selectke ==null){
                                                                                                                        int major_no = Integer.parseInt(request.getParameter("major_no"));
                                                                                                                        list= lb2.listlecture(major_no);
                                                                                                                        }else{
                                                                                                                        list = lb2.listKeywords(selectke, lecturename);
                                                                                                                        }
                                                                                                                        lecture.LectureBean llb=null;
                                                                                                                        	for(int i=0;i<list.size();i++){
                                                                                                                        	 llb = list.get(i);
                                                                                                                       			if(i%2==1){
                        %>
                        <tr class="lhover">
                            <td><a class="button" onclick="location.href='hsle0204W.jsp?l_no=<%=llb.getL_no()%>&major_no=<%=llb.getMajor_no()%>'">��û</a></td>
                            <td><%=llb.getL_no()%></td>
							<td><%=llb.getL_name()%></td>
							<td><%=llb.getL_level()%></td>
							<td><%=llb.getL_unit()%></td>
							<td><%=llb.getMajor_no()%></td>
							<td><%=llb.getL_day()%></td>
							<td><%=llb.getL_start()%></td>
							<td><%=llb.getL_max()%></td>
							<td><%=llb.getL_com()%></td>
                        </tr>
<%
	}else{
%>
							<tr class="lhover2">
                            <td><a class="button" onclick="location.href='hsle0204W.jsp?l_no=<%=llb.getL_no()%>&major_no=<%=llb.getMajor_no()%>'">��û</a></td>
                            <td><%=llb.getL_no()%></td>
							<td><%=llb.getL_name()%></td>
							<td><%=llb.getL_level()%></td>
							<td><%=llb.getL_unit()%></td>
							<td><%=llb.getMajor_no()%></td>
							<td><%=llb.getL_day()%></td>
							<td><%=llb.getL_start()%></td>
							<td><%=llb.getL_max()%></td>
							<td><%=llb.getL_com()%></td>
                        </tr>
<%
	}
                       	}
%>
                    </table>
                </div>
                <div class="lmain2">
                    <div class="lmain2_head">
                     <%
                     	lecture.LectureDBBean lb3 = lecture.LectureDBBean.getinstance();
                                                                                                         	lecture.LectureBean lt= lb3.semlecture(s_no);
                     %>   
                        <strong>����Ȯ������</strong>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        �ܿ����� : <%
                        	int limit =19;
                                                                                                                        if(lt.getL_sem()>limit){
                        %>
	                    	 		<script>
	                    	 			alert("��û ������ �ʰ� �Ǿ����ϴ�.");
	                    	 		</script>
	                    	 <%
	                    	 	}else{
	                    	 	                    	 	                    	 	                    	                         	limit = limit - lt.getL_sem();
	                    	 	                    	 	                    	 	                    	                         	out.println(limit);                        
	                    	 	                    	 	                    	 	                    	 	                     }
	                    	 %>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ��û���� : 
                     <%=lt.getL_sem()%>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        �ִ�������� : 19
                    </div>
                    
                    <div class="lmain2_main">
                        <table>
                            <tr class="lcolor">
                            	<td>����</td>
                                <td>���ǹ�ȣ</td>
                                <td>���Ǹ�</td>
                                <td>�г�</td>
                                <td>����</td>
                                <td>��米��</td>
                                <td>���ǿ���</td>
                                <td>���ǽð�</td>
                                <td>�ܿ���</td>
                                <td>���</td>
                            </tr>
                           	  <%
                           	  	lecture.LectureDBBean lb1=lecture.LectureDBBean.getinstance();
                           	                             	                             	                             	                               ArrayList<lecture.LectureBean> view= lb1.viewlecture(s_no);
                           	                             	                             	                             	  																for(int i=0;i<view.size();i++){
                           	                             	                             	                             	          																	lecture.LectureBean lb = view.get(i);
                           	                             	                             	                             	          																	if(i%2==1){
                           	  %>
	                            <tr class="lhover">
	                            	<td><a class="button"  onclick="location.href='hsle0203W.jsp?l_no=<%=lb.getL_no()%>&major_no=<%=lb.getMajor_no()%>'">����</a></td>
	                           		<td><%=lb.getL_no()%></td>
									<td><%=lb.getL_name()%></td>
									<td><%=lb.getL_level()%></td>
									<td><%=lb.getL_unit()%></td>
									<td><%=lb.getProfessor_p_no()%></td>
									<td><%=lb.getL_day()%></td>
									<td><%=lb.getL_start()%></td>
									<td><%=lb.getL_max()%></td>
									<td></td>
	                            </tr>
                            <%}else{%>
                            	<tr class="lhover2">
                                <td><a class="button" onclick="location.href='hsle0203W.jsp?l_no=<%=lb.getL_no()%>&major_no=<%=lb.getMajor_no()%>'">����</a></td>
                                <td><%=lb.getL_no()%></td>
								<td><%=lb.getL_name()%></td>
								<td><%=lb.getL_level()%></td>
								<td><%=lb.getL_unit()%></td>
								<td><%=lb.getProfessor_p_no()%></td>
								<td><%=lb.getL_day()%></td>
								<td><%=lb.getL_start()%></td>
								<td><%=lb.getL_max() %></td>
								<td></td>
                            </tr><%
                            	}	
                            }%>
                          
                        </table>
                    </div>
                </div>
            </div>
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



