alter table lecture modify l_com varchar(20);

update lecture
set
l_name = '�ڹ�',
l_com = '�кα���'
where l_no = 123;
update lecture
set
l_name = 'HTML',
l_com = '�кα���'
where l_no = 1234;
update lecture
set
l_name = 'JSP',
l_com = '����'
where l_no = 1235;
update lecture
set
l_name = '��������Ʈ',
l_com = '����'
where l_no = 1236;
update lecture
set
l_name = '�ȵ���̵�',
l_com = '����'
where l_no = 1237;
update lecture
set
l_name = '����Ŭ',
l_com = '�кα���'
where l_no = 1238;
update lecture
set
l_name = '�������̽�',
l_com = '����'
where l_no = 1239;
update lecture
set
l_name = '�ڹ� ��ũ��Ʈ',
l_com = '����'
where l_no = 1230;
update lecture
set
l_name = 'Git',
l_com = '����'
where l_no = 1231;
update lecture
set
l_name = 'MySQL',
l_com = '����'
where l_no = 1232;

commit;