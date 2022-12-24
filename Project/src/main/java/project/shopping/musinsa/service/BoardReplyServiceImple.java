package project.shopping.musinsa.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.shopping.musinsa.domain.BoardReplyVO;
import project.shopping.musinsa.persistence.BoardReplyDAO;

@Service
public class BoardReplyServiceImple implements BoardReplyService {
	private static final Logger logger = 
			LoggerFactory.getLogger(BoardReplyServiceImple.class);
	
	@Autowired
	private BoardReplyDAO boardReplyDAO; 
	
	// 댓글 등록
	@Override
	public int create(BoardReplyVO vo) {
		logger.info("replyCreate() 호출 : vo = " + vo.toString());
		return boardReplyDAO.insert(vo);
	}

	@Override
	public List<BoardReplyVO> read(int boardNumber) {
		logger.info("replyRead() 호출 : boardNumber = " + boardNumber);
		return boardReplyDAO.select(boardNumber);
	}

	// 댓글 수정
	@Override
	public int update(BoardReplyVO vo) {
		logger.info("replyUpdate() 호출 : vo = " + vo.toString());
		return boardReplyDAO.update(vo);
	}
	
	// 댓글 삭제
	@Override
	public int delete(int replyNumber) {
		logger.info("replyDelete() 호출  :replyNumber = " + replyNumber);
		return boardReplyDAO.delete(replyNumber);
	}
	


} // end BoardReplyServiceImple
