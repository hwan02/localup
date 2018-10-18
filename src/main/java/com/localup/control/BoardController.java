package com.localup.control;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.localup.domain.BoardVO;
import com.localup.domain.Criteria;
import com.localup.service.BoardService;
import com.localup.service.MemberService;
import com.localup.service.ReplyService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	@Inject
	ReplyService replyService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="contact", method=RequestMethod.GET) //contact 실험
	public String contact() throws Exception{
		return "contact";
	}

	@RequestMapping(value="write", method=RequestMethod.GET) //게시글 쓰기 폼
	public String writeGET(String board_title,String board_alti, String board_long, Model model) throws Exception{
		System.out.println(board_title);
		System.out.println(board_alti+board_long);
		model.addAttribute("board_alti", board_alti);
		model.addAttribute("board_long", board_long);
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
		boardService.boardWrite(boardVO);
		//return "board/board";
		return "redirect:/index";
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

	@RequestMapping(value="read", method=RequestMethod.GET) //게시글 상세페이지 --> http://localhost/board/read?board_no=2
	public String read(int board_no,Model model,HttpSession session) throws Exception{
		session.getAttribute("member_email");
		model.addAttribute("boardVO",boardService.boarRead(board_no));
		model.addAttribute("board_like",boardService.likeCount(board_no));
		model.addAttribute("replyCnt",replyService.count(board_no));
		return "board/boardRead";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET) //게시물 수정폼
	public String modGET(Model model, int board_no, @ModelAttribute("cri") Criteria cri) throws Exception {
		model.addAttribute("boardVO", boardService.boarRead(board_no));
		return "board/boardUpdate";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST) //게시물 DB 수정
	public String modPOST(BoardVO boardVO, RedirectAttributes attr, Criteria cri) throws Exception {
		boardService.boardUpdate(boardVO);//수정작업
		//attr.addFlashAttribute("msg","SUCCESS");
		
		//list.jsp를 호출하면서 유지해야 하는 URL 파라미터String 정의!!
		//attr.addAttribute("cri",cri); //에러
		//RedirectAttributes클래스 addAttribute()메소드에는 String을 저장!!
		//attr.addAttribute("page",cri.getPage());
		//attr.addAttribute("perPageNum",cri.getPerPageNum());
		
		return "redirect:/index"; //수정작업확인  //일단 메인
	}
	
	@RequestMapping("delete") //특정 게시물 삭제 (URL요청)
	public String delete(int board_no, RedirectAttributes attr, Criteria cri) throws Exception {
		System.out.println("delete board_no>>>"+board_no);
		boardService.boardDelete(board_no);
		//attr.addFlashAttribute("msg","SUCCESS");
		//attr.addAttribute("page",cri.getPage());
		//attr.addAttribute("perPageNum",cri.getPerPageNum());
		
		return "redirect:/index"; //메인
	}
	
	//좋아요
	@RequestMapping(value="like", method=RequestMethod.POST)
	public @ResponseBody int like(int board_no,Model model) throws Exception{
		System.out.println("like board_no>>>"+board_no);
		boardService.likeUp(board_no); //좋아요 갯수 update 0-->1, 1-->2
		//model.addAttribute("like",boardService.LikeCount(board_no));
		return boardService.likeCount(board_no);//"board/boardRead";
	}
	@RequestMapping(value="likeMinus", method=RequestMethod.POST)
	public @ResponseBody int likeMinus(int board_no,Model model) throws Exception{
		System.out.println("like board_no>>>"+board_no);
		boardService.likeMinus(board_no);
		return boardService.likeCount(board_no);//"board/boardRead";
	}
	
	
	//특정 아이디가 쓴 전체 게시글 조회 : 작성자 rys
	@RequestMapping("myWrite")
	public String myWrite(Model model,String member_email) throws Exception {
		System.out.println("member_email>>"+member_email);
		model.addAttribute("boardList",boardService.readIdBoard(member_email));
		return"my/myWrite";
	}

	
}

