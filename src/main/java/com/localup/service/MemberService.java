package com.localup.service;

import java.util.List;

import com.localup.domain.BoardVO;
import com.localup.domain.LevelsVO;
import com.localup.domain.MemberVO;
import com.localup.domain.SubVO;

public interface MemberService {
	//회원정보 업데이트
	public void update(MemberVO memberUpdateVO) throws Exception;
	
	//회원 정보조회
	//public List<MemberVO> listAll() throws Exception;
	
	//특정 아이디 조회
	public MemberVO read(String member_email) throws Exception;
	
	//회원탈퇴
	public void delete(String member_email) throws Exception;
	
	//특정 아이디 레벨 조회
	public String readLevel(String member_email) throws Exception;
	
	//특정 아이디가 작성한(내가 쓴) 게시글 조회
	public List<BoardVO> listIdBoard(String member_email) throws Exception;
	
	//팔로우(구독)하기
	public void addSub(SubVO subVO) throws Exception;
	
	//팔로우 수
	public int countSub(String member_email_guide) throws Exception;
	
	//팔로우 한 사용자 조회
	public List<SubVO> readSub(String member_email_guide) throws Exception; 
	
	//로그인한 아이디가 팔로우한 사용자인지 찾기
	public List<String> readLoginSub(String member_email_sub) throws Exception;
	
	//팔로우 취소
	public void minusSub(String member_email_sub,String member_email_guide) throws Exception;
}
