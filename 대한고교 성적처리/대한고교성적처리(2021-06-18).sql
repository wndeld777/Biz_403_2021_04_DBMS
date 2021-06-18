CREATE DATABASE stscore;
use stscore;
CREATE TABLE tbl_student(
st_num	CHAR(8)		PRIMARY KEY,
st_name	VARCHAR(20)	NOT NULL	,
st_tel	VARCHAR(20)	NOT NULL	,
st_grade	INT	NOT NULL	,
st_dpcode	VARCHAR(20)	NOT NULL	

);
CREATE TABLE tbl_subject(
sb_code	CHAR(5)		PRIMARY KEY,
sb_name	VARCHAR(20)	NOT NULL	

);
CREATE TABLE tbl_score(
sc_seq	BIGINT	auto_increment	PRIMARY KEY,
sc_stnum	CHAR(5)	NOT NULL	,
sc_sbcode	CHAR(8)	NOT NULL	,
sc_sum	INT		,
sc_avg	INT		

);
drop table tbl_score;