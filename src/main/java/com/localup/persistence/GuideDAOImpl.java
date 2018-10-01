package com.localup.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.GuideVO;

@Repository
public class GuideDAOImpl implements GuideDAO{
	
	@Inject
	SqlSession sqlSession;
	
	//DB 입력
	@Override
	public void insert(GuideVO guideVO) throws Exception {
		sqlSession.insert("guide.insert",guideVO);
	}

}
