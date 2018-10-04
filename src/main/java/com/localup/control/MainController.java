package com.localup.control;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.localup.domain.BoardVO;
import com.localup.domain.Location;
import com.localup.service.MainService;

@Controller
public class MainController {
	
	@Inject
	private MainService service;
	
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("test")
	public String test() {
		return "test";
	}
	@RequestMapping("test2")
	public String test2() {
		return "test2";
	}
	@RequestMapping("index")
	public String index() {
		return "main/index";
	}
	@RequestMapping("location")
	public String loc(Location loc, String board_type, Model model) {
		if(loc.getSouth()!=null) {
			System.out.println("loc:::실행2>>>loc:"+loc+"\nboard_type:"+board_type);
		List<BoardVO> list =service.listBoard(loc,board_type);
		System.out.println(list);
		model.addAttribute("list",list);
		}
		return "jsp/test";
	}
	@RequestMapping("first")
	public String loc2(Location loc,String board_type, Model model) {
		if(loc.getSouth()!=null) {
			System.out.println("not null이네");
			//System.out.println("loc2:::실행2>>>loc:"+loc+"\nboard_type:"+board_type);
		List<BoardVO> list =service.listBoard(loc,board_type);
		System.out.println(list);
		model.addAttribute("list",list);
		}else {
			System.out.println("else실행 되었습니다");
			List<BoardVO> list =service.listBoardAll();
			model.addAttribute("list",list);
		}
		return "main/location";
	}
}
