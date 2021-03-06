package com.localup.service;

import java.util.List;

import com.localup.domain.GuideVO;
import com.localup.domain.PayInfoVO;

public interface PayInfoService {
	
	//DB입력
	public void insert(PayInfoVO payInfoVO) throws Exception;
	
	//특정값 조회
	//투어번호
	public List<GuideVO> payList(Integer tour_no) throws Exception;
	
	public PayInfoVO payList_payno(Integer pay_no) throws Exception;
	
	//결제번호
	public List<PayInfoVO> payList2(String member_email) throws Exception;
	
	//결제취소시 업데이트
	public void update(PayInfoVO payInfoVO) throws Exception;
	
	//전체 행 수 조회
	public int listCount();
	
	//myPayInfo update DB전체조회
	public List<PayInfoVO> myPayInfoAll(int start, int max,String member_email);
	
}
