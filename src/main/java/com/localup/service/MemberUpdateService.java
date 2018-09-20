package com.localup.service;

import java.util.List;

import com.localup.domain.MemberUpdateVO;

public interface MemberUpdateService {
	//회원정보 업데이트
	public void update(MemberUpdateVO memberUpdateVO) throws Exception;
	
	//회원 정보조회
	public List<MemberUpdateVO> listAll() throws Exception;
}
