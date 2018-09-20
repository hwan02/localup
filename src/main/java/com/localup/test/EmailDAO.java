package com.localup.test;

public interface EmailDAO {
	//생성
	public void create(EmailForm emailForm) throws Exception;
	
	//업데이트
	public void update(EmailForm emailForm) throws Exception;
}
