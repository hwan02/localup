/* 투어 */
select * from tour;
drop table tour;
CREATE TABLE tour (
	--tour_no NUMBER NOT NULL, /* 투어번호 */
	--tour_title VARCHAR2(100) NOT NULL, /* 투어명 */
	--tour_sdate DATE NOT NULL, /* 투어시작일시 */
	--tour_edate DATE NOT NULL, /* 투어종료일시 */
	--tour_pay NUMBER NOT NULL, /* 투어금액 */
	--tour_cont VARCHAR2(500) NOT NULL, /* 투어내용 */
	--tour_img VARCHAR2(150) NOT NULL /* 투어이미지 */
	tour_img VARCHAR2(150) NOT NULL
	--board_no NUMBER NOT NULL /* 게시글번호 */
);


--추가 : rys
drop sequence tour_seq;
create sequence tour_seq
start with 1
increment by 1 
nocache
nocycle;		



CREATE UNIQUE INDEX PK_tour
	ON tour (
		tour_no ASC
	);

ALTER TABLE tour
	ADD
		CONSTRAINT PK_tour
		PRIMARY KEY (
			tour_no
		);
		
ALTER TABLE tour
	ADD
		CONSTRAINT FK_board_TO_tour
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			board_no
		);
		
--board 테이블 조회
select * from board;