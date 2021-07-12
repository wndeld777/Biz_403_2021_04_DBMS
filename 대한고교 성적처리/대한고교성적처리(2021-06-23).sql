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

/*
TABLE에 
	INSERT INTO ON DUPLICATE KEY UPDATE를
    실행하기 위해서는 PK 설정을 변경해야 한다
tbl_score은 두개의 칼럼을 기준으로
		 UPDATE, DELETE 를 수행하는 문제가 발생한다
가장 좋은 설계는 UPDATE, DELETE를 수행할때
		한개의 칼럼으로 구성된 PK를 기준으로
        수행하는 것이다
*/
CREATE TABLE tbl_score(
	-- sc_seq BIGINT auto_increment PRIMARY KEY,
    sc_stnum char(8) NOT NULL,
    sc_sbcode char(4) NOT NULL,
    sc_score INT NOT NULL,
    PRIMARY KEY(sc_stnum, sc_sbcode)
);
/*
PK는 그대로 살려두고 
두개의 칼럼을 묶어 UNIQUE로 설정 
두개 칼럼의 값이 동시에 같은 경우는 추가하지 말라는
 제약조건 설정
*/
CREATE TABLE tbl_score(
	sc_seq BIGINT auto_increment PRIMARY KEY,
    sc_stnum char(8) NOT NULL,
    sc_sbcode char(4) NOT NULL,
    sc_score INT NOT NULL,
    unique(sc_stnum, sc_sbcode)
);
DROP TABLE tbl_score;
SELECT * FROM tbl_score;
SELECT * FROM tbl_subject;
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
SELECT * FROM tbl_score;
INSERT INTO tbl_score(sc_stnum, sc_sbcode,sc_score)
VALUE('20210001','S001',88);
SELECT * FROM tbl_subject;
DELETE FROM tbl_subject WHERE sb_code = '과목코드';
INSERT INTO tbl_subject(sb_code,sb_name)
value('S001','국어');
INSERT INTO tbl_subject(sb_code,sb_name)
value('S002','영어');
INSERT INTO tbl_subject(sb_code,sb_name)
value('S003','수학');

-- 한학생의 세과목의 점수를 개별적으로 INSERT 하기
INSERT INTO tbl_score(sc_stnum, sc_sbcode,sc_score)
values('20210002','S001',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode,sc_score)
values('20210002','S002',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode,sc_score)
values('20210002','S003',90);

-- 한번의 INSERT 명령문으로 다수의 데이터를 INSERT
-- BULK INSERT
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score)
values('2021002','S001',90),
('2021002','S002',90),
('2021002','S003',90),
('2021002','S004',90),
('2021002','S005',90);

select * from tbl_score;