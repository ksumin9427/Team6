<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureBean"%>
<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//���߿� ���⼭ ���̵𼽼��� �޾ƿ� �����Դϴ�.
%>
<%
	int s_no=20180001;
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
            <div>
                <div class="lhead">
                    <div class="lhead_head2">
                    	<form action="hsle0202W.jsp" method="post" name="fr1">
                            
                               &nbsp;&nbsp;&nbsp; <strong>Ű���� �˻�</strong>&nbsp;
                               <select name="selectke">
                                   <option value="01">���Ǹ�˻�</option>
                                   <option value="02">�����̸��˻�</option>
                                   <option value="03">���ǹ�ȣ</option>
                                   <option value="04">���ǿ���</option>
                               </select>
                               <input type="text" name="lecturename">
                               <a class="button" onclick="click_ok()">�˻�</a>  
                           
                       </form>
                    	<form action="hsle0202W.jsp" method="post" name="fr">
	                        
	                            &nbsp;&nbsp;&nbsp; <strong>�������� �˻�</strong>&nbsp;
	                            <select id="luni01" name="major_no" >
		                                <option value="11">��ǻ�Ͱ��а�</option>
		                                <option value="12">����а�</option>
		                                <option value="13">ü���а�</option>
	                            <a class="button" onclick="click_ok()">�˻�</a>  
                        </form>
                          
                    </div>
                </div>
                <div class="lmain">
                    <table>
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
                        <tr>
                            <td><a class="button" href="#">��û</a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="lmain2">
                    <div class="lmain2_head">
                        <strong>����Ȯ������</strong>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        �ܿ����� : 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ��û���� : 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        �ִ�������� :
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
                              	lecture.LectureDBBean dbbean=lecture.LectureDBBean.getinstance();
                                                                                                                                                     ArrayList<lecture.LectureBean> view= dbbean.viewlecture(s_no);
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
								<td><%=lb.getL_time()%></td>
								<td><%=lb.getL_max()%></td>
								<td></td>
                            </tr>
                            <%}else{%>
                            	<tr class="lhover2">
                                <td><a class="button"  onclick="location.href='hsle0203W.jsp?l_no=<%=lb.getL_no()%>&major_no=<%=lb.getMajor_no()%>'">����</a></td>
                                <td><%=lb.getL_no()%></td>
								<td><%=lb.getL_name()%></td>
								<td><%=lb.getL_level()%></td>
								<td><%=lb.getL_unit()%></td>
								<td><%=lb.getProfessor_p_no()%></td>
								<td><%=lb.getL_day()%></td>
								<td><%=lb.getL_time()%></td>
								<td><%=lb.getL_max()%></td>
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

