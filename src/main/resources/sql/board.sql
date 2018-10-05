/* 게시글 */
drop table board;
CREATE TABLE board (
	board_no NUMBER NOT NULL, /* 게시글번호 */
	member_email VARCHAR2(100) NOT NULL, /* 회원ID */
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
			member_email
		)
		REFERENCES member (
			member_email
		);
drop sequence board_seq;
create sequence board_seq
start with 1
increment by 1 
nocache
nocycle;		
delete from board;
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'localup@gmail.com', '맛집','어디까지 가봤니?','난 여기까지 가봤단다1','mathouse1.jpg',13,8,37.1,126.1,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '맛집','어디까지 가봤니?','난 여기까지 가봤단다2','mathouse2.jpg',13,8,37.2,126.2,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '맛집','어디까지 가봤니?','난 여기까지 가봤단다3','mathouse3.jpg',13,8,37.3,126.3,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '맛집','어디까지 가봤니?','난 여기까지 가봤단다4','mathouse4.jpg',13,8,37.4,126.4,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '맛집','어디까지 가봤니?','난 여기까지 가봤단다5','mathouse5.jpg',13,8,37.5,126.5,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '가이드','어디까지 가봤니?','난 여기까지 가봤단다6','mathouse6.jpg',13,8,37.6,126.6,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '교통','어디까지 가봤니?','난 여기까지 가봤단다7','mathouse7.jpg',13,8,37.6,126.6,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '편의시설','어디까지 가봤니?','난 여기까지 가봤단다8','mathouse8.jpg',13,8,37.6,126.6,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '랜드마크','어디까지 가봤니?','난 여기까지 가봤단다9','mathouse9.jpg',13,8,37.6,126.6,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '숙박','어디까지 가봤니?','난 여기까지 가봤단다10','mathouse10.jpg',13,8,37.6,126.6,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '지역소식','어디까지 가봤니?','난 여기까지 가봤단다11','mathouse11.jpg',13,8,37.6,126.6,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '숙박','어디까지 가봤니?','난 여기까지 가봤단다12','mathouse12.jpg',13,8,37.485454939832456,127.02068035663186,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '지역소식','어디까지 가봤니?','난 여기까지 가봤단다13','mathouse13.jpg',13,8,37.487454939832426,127.02068035663186,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '랜드마크','어디까지 가봤니?','난 여기까지 가봤단다14','mathouse14.jpg',13,8,37.488454939832416,127.02068035663186,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '편의시설','어디까지 가봤니?','난 여기까지 가봤단다15','mathouse15.jpg',13,8,37.489454939832406,127.02068035663186,5); 
insert into BOARD(board_no, member_email, board_type, board_title, board_cont, board_img, board_view, board_like, board_alti, board_long, board_max) 
values(board_seq.nextval, 'gildong@naver.com', '지역소식','어디까지 가봤니?','난 여기까지 가봤단다11','mathouse12.jpg',13,8,37.490454939832446,127.02068035663186,5); 

select * from board;