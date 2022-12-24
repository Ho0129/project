package project.shopping.musinsa.service;

import java.util.List;

import project.shopping.musinsa.domain.BoardReplyVO;

public interface BoardReplyService {

	// ´ñ±Û µî·Ï
	int create(BoardReplyVO vo);

	List<BoardReplyVO> read(int boardNumber);
	
	// ´ñ±Û ¼öÁ¤
	int update(BoardReplyVO vo);
	
	// ´ñ±Û »èÁ¦
	int delete(int replyNumber);
	
	
	
} // end BoardReplyService 
