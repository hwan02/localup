------------------------------member table

--VO,XML 사용할 것들
--member_email
--member_pw
--member_name
--member_addr
--member_tel
--member_pref
--member_intro

drop table member;
select * from MEMBER;

create table member(
	member_email varchar2(50)  constraint member_pk primary key,	--이메일 : 아이디
	member_pw	 varchar2(20)  not null,							--비번
	member_name	 varchar2(30)  not null,							--이름
	member_addr  varchar2(200) not null,							--주소
	member_tel	 varchar2(13)  not null,							--연락처
	member_pref	 varchar2(50)  not null,							--선호지역
	member_intro varchar2(300) null									--소개	
);

insert into member (member_email,member_pw,member_name,member_addr,member_tel,member_pref,member_intro)
	values ('localup@gmail.com','123','가이드왕','서울시','01012345678','서울시 서초구','가이드왕 될사람');
------------------------------member table_END