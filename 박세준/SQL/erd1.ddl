drop table board_p;
drop table board_s;
drop table notice;
drop table manager;
drop table timetable_p;
drop table timetable_s;
drop table score;
drop table lecture;
drop table professor;
drop table student;
drop table major;

CREATE TABLE board_p (
    bp_no       NUMBER(5) NOT NULL,
    bp_name     VARCHAR2(20),
    bp_title    VARCHAR2(80),
    bp_content  VARCHAR2(3000),
    bp_date     DATE,
    bp_hit      NUMBER(5),
    bp_ref      NUMBER(5),
    bp_step     NUMBER(5),
    bp_level    NUMBER(5)
);

ALTER TABLE board_p ADD CONSTRAINT board_sv1_pk PRIMARY KEY ( bp_no );

CREATE TABLE board_s (
    bs_no       NUMBER(5) NOT NULL,
    bs_name     VARCHAR2(20),
    bs_title    VARCHAR2(80),
    bs_content  VARCHAR2(3000),
    bs_date     DATE,
    bs_hit      NUMBER(5),
    bs_ref      NUMBER(5),
    bs_step     NUMBER(5),
    bs_level    NUMBER(5)
);

ALTER TABLE board_s ADD CONSTRAINT board_s_pk PRIMARY KEY ( bs_no );

CREATE TABLE lecture (
    l_no            NUMBER(10) NOT NULL,
    l_name          VARCHAR2(50),
    l_level         NUMBER(1),
    l_sem           NUMBER(1),
    l_unit          NUMBER(5),
    l_max           NUMBER(5),
    l_day           VARCHAR2(20),
    l_start         NUMBER(5),
    l_time          NUMBER(5),
    l_com           CHAR(5),
    major_no        NUMBER(10) NOT NULL,
    professor_p_no  NUMBER(8) NOT NULL
);

ALTER TABLE lecture ADD CONSTRAINT lecture_pk PRIMARY KEY ( l_no );

CREATE TABLE major (
    name  VARCHAR2(50),
    no    NUMBER(10) NOT NULL
);

ALTER TABLE major ADD CONSTRAINT major_pk PRIMARY KEY ( no );

CREATE TABLE manager (
    m_no    NUMBER(10) NOT NULL,
    m_name  VARCHAR2(20),
    m_pwd   VARCHAR2(12)
);

ALTER TABLE manager ADD CONSTRAINT manager_pk PRIMARY KEY ( m_no );

CREATE TABLE NOTICE
   (N_NO NUMBER(5,0), 
	N_DIV VARCHAR2(20 BYTE), 
	N_NAME VARCHAR2(20 BYTE), 
	N_EMAIL VARCHAR2(50 BYTE), 
	N_TITLE VARCHAR2(80 BYTE), 
	N_CONTENT VARCHAR2(3000 BYTE), 
	N_PWD VARCHAR2(12 BYTE), 
	N_DATE DATE, 
	N_HIT NUMBER(5,0) DEFAULT 0, 
	N_FNAME VARCHAR2(100 BYTE), 
	N_FSIZE NUMBER(10,0), 
	N_RFNAME VARCHAR2(100 BYTE), 
	 PRIMARY KEY ("N_NO")
);

ALTER TABLE notice ADD CONSTRAINT board_pv1_pk PRIMARY KEY ( n_no );

CREATE TABLE professor(
    p_no INT,
    p_pwd VARCHAR(15),
    p_name varchar(20),
    p_jumin char(13),
    p_tel varchar(20),
    p_email varchar(20),
    p_room varchar(20),
    MAJOR_no INT
);

ALTER TABLE professor ADD CONSTRAINT professor_pk PRIMARY KEY ( p_no );

CREATE TABLE score (
    student_s_no    NUMBER(8) NOT NULL,
    professor_p_no  NUMBER(8) NOT NULL,
    lecture_l_no    NUMBER(10) NOT NULL,
    c_score         CHAR(2),
    c_sem           NUMBER(1),
    c_year          NUMBER(4)
);

CREATE TABLE STUDENT (	
    "S_NO" NUMBER(8,0) NOT NULL ENABLE, 
	"S_PWD" VARCHAR2(12 BYTE), 
	"S_NAME" VARCHAR2(20 BYTE), 
	"S_LEVEL" NUMBER(1,0), 
	"S_JUMIN" VARCHAR2(13 BYTE), 
	"S_TEL" VARCHAR2(13 BYTE), 
	"S_EMAIL" VARCHAR2(50 BYTE), 
	"S_STATUS" NUMBER(1,0), 
	"MAJOR_NO" NUMBER(10,0) NOT NULL ENABLE 
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( s_no );

CREATE TABLE timetable_p (
    professor_p_no  NUMBER(8) NOT NULL,
    t_pday          VARCHAR2(20),
    t_p1            NUMBER(10),
    t_p2            NUMBER(10),
    t_p3            NUMBER(10),
    t_p4            NUMBER(10),
    t_p5            NUMBER(10),
    t_p6            NUMBER(10),
    t_p7            NUMBER(10),
    t_p8            NUMBER(10)
);

CREATE TABLE timetable_s (
    student_s_no  NUMBER(8) NOT NULL,
    t_sday        VARCHAR2(20),
    t_s1          NUMBER(10),
    t_s2          NUMBER(10),
    t_s3          NUMBER(10),
    t_s4          NUMBER(10),
    t_s5          NUMBER(10),
    t_s6          NUMBER(10),
    t_s7          NUMBER(10),
    t_s8          NUMBER(10)
);

ALTER TABLE lecture
    ADD CONSTRAINT lecture_major_fk FOREIGN KEY ( major_no )
        REFERENCES major ( no );

ALTER TABLE lecture
    ADD CONSTRAINT lecture_professor_fk FOREIGN KEY ( professor_p_no )
        REFERENCES professor ( p_no );

ALTER TABLE professor
    ADD CONSTRAINT professor_major_fk FOREIGN KEY ( major_no )
        REFERENCES major ( no );

ALTER TABLE score
    ADD CONSTRAINT score_lecture_fk FOREIGN KEY ( lecture_l_no )
        REFERENCES lecture ( l_no );

ALTER TABLE score
    ADD CONSTRAINT score_professor_fk FOREIGN KEY ( professor_p_no )
        REFERENCES professor ( p_no );

ALTER TABLE score
    ADD CONSTRAINT score_student_fk FOREIGN KEY ( student_s_no )
        REFERENCES student ( s_no );

ALTER TABLE student
    ADD CONSTRAINT student_major_fk FOREIGN KEY ( major_no )
        REFERENCES major ( no );

ALTER TABLE timetable_p
    ADD CONSTRAINT timetable_p_professor_fk FOREIGN KEY ( professor_p_no )
        REFERENCES professor ( p_no );

ALTER TABLE timetable_s
    ADD CONSTRAINT timetable_s_student_fk FOREIGN KEY ( student_s_no )
        REFERENCES student ( s_no );

insert into major values('��ǻ�Ͱ��а�',11);
insert into major values('�����а�',12);
insert into major values('ü���а�',13);


Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20180001,'1000001','�ڼ���',4,'9600011000001','010-1111-1111','a@naver.com',1,11);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20190001,'1000002','�ڰ���',3,'9700011000002','010-1111-1112','b@naver.com',1,11);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20200001,'1000003','������',2,'9800011000003','010-1111-1113','c@naver.com',1,11);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210001,'1000004','������',1,'9900011000004','010-1111-1114','d@naver.com',1,11);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210002,'1000005','ȫ�浿',1,'9900011000005','010-1111-1115','e@naver.com',1,12);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210003,'1000006','ȫ���',1,'9900011000006','010-1111-1116','f@naver.com',1,12);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210004,'1000007','��ö��',1,'9900011000007','010-1111-1117','g@naver.com',1,12);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210005,'1000008','�迵��',1,'9900011000008','010-1111-1118','h@naver.com',1,12);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210006,'1000009','��μ�',1,'9900011000009','010-1111-1119','i@naver.com',1,13);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210007,'1000010','����ȯ',1,'9900011000010','010-1111-1120','j@naver.com',1,13);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210008,'1000011','��¿�',1,'9900011000011','010-1111-1121','k@naver.com',1,13);
Insert into STUDENT (S_NO,S_PWD,S_NAME,S_LEVEL,S_JUMIN,S_TEL,S_EMAIL,S_STATUS,MAJOR_NO) values (20210009,'1000012','�ڼ���',1,'9900011000012','010-1111-1122','l@naver.com',1,13);


insert into PROFESSOR values (1001,'1901628','��öȫ','6505041901628','010-5477-4944','sasasa@naver.com','1',11);
insert into PROFESSOR values (1002,'1154012','�����','6706071154012','010-9747-4954','gogi@naver.com','2',11);
insert into PROFESSOR values (1003,'1451447','���','7412111451447','010-9999-3677','beaeba@google..com','3',12);
insert into PROFESSOR values (1004,'2211057','����','6911112211057','010-1121-4774','beneco@naver.com','4',12);
insert into PROFESSOR values (1005,'1164795','Ȳ����','6601071164795','010-2247-9954','sojuboy@naver.com','5',13);
insert into PROFESSOR values (1006,'1159985','�Ӽ���','7703011159985','010-4562-1237','rakrock@naver.com','6',13);

insert into PROFESSOR values (1007,'2015474','������','6706072015474','010-3214-9874','guraya@naver.com','7',11);
insert into PROFESSOR values (1008,'1104124','�̻�','7412111104124','010-1101-9575','choite@google..com','8',12);
insert into PROFESSOR values (1009,'1452368','���ֽ�','6601071452368','010-1459-6664','borabo@naver.com','9',13);


--�����а�--
    --1�г�1�б�--
    insert into lecture VALUES(1201,'�������Ȱ��',1,1,1,10,'��',9,50,1,12,1003);
    insert into lecture VALUES(1202,'�����б�����',1,1,1,10,'ȭ',10,50,1,12,1003);
    insert into lecture VALUES(1203,'������ǻ�����α׷���',1,1,1,10,'��',11,50,1,12,1003);
    insert into lecture VALUES(1204,'��������ǥ��',1,1,1,10,'��',12,50,1,12,1004);
    insert into lecture VALUES(1205,'���нǿ뿵��(II)',1,1,1,10,'��',13,50,1,12,1004);
    insert into lecture VALUES(1206,'��ǻ�û����ΰ�����',1,1,1,10,'��',14,50,1,12,1004);
    insert into lecture VALUES(1207,'�Ϲݹ�����(I)',1,1,1,10,'ȭ',15,50,1,12,1008);
    insert into lecture VALUES(1208,'�Ϲݹ����н���(I)',1,1,1,10,'��',16,50,1,12,1008);
    insert into lecture VALUES(1209,'�Ϲ�ȭ�н���(I)',1,1,1,10,'��',17,50,1,12,1008);
    
    --1�г�2�б�--
    insert into lecture VALUES(1211,'�������Ȱ��2',1,2,1,10,'��',9,50,1,12,1003);
    insert into lecture VALUES(1212,'�����б�����2',1,2,1,10,'ȭ',10,50,1,12,1003);
    insert into lecture VALUES(1213,'������ǻ�����α׷���2',1,2,1,10,'��',11,50,1,12,1008);
    insert into lecture VALUES(1214,'��������ǥ��2',1,2,1,10,'��',12,50,1,12,1004);
    insert into lecture VALUES(1215,'���нǿ뿵��(IV)',1,2,1,10,'��',13,50,1,12,1004);
    insert into lecture VALUES(1216,'��ǻ�û����ΰ�����2',1,2,1,10,'��',14,50,1,12,1008);
    
    --2�г�1�б�--
    insert into lecture VALUES(1221,'��Ὺ��',2,1,1,10,'��',9,50,1,12,1003);
    insert into lecture VALUES(1222,'�������ȭ��',2,1,1,10,'ȭ',10,50,1,12,1003);
    insert into lecture VALUES(1223,'���ڹ���ȭ��',2,1,1,10,'��',11,50,1,12,1008);
    insert into lecture VALUES(1224,'�����а���(I)',2,1,1,10,'��',12,50,1,12,1004);
    insert into lecture VALUES(1225,'������',2,1,1,10,'��',13,50,1,12,1004);
    insert into lecture VALUES(1226,'������(I)',2,1,1,10,'��',14,50,1,12,1008);
    
    --2�г�2�б�--
    insert into lecture VALUES(1231,'��Ὺ��2',2,2,1,10,'��',9,50,1,12,1003);
    insert into lecture VALUES(1232,'�������ȭ��2',2,2,1,10,'ȭ',10,50,1,12,1003);
    insert into lecture VALUES(1233,'���ڹ���ȭ��2',2,2,1,10,'��',11,50,1,12,1008);
    insert into lecture VALUES(1234,'�����а���(II)',2,2,1,10,'��',12,50,1,12,1004);
    insert into lecture VALUES(1235,'������2',2,2,1,10,'��',13,50,1,12,1004);
    insert into lecture VALUES(1236,'������(II)',2,2,1,10,'��',14,50,1,12,1008);
    
    --3�г�1�б�--
    insert into lecture VALUES(1241,'��������',3,1,1,10,'��',9,50,1,12,1003);
    insert into lecture VALUES(1242,'�������ȭ��',3,1,1,10,'ȭ',10,50,1,12,1003);
    insert into lecture VALUES(1243,'�̵�����׼ӵ���',3,1,1,10,'��',11,50,1,12,1008);
    insert into lecture VALUES(1244,'�������ᰳ��(I)',3,1,1,10,'��',12,50,1,12,1004);
    insert into lecture VALUES(1245,'ö���ż���',3,1,1,10,'��',13,50,1,12,1004);
    insert into lecture VALUES(1246,'�ݵ�ü���ڰ���',3,1,1,10,'��',14,50,1,12,1008);
    
    --3�г�2�б�--
    insert into lecture VALUES(1251,'�������ͺм�',3,2,1,10,'��',9,50,1,12,1003);
    insert into lecture VALUES(1252,'X-��ȸ���װ�����',3,2,1,10,'ȭ',10,50,1,12,1003);
    insert into lecture VALUES(1253,'��������ڱ�������',3,2,1,10,'��',11,50,1,12,1008);
    insert into lecture VALUES(1254,'�����а���(II)',3,2,1,10,'��',12,50,1,12,1004);
    insert into lecture VALUES(1255,'���������׻�ȭ',3,2,1,10,'��',13,50,1,12,1004);
    insert into lecture VALUES(1256,'�������ᰳ��(II)',3,2,1,10,'��',14,50,1,12,1008);
    
    --4�г�1�б�--
    insert into lecture VALUES(1261,'�������',4,1,1,10,'��',9,50,1,12,1003);
    insert into lecture VALUES(1262,'��ö����',4,1,1,10,'ȭ',10,50,1,12,1003);
    insert into lecture VALUES(1263,'�Ҽ�����',4,1,1,10,'��',11,50,1,12,1008);
    insert into lecture VALUES(1264,'����ͽ�����(I)',4,1,1,10,'��',12,50,1,12,1004);
    insert into lecture VALUES(1265,'ö���ż���',4,1,1,10,'��',13,50,1,12,1004);
    insert into lecture VALUES(1266,'��ü����',4,1,1,10,'��',14,50,1,12,1008);
    
    --4�г�2�б�--
    insert into lecture VALUES(1271,'����������̺긮���������',4,2,1,10,'��',9,50,1,12,1003);
    insert into lecture VALUES(1272,'â����������ռ���',4,2,1,10,'ȭ',10,50,1,12,1003);
    insert into lecture VALUES(1273,'�����н��� (II)',4,2,1,10,'��',11,50,1,12,1008);
    insert into lecture VALUES(1274,'����ͽ�����(II)',4,2,1,10,'��',12,50,1,12,1004);
    insert into lecture VALUES(1275,'ö���ż���2',4,2,1,10,'��',13,50,1,12,1004);
    insert into lecture VALUES(1276,'��ö����',4,2,1,10,'��',14,50,1,12,1008);
    
    --ü���а�--
    --1�г�1�б�--
    insert into lecture VALUES(1301,'������ �ɸ���',1,1,1,10,'��',9,50,1,13,1005);
    insert into lecture VALUES(1302,'������ ����',1,1,1,10,'ȭ',10,50,1,13,1005);
    insert into lecture VALUES(1303,'����I',1,1,1,10,'��',11,50,1,13,1005);
    insert into lecture VALUES(1304,'����ƮƮ���̴�',1,1,1,10,'��',12,50,1,13,1005);
    insert into lecture VALUES(1305,'ä��I',1,1,1,10,'��',13,50,1,13,1009);
    insert into lecture VALUES(1306,'��������ȸ��',1,1,1,10,'��',14,50,1,13,1006);
    insert into lecture VALUES(1307,'������ ������',1,1,1,10,'ȭ',15,50,1,13,1006);
    insert into lecture VALUES(1308,'������ũ�����̼�',1,1,1,10,'��',16,50,1,13,1006);
    insert into lecture VALUES(1309,'��������å �� ��',1,1,1,10,'��',17,50,1,13,1009);
    --1�г�2�б�--
    insert into lecture VALUES(1311,'����1',1,2,1,10,'��',9,50,1,13,1005);
    insert into lecture VALUES(1312,'GX���α׷�1',1,2,1,10,'ȭ',10,50,1,13,1005);
    insert into lecture VALUES(1313,'��Ȱü�� �̷а� ����',1,2,1,10,'��',11,50,1,13,1009);
    insert into lecture VALUES(1314,'��� ���Űǰ�',1,2,1,10,'��',12,50,1,13,1005);
    insert into lecture VALUES(1315,'ä��II',1,2,1,10,'��',13,50,1,13,1009);
    insert into lecture VALUES(1316,'����غ���',1,2,1,10,'��',14,50,1,13,1006);
    --2�г�1�б�--
    insert into lecture VALUES(1321,'AT�̷� �� ��ü',2,1,1,10,'��',9,50,1,13,1005);
    insert into lecture VALUES(1322,'Ʈ���̴� �����',2,1,1,10,'ȭ',10,50,1,13,1009);
    insert into lecture VALUES(1323,'����II',2,1,1,10,'��',11,50,1,13,1006);
    insert into lecture VALUES(1324,'�����',2,1,1,10,'��',12,50,1,13,1006);
    insert into lecture VALUES(1325,'���⽺����I',2,1,1,10,'��',13,50,1,13,1005);
    --2�г�2�б�--
    insert into lecture VALUES(1331,'����2',2,2,1,10,'��',9,50,1,13,1005);
    insert into lecture VALUES(1332,'GX���α׷�2',2,2,1,10,'ȭ',10,50,1,13,1009);
    insert into lecture VALUES(1333,'��������',2,2,1,10,'��',11,50,1,13,1005);
    insert into lecture VALUES(1334,'����κ�',2,2,1,10,'��',12,50,1,13,1006);
    insert into lecture VALUES(1335,'������ũ�����̼�',2,2,1,10,'��',13,50,1,13,1009);
    insert into lecture VALUES(1336,'���⽺����II',2,2,1,10,'��',14,50,1,13,1006);
    --3�г�1�б�--
    insert into lecture VALUES(1341,'��������',3,1,1,10,'��',9,50,1,13,1005);
    insert into lecture VALUES(1342,'��������',3,1,1,10,'ȭ',10,50,1,13,1005);
    insert into lecture VALUES(1343,'����Iv',3,1,1,10,'��',11,50,1,13,1009);
    insert into lecture VALUES(1344,'�����II',3,1,1,10,'��',12,50,1,13,1005);
    insert into lecture VALUES(1345,'���⽺����II',3,1,1,10,'��',13,50,1,13,1006);
    --3�г�2�б�--
    insert into lecture VALUES(1351,'�����ΰ� ����1',3,2,1,10,'��',9,50,1,13,1005);
    insert into lecture VALUES(1352,'����ü��',3,2,1,10,'ȭ',10,50,1,13,1006);
    insert into lecture VALUES(1353,'�౸',3,2,1,10,'��',11,50,1,13,1009);
    insert into lecture VALUES(1354,'��',3,2,1,10,'��',12,50,1,13,1006);
    insert into lecture VALUES(1355,'����ƮƮ���̴�2',3,2,1,10,'��',13,50,1,13,1009);
    insert into lecture VALUES(1356,'���⽺����IV',3,2,1,10,'��',14,50,1,13,1006);
    --4�г�1�б�--
    insert into lecture VALUES(1361,'��������II',4,1,1,10,'��',9,50,1,13,1009);
    insert into lecture VALUES(1362,'��������II',4,1,1,10,'ȭ',10,50,1,13,1005);
    insert into lecture VALUES(1363,'����',4,1,1,10,'��',11,50,1,13,1006);
    insert into lecture VALUES(1364,'�����IV',4,1,1,10,'��',12,50,1,13,1009);
    insert into lecture VALUES(1365,'���⽺����IV',4,1,1,10,'��',13,50,1,13,1005);
    --4�г�2�б�--
    insert into lecture VALUES(1371,'�����ΰ� ����2',4,2,1,10,'��',9,50,1,13,1009);
    insert into lecture VALUES(1372,'����ü��II',4,2,1,10,'ȭ',10,50,1,13,1005);
    insert into lecture VALUES(1373,'�౸II',4,2,1,10,'��',11,50,1,13,1006);
    insert into lecture VALUES(1374,'��II',4,2,1,10,'��',12,50,1,13,1006);
    insert into lecture VALUES(1375,'����II',4,2,1,10,'��',13,50,1,13,1005);
    insert into lecture VALUES(1376,'�����ǽ�',4,2,1,10,'��',14,50,1,13,1009);


--������ȣ11--
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1136,'JAVA',1,1,1,20,'��',14,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1101,'���ʰ��м���',1,1,1,20,'��',9,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1103,'C���α׷���',1,1,1,20,'��',11,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1104,'C���α׷���2',1,2,1,20,'��',11,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1102,'���ʰ��м���2',1,2,1,20,'��',9,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1105,'�ڷᱸ��',1,1,1,20,'ȭ',11,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1106,'�ڷᱸ��2',1,2,1,20,'ȭ',11,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1107,'�ü��',1,1,1,10,'��',14,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1108,'�ü��2',1,2,1,10,'��',14,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1109,'�˰��򼳰�ͺм�',1,1,1,10,'��',11,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1110,'�˰��򼳰�ͺм�2',1,2,1,10,'��',11,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1111,'���α׷��־�� ',1,1,1,10,'��',13,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1112,'���α׷��־��2',1,2,1,10,'��',13,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1113,'����ó�� ',2,1,1,10,'ȭ',10,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1114,'����ó��2 ',2,2,1,10,'ȭ',10,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1115,'�����ΰ�����',2,1,1,10,'��',15,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1116,'�����ΰ�����2',2,2,1,10,'��',15,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1117,'���������α׷���',2,1,1,10,'��',15,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1118,'���������α׷���2',2,2,1,10,'��',15,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1119,'ĸ��������� ',2,1,1,10,'��',16,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1120,'ĸ���������2',2,2,1,10,'��',16,50,'1    ',11,1002);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1121,'�Ӻ����',3,1,1,10,'��',10,50,'1    ',11,1007);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1122,'�Ӻ����2',3,2,1,10,'��',10,50,'1    ',11,1007);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1123,'��ǻ�ͳ�',3,1,1,10,'ȭ',11,50,'1    ',11,1007);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1124,'��ǻ�ͳ�2',3,2,1,10,'ȭ',11,50,'1    ',11,1007);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1125,'����Ʈ����',3,1,1,10,'��',13,50,'1    ',11,1007);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1126,'����Ʈ����2',3,2,1,10,'��',13,50,'1    ',11,1007);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1127,'��ǻ�ͱ׷��Ƚ�',3,1,1,10,'��',15,50,'1    ',11,1007);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1128,'��ǻ�ͱ׷��Ƚ�2',3,2,1,10,'��',15,50,'1    ',11,1007);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1129,'�ǽ�',4,1,1,10,'��',16,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1130,'�ǽ�2',4,2,1,10,'��',16,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1131,'��޼���Ʈ����',4,1,1,10,'ȭ',17,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1132,'��޼���Ʈ����2',4,2,1,10,'ȭ',17,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1133,'��ġ��ǻ��',4,1,1,10,'��',15,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1134,'��ġ��ǻ��2',4,2,1,10,'��',15,50,'1    ',11,1001);
Insert into LECTURE (L_NO,L_NAME,L_LEVEL,L_SEM,L_UNIT,L_MAX,L_DAY,L_START,L_TIME,L_COM,MAJOR_NO,PROFESSOR_P_NO) values (1135,'��ǻ�ͱ���',1,1,1,20,'��',13,50,'1    ',11,1002);


CREATE TABLE LECTURE_A 
(S_NO NUMBER(8,0), 
L_NO NUMBER(10,0));

insert into lecture_a values(20210001,1201);
insert into lecture_a values(20210002,1201);
insert into lecture_a values(20210003,1201);
insert into lecture_a values(20210004,1201);

insert into lecture_a values(20210001,1203);
insert into lecture_a values(20210002,1203);
insert into lecture_a values(20210003,1203);
insert into lecture_a values(20210004,1203);

insert into lecture_a values(20210001,1202);
insert into lecture_a values(20210002,1202);
insert into lecture_a values(20210003,1202);
insert into lecture_a values(20210004,1202);


CREATE TABLE EXAM 
(S_NO NUMBER(8,0), 
S_NAME VARCHAR2(20 BYTE), 
L_NO NUMBER(8,0), 
MIDEX NUMBER(5,0), 
FINALEX NUMBER(5,0), 
TASK NUMBER(5,0), 
TOTAL NUMBER(5,0), 
SCORE VARCHAR2(5 BYTE));