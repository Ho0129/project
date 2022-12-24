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
	
	// ��� ���
	@Override
	public int create(BoardReplyVO vo) {
		logger.info("replyCreate() ȣ�� : vo = " + vo.toString());
		return boardReplyDAO.insert(vo);
	}

	@Override
	public List<BoardReplyVO> read(int boardNumber) {
		logger.info("replyRead() ȣ�� : boardNumber = " + boardNumber);
		return boardReplyDAO.select(boardNumber);
	}

	// ��� ����
	@Override
	public int update(BoardReplyVO vo) {
		logger.info("replyUpdate() ȣ�� : vo = " + vo.toString());
		return boardReplyDAO.update(vo);
	}
	
	// ��� ����
	@Override
	public int delete(int replyNumber) {
		logger.info("replyDelete() ȣ��  :replyNumber = " + replyNumber);
		return boardReplyDAO.delete(replyNumber);
	}
	


} // end BoardReplyServiceImple
