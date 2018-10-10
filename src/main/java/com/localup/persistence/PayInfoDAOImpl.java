package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.GuideVO;
import com.localup.domain.PayInfoVO;

@Repository
public class PayInfoDAOImpl implements PayInfoDAO{

	@Inject
	SqlSession sqlSession;
	
	//DB입력
	@Override
	public void insert(PayInfoVO payInfoVO) throws Exception {
		sqlSession.insert("payInfo.insert",payInfoVO);	
	}
	
	@Override
	public void pay_cdateInsert(PayInfoVO payInfoVO) throws Exception {
		sqlSession.insert("payInfo.pay_cdate",payInfoVO);	
	}
	
	//특정값 조회
	//투어번호
	@Override
	public List<GuideVO> payList(Integer tour_no) throws Exception {
		tour_no=1;
		return sqlSession.selectList("payInfo.payList",tour_no);
	}

	//결제번호
	@Override
	public List<PayInfoVO> payList2(Integer pay_no) throws Exception {
		pay_no=1;
		return sqlSession.selectList("payInfo.payList2",pay_no);
	}

	@Override
	public void update(PayInfoVO payInfoVO) throws Exception {
		sqlSession.update("payInfo.update",payInfoVO);
		
	}

	


}
