package com.localup.persistence;

import java.sql.SQLException;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.localup.domain.GuideVO;

@Repository
public class GuideDAOImpl implements GuideDAO{
	
//	@Inject
//	SqlSession sqlSession;
	
	//DB 입력
	@Override
	public void insert(GuideVO guideVO) throws Exception {
		//sqlSession.insert("guide.insert",guideVO);
	}

	//============================================이미지 TEST 시작	
	@Inject
	private SqlSession query;
	 
	public void saveImage(Map<String, Object> hmap) throws SQLException {
	    query.insert("guide.insert",hmap);
	}


}
