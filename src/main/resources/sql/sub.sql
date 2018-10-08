/* 구독 */
CREATE TABLE sub (
	member_id_sub1 VARCHAR2(50) NOT NULL, /* 구독자ID */
	member_id_guide1 VARCHAR2(50) NOT NULL, /* 가이드ID */
	sub_date DATE DEFAULT sysdate NOT NULL /* 구독신청일시 */
);

CREATE UNIQUE INDEX PK_sub
	ON sub (
		member_id_sub1 ASC,
		member_id_guide1 ASC
	);

ALTER TABLE sub
	ADD
		CONSTRAINT PK_sub
		PRIMARY KEY (
			member_id_sub1,
			member_id_guide1
		);
		
ALTER TABLE sub
	ADD
		CONSTRAINT FK_member_TO_sub
		FOREIGN KEY (
			member_id_sub1
		)
		REFERENCES member (
			member_email
		);

ALTER TABLE sub
	ADD
		CONSTRAINT FK_member_TO_sub2
		FOREIGN KEY (
			member_id_guide1
		)
		REFERENCES member (
			member_email
		);
		
--TEST
insert into sub(member_id_sub1,member_id_guide1) values("localup@gmail.com","naver@gmail.com");