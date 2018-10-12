-- CREATE TABLE level --ORA-00903: invalid table name ==> CREATE TABLE levels
 
/* 회원등급 */
drop table levels;
CREATE TABLE levels (
	--levels_level NUMBER NOT NULL, /* 회원레벨 */
	levels_name VARCHAR2(20) NOT NULL, /* 레벨명 */
	--levels_point NUMBER NOT NULL, /* 누적경험치 */
	--levels_like NUMBER NOT NULL, /* 좋아요기준 */
	--levels_board NUMBER NOT NULL /* 게시글 수 */
);

CREATE UNIQUE INDEX PK_levels
	ON levels (
		levels_level ASC
	);

ALTER TABLE levels
	ADD
		CONSTRAINT PK_levels
		PRIMARY KEY (
			levels_level
		);
		
insert into levels (levels_level,levels_name,levels_point,levels_like,levels_board) 
values (1,'초보자',10,5,5);
insert into levels (levels_level,levels_name,levels_point,levels_like,levels_board) 
values (2,'탐험자',50,10,10);
insert into levels (levels_level,levels_name,levels_point,levels_like,levels_board) 
values (3,'초보가이드',100,20,20);
insert into levels (levels_level,levels_name,levels_point,levels_like,levels_board) 
values (4,'베테랑가이드',130,30,30);
insert into levels (levels_level,levels_name,levels_point,levels_like,levels_board) 
values (5,'정복자',200,50,50);