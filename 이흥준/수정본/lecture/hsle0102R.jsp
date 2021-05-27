<%@page import="lecture.LectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	request.setCharacterEncoding("EUC-KR");
   		String selectke =request.getParameter("selectke"); 
   	    String lecturename =request.getParameter("lecturename");
 %>
<html>
<head>
<meta charset="EUC-KR">
 <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript" src="lecture1.js" charset="utf-8"></script>
    <title>가산대학교 학생지원시스템</title>
</head>
<body id="page">
   <jsp:include page="../common/stu_menu.jsp"></jsp:include>
    <div >
    
    <section>
        <article>
            <div>
                <div class="lhead">
                    <div class="lhead_head">
                    	<form action="hsle0102R.jsp" method="post" name="fr">
                            <p>
                               &nbsp;&nbsp;&nbsp; <strong>키워드 검색</strong>&nbsp;
                               <select name="selectke">
                                   <option value="01">강의명검색</option>
                                   <option value="03">강의번호</option>
                                   <option value="04">강의요일</option>
                               </select>
                               <input type="text" name="lecturename">
                               <a class="button" onclick="click_ok()">조회</a>  
                           </p>
                       </form>  
                    </div>
                </div>
                <div class="lmain" style="width: 100%; height: 500px; overflow: auto">
                    <table style="width: 100%;"0" overflow:auto">
                        <tr class="lcolor">
                            
                            <td>강의번호</td>
                            <td>강의명</td>
                            <td>학년</td>
                            <td>학점</td>
                            <td>담당교수</td>
                            <td>강의요일</td>
                            <td>강의시간</td>
                            <td>수강가능인원</td>
                            <td>이수구분</td>
                        </tr>
            <%
            	// String selectke =request.getParameter("selectke"); 
                                		 // String lecturename =request.getParameter("lecturename");
                                	      lecture.LectureDBBean ldb = lecture.LectureDBBean.getinstance();
                                	      ArrayList<lecture.LectureBean> list = ldb.listKeywords(selectke, lecturename);
                                                for(int i=0;i<list.size();i++){
                                                	lecture.LectureBean llb = list.get(i);
                                               			if(i%2==1){
            %>
                        <tr class="lhover">
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
                       	}%>
                    </table>
                </div>
            </div>
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