package com.localup.test;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService{
	
	@Inject
	EmailDAO emailDAO;
	
	@Override
	public void create(EmailForm emailForm) throws Exception {
		emailDAO.create(emailForm);
		
	}

	@Override
	public void update(EmailForm emailForm) throws Exception {
		emailDAO.update(emailForm);
	}

}
