<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int code=0;
	String id=null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
		code = ((Integer)(session.getAttribute("code"))).intValue();
	}
%>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="main.css">
<title>Insert title here</title>
</head>
<body>
	 <div id="page">
    <header>
        <div class="top_bg">
        <div class="top-left-header">
            <ul>
                   <li><a href="#">HOME</a></li>
                    <%
                    	if(id == null){
                    %>
	                    	<li><a href="../login/hhlg0101R.html">LOGIN</a></li>
                    <%
                    	}else{
                    %>
	                		<li><a href="../login/hhlg0103R.jsp">LOGOUT</a></li>
                    <%
                    	}
                   		if(code == 1){
                    %>
	                		<li><a href="../notice/hsno0101R.jsp">학생페이지로</a></li>
                    <%
                   		}else if(code == 2){
                    %>
	                		<li><a href="../notice/hpno0101R.jsp">교직원페이지로</a></li>
                    <%
                   		}else if(code == 3){
                    %>
        	                <li><a href="../notice/hmno0103R.jsp">관리자페이지로</a></li>
                    <%
                   		}
                    %>
            </ul>
        </div>
        </div>
            <div class="logo">
                <h1><img src="../images/kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                    가산대학교</h1>
            </div>
    </header>
    <article>
        <section>
            <div><img src="../images/main2.jpg" alt="" width="100%" ></div>
            <br>
            <div class="news">가산대학교 소식</div>
            <div class="news2"><strong> KASAN NEWS</strong></div><br>
            <table class="news3">
            <tr>
                <td class="news3-1">
                <a href="#"><img src="/images/코로나.PNG" width="300px"></a>
                </td>
                <td class="news3-2">
                <a href="#"><img src="/images/운동장.PNG" width="300px"></a>
                </td>
                 <td class="news3-3">
                <a href="#"><img src="/images/커피.PNG" width="300px" ></a>
                </td>
                 <td class="news3-4">
                <a href="#"><img src="/images/절규.PNG"width="300px" height="300px"></a>
                </td>
            </tr>
            <tr>
                <td>방역수칙 완벽(공부만해)</td>
                <td>운동장 잔디 정리(여름이야 운동좀해)</td>
                <td>선착순 10명 으메리카노(마시고 공부해)</td>
                <td>방학이 다가온다!!(학교가좋지?)</td>
            </tr>
            </table>
            <div class="news">가산대학교 소개</div>
            <div class="news2"><strong> INTRODUCE</strong></div><br>
            <img src="/images/외대.jpg" width="500" class="introduce">
            <div class="introduce2">
                미래의 가능성 가산대학교 미래캠퍼스는 지난 42년 간, 시대의 맨 앞에 서서 변화를 두려워하지 않고 도전하며 새로운 가능성을 열어 왔다. 가산대학교 미래캠퍼스는 교육중심 대학의 위상을 높이고 쾌적환 환경에서 학업에 매진할 수 있도록 첨단분야 특성화 교육환경을 강화하고 있다.

				새로운 패러다임
				연세대학교는 하버드, 프린스턴, 옥스퍼드 등 세계 명문대학이 도입하고 있는 Residential College(RC) 시스템을 국내 최초로 도입 발전시켜 소통과 협력, 섬김의 리더십과 지성과 덕성, 영성이 조화된 글로벌 인재를 양성하는 전인교육의 장으로써 새로운 명품 교육을 만들어가고 있다.
				
				연세의 꿈
				21세기 무한한 가능성을 현실로 만들기 위해 먼 앞날을 준비하고 철저히 계획하는 것, 연세대학교 미래캠퍼스가 지금까지 걸어왔고 걸어가고자 하는 길이다. 가산대학교 미래캠퍼스는 백년대계를 통해 교육과 연구, 사회봉사의 가치를 실현하며 새로운 미래를 만든다.
            </div>
			</section>
        </article>

       <footer>
        <ul>
            <li>부산 부산진구 중앙대로 688</li>
            <li>TEL : 051-912-1000</li>
            <li><i>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</i></li>
        </ul>
    </footer>
</div>
</body>
</html>