package com.localup.control;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.localup.domain.GuideVO;
import com.localup.persistence.GuideDAO;
import com.localup.persistence.GuideDAOImpl;
import com.localup.service.GuideService;

@Controller
@RequestMapping("guide")
public class GuideController {
	
	//이미지 TEST
	//private static final Logger logger = LoggerFactory.getLogger(GuideController.class);
	
	@Inject
	GuideService guideService;
	
	//이미지 DB 입력
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//가이드 상세 페이지 (작성자 : rys)
	//가이드 상세 페이지 폼 보기
	@RequestMapping("guideDetailPage")
	public String guideDetailPage() throws Exception {
		return "board/guide";
	}
	
	//가이드 상세 페이지 등록 폼보기
	@RequestMapping(value="guideWrite",method=RequestMethod.GET)
	public String guideWriteGET() throws Exception {
		return "board/guideWrite";
	}

	//이미지 TEST
//	@RequestMapping(value="guideWrite",method=RequestMethod.GET)
//	public String guideWriteGET() throws Exception {
//		return "board/guideWriteTest";
//	}
	
	//가이드 상세 페이지 등록 ===> DB 입력처리
	@RequestMapping(value="guideWrite",method=RequestMethod.POST)
	public String guideWritePOST(GuideVO guideVO, MultipartFile tour_img) throws Exception {
		String savedName = uploadFile(tour_img.getOriginalFilename(),tour_img.getBytes());
		//guideVO.setTour_img(savedName);
		//guideService.insert(guideVO);
		return "main/main";
	}
	
	//이미지 TEST
//	@RequestMapping(value="guideWrite",method=RequestMethod.POST)
//	public String guideWritePOST(GuideVO guideVO,MultipartFile tour_img) throws Exception {
//		String savedName = uploadFile(tour_img.getOriginalFilename(),tour_img.getBytes());
//		guideVO.setTour_img(savedName);
//		guideService.insert(guideVO);
//		return "redirect:result";
//	}
	
//	//이미지 TEST
//	@RequestMapping("result")
//	public String result() {
//		return "board/guideWriteTest2";
//	}
	
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_upload_" + originalName;
		File target = new File(uploadPath,savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

}
