-- CREATE TABLE level --ORA-00903: invalid table name ==> CREATE TABLE levels
 
/* 회원등급 */
drop table levels;
--CREATE TABLE levels (
--	--levels_level NUMBER NOT NULL, /* 회원레벨 */
--	levels_name VARCHAR2(20) NOT NULL, /* 레벨명 */
--	levels_point NUMBER NOT NULL, /* 누적경험치 */
--	levels_like NUMBER NOT NULL, /* 좋아요기준 */
--	levels_board NUMBER NOT NULL /* 게시글 수 */
--);


--CREATE UNIQUE INDEX PK_levels
--	ON levels (
--		levels_level ASC
--	);
		
--insert into levels (levels_name,levels_point,levels_like,levels_board) 
--values ('초보자',10,5,5);
--insert into levels (levels_name,levels_point,levels_like,levels_board) 
--values ('탐험자',50,20,30);
--insert into levels (levels_name,levels_point,levels_like,levels_board) 
--values ('초보가이드',100,30,70);
--insert into levels (levels_name,levels_point,levels_like,levels_board) 
--values ('베테랑가이드',130,50,80);
--insert into levels (levels_name,levels_point,levels_like,levels_board) 
--values ('정복자',200,70,130);
------------------------------------------------------
drop table levels;
CREATE TABLE levels (
	--levels_level NUMBER NOT NULL, /* 회원레벨 */
	levels_name VARCHAR2(20) NOT NULL, /* 레벨명 */
	levels_min number not null,
	levels_max number not null
);
ALTER TABLE levels
	ADD
		CONSTRAINT PK_levels
		PRIMARY KEY (
			levels_name
		);

insert into levels (levels_name,levels_min,levels_max) 
values ('초보자',0,10);
insert into levels (levels_name,levels_min,levels_max) 
values ('탐험자',11,50);
insert into levels (levels_name,levels_min,levels_max) 
values ('초보가이드',51,100);
insert into levels (levels_name,levels_min,levels_max) 
values ('베테랑가이드',101,131);
insert into levels (levels_name,levels_min,levels_max) 
values ('정복자',131,200);

select count(board_no) from board where member_email='gildong@naver.com';

select levels_name 
from levels 
where (select count(board_no) from board where member_email='gildong@naver.com')
between levels_min and levels_max;
/*
LEVELS_NAME
----------------------------------------
초보자
*/

select * from levels;
------------------------------------------------------
/* 회원등급이력 */
drop table levelhis;
CREATE TABLE levelhis (
	member_email VARCHAR2(50) NOT NULL, /* 이메일 */
	levelhis_date DATE NOT NULL, /* 부여년도 */
	levelhis_level NUMBER NOT NULL /* 회원레벨 */
);

CREATE UNIQUE INDEX PK_levelhis
	ON levelhis (
		member_email ASC
	);

ALTER TABLE levelhis
	ADD
		CONSTRAINT PK_levelhis
		PRIMARY KEY (
			member_email
		);
------------------------------------------------------
