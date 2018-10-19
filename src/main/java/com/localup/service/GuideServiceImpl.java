package com.localup.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.GuideVO;
import com.localup.persistence.GuideDAO;

@Service
public class GuideServiceImpl implements GuideService{

	@Inject
	GuideDAO guideDAO;
	
	@Override
	public void insert(GuideVO guideVO) throws Exception {
		guideDAO.insert(guideVO);
	}

	@Override
	public GuideVO list(Integer board_no) throws Exception {
		return guideDAO.list(board_no);
	}
	
	@Override
	public GuideVO myApplyGuideUpdate(Integer tour_no) throws Exception{
		return guideDAO.myApplyGuideUpdate(tour_no);
	}

	@Override
	public List<GuideVO> myApplySchedule(Date tour_edate) throws Exception {
		return guideDAO.myApplySchedule(tour_edate);
	}

	@Override
	public List<GuideVO> myApplyPast(Date tour_edate) throws Exception {
		return guideDAO.myApplyPast(tour_edate);
	}

	//특정 가이드 상세페이지 DB수정
	@Override
	public boolean update(GuideVO guideVO) throws Exception {
		return guideDAO.update(guideVO);
	}

	//특정 가이드 상세페이지 DB삭제
	@Override
	public boolean delete(Integer tour_no) throws Exception {
		return guideDAO.delete(tour_no);
	}

}
