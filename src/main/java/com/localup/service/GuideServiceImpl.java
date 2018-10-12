package com.localup.service;

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
