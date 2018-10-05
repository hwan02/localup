package com.localup.domain;

import java.util.Date;

public class PayInfoVO {
	private Integer pay_no; 	/* 결제번호 */
	private Integer pay_num; 	/* 결제인원 */
	private Integer pay_pay; 	/* 결제금액 */
	private String pay_way; 	/* 결제수단 */
	private Integer board_no; 	/* 게시글번호 */
	private String pay_state; 	/*결제상태*/
	//private Date pay_pdate; 	/* 결제승인일시 */
	private String member_email;/* 신청회원 */
	public Integer getPay_no() {
		return pay_no;
	}
	public void setPay_no(Integer pay_no) {
		this.pay_no = pay_no;
	}
	public Integer getPay_num() {
		return pay_num;
	}
	public void setPay_num(Integer pay_num) {
		this.pay_num = pay_num;
	}
	public Integer getPay_pay() {
		return pay_pay;
	}
	public void setPay_pay(Integer pay_pay) {
		this.pay_pay = pay_pay;
	}
	public String getPay_way() {
		return pay_way;
	}
	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}
	public Integer getBoard_no() {
		return board_no;
	}
	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}
	public String getPay_state() {
		return pay_state;
	}
	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	@Override
	public String toString() {
		return "PayInfoVO [pay_no=" + pay_no + ", pay_num=" + pay_num + ", pay_pay=" + pay_pay + ", pay_way=" + pay_way
				+ ", board_no=" + board_no + ", pay_state=" + pay_state + ", member_email=" + member_email + "]";
	}

	
	
}