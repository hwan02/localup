package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.BoardVO;
import com.localup.domain.LevelsVO;
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

	@Override
	public void delete(String member_email) throws Exception {
		memberDAO.delete(member_email);
		
	}
	
	//특정 아이디 레벨 조회
	@Override
	public String readLevel(String member_email) throws Exception {
		return memberDAO.myLevel(member_email);
	}
	
	//특정 아이디가 쓴(내가 쓴) 게시글 조회
	@Override
	public List<BoardVO> listIdBoard(String member_email) throws Exception {
		return memberDAO.readIdBoard(member_email);
	}

	//회원정보 조회
//	@Override
//	public List<MemberVO> listAll() throws Exception {
//		return  memberDAO.listAll();
//	}

}
