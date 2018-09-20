package com.localup.test;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO userDAO;
	
	@Override
	public Object login(UserVO uservo) throws Exception {
		return userDAO.login(uservo);
	}


}
