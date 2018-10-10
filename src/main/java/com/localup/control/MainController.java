package com.localup.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	
	@RequestMapping(value="index")
	public String indexGet(String logout, HttpServletRequest request) {
		if(logout!=null&&logout.equals("logout")) {
			request.getSession().removeAttribute("login");
		}
		return "main/index";
	}
	@RequestMapping("location")
	public String loc(Location loc, String board_type, Model model) {
		if(loc.getSouth()!=null) {
		List<BoardVO> list =service.listBoard(loc,board_type);
		model.addAttribute("list",list);
		}
		return "main/board";
	}
	@RequestMapping("first")
	public String loc2(Location loc,String board_type,String member_email, Model model) {
		if(loc.getSouth()!=null) {
			//System.out.println("loc2:::실행2>>>loc:"+loc+"\nboard_type:"+board_type);
		List<BoardVO> list =service.listBoard(loc,board_type);
		
		model.addAttribute("list",list);
		}else {
			List<BoardVO> list =service.listBoardAll();
		model.addAttribute("list",list);
		}
		return "main/location";
	}
	@RequestMapping("customOverlay")
	public String custom(String lng, String lat, Model model) {
		List<BoardVO> custom =service.listCustom(lat.substring(0,14), lng);
		model.addAttribute("custom",custom);
		return "main/custom";
	}
	@RequestMapping("locInfo")
	public String locInfo(String email, Model model) {
		if(email!=null) {
		String locInfo =service.locInfo(email);
		model.addAttribute("locInfo",locInfo);
		}
		return "main/locInfo";
	}
	@RequestMapping("search")
	public String search(String mainSearch, Model model) {
		List<String> listName=service.listName(mainSearch);
		String listNames = listName.size()+"|";
	    for(int i=0; i<listName.size(); i++){
	    	listNames += listName.get(i);
	    	if(i< listName.size()-1)listNames+=",";
	    }
	    //예시) 2|양말,양고기
		model.addAttribute("listNames",listNames);
		return "main/search";
	}
}
