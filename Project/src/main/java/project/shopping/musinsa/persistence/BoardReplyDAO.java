package project.shopping.musinsa.persistence;

import java.util.List;

import project.shopping.musinsa.domain.BoardReplyVO;

public interface BoardReplyDAO {

	// ��� ���
	int insert(BoardReplyVO vo);
		
	// ��� ��ü �˻�
	List<BoardReplyVO> select(int boardNumber);
		
	// ��� ����
	int update(BoardReplyVO vo);
	
	// ��� ����
	int delete(int replyNumber);

} // end BoardReplyDAO

