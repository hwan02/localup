package com.localup.persistence;

import com.localup.domain.GuideVO;

public interface GuideDAO {
	
	//DB 입력
	public void insert(GuideVO guideVO) throws Exception;
	
	//특정 가이드 상세페이지 가져오기
	public GuideVO list(Integer board_no) throws Exception;
}
