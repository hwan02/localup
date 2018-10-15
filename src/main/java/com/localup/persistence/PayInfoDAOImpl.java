package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
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
	
	//특정값 조회
	//투어번호
	@Override
	public List<GuideVO> payList(Integer tour_no) throws Exception {
		//tour_no=1;
		return sqlSession.selectList("payInfo.payList",tour_no);
	}

	//결제번호
	@Override
	public List<PayInfoVO> payList2(String member_email) throws Exception {
		//member_email="localup@gmail.com";
		return sqlSession.selectList("payInfo.payList2",member_email);
	}

	@Override
	public void update(PayInfoVO payInfoVO) throws Exception {
		//System.out.println("DAO>>>"+payInfoVO);
		sqlSession.update("payInfo.update",payInfoVO);
		
	}

	@Override
	public PayInfoVO payList_payno(Integer pay_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payInfo.payList_payno",pay_no);
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne("payInfo.totalCount");
	}

	@Override
	public List<PayInfoVO> myPayInfoAll(int start, int max,String member_email) {
		//RowBounds rb = new RowBounds(skip,max);
		//===>rb를 통해 조회할 행의 범위설정이 가능 : start=스킵할 행의수, max=조회할 최대 행의수
		member_email="localup@gmail.com";
		RowBounds rb = new RowBounds(start,max);
		return sqlSession.selectList("payInfo.payList2",member_email ,rb);
		//								호출 id			
	}


}
