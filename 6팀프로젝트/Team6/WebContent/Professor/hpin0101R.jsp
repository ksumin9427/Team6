<%@page import="pro.ProfessorBean"%>
<%@page import="pro.ProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_no=1001; //���߿� ���� ��ȣ�� request�� �޾Ƽ� �������� �Ѿ���ҿ����Դϴ�.
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" media="(min-width:670px)">
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
                <table class="thead">
                    <div><h1 class="tname">��������������</h1></div>
                    <tr>
                        <td colspan="2"><img src="../images//zzz.png" width="190px" height="210px"></td>
                    </tr>
                            <%
                            	ProfessorDBBean prodb = ProfessorDBBean.getinstance();
                                                                                    	ProfessorBean pro= prodb.listpro(p_no);
                                                                                    	if(pro != null){
                            %>
                    <tr>
                        <td width="35" height="19">�̸�</td>
                        <td><%=pro.getP_name() %></td>
                    </tr>
                </table>
                    <span>
                        <span>
                            <table class="tbody">
                                <tr>
                                    <td>
                                        ������ȣ
                                    </td>
                                    <td><%=pro.getP_no() %></td>
                                </tr>
                                <tr>
                                    <td>
                                        �̸�
                                    </td>
                                    <td><%=pro.getP_name() %></td>
                                </tr>
                                <tr>
                                    <td>
                                        ����
                                    </td>
                                    <td><%
                                    	String major =prodb.majorname(pro.getMajor_no());
                                    	out.println(major);
                                    %></td>
                                </tr>
                                <tr>
                                    <td>
                                        �������
                                    </td>
                                    <td><%=pro.getP_jumin() %></td>
                                </tr>
                                <tr>
                                    <td>
                                        ��ȭ��ȣ
                                    </td>
                                    <td><%=pro.getP_tel() %></td>
                                </tr>
                                <tr>
                                    <td>
                                        �̸���
                                    </td>
                                    <td><%=pro.getP_email() %></td>
                                </tr>
                                <tr>
                                    <td>
                                        ��簭��
                                    </td>
                                    <td> <%
                                       		String lec =prodb.lecturename(pro.getP_no());
                                    		out.println(lec);
                                        %></td>
                                </tr>
                                <tr>
                                    <td>
                                        ���ǽ�
                                    </td>
                                    <td><%=pro.getP_room() %></td>
                                </tr>
                                <%} %>
                                <tr>
                                	<td><a href="hpin0201W.jsp?p_no=<%=p_no %>" class="button">�����ϱ�</a></td>
                                </tr>
                            </table>
                        </span>
                    </span>
                </article>
            </section>
            

            
            
        <footer id="foot">
            <ul>
                <li>�λ� �λ����� �߾Ӵ�� 688</li>
                <li>TEL : 051-912-1000</li>
                <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
            </ul>
        </footer>


    </div>
</body>
</html>