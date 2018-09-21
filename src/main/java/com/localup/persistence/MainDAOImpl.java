package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.Location;
@Repository
public class MainDAOImpl implements MainDAO{
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<Location> listBoard(Location loc) {
		return sqlSession.selectList("main.listBoard", loc);
	}

}
