drop table board_s;

CREATE TABLE board_s (
    bs_id       NUMBER(5) NOT NULL,
    bs_name     VARCHAR2(20),
    bs_email    VARCHAR2(20),
    bs_title    VARCHAR2(80),
    bs_content  VARCHAR2(3000),
    bs_pwd      VARCHAR2(12),
    bs_date     DATE,
    bs_hit      NUMBER(5),
    bs_ip       VARCHAR2(15),
    bs_ref      NUMBER(5),
    bs_step     NUMBER(5),
    bs_level    NUMBER(5),
    bs_fname    VARCHAR2(100),
    bs_fsize    NUMBER(10),
    bs_rfname    VARCHAR2(100)
);

ALTER TABLE board_s ADD CONSTRAINT board_sv2_pk PRIMARY KEY ( bs_id );

commit;