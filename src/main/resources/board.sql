/* 게시글 */
drop table board;
CREATE TABLE board (
	board_no NUMBER NOT NULL, /* 게시글번호 */
	member_id VARCHAR2(15) NOT NULL, /* 회원ID */
	board_type VARCHAR2(20) NOT NULL, /* 게시글유형 */
	board_title VARCHAR2(100) NOT NULL, /* 게시글제목 */
	board_cont VARCHAR2(1000), /* 게시글내용 */
	board_img VARCHAR2(150) NOT NULL, /* 게시글이미지 */
	board_view NUMBER DEFAULT 0 NOT NULL, /* 조회수 */
	board_like NUMBER DEFAULT 0 NOT NULL, /* 좋아요 */
	board_date DATE DEFAULT sysdate NOT NULL, /* 게시글작성일시 */
	board_alti NUMBER NOT NULL, /* 위도 */
	board_long NUMBER NOT NULL, /* 경도 */
	board_max NUMBER, /* 투어최대인원수 */
	board_rec VARCHAR2(150) DEFAULT null /* 추천여부 */
);

CREATE UNIQUE INDEX PK_board
	ON board (
		board_no ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			board_no
		);
ALTER TABLE board
	ADD
		CONSTRAINT FK_member_TO_board
		FOREIGN KEY (
			member_id
		)
		REFERENCES member (
			member_id
		);
drop sequence board_seq;
create sequence board_seq
start with 1
increment by 1 
nocache
nocycle;		

insert into BOARD(board_no, member_id, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 
'gildong', 
'맛집',
'어디까지 가봤니?',
'난 여기까지 가봤단다',
'mathouse.jpg',
13,
8,
126,
37.1,
5); 