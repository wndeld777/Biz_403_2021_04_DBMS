-- 여기는 food 접속 

CREATE TABLE tbl_foods(
    fo_fcode	CHAR(7)		PRIMARY KEY,
    fo_name	NVARCHAR2(50)	NOT NULL,	
    fo_year	CHAR(4)	NOT NULL	,
    fo_dcode	CHAR(6)	NOT NULL,	
    fo_vcode	CHAR(4)	NOT NULL,	
    fo_size	NUMBER		,
    fo_gram	NUMBER		,
    fo_kcal	NUMBER		,
    fo_protein	NUMBER	,	
    fo_fat	NUMBER		,
    fo_carbo	NUMBER	,	
    fo_sugars	NUMBER		
);
DROP TABLE tbl_foods;

CREATE TABLE tbl_company(
    co_dcode	CHAR(6)		PRIMARY KEY,
    co_name	NVARCHAR2(100)	NOT NULL	
);
DROP TABLE tbl_company;
CREATE TABLE tbl_items(
    it_vcode	CHAR(4)		PRIMARY KEY,
    it_name	NVARCHAR2(50)	NOT NULL	
);
DROP TABLE tbl_items;

ALTER TABLE tbl_foods
ADD CONSTRAINT fk_company
FOREIGN KEY(fo_dcode)
REFERENCES tbl_company(co_dcode);


ALTER TABLE tbl_foods
ADD CONSTRAINT fk_items
FOREIGN KEY(fo_vcode)
REFERENCES tbl_items(it_vcode);
CREATE VIEW view_식품정보 AS
(
    SELECT 
        F.fo_fcode AS 식품코드,
        F.fo_name AS 식품명,
        F.fo_year AS 출시연도,
        F.fo_dcode AS 제조사코드,
        c.co_name AS 제조사이름,
        F.fo_vcode AS 분류코드,
        i.it_name AS 분류명,
        F.fo_size AS 일회제공량,
        F.fo_gram AS 총내용량,
        F.fo_kcal AS 에너지,
        f.fo_protein AS 단백질,
        F.fo_fat AS 지방,
        F.fo_carbo AS 탄수화물,
        f.fo_sugars AS 총당류
        
    FROM tbl_foods F
        LEFT JOIN tbl_company C
            ON F.fo_dcode = c.co_dcode
        LEFT JOIN tbl_items I
            ON F.fo_vcode = I.it_vcode
);

CREATE TABLE tbl_myfoods(
    mf_seq VARCHAR2(10) PRIMARY KEY,
    mf_date VARCHAR2(20) ,
    mf_fcode CHAR(7) ,
    mf_eat NUMBER
);

DROP TABLE tbl_myfoods;

commit;
CREATE VIEW view_섭취정보 AS
(   
    SELECT M.mf_date AS 날짜 ,
        F.fo_name AS 식품명,
        F.fo_kcal * M.mf_eat AS 칼로리,
        F.fo_protein * m.mf_eat AS 단백질,
        F.fo_fat * mf_eat AS 지방,
        F.fo_carbo * mf_eat AS 탄수화물,
        F.fo_sugars * mf_eat AS 총당류
    FROM tbl_foods F
        LEFT JOIN tbl_myfoods M
            ON F.fo_fcode = m.mf_fcode
            WHERE M.mf_date IS NOT NULL
);

DROP VIEW view_섭취정보;

SELECT *
FROM view_섭취정보;