package com.localup.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.PayInfoVO;

@Repository
public class PayInfoDAOImpl implements PayInfoDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insert(PayInfoVO payInfoVO) throws Exception {
		sqlSession.insert("payInfo.insert",payInfoVO);	
	}

}
