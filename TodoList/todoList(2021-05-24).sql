-- 여기는 TODOLIST 접속

CREATE TABLE tbl_todoList(
    to_seq NUMBER PRIMARY KEY,
    to_work nVARCHAR2(100) NOT NULL, 
    to_date VARCHAR2(10) NOT NULL,
    to_time VARCHAR2(10) NOT NULL,
    to_place nVARCHAR2(100)

);

CREATE SEQUENCE seq_todoList
  START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_todoList(to_seq,to_work,to_date,to_time,to_place)
VALUES (seq_todoList.NEXTVAL,'서블릿 실습','2021-05-01','11:13:11','403');

SELECT * FROM tbl_todoList;

commit