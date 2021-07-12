CREATE DATABASE honjalDB;

USE honjalDB;

CREATE TABLE tbl_member(
	member_num	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	member_level	BIGINT	NOT NULL,
	member_id	VARCHAR(20)	NOT NULL	UNIQUE,
	member_pw	VARCHAR(30)	NOT NULL,
	member_nname	VARCHAR(30)	NOT NULL	UNIQUE,
	member_email	VARCHAR(30)	NOT NULL	UNIQUE
);
DROP TABLE tbl_member;

CREATE TABLE tbl_content(
	content_num	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	member_num	BIGINT	NOT NULL,
	board_code	CHAR(4)	NOT NULL,
	content_date	VARCHAR(10)	NOT NULL,
	content_time	VARCHAR(10)	NOT NULL,
	content_view	INT	NOT NULL,
	content_good	INT	NOT NULL,
	content_title	VARCHAR(125)	NOT NULL,
	content_text	VARCHAR(2000)	NOT NULL	
);
DROP table tbl_content;


CREATE TABLE tbl_board(
	board_code	CHAR(4)		PRIMARY KEY,
	board_name	VARCHAR(20)	NOT NULL	
);

CREATE TABLE tbl_comment(
	comment_num	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	content_num	BIGINT	NOT NULL,
	member_num	BIGINT	NOT NULL,
	board_code	CHAR(4)	NOT NULL,
	comment_writer	VARCHAR(10)	NOT NULL,
	comment_text	VARCHAR(500)	NOT NULL,	
	comment_time	VARCHAR(20)	NOT NULL	
);

CREATE TABLE tbl_file(
	file_num	BIGINT		PRIMARY KEY,
	content_num	BIGINT	NOT NULL,
	member_num	BIGINT	NOT NULL,
	board_code	 CHAR(4)	NOT NULL,	
	file_name	VARCHAR(200)	NOT NULL	
);

CREATE TABLE tbl_scrap(
	scrap_num	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	content_num	BIGINT	NOT NULL,
	member_num	BIGINT	NOT NULL,
	board_code	 CHAR(4)	NOT NULL,
	scrap_date	VARCHAR(20)	NOT NULL	
);

-- fk 삭제
ALTER TABLE tbl_comment
DROP CONSTRAINT fk_content_num;


-- 회원 -> 게시물
ALTER TABLE tbl_content 
ADD CONSTRAINT fk_member_num 
FOREIGN KEY (member_num) 
REFERENCES tbl_member(member_num); 

-- 게시물 -> 댓글
ALTER TABLE tbl_comment
ADD CONSTRAINT fk_comment_content_num
FOREIGN KEY (content_num) 
REFERENCES tbl_content(content_num); 

-- 게시물 -> 첨부파일
ALTER TABLE tbl_file
ADD CONSTRAINT fk_file_content_num
FOREIGN KEY (content_num) 
REFERENCES tbl_content(content_num); 

-- 게시물 -> 스크랩
ALTER TABLE tbl_scrap
ADD CONSTRAINT fk_scrap_content_num
FOREIGN KEY (content_num) 
REFERENCES tbl_content(content_num); 

-- 게시판 -> 게시물
ALTER TABLE tbl_content
ADD CONSTRAINT fk_board_code
FOREIGN KEY (board_code) 
REFERENCES tbl_board(board_code); 


