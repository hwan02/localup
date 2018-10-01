package com.localup.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class GuideVO {
//	private Integer tour_no;	/* 투어번호 */
//	private String tour_title; 	/* 투어명 */
//	private Date tour_sdate; 	/* 투어시작일시 */
//	private Date tour_edate; 	/* 투어종료일시 */
//	private Integer tour_pay; 	/* 투어금액 */
//	private String tour_cont; 	/* 투어내용 */
//	private String tour_img; 	/* 투어이미지 */
//	private Integer board_no; 	/* 게시글번호 */
//
//	public Integer getTour_no() {
//		return tour_no;
//	}
//
//	public void setTour_no(Integer tour_no) {
//		this.tour_no = tour_no;
//	}
//
//	public String getTour_title() {
//		return tour_title;
//	}
//
//	public void setTour_title(String tour_title) {
//		this.tour_title = tour_title;
//	}
//
//	public Date getTour_sdate() {
//		return tour_sdate;
//	}
//
//	public void setTour_sdate(Date tour_sdate) {
//		this.tour_sdate = tour_sdate;
//	}
//
//	public Date getTour_edate() {
//		return tour_edate;
//	}
//
//	public void setTour_edate(Date tour_edate) {
//		this.tour_edate = tour_edate;
//	}
//
//	public Integer getTour_pay() {
//		return tour_pay;
//	}
//
//	public void setTour_pay(Integer tour_pay) {
//		this.tour_pay = tour_pay;
//	}
//
//	public String getTour_cont() {
//		return tour_cont;
//	}
//
//	public void setTour_cont(String tour_cont) {
//		this.tour_cont = tour_cont;
//	}
//
//	public String getTour_img() {
//		return tour_img;
//	}
//
//	public void setTour_img(String tour_img) {
//		this.tour_img = tour_img;
//	}
//
//	public Integer getBoard_no() {
//		return board_no;
//	}
//
//	public void setBoard_no(Integer board_no) {
//		this.board_no = board_no;
//	}
//
//	@Override
//	public String toString() {
//		return "GuideVO [tour_no=" + tour_no + ", tour_title=" + tour_title + ", tour_sdate=" + tour_sdate
//				+ ", tour_edate=" + tour_edate + ", tour_pay=" + tour_pay + ", tour_cont=" + tour_cont + ", tour_img="
//				+ tour_img + ", board_no=" + board_no + "]";
//	}

    private MultipartFile imgFile;
    
    public MultipartFile getImgFile() {
        return imgFile;
    }
 
    public void setImgFile(MultipartFile imgFile) {
        this.imgFile = imgFile;
    }
	
	
}
