package com.localup.service;

import java.sql.Date;
import java.util.List;

import com.localup.domain.GuideVO;

public interface GuideService {
	
	//DB 입력
	public void insert(GuideVO guideVO) throws Exception;
	
	//특정값 불어오기
	public GuideVO list(Integer board_no) throws Exception;
	
	//특정 가이드 상세페이지 DB수정
	public boolean update(GuideVO guideVO) throws Exception;
	
	//특정 가이드 상세페이지 DB삭제
	public boolean delete(Integer tour_no) throws Exception;

	public List<GuideVO> myApplySchedule(Date tour_edate) throws Exception;

	public List<GuideVO> myApplyPast(Date tour_edate) throws Exception;

	public GuideVO myApplyGuideUpdate(Integer tour_no) throws Exception;
}
