/* 멤버 */
alter table member drop constraint PK_member cascade;
drop table member;
CREATE TABLE member (
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
		member_email ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			member_email
		);
insert into member (member_email,member_pw,member_name,member_addr,member_tel,member_pref,member_intro)
   values('localup@gmail.com','123','가이드왕','서울시','010-1234-5678','서울시 서초구','나야나');
insert into member (member_email,member_pw,member_name,member_addr,member_tel,member_pref,member_intro)
   values('naver@gmail.com','123','네이버','경기도','010-1234-5678','성남시 판교','나야나');    
insert into member (member_email,member_pw,member_name,member_addr,member_tel,member_pref,member_intro)
   values('gildong@naver.com','123','네이버','경기도','010-1234-5678','성남시 판교','나야나');    