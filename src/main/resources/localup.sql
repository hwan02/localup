------------------------------member table

--VO,XML 사용할 것들
--member_email
--member_pw
--member_name
--member_zipcode
--member_addr
--member_detailedaddress
--member_tel
--member_pref
--member_intro

drop table member;
/* 멤버 : 우편번호,주소,상세주소 추가*/
CREATE TABLE member (
	member_email VARCHAR2(50) NOT NULL, /* 이메일 */
	member_pw VARCHAR2(20) NOT NULL, /* 회원PW */
	member_name VARCHAR2(30) NOT NULL, /* 이름 */
	member_zipcode VARCHAR2(50) NOT NULL, /* 우편번호 */
	member_addr VARCHAR2(1000) NOT NULL, /*주소*/
	member_detailedaddress VARCHAR2(1000) NOT NULL, /*상세주소*/
	member_tel VARCHAR2(13) NOT NULL, /* 연락처 */
	member_pref VARCHAR2(50), /* 선호지역 */
	member_intro VARCHAR2(300) /* 소개 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		member_email ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			member_email
		);

insert into member (member_email,member_pw,member_name,member_zipcode,member_addr,member_detailedaddress,member_tel,member_pref,member_intro)
	values('localup@gmail.com','123','가이드왕','12345','서울시','엔코아','010-1234-5678','서울시 서초구','나야나');
------------------------------member table_END