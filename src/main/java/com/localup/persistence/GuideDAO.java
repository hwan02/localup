package com.localup.persistence;

import com.localup.domain.GuideVO;

public interface GuideDAO {
	
	//DB 입력
	public void insert(GuideVO guideVO) throws Exception;
}
