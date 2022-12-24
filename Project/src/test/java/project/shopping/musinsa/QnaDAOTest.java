package project.shopping.musinsa;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import project.shopping.musinsa.domain.QnaVO;
import project.shopping.musinsa.persistence.QnaDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class QnaDAOTest {
	private static final Logger logger =
			LoggerFactory.getLogger(QnaDAOTest.class);
	
	@Autowired
	private QnaDAO dao;
	
	@Test
	public void testDAO() {
		testInsert();
//		testSelectAll();
//		testSelectByIndex();
//		testUpdate();
//		testDelete();
	} // end testDAO()


	private void testInsert() {
		QnaVO vo = new QnaVO(0, "호", null, "배송 문의", "이거 언제 오나요..?", null, "배송 관련 문의입니다.", 1, null);
		int result = dao.insert(vo);
		logger.info(result + "행 삽입");
	} // end testInsert()
	
	private void testSelectAll() {
		List<QnaVO> list = dao.select(1);
		logger.info(list.size() + "");
		for(QnaVO vo : list) {
			logger.info(vo.toString());
		}
	} // end testSelect()
	
	private void testSelectByIndex() {
		QnaVO vo = dao.select1(2);
		logger.info(vo.toString());
	} // end testSelectByIndex()
	
	private void testUpdate() {
		QnaVO vo = new QnaVO(0, "hoho", "답변완료", "배송 문의", "ok1", null, "제목", 1, null);
		int result = dao.update(vo);
		if(result == 1) {
			logger.info(result + "행 수정");
		}
		
	} // end testUpdate()
	
	private void testDelete() {
		int result = dao.delete(2);
		if(result == 1) {
			logger.info(result + "행 삭제");
		}
	} // end testDelete()

} // end QnaDAOTest
