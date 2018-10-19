package com.localup.persistence;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.localup.domain.GuideVO;
import com.localup.domain.PayInfoVO;

@Repository
public class GuideDAOImpl implements GuideDAO{
	
	@Inject
	SqlSession sqlSession;
	
	//DB 입력
	@Override
	public void insert(GuideVO guideVO) throws Exception {
		sqlSession.insert("guide.insert",guideVO);
	}

	//특정 가이드 상세페이지 DB가져오기
	@Override
	public GuideVO list(Integer board_no) throws Exception {
		//board_no = 1;
		return sqlSession.selectOne("guide.list",board_no);
	}

	//특정 가이드 상세페이지 DB가져오기
	@Override
	public GuideVO myApplyGuideUpdate(Integer tour_no) throws Exception {
		return sqlSession.selectOne("guide.myApplyGuideUpdate",tour_no);
	}

	@Override
	public List<GuideVO> myApplySchedule(Date tour_edate) throws Exception {
		//board_no = 1;
		return sqlSession.selectList("guide.myApplySchedule",tour_edate);
	}
	
	@Override
	public List<GuideVO> myApplyPast(Date tour_edate) throws Exception {
		//board_no = 1;
		return sqlSession.selectList("guide.myApplyPast",tour_edate);
	}

	//특정 가이드 상세페이지 DB수정
	@Override
	public boolean update(GuideVO guideVO) throws Exception {
		int guideUpdate = sqlSession.update("guide.update",guideVO);
		if(guideUpdate ==1) {
			return true;
		}
		
		return false;
	}

	//특정 가이드 상세페이지 DB삭제
	@Override
	public boolean delete(Integer tour_no) {
		int guideDelete = sqlSession.delete("guide.delete",tour_no);
		if(guideDelete==1) {
			return true;
		}
		return false;
	}
}
