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

CREATE TABLE notice (
    n_no       NUMBER(5) NOT NULL,
    n_name     VARCHAR2(20),
    n_title    VARCHAR2(80),
    n_content  VARCHAR2(3000),
    n_date     DATE,
    n_hit      NUMBER(5),
    n_div      VARCHAR2(5)
);

ALTER TABLE notice ADD CONSTRAINT board_pv1_pk PRIMARY KEY ( n_no );

CREATE TABLE professor (
    p_no      NUMBER(8) NOT NULL,
    p_pwd     VARCHAR2(12),
    p_name    VARCHAR2(20),
    p_brith   VARCHAR2(10),
    p_tel     VARCHAR2(13),
    p_email   VARCHAR2(50),
    p_room    VARCHAR2(20),
    major_no  NUMBER(10) NOT NULL
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



-- Oracle SQL Developer Data Modeler ?š”?•½ ë³´ê³ ?„œ: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
