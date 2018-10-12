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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//local 폴더에 저장 위치 호출
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//가이드 상세 페이지 (작성자 : rys)
	//가이드 상세 페이지 폼 보기
	@RequestMapping("guideDetailPage")
	public String guideDetailPage(Integer board_no, Model model) throws Exception {
		model.addAttribute("GuideVO",guideService.list(board_no));
		return "board/guide";
	}
	
	//가이드 상세 페이지 등록 폼보기
	@RequestMapping(value="guideWrite",method=RequestMethod.GET)
	public String guideWriteGET() throws Exception {
		return "board/guideWrite";
	}

	//가이드 상세 페이지 등록 ===> DB 입력처리
	@RequestMapping(value="guideWrite",method=RequestMethod.POST)
	public String guideWritePOST(GuideVO guideVO, MultipartFile tour_imgs) throws Exception {
		String savedName = uploadFile(tour_imgs.getOriginalFilename(),tour_imgs.getBytes());
		guideVO.setTour_img(savedName);
		guideService.insert(guideVO);
		return "redirect: /guide/main";
	}
	
	//가이드 상세 페이지 등록 ==이동==> 페인페이지
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
	//이미지 업로드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		//UUID uid = UUID.randomUUID();
		//String savedName = uid.toString() + "_upload_" + originalName;
		String savedName = "upload_" + originalName;
		File target = new File(uploadPath,savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	//가이드 상세 페이지 수정폼 보기
	@RequestMapping(value="guideUpdate",method=RequestMethod.GET)
	public String guideUpdateGET(Integer tour_no, Model model) throws Exception {
		model.addAttribute("GuideVO",guideService.list(tour_no));
		return "board/guideUpdate";
	}
	
	//가이드 상세 페이지 DB수정 요청
	@RequestMapping(value="guideUpdate",method=RequestMethod.POST)
	public String guideUpdatePOST(GuideVO guideVO,RedirectAttributes attr) throws Exception {
		
		if(guideService.update(guideVO)) { //수정 성공
			attr.addFlashAttribute("msg","success");
		}else { //수정 실패
			attr.addFlashAttribute("msg","upfail");
		}//if ~ else
		return "redirect:guideDetailPage";
	}
	
	//가이드 상세 페이지 DB삭제 요청
	@RequestMapping("guideDelete")
	public String guideDelete(Integer tour_no, Model model) throws Exception {
		if(guideService.delete(tour_no)) { //삭제성공
			model.addAttribute("msg","success");
		}else { //삭제실패
			model.addAttribute("msg","delfail");
		}
		return "redirect:/guide/main";
	}
	
}
