package project.shopping.musinsa.persistence;

import java.util.List;

import project.shopping.musinsa.domain.BoardVO;
import project.shopping.musinsa.pageutil.PageCriteria;

public interface BoardDAO {

	// 게시물 등록
	int insert(BoardVO vo);
	
	// 게시물 검색
	BoardVO select(int boardNumber);
	
	// 사용자용 게시물 전체검색
	List<BoardVO> userSelect(String userId, PageCriteria criteria);
	
	/*
	 * // 게시물 전체 검색 List<BoardVO> 
	 * select();
	 */
		
	// 게시물 수정
	int update(BoardVO vo);
	
	// 게시물 삭제
	int delete(int boardNumber);
	
	// 페이징 처리
	List<BoardVO> select(PageCriteria criteria);
	
	// 총 게시글 수
	int getTotalCounts();
	
	// 사용자 게시글 수
	int userBoardCounts(String userId);
	
	List<BoardVO> select(String boardNumber);
	
	
} // end BoardVO
