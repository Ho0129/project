package project.shopping.musinsa.service;

import java.util.List;

import project.shopping.musinsa.domain.BoardReplyVO;

public interface BoardReplyService {

	// ��� ���
	int create(BoardReplyVO vo);

	List<BoardReplyVO> read(int boardNumber);
	
	// ��� ����
	int update(BoardReplyVO vo);
	
	// ��� ����
	int delete(int replyNumber);
	
	
	
} // end BoardReplyService 
