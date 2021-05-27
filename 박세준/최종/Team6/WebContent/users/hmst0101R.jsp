<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../style.css">
    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <title>가산대학교 관리자지원시스템</title>
</head>
<body>
    <div id="page">
    
	<jsp:include page="../common/m_menu.jsp"></jsp:include>

	<br/>
 	<br/>
 	<br/>
    <br/>
            <ul class="sul">
                <li class="meme"><a class="menuLink" href="/izone/users/stuList.ga">학생정보 조회</a></li>
                <li class="meme"><a class="menuLink" href="/izone/users/stuWriteView.ga">학생정보 등록</a></li>
			</ul>        
   
    		
	    		<table class="table table-hover">
							
							<tr>
								<td align="center">학번</td>
								<td align="center">비밀번호</td>
								<td align="center">이름</td>
								<td align="center">학년</td>
								<td align="center">이메일</td>
								<td align="center">전화번호</td>
								<td align="center">재적상태</td>
								<td align="center">전공번호</td>
								<td align="center">주민등록번호</td>
							</tr>
	
							<c:forEach var = "info" items="${infos}">
							<tr>
								<!-- 게시글리스트가 들어갈 행 -->
								<td align="center">
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.s_no}
									</a>
								</td>
								<td align="center">
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.s_pwd}
									</a>
								</td>
								<td align="center">
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.s_name}
									</a>
								</td>
								<td align="center">
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.s_level}
									</a>
								</td>
								<td align="center">
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.s_email}
									</a>
								</td>
								<td align="center">
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.s_tel}
									</a>
								</td>
								<td align="center"> 
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.s_status}
									</a>
								</td>
								<td align="center">
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.MAJOR_no}
									</a>
								</td>
								<td align="center">
									<a href="/izone/users/stuContentView.ga?s_no=${info.s_no}" style="green: ;">
									${info.s_jumin}
									</a>
								</td>												
							</tr>		
							</c:forEach>	 					
				</table>
			
	<jsp:include page="../common/footer.jsp"></jsp:include>

</div>
</body>
</html>