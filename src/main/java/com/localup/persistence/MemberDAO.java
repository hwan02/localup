package com.localup.persistence;

import java.util.List;

import com.localup.domain.MemberVO;


public interface MemberDAO {
	// 업데이트
	public void update(MemberVO memberUpdateVO) throws Exception;
	
	//전체조회
	//public List<MemberVO> listAll() throws Exception;
	
	//특정한 값 조회
	public MemberVO read(String member_email) throws Exception;
}
