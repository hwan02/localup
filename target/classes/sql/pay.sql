/* 결제내역 */
select * from pay;
drop table pay;
CREATE TABLE pay (
	pay_no NUMBER NOT NULL, /* 결제번호 */
	pay_pay NUMBER NOT NULL, /* 결제금액 */
	pay_num NUMBER NOT NULL, /* 결제인원 */
	pay_pdate date default sysdate, /* 결제승인일시 */
	pay_cdate date,--date default sysdate, /* 결제취소일시 */
	pay_state VARCHAR2(20) NOT NULL, /* 결제상태 */
	pay_way VARCHAR2(20) NOT NULL, /* 결제수단 */
	board_no NUMBER NOT NULL, /* 게시글번호 */
	member_email VARCHAR2(50) /* 신청회원 */
);

--추가 : rys
drop sequence pay_seq;
create sequence pay_seq
start with 1
increment by 1 
nocache
nocycle;


CREATE UNIQUE INDEX PK_pay
	ON pay (
		pay_no ASC
	);

ALTER TABLE pay
	ADD
		CONSTRAINT PK_pay
		PRIMARY KEY (
			pay_no
		);
		
ALTER TABLE pay
	ADD
		CONSTRAINT FK_member_TO_pay
		FOREIGN KEY (
			member_email
		)
		REFERENCES member (
			member_email
		);

ALTER TABLE pay
	ADD
		CONSTRAINT FK_board_TO_pay
		FOREIGN KEY (
			board_no
		)
		REFERENCES board (
			board_no
		);