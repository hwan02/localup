package com.localup.persistence;

import java.util.List;
import com.localup.domain.MemberVO;

public interface MemberDAO_sign {
	//회원정보 등록
	public void insert(MemberVO memberVO) throws Exception;

	//이메일인증 성공
	public int update_state(String member_email, int member_state) throws Exception;
	
	//로그인
	public boolean signin(String member_email, String member_pw) throws Exception;
	
	//이메일 찾기
	public List<Object> findEmail(String member_name, String member_tel) throws Exception;
	
	//(임시)비밀번호 설정
	public int update_pw(String member_name, String member_email, String member_pw) throws Exception;
}
