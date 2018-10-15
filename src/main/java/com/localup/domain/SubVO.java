package com.localup.domain;

import java.util.Date;

public class SubVO {
	private String member_email_sub;
	private String member_email_guide;
	private Date sub_date;

	public SubVO() {
		// TODO Auto-generated constructor stub
	}

	public SubVO(String member_email_sub, String member_email_guide, Date sub_date) {
		super();
		this.member_email_sub = member_email_sub;
		this.member_email_guide = member_email_guide;
		this.sub_date = sub_date;
	}

	public String getMember_email_sub() {
		return member_email_sub;
	}

	public void setMember_email_sub(String member_email_sub) {
		this.member_email_sub = member_email_sub;
	}

	public String getMember_email_guide() {
		return member_email_guide;
	}

	public void setMember_email_guide(String member_email_guide) {
		this.member_email_guide = member_email_guide;
	}

	public Date getSub_date() {
		return sub_date;
	}

	public void setSub_date(Date sub_date) {
		this.sub_date = sub_date;
	}

	@Override
	public String toString() {
		return "SubVO [member_email_sub=" + member_email_sub + ", member_email_guide=" + member_email_guide
				+ ", sub_date=" + sub_date + "]";
	}

}
