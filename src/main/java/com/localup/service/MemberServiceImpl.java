package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.BoardVO;
import com.localup.domain.LevelsVO;
import com.localup.domain.MemberVO;
import com.localup.domain.SubVO;
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
	
	//팔로우(구독)하기
	@Override
	public void addSub(SubVO subVO) throws Exception {
		memberDAO.insertSub(subVO);
	}
	
	//팔로우 수
	@Override
	public int countSub(String member_email_guide) throws Exception {
		return memberDAO.subCount(member_email_guide);
	}
	
	//팔로우한 사용자 조회
	@Override
	public List<SubVO> readSub(String member_email_guide) throws Exception {
		return memberDAO.selectSub(member_email_guide);
	}
	
	//팔로우 취소
	@Override
	public void minusSub(String member_email_sub, String member_email_guide) throws Exception {
		memberDAO.deleteSub(member_email_sub, member_email_guide);
	}
	
	//로그인한 아이디가 팔로우한 사용자인지 찾기
	@Override
	public int subCheck(String member_email_sub, String member_email_guide) throws Exception {
		return memberDAO.checkSub(member_email_sub, member_email_guide);
	}
	
	//내가 팔로우 한 사용자들 조회
	@Override
	public List<SubVO> readGuide(String member_email_sub) throws Exception {
		return memberDAO.myGuide(member_email_sub);
	}
	
	//특정 사용자가 쓴 게시글 전체 행수 조회
	@Override
	public int mboardCount(String member_email) throws Exception {
		return memberDAO.countMBord(member_email);
	}

	//회원정보 조회
//	@Override
//	public List<MemberVO> listAll() throws Exception {
//		return  memberDAO.listAll();
//	}

}
