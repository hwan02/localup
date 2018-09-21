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
@RequestMapping("main")
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
	
	@RequestMapping("location")
	public String loc(Location loc, Model model) {
		if(loc!=null) {
		List<BoardVO> list =service.listBoard(loc);
		System.out.println(list);
		}
		return "jsp/test";
	}
}
