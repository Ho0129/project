package project.shopping.musinsa.persistence;

import java.util.List;

import project.shopping.musinsa.domain.ReviewVO;

public interface ReviewDAO {
	// ���� ���
	int insert(ReviewVO rvo);
	
	// ���� �� ���� ��������
	List<ReviewVO> select(int productNumber);
	
	// ���� ����
	int delete(int reviewNumber);
	
} // end ReviewDAO
