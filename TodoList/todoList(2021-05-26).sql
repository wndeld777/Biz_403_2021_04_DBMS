SHOW DATABASES;

CREATE DATABASE myDB;
USE myDB;
CREATE TABLE tbl_todolist(
	td_seq BIGINT auto_increment primary KEY,
    td_sdate varchar(10) not null, -- 추가된 날짜
    td_stime varchar(10) not null, -- 추가된 시간
    td_doit varchar(300) not null,
    td_edate varchar(10) default '', -- 완료된 날짜
    td_etime varchar(10) default '' -- 완료된 시간 
);    
    
DESC tbl_todolist;
select * FROM tbl_todolist;