package project.shopping.musinsa.persistence;

import java.util.List;

import project.shopping.musinsa.domain.BoardReplyVO;

public interface BoardReplyDAO {

	// ´ñ±Û µî·Ï
	int insert(BoardReplyVO vo);
		
	// ´ñ±Û ÀüÃ¼ °Ë»ö
	List<BoardReplyVO> select(int boardNumber);
		
	// ´ñ±Û ¼öÁ¤
	int update(BoardReplyVO vo);
	
	// ´ñ±Û »èÁ¦
	int delete(int replyNumber);

} // end BoardReplyDAO

