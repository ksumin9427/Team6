<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
    
    <form action="/izone/users/stuWrtie.ga"  method="post" style="margin-bottom: 0;">
	<table class="table">
		<tr>
			<td style="text-align: left">
				<strong>학번을 입력하세요</strong>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_no"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="학번"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<strong>이름을 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_name"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="이름"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<strong>학년을 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_level"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="학년"></td>
		</tr>
		
		
		<tr>
			<td style="text-align: left">
				<strong>주민등록번호를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_jumin"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="주민등록번호"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<strong>전화번호를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td><input type="tel" name="s_tel"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="전화번호"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<strong>이메일주소를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td><input type="email" name="s_email"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="e-mail"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<strong>재적상태를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_status"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="재적상태"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<strong>전공번호를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td><input type="text" name="MAJOR_no"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="전공번호"></td>
		</tr>
		<tr>
			<td style="width: 100%; text-align: center; colspan: 3;"><input
				type="submit" value="등록" 
				style="background-color: #4B89DC; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
			</td>
		</tr>
	</table>
</form>
       
	<jsp:include page="../common/footer.jsp"></jsp:include>

</div>
</body>
</html>