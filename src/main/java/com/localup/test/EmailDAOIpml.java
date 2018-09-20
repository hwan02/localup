package com.localup.test;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDAOIpml implements EmailDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void create(EmailForm emailForm) throws Exception {
		sqlSession.insert("user.create",emailForm);
		
	}

	@Override
	public void update(EmailForm emailForm) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
