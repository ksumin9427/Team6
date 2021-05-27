alter table lecture modify l_com varchar(20);

update lecture
set
l_name = '자바',
l_com = '학부기초'
where l_no = 123;
update lecture
set
l_name = 'HTML',
l_com = '학부기초'
where l_no = 1234;
update lecture
set
l_name = 'JSP',
l_com = '전공'
where l_no = 1235;
update lecture
set
l_name = '스프링부트',
l_com = '전공'
where l_no = 1236;
update lecture
set
l_name = '안드로이드',
l_com = '전공'
where l_no = 1237;
update lecture
set
l_name = '오라클',
l_com = '학부기초'
where l_no = 1238;
update lecture
set
l_name = '인터페이스',
l_com = '전공'
where l_no = 1239;
update lecture
set
l_name = '자바 스크립트',
l_com = '전공'
where l_no = 1230;
update lecture
set
l_name = 'Git',
l_com = '전공'
where l_no = 1231;
update lecture
set
l_name = 'MySQL',
l_com = '전공'
where l_no = 1232;

commit;