/* 구독 */
drop table sub;
CREATE TABLE sub (
	member_email_sub VARCHAR2(50) NOT NULL, /* 구독자ID */
	member_email_guide VARCHAR2(50) NOT NULL, /* 가이드ID */
	sub_date DATE DEFAULT sysdate NOT NULL /* 구독신청일시 */
);

CREATE UNIQUE INDEX PK_sub
	ON sub (
		member_email_sub ASC,
		member_email_guide ASC
	);

ALTER TABLE sub
	ADD
		CONSTRAINT PK_sub
		PRIMARY KEY (
			member_email_sub,
			member_email_guide
		);
		
ALTER TABLE sub
	ADD
		CONSTRAINT FK_member_TO_sub
		FOREIGN KEY (
			member_email_sub
		)
		REFERENCES member (
			member_email
		);

ALTER TABLE sub
	ADD
		CONSTRAINT FK_member_TO_sub
		FOREIGN KEY (
			member_email_guide
		)
		REFERENCES member (
			member_email
		);
		
--TEST
insert into sub(member_id_sub1,member_id_guide1) values('localup@gmail.com','naver@gmail.com');