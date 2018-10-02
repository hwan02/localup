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
	
	@Inject
	SqlSession sqlSession;
	
	//DB 입력
	@Override
	public void insert(GuideVO guideVO) throws Exception {
		sqlSession.insert("guide.insert",guideVO);
	}

	//특정 가이드 상세페이지 가져오기
	@Override
	public GuideVO list(String tour_img) throws Exception {
		tour_img = "upload_6.jpg";
		return sqlSession.selectOne("guide.list",tour_img);
	}

}
