package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.MemberVO;
import com.localup.persistence.MemberDAO_sign;

@Service
public class MemberServiceImpl_sign implements MemberService_sign{
	
	@Inject
	MemberDAO_sign memberDAO_sign;
	
	@Override
	public void insert(MemberVO memberVO) throws Exception {
		memberDAO_sign.insert(memberVO);
	}

	@Override
	public int update_state(String member_email, int member_state) throws Exception {
		return memberDAO_sign.update_state(member_email, member_state);
	}

	@Override
	public boolean signin(String member_email, String member_pw) throws Exception {
		return memberDAO_sign.signin(member_email, member_pw);
	}

	@Override
	public List<Object> findEmail(String member_name, String member_tel) throws Exception {
		return memberDAO_sign.findEmail(member_name, member_tel);
	}

	@Override
	public int update_pw(String member_name, String member_email, String member_pw) throws Exception {
		return memberDAO_sign.update_pw(member_name, member_email, member_pw);
	}	
}
