package com.localup.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.PayInfoVO;
import com.localup.persistence.PayInfoDAO;

@Service
public class PayInfoServiceImpl implements PayInfoService{
	
	@Inject
	PayInfoDAO payInfoDAO;
	
	@Override
	public void insert(PayInfoVO payInfoVO) throws Exception {
		payInfoDAO.insert(payInfoVO);
	}

}
