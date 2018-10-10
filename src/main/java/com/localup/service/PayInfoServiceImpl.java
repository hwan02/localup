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

	

	//특정값 조회
	//결제번호
	@Override
	public List<GuideVO> payList(Integer tour_no) throws Exception {
		return payInfoDAO.payList(tour_no);
	}

	//투어번호
	@Override
	public List<PayInfoVO> payList2(String member_email) throws Exception {
		return payInfoDAO.payList2(member_email);
	}

	//결제취소시 업데이트
	@Override
	public void update(PayInfoVO payInfoVO) throws Exception {
		payInfoDAO.update(payInfoVO);
		
	}



	


}
