drop table board_p;

CREATE TABLE board_p (
    bp_id       NUMBER(5) NOT NULL,
    bp_name     VARCHAR2(20),
    bp_email    VARCHAR2(20),
    bp_title    VARCHAR2(80),
    bp_content  VARCHAR2(3000),
    bp_pwd      VARCHAR2(12),
    bp_date     DATE,
    bp_hit      NUMBER(5) default 0,
    bp_ip       VARCHAR2(15),
    bp_ref      NUMBER(5),
    bp_step     NUMBER(5),
    bp_level    NUMBER(5),
    bp_fname    VARCHAR2(100),
    bp_fsize    NUMBER(10),
    bp_rfname    VARCHAR2(100)
);

ALTER TABLE board_p ADD CONSTRAINT board_pv3_pk PRIMARY KEY ( bp_id );

commit;