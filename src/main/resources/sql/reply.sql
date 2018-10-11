/* 댓글 */
drop table reply;
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* 댓글번호 */
	reply_cont VARCHAR2(300) NOT NULL, /* 댓글내용 */
	reply_date DATE DEFAULT sysdate NOT NULL, /* 댓글작성일시 */
	reply_upno NUMBER, /* 상위댓글번호 */
	reply_star NUMBER NOT NULL, /* 평점 */
	board_no NUMBER NOT NULL, /* 게시글번호 */
	member_email VARCHAR2(50) /* 댓글작성자 */
);

CREATE UNIQUE INDEX PK_reply
	ON reply (
		reply_no ASC
	);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_no
		);
		
drop sequence reply_seq;
create sequence reply_seq
		start with 1
		increment by 1
		nocycle
		nocache;
		
------------------------------
ALTER TABLE reply
	ADD
		CONSTRAINT FK_board_TO_reply
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			board_no
		);