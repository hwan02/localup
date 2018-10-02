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
	public GuideVO list(String tour_img) throws Exception {
		return guideDAO.list(tour_img);
	}

}
