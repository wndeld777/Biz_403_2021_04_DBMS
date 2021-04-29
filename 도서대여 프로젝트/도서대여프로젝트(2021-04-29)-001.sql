-- 여기는 bookuser접속

CREATE TABLE tbl_books(
    bk_isbn CHAR(13) PRIMARY KEY,
    bk_title nVARCHAR2(125) NOT NULL,
    bk_ccode CHAR(5) NOT NULL,
    bk_acode CHAR(5) NOT NULL,
    bk_date VARCHAR2(10),
    bk_price NUMBER,
    bk_pages NUMBER
);
DROP TABLE tbl_books;

INSERT INTO tbl_books(bk_isbn,bk_title,bk_ccode,bk_acode,bk_date,bk_price,bk_pages)
VALUES('9791162540770',	'데스 바이 아마존','12345','12345','2019-04-15',15000,272);

SELECT
    bk_isbn ISBN,
    bk_title 도서명,
    bk_ccode 출판사코드,
    bk_acode 저자코드,
    bk_date 출판일,
    bk_price 가격,
    bk_pages 페이지
FROM tbl_books;

CREATE TABLE tbl_company(
    cp_code CHAR(5) PRIMARY KEY,
    cp_title nVARCHAR2(125) NOT NULL,
    cp_ceo nVARCHAR2(20),
    cp_tel VARCHAR2(20),
    cp_addr nVARCHAR2(125),
    cp_genre nVARCHAR2(30)
);
DROP TABLE tbl_company;

INSERT INTO tbl_company(cp_code,cp_title,cp_ceo,cp_tel,cp_addr,cp_genre)
VALUES('12345','데스 바이 아마존','홍길동','010-1234-5678','광주광역시','역사');

SELECT
    cp_code 출판사코드,
    cp_title 출판사명,
    cp_ceo 대표,
    cp_tel 전화번호,
    cp_addr 주소,
    cp_genre 주요장르
FROM tbl_company;

CREATE TABLE tbl_author(
    au_code CHAR(5) PRIMARY KEY,
    au_name nVARCHAR2(50) NOT NULL,
    au_tel VARCHAR2(20),
    au_addr nVARCHAR2(125),
    au_genre nVARCHAR2(30)
);
DROP TABLE tbl_author;

INSERT INTO tbl_author(au_code, au_name, au_tel, au_addr, au_genre)
VALUES('12345','시로타 마코토','010-1234-5678','광주광역시','역사');

SELECT
    au_code 저자코드,
    au_name 저자명,
    au_tel 전화번호,
    au_addr 주소,
    au_genre 주요장르
FROM tbl_author;

-- 3개의 Table을 JOIN하여 view 만들기
CREATE VIEW view_도서정보 AS
(
    SELECT B.bk_isbn AS ISBN,
        B.bk_title AS 도서명,
        C.cp_title AS 출판사명,
        C.cp_ceo AS 출판사대표,
        A.au_name AS 저자명,
        A.au_tel AS 저자연락처,
        B.bk_date AS 출판일,
        B.bk_price AS 가격
    FROM tbl_books B
        LEFT JOIN tbl_company C
            ON B.bk_ccode = C.cp_code
        LEFT JOIN tbl_author A
            ON B.bk_acode = A.au_code
 );       
/*
 고정문자열 type칼럼 주의사항
 CHAR() Type의 문자열 칼럼은 실제 저장되는 데이터 type에 따라
 많은 주의를 해야 한다
 
 만약 데이터가 숫자값으로만 되어 있는 경우
 00001, 00002 와 깉이 입력할 경우 0을 삭제해 버리는 경우가 있다
 
 (엑셀에서 import 하는)실제 데이터가 날짜타입일 경우
 SQL의 날짜형 데이터로 변환한 후 다시 문자열로 변환하여 저장
 
 칼럼을 PK로 설정하지 않는 경우는 가급적 CHAR로 설정하지 말고
 VARCHAR2로 설정하는 것이 좋다.
 
 고정문자열 칼럼으로 조회를 할때 아래와 같은 조건을 부여하면
 데이터가 조회 되지 않는 현상이 발생할수 있다
 WHERE 코드 = '00001'
*/

SELECT * FROM view_도서정보;

-- 조건을 부여하여 찾기
-- PK칼럼으로 데이터 조회
SELECT * FROM view_도서정보
WHERE ISBN = '9791162540695';

-- 도서명이 엘리트 문자열로 시작되는 모든(List) 데이터
SELECT * FROM view_도서정보
WHERE 도서명 LIKE '엘리트%';

-- 출판사명에 넥 문자열이 포함된 모든 데이터
SELECT * FROM view_도서정보
WHERE 출판사명 LIKE '%넥%';

-- 출판일이 2018년인 모든 데이터
SELECT * FROM view_도서정보
WHERE 출판일 >= '2018-01-01' AND 출판일 <= '2018-12-31';

SELECT * FROM view_도서정보
WHERE 출판일 BETWEEN '2018-01-01' AND '2018-12-31';

-- SUBSTR() 함수를 사용한 문자열 자르기
-- SUBSTR(문자열데이터, 시작위치, 개수)
-- 타 DB에서는 LEFT(문자열, 몇글자) 함수를 사용
--      RIGHT(문자열, 몇글자) 오른쪽에서 몇글자
SELECT * FROM view_도서정보
WHERE SUBSTR(출판일,0,4) = '2018';

-- 출판일 칼럼의 데이터를 앞에서 4글자만 잘라서 보여라
SELECT SUBSTR(출판일,0,4) AS 출판년도 FROM view_도서정보;
-- 출판일 칼럼의 데이터를 오른쪽에서 4글자만 잘라서 보여라
SELECT SUBSTR(출판일,-5) AS 출판월일 FROM view_도서정보;

-- 1 OR 1 = 1
DELETE FROM tbl_books WHERE bk_isbn = 1 OR 1 = 1;
