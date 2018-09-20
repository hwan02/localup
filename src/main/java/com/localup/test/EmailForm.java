package com.localup.test;

public class EmailForm {
	private String receiver, subject, temporaryPW,content;

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTemporaryPW() {
		return temporaryPW;
	}

	public void setTemporaryPW(String temporaryPW) {
		this.temporaryPW = temporaryPW;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "EmailForm [receiver=" + receiver + ", subject=" + subject + ", temporaryPW=" + temporaryPW
				+ ", content=" + content + "]";
	}

	
	
	
}
