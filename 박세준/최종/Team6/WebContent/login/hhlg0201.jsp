<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�/���ã��</title>
    <link rel="stylesheet" href="./login.css" media="(min-width:670px)">
    <link rel="stylesheet" href="./find_id_pw.css" media="(min-width:670px)">
</head>
<body>
    <div id="page">
        <header>
            <div id="logo">
                <img src="../images/logo.jpg" alt="Logo">
            </div>
 
            <div id="top_menu">
                <a href="../common/main.jsp">HOME</a> | 
                <a href="hhlg0102R.jsp">LOGIN</a> |
            </div>
        </header>
	<div class="main">
		<input id="tab1" type="radio" name="tabs" checked>
		<label for="tab1">���̵� ã��</label>
		<input id="tab2" type="radio" name="tabs">
		<label for="tab2">��й�ȣ ã��</label>
		
		<div class="conbox con1">
			<form action="hhlg0202R.jsp" method="post">
				<table width=500px; height=250px;>
					<tr>
						<td>ȸ������ :</td>
						<td> 
							<select name="code">
								<option value="1">�л�</option>
								<option value="2">����</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>��  �� :</td>
						<td> <input type="text" name="name"> </td>
					</tr>
					<tr>
						<td>E-mail :</td>
						<td> <input type="text" name="email"> </td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="Ȯ��">
							<input type="reset" value="�ٽ��ۼ�">
							<input type="button" value="�α����ϱ�" onclick="location.href='hhlg0101R.html'">
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<div class="conbox con2">
			<form action="hhlg0203R.jsp" method="post">
				<p>������ �Է��Ͻø� ��й�ȣ�� �ʱ�ȭ�˴ϴ�.(�ʱ��й�ȣ: �ֹι�ȣ ��7�ڸ�)</p>
				<table width=500px; height=250px;>
					<tr>
						<td>ȸ������ :</td>
						<td> 
							<select name="code">
								<option value="1">�л�</option>
								<option value="2">����</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>���̵� :</td>
						<td> <input type="text" name="id"> </td>
					</tr>
					<tr>
						<td>�ֹι�ȣ :</td>
						<td> <input type="password" name="jumin"> </td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="Ȯ��">
							<input type="reset" value="�ٽ��ۼ�">
							<input type="button" value="�α����ϱ�" onclick="location.href='hhlg0101R.html'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
</body>
</html>