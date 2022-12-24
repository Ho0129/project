package project.shopping.musinsa.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.shopping.musinsa.domain.BoardVO;
import project.shopping.musinsa.pageutil.PageCriteria;

@Repository
public class BoardDAOImple implements BoardDAO{

		private static final Logger logger =  
				LoggerFactory.getLogger(BoardDAOImple.class);
		private static final String NAMESPACE = 
				"project.shopping.musinsa.boardMapper";
	
		@Autowired
		private SqlSession sqlSession;
		
	// 게시물 등록
	@Override
	public int insert(BoardVO vo) {
		logger.info("insert() 호출 : vo = " + vo.toString());
		return sqlSession.insert(NAMESPACE + ".board_insert", vo);
	}

	// 게시물 검색
	@Override
	public BoardVO select(int boardNumber) {
		logger.info("select() 호출 : boardNumber = " + boardNumber);
		return sqlSession.selectOne(NAMESPACE + ".select_by_board_number", boardNumber);
	}

//	// 게시물 전체 검색
//	@Override
//	public List<BoardVO> select() {
//		logger.info("select()123213 호출");
//		return sqlSession.selectList(NAMESPACE + ".select_all");
//	}

	// 게시물 수정
	@Override
	public int update(BoardVO vo) {
		logger.info("update()호출 : vo = " + vo.toString()); 
		return sqlSession.update(NAMESPACE + ".board_update", vo) ;
	}

	// 게시물 삭제
	@Override
	public int delete(int boardNumber) {
		logger.info("delete()호출 : boardNumber = " + boardNumber);
		return sqlSession.delete(NAMESPACE + ".board_delete", boardNumber);
	}

	// 전체게시물 조회(관리자용)
	@Override
	public List<BoardVO> select(PageCriteria criteria) {
		logger.info("select()관리자용 호출");
		logger.info("start = " + criteria.getStart());
		logger.info("end = " + criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".paging", criteria);
	}

	// 총 게시글 수
	@Override
	public int getTotalCounts() {
		logger.info("getTotalCounts() 호출");
		return sqlSession.selectOne(NAMESPACE + ".total_count");
	}
	
	// 사용자 게시글 수
	@Override
	public int userBoardCounts(String userId) {
		logger.info("userBoardCounts() 호출");
		return sqlSession.selectOne(NAMESPACE + ".user_board_count", userId); 
	}

	@Override
	public List<BoardVO> select(String boardNumber) {
		logger.info("select() 호출 : boardNumber = " + boardNumber);
		return sqlSession.selectList(NAMESPACE + ".select_by_userid" , "%" + boardNumber + "%");
	}

	@Override
	public List<BoardVO> userSelect(String userId, PageCriteria criteria) {
		logger.info("select() 호출 : userId = " + userId );
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("userId", userId);
		args.put("start", criteria.getStart());
		args.put("end", criteria.getEnd());
		
		List<BoardVO> list = sqlSession.selectList(NAMESPACE + ".user_select_all", args);
		return list; 
	}

} // end BoardDAOImple
