<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript" src="lecture1.js" charset="utf-8"></script>
    <title>������б� �л������ý���</title>
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
                    </div>
                </div>
                <div class="lmain">
                    <table>
                        <tr class="lcolor">
                            
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