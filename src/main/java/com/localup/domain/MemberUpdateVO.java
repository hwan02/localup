package com.localup.domain;

public class MemberUpdateVO {
	private String member_email; 						// 이메일 : 아이디
	private String member_pw; 							// 비번
	private String member_name; 						// 이름
	private String member_zipcode; 					// 우편번호
	private String member_addr; 							// 주소
	private String member_detailedaddress; 		// 상세주소
	private String member_tel; 								// 연락처
	private String member_pref; 							// 선호지역
	private String member_intro; 							// 소개

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_detailedaddress() {
		return member_detailedaddress;
	}

	public void setMember_detailedaddress(String member_detailedaddress) {
		this.member_detailedaddress = member_detailedaddress;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_pref() {
		return member_pref;
	}

	public void setMember_pref(String member_pref) {
		this.member_pref = member_pref;
	}

	public String getMember_intro() {
		return member_intro;
	}

	public void setMember_intro(String member_intro) {
		this.member_intro = member_intro;
	}

	@Override
	public String toString() {
		return "MemberUpdateVO [member_email=" + member_email + ", member_pw=" + member_pw + ", member_name="
				+ member_name + ", member_zipcode=" + member_zipcode + ", member_addr=" + member_addr
				+ ", member_detailedaddress=" + member_detailedaddress + ", member_tel=" + member_tel + ", member_pref="
				+ member_pref + ", member_intro=" + member_intro + "]";
	}

}
