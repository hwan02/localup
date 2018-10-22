package com.localup.domain;

import java.util.Date;

import com.google.gson.Gson;

public class ChatVO {
	private int chat_no;
	private String chat_cont;
	private Date chat_date;
	private String chat_check;
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public String getChat_cont() {
		return chat_cont;
	}
	public void setChat_cont(String chat_cont) {
		this.chat_cont = chat_cont;
	}
	public Date getChat_date() {
		return chat_date;
	}
	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
	public String getChat_check() {
		return chat_check;
	}
	public void setChat_check(String chat_check) {
		this.chat_check = chat_check;
	}
	public static ChatVO convertMessage(String source) {
		  ChatVO message = new ChatVO();
	      Gson gson = new Gson();
	      //String을 json형태로 
	      message = gson.fromJson(source,  ChatVO.class);
	      return message;
	   }
	@Override
	public String toString() {
		return "ChatVO [chat_no=" + chat_no + ", chat_cont=" + chat_cont + ", chat_date=" + chat_date + ", chat_check="
				+ chat_check + "]";
	}
}
