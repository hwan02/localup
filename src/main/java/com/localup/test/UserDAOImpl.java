package com.localup.test;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public Object login(UserVO uservo) throws Exception {
		return sqlSession.selectOne("user.login",uservo);
		
	}

}