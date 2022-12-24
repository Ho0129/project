package project.shopping.musinsa.persistence;

import java.util.List;

import project.shopping.musinsa.domain.BoardVO;
import project.shopping.musinsa.pageutil.PageCriteria;

public interface BoardDAO {

	// �Խù� ���
	int insert(BoardVO vo);
	
	// �Խù� �˻�
	BoardVO select(int boardNumber);
	
	// ����ڿ� �Խù� ��ü�˻�
	List<BoardVO> userSelect(String userId, PageCriteria criteria);
	
	/*
	 * // �Խù� ��ü �˻� List<BoardVO> 
	 * select();
	 */
		
	// �Խù� ����
	int update(BoardVO vo);
	
	// �Խù� ����
	int delete(int boardNumber);
	
	// ����¡ ó��
	List<BoardVO> select(PageCriteria criteria);
	
	// �� �Խñ� ��
	int getTotalCounts();
	
	// ����� �Խñ� ��
	int userBoardCounts(String userId);
	
	List<BoardVO> select(String boardNumber);
	
	
} // end BoardVO
