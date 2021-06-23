CREATE DATABASE db_school;
USE db_school;
CREATE TABLE tbl_student(
st_num	CHAR(8)		PRIMARY KEY,
st_name	varchar(20)	NOT NULL,	
st_dept	varchar(20)		NOT NULL,
st_grade INT		NOT NULL,
st_tel	VARCHAR(15)		NOT NULL,
st_addr	varchar(125)		

);
DROP TABLE tbl_student;
INSERT INTO tbl_student(st_num,st_name,st_dept,st_grade,st_tel)
values('2021001','홍길동','학과','1','010-111-222');

commit;
CREATE TABLE tbl_score(
	sc_seq BIGINT auto_increment PRIMARY KEY,
    sc_stnum char(8) NOT NULL,
    sc_sbcode char(4) NOT NULL,
    sc_score INT NOT NULL
);
DROP TABLE tbl_score;
DESC tbl_score;
INSERT INTO tbl_score(sc_stnum,sc_sbcode,sc_score)
values('2021001','S001',90);
INSERT INTO tbl_score(sc_stnum,sc_sbcode,sc_score)
values('2021001','S002',90);
INSERT INTO tbl_score(sc_stnum,sc_sbcode,sc_score)
values('2021001','S003',90);

CREATE TABLE tbl_subject(
	sb_code	CHAR(4)		PRIMARY KEY,
	sb_name	VARCHAR(20)	NOT NULL	,
	sb_prof	VARCHAR(20)		
);
DROP TABLE tbl_subject;
INSERT INTO tbl_subject(sb_code,sb_name,sb_prof)
value('S001','국어');
INSERT INTO tbl_subject(sb_code,sb_name,sb_prof)
value('S002','영어');
INSERT INTO tbl_subject(sb_code,sb_name,sb_prof)
value('S003','수학');
