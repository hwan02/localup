package com.localup.service;

import com.localup.domain.GuideVO;

public interface GuideService {
	
	//DB 입력
	public void insert(GuideVO guideVO) throws Exception;
	
	//특정값 불어오기
	public GuideVO list(String tour_img) throws Exception;
}
