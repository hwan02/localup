package com.localup.control;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.localup.service.BoardService;
import com.localup.service.RankService;

@Controller
@RequestMapping("rank")
public class RankController {
	
	@Inject
	RankService rankService;
	
	//게시글 타입별 랭킹 (좋아요 순)
	@RequestMapping(value="category", method=RequestMethod.GET)
	public String category(Model model) throws Exception{
		model.addAttribute("restaurant",rankService.rankCategory1());
		model.addAttribute("traffic",rankService.rankCategory2());
		model.addAttribute("facilities",rankService.rankCategory3());
		model.addAttribute("lodgment",rankService.rankCategory4());
		model.addAttribute("randmark",rankService.rankCategory5());
		
		return "board/rankBoard";
	}
	
}

