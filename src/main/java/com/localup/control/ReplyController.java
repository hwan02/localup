package com.localup.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.localup.domain.Criteria;
import com.localup.domain.PageMaker;
import com.localup.domain.ReplyVO;
import com.localup.service.ReplyService;

@RestController //Ajax전용 컨트롤러
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	ReplyService replyService;
	
	//댓글입력
	//@ResponseBody : VO ---> JSON
	//@RequestBody : JSON ---> VO : 보내는 쪽에서 JSON 명시를 해야함
	@RequestMapping(value="",method=RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody ReplyVO replyVO) {
		//ResponseEntitiy<클라이언트에게 전달할 자료형>
		
		ResponseEntity<String> entity = null;
		try {
			replyService.addReply(replyVO);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);//200
		} catch (Exception e) {
			//입력실패
			entity = new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);//400
			e.printStackTrace();
		}
			
		return entity;
	}//write
		
	//특정 게시물에 대한 전체 댓글 조회
	//실제요청 ===> /reply/all/120
	@RequestMapping(value="/all/{board_no}",method=RequestMethod.GET)
	//{board_no} ---> 파라미터값의 역할
	public List<ReplyVO> list(@PathVariable("board_no")Integer board_no) {
		List<ReplyVO> list = null;
		try {
			list = replyService.listReply(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}//list
		
	//페이징된 댓글
	//실제요청: /reply/120/2 ===> 120:글번호, 2:2페이지
	@RequestMapping(value="/{board_no}/{page}",method=RequestMethod.GET)
	public Map<String, Object> listPage(@PathVariable("board_no") int board_no, @PathVariable("page") int page) {
		List<ReplyVO> list = null;
		Map<String, Object> map = new HashMap<>();
			
		try {
			Criteria cri = new Criteria(); //기본값: 1페이지, 10개의 레코드
			cri.setPage(page); //2페이지, 10개의 레코드
				
			PageMaker pageMaker = new PageMaker(); //번호출력
			pageMaker.setCri(cri); //현재페이지에 대한 정보
			int totalCount = replyService.count(board_no);
			pageMaker.setTotalCount(totalCount); //마지막 페이지 Number
			//1페이지(예:1 2 3 4 5 6 7 8 9 10)
			//2페이지(예:11 12 13 14 15)
				
			list = replyService.listReplyPage(board_no, cri); //페이징된(범위:cri) 댓글 조회
				
			//pageMaker와 list정보를 한개의 변수(객체)에 저장!! ===> Map
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return list; //[{VO},{VO}]
		return map; //{"list":[{VO},{VO}],"pageMaker":pageMaker}
	}//listPage
		
	//특정 댓글 수정
	//실제요청 ===> /reply/2
	@RequestMapping(value="/{reply_no}",method={RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("reply_no")int reply_no, @RequestBody ReplyVO replyVO/*수정할 데이터*/) {
		ResponseEntity<String> entity = null;
		//데이터와 함께 (조작된)서버의 상태(status)를 전달
			
		try {
			replyVO.setReply_no(reply_no);//URL경로를 통해 전달받은 rno값을 VO에 설정.
			System.out.println(replyVO);
			replyService.modifyReply(replyVO);
			//return "SUCCESS";
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);//200
		} catch (Exception e) {
			System.out.println(replyVO);
			e.printStackTrace();
			//return "FAIL";
			entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);//400
		}
		return entity;
	}//update
		
	//특정 댓글 삭제
	//실제요청 ===> /reply/1
	@RequestMapping(value="/{reply_no}",method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reply_no") int reply_no) {
		try {
			replyService.removeReply(reply_no);
			return new ResponseEntity<>("SUCCESS",HttpStatus.OK);//200
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("FAIL",HttpStatus.BAD_REQUEST);
		}
	}//remove
	
}
