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



	@Override
	public PayInfoVO payList_payno(Integer pay_no) throws Exception {
		// TODO Auto-generated method stub
		return payInfoDAO.payList_payno(pay_no);
	}



	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return payInfoDAO.totalCount();
	}

	@Override
	//myPayInfo update DB전체조회
	public List<PayInfoVO> myPayInfoAll(int start, int max,String member_email) {
		return payInfoDAO.myPayInfoAll(start, max,member_email);
	}






	

	


}
