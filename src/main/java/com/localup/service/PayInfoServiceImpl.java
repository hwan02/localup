package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.GuideVO;
import com.localup.domain.PayInfoVO;
import com.localup.persistence.PayInfoDAO;

@Service
public class PayInfoServiceImpl implements PayInfoService{
	
	@Inject
	PayInfoDAO payInfoDAO;
	
	//DB 입력
	@Override
	public void insert(PayInfoVO payInfoVO) throws Exception {
		payInfoDAO.insert(payInfoVO);
	}
	
	@Override
	public void pay_cdateInsert(PayInfoVO payInfoVO) throws Exception {
		payInfoDAO.pay_cdateInsert(payInfoVO);
		
	}
	

	//특정값 조회
	//결제번호
	@Override
	public List<GuideVO> payList(Integer tour_no) throws Exception {
		return payInfoDAO.payList(tour_no);
	}

	//투어번호
	@Override
	public List<PayInfoVO> payList2(Integer pay_no) throws Exception {
		return payInfoDAO.payList2(pay_no);
	}

	//결제취소시 업데이트
	@Override
	public void update(PayInfoVO payInfoVO) throws Exception {
		payInfoDAO.update(payInfoVO);
		
	}



	


}
