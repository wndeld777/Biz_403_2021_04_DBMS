-- 하나마트
-- Database 생성
CREATE DATABASE nhDB;
USE nhDB;
SHOW TABLES;
-- Table 생성
DROP TABLE tbl_iolist;
CREATE TABLE tbl_iolist(
io_seq	BIGINT	AUTO_INCREMENT PRIMARY KEY,
io_date	VARCHAR(10)	NOT NULL,	
io_time	VARCHAR(10)	NOT NULL,	
io_pname	VARCHAR(50)	NOT NULL	,
io_dname	VARCHAR(50)	NOT NULL	,
io_dceo	VARCHAR(20)	NOT NULL	,
io_inout	VARCHAR(5)	NOT NULL,	
io_qty	int	NOT NULL	,
io_price	INT	NOT NULL,	
io_total	INT		
);
SELECT COUNT(*) FROM tbl_iolist;
-- 매입과 매출 합계
-- io_inout 칼럼 1이면 매입, 2면 매출
-- 수량*단가를 곱하여 합계계산 
SELECT (io_qty * io_price) 합계 FROM tbl_iolist;
DESC tbl_iolist;
-- 통계함수와 GROUP BY 를 사용하여 매입, 매출 합계 계산
SELECT sum(io_qty * io_price) 합계 FROM tbl_iolist
group by io_inout;
SELECT io_inout, sum(io_qty * io_price) 합계 FROM tbl_iolist
group by io_inout;
-- oracle decode(조건, true, false)
SELECT CASE WHEN io_inout = '1' THEN '매입'
		WHEN io_inout = '2' THEN '매출'
		END AS '구분',
        SUM(io_qty * io_price) AS '합계'
FROM tbl_iolist
group by io_inout;
-- if(조건, true, false) : MySQL 전용함수
SELECT IF(io_inout = '1','매입','매출') AS 구분,
SUM(io_qty * io_price) AS 합계
FROM tbl_iolist
GROUP BY io_inout;

-- 매입합계와 매출합계를 pivot 형식으로 조회
SELECT SUM(IF(io_inout = '1', io_qty * io_price,0)) AS 매입,
		SUM(IF(io_inout = '2', io_qty * io_price,0)) AS 매출
FROM tbl_iolist;
-- 일자별로 매입 매출 합계
SELECT io_date AS 일자, SUM(IF(io_inout = '1', io_qty * io_price,0)) AS 매입,
		SUM(IF(io_inout = '2', io_qty * io_price,0)) AS 매출
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;

-- 각 거래처별로 매입 매출 합계
-- pivot 방식으로 조회하기
SELECT io_dname AS 거래처명, SUM(IF(io_inout = '1', io_qty * io_price,0)) AS 매입,
		SUM(IF(io_inout = '2', io_qty * io_price,0)) AS 매출
FROM tbl_iolist
GROUP BY io_dname
ORDER BY io_dname;
-- 표준 SQL을 사용하여 거래처별로 매입 매출 합계
SELECT io_dname,
SUM(CASE WHEN io_inout = '1' THEN io_qty * io_price ELSE 0 END) AS 매입,
SUM(CASE WHEN io_inout = '2' THEN io_qty * io_price ELSE 0 END) AS 매출
FROM tbl_iolist
GROUP BY io_dname;
-- 2020년 4월의 매입 매출 리스트 조회
SELECT *
FROM tbl_iolist
WHERE io_date BETWEEN '2020-04-01' AND '2020-04-30';
-- 2020년 4월의 거래처별로 매입매출 합계
SELECT io_dname AS 거래처명, io_date AS 거래일자,
	SUM(IF(io_inout = '1', io_qty * io_price,0)) AS 매입,
	SUM(IF(io_inout = '2', io_qty * io_price,0)) AS 매출
FROM tbl_iolist
WHERE io_date BETWEEN '2020-04-01' AND '2020-04-30'
GROUP BY io_dname,io_date;

SELECT io_dname AS 거래처명, io_date AS 거래일자,
	SUM(CASE WHEN io_inout = '1' THEN io_qty * io_price ELSE 0 END) AS 매입,
	SUM(CASE WHEN io_inout = '2' THEN io_qty * io_price ELSE 0 END) AS 매출
FROM tbl_iolist
WHERE io_date BETWEEN '2020-04-01' AND '2020-04-30'
GROUP BY io_dname,io_date;
-- LEFT, MID, RIGHT
-- 문자열 칼럼의 데이터를 일부만 추출할때
-- LEFT(칼럼, 개수) : 왼쪽부터 문자열 추출
-- MID(칼럼, 위치, 개수) : 중간문자열 추출
-- Oracle SUBSTR(칼럼, 위치, 개수) 
-- RIGHT(칼럼, 개수) : 오른쪽부터 문자열 추출
SELECT * FROM tbl_iolist
WHERE LEFT(io_date,7) = '2020-04';

SELECT LEFT('대한민국',2);
SELECT LEFT('Republic of',2);
-- MySQL은 언어와 관계없이 글자수로 인식
SELECT LEFT('대한민국',2) AS 대한민국, LEFT('Korea',2) AS Korea;
SELECT MID('대한민국',2,2) AS 대한민국, MID('Korea',3,2) AS Korea;
SELECT RIGHT('대한민국',2), RIGHT('Korea',2);

CREATE TABLE tbl_dept(
dp_code	CHAR(5)		PRIMARY KEY,
dp_name	VARCHAR(50)	NOT NULL,	
dp_ceo	VARCHAR(50)	NOT NULL,	
dp_tel	VARCHAR(20)		,
dp_addr	VARCHAR(125)		
);
CREATE TABLE tbl_dept(
p_code	CHAR(6)		PRIMARY KEY,
p_name	VARCHAR(50)	NOT NULL,	
p_iprice	int	NOT NULL	,
p_oprice	int	NOT NULL	,
p_vat	VARCHAR(1)	DEFAULT 'Y'	
);
-- DB생성 테이블생성 INSERT SELECT UPDATE(2)