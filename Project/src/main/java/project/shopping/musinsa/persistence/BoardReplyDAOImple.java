package project.shopping.musinsa.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.shopping.musinsa.domain.BoardReplyVO;

@Repository
public class BoardReplyDAOImple implements BoardReplyDAO {
	
	private static final Logger logger =  
			LoggerFactory.getLogger(BoardDAOImple.class);
	private static final String NAMESPACE = 
			"project.shopping.musinsa.BoardReplyMapper";

	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 등록
	@Override
	public int insert(BoardReplyVO vo) {
		logger.info("replyInsert() 호출  : vo = " + vo.toString());
		return sqlSession.insert(NAMESPACE + ".reply_insert", vo);
	}

	// 댓글 전체 검색
	@Override
	public List<BoardReplyVO> select(int boardNumber) {
		logger.info("replySelect() 호출  : replyNumber = " + boardNumber);
		return sqlSession.selectList(NAMESPACE + ".select_all_by_board_number", boardNumber) ;
	}

	// 댓글 수정
	@Override
	public int update(BoardReplyVO vo) {
		logger.info("replyUpdate() 호출 : vo = " + vo.toString());
		return sqlSession.update(NAMESPACE + ".reply_update", vo );
	}

	// 댓글 삭제
	@Override
	public int delete(int replyNumber) {
		logger.info("replyDelete() 호출 : replyNumber = " + replyNumber);
		return sqlSession.delete(NAMESPACE + ".reply_delete", replyNumber);
	}
} // end BoardReplyDAOImple
