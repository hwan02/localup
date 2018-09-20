package com.localup.persistence;

import java.util.List;

import com.localup.domain.MemberUpdateVO;

public interface MemberUpdateDAO {
	// 업데이트
	public void update(MemberUpdateVO memberUpdateVO) throws Exception;
	
	//조회
	public List<MemberUpdateVO> listAll() throws Exception;
}
