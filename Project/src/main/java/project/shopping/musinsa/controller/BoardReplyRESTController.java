package project.shopping.musinsa.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import project.shopping.musinsa.domain.BoardReplyVO;
import project.shopping.musinsa.service.BoardReplyService;

@RestController
@RequestMapping(value="/boardreplies")
public class BoardReplyRESTController {
	private static final Logger logger =
			LoggerFactory.getLogger(BoardReplyRESTController.class);

	@Autowired
	private BoardReplyService boardReplyService;
	
	@PostMapping // POST - 댓글 입력
	public ResponseEntity<Integer> createBoardReply(
		@RequestBody BoardReplyVO vo){
		logger.info("createBoardReply() 호출 : vo = " + vo.toString());
		int result = boardReplyService.create(vo);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	} // end createBoardReply
	
	@GetMapping("/all/{boardNumber}") // GET : 댓글 선택(all)
	public ResponseEntity<List<BoardReplyVO>> readBoardReply(
			@PathVariable("boardNumber") int boardNumber) {
		logger.info("-=-=-=-=-=--=-=-=-=-=readBoardReply 호출");
		List<BoardReplyVO> list = boardReplyService.read(boardNumber);
		return new ResponseEntity<List<BoardReplyVO>>(list, HttpStatus.OK);
	} // end readBorardReply
	
	@PutMapping("/{replyNumber}")
	public ResponseEntity<Integer> updateBoardReply(
			@PathVariable("replyNumber") int replyNumber,
			@RequestBody BoardReplyVO vo) {
		vo.setReplyNumber(replyNumber);
		int result = boardReplyService.update(vo);
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
	} // end updateBoardReply
	
	@DeleteMapping("/{replyNumber}")
	public ResponseEntity<Integer> deleteBoardReply (
			@PathVariable("replyNumber") int replyNumber) {
		logger.info("replyNumber = " + replyNumber);
		int result = boardReplyService.delete(replyNumber);
		return new ResponseEntity<Integer>(result, HttpStatus.OK);
	}// end deleteBoardReply

	
}// end BoardReplyRESTController
 