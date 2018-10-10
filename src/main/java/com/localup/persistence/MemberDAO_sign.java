package com.localup.persistence;

import com.localup.domain.MemberVO;

public interface MemberDAO_sign {
	//회원정보 등록
	public void insert(MemberVO memberVO) throws Exception;

	//이메일인증 성공
	public int update_state(String member_email, int member_state) throws Exception;
	
	//로그인
	public boolean signin(String member_email, String member_pw) throws Exception;
	
	//이메일 찾기
	public String findEmail(String member_name, String member_tel) throws Exception;
}
