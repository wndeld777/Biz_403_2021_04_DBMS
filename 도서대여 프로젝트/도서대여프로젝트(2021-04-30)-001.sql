CREATE TABLE tbl_book(
    bk_isbn	CHAR(13)		PRIMARY KEY,
    bk_title	NVARCHAR2(125)	NOT NULL,	
    bk_ccode	CHAR(5)	NOT NULL	,
    bk_acode	CHAR(5)	NOT NULL	,
    bk_date	 VARCHAR2(10)		,
    bk_price	NUMBER		,
    bk_pages	NUMBER		
);

CREATE TABLE tbl_company(
    cp_code	CHAR(5)		PRIMARY KEY,
    cp_title	NVARCHAR2(125)	NOT NULL	,
    cp_ceo	NVARCHAR2(20)		,
    cp_tel	VARCHAR2(20)		,
    cp_addr	NVARCHAR2(125)		,
    cp_genre	NVARCHAR2(10)		
);

CREATE TABLE tbl_author(
    au_code	CHAR(5)		PRIMARY KEY,
    au_name	NVARCHAR2(50)	NOT NULL,	
    au_tel	VARCHAR2(20)		,
    au_addr	NVARCHAR2(125)		,
    au_genre	NVARCHAR2(30)		
);

-- 3개의 TABLE을 JOIN
DROP VIEW view_도서정보;
CREATE VIEW view_도서정보 AS
(
    SELECT b.bk_isbn AS ISBN,
        b.bk_title AS 도서명,
        c.cp_title AS 출판사명,
        c.cp_ceo AS 출판사대표,
        a.au_name AS 저자명,
        a.au_tel AS 저자연락처,
        b.bk_date AS 출판일,
        b.bk_price AS 가격,
        b.bk_pages AS 페이지
    FROM tbl_book B
        LEFT JOIN tbl_company C 
            ON B.bk_ccode = c.cp_code
        LEFT JOIN tbl_author A
            ON B.bk_acode = A.au_code
);

-- 단독 TABLE로 생성된 VIEW는 INSERT, UPDATE, DELETE를
-- 실행할 수 있다
-- TABLE 을 JOIN한 결과로 생성된 VIEW는 읽기전용
--      INSERT, UPDATE, DELETE 를 실행 할 수 있다

SELECT * FROM view_도서정보;

DELETE FROM tbl_book;
COMMIT;