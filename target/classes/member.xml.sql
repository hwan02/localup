/* 멤버 */
CREATE TABLE member (
	member_id VARCHAR2(15) NOT NULL, /* 회원ID */
	member_pw VARCHAR2(20) NOT NULL, /* 회원PW */
	member_name VARCHAR2(30) NOT NULL, /* 이름 */
	member_addr VARCHAR2(200) NOT NULL, /* 주소 */
	member_tel VARCHAR2(13) NOT NULL, /* 연락처 */
	member_email VARCHAR2(50) NOT NULL, /* 이메일 */
	member_pref VARCHAR2(50), /* 선호지역 */
	member_intro VARCHAR2(300) /* 소개 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		member_id ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			member_id
		);
		