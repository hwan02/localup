package com.localup.control;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

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

import com.localup.domain.BoardVO;
import com.localup.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="contact", method=RequestMethod.GET) //contact 실험
	public String contact() throws Exception{
		return "contact";
	}

	@RequestMapping(value="write", method=RequestMethod.GET) //게시글 쓰기 폼
	public String writeGET() throws Exception{
		return "board/boardWrite";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST) //db입력
	public String writePOST(BoardVO boardVO, RedirectAttributes attr,MultipartFile board_imgs) throws Exception{
		System.out.println("board_img="+board_imgs);
		System.out.println("originalName: "+ board_imgs.getOriginalFilename());
		System.out.println("size: "+ board_imgs.getSize());
		System.out.println("contentType: "+ board_imgs.getContentType());
		String savedName = uploadFile(board_imgs.getOriginalFilename(),board_imgs.getBytes());
		attr.addAttribute("savedName",savedName);
		//model.addAttribute("savedName",savedName);
		
		boardVO.setBoard_img(savedName);
		
		System.out.println("contVO>>"+boardVO);
		boardService.BoardWrite(boardVO);
		//return "board/board";
		return "redirect:write";
	}
	
	//-----------------test Image Upload
	@RequestMapping(value="test", method=RequestMethod.GET) //게시글 쓰기 폼
	public String testGET() throws Exception{
		return "board/testWrite";
	}
	
	@ResponseBody
	@RequestMapping(value="test", method=RequestMethod.POST, produces="text/plain;charset=UTF-8") //db입력
	public String testPOST(MultipartFile file, Model model) throws Exception{
	//public ResponseEntity<String> testPOST(MultipartFile file, Model model) throws Exception{
		System.out.println("originalName: "+ file.getOriginalFilename());
		System.out.println("size: "+ file.getSize());
		System.out.println("contentType: "+ file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(),file.getBytes());
		
		model.addAttribute("savedName",savedName);
		return "board/testWrite";
		//return new ResponseEntity<>(file.getOriginalFilename(),HttpStatus.CREATED);
	}
	//-----------------test Image Upload
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception { //사진 중복되지 않게 id를 붙임 
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath,savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	@RequestMapping(value="read")
	public String read(int board_no,Model model) throws Exception{
		//model.addAttribute("path","C:\\localup\\img");
		model.addAttribute("boardVO",boardService.BoarRead(board_no));
		return "board/boardRead";
	}
}

