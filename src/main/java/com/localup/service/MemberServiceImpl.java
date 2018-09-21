package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.MemberVO;
import com.localup.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	MemberDAO memberDAO;
	
	//회원정보 업데이트
	@Override
	public void update(MemberVO myUpdateVO) throws Exception {
		memberDAO.update(myUpdateVO);	
	}

	@Override
	public MemberVO read(String member_email) throws Exception {
		//member_email = "localup@gmail.com";
		return memberDAO.read(member_email);
	}

	//회원정보 조회
//	@Override
//	public List<MemberVO> listAll() throws Exception {
//		return  memberDAO.listAll();
//	}

}
