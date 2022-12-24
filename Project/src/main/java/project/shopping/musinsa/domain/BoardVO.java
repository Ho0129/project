package project.shopping.musinsa.domain;

import java.util.Date;

public class BoardVO {
	
	// ��� ����
	private int boardNumber; // �Խ��� ��ȣ
	private String userId; // �� �ۼ���
	private String boardTitle; // �Խ��� ����
	private String boardContent; // �Խ��� ����
	private Date boardDateCreated; // �Խ��� �ۼ� �ð�
	private String boardQnAList; // �Խ��� ���� ����

	// �⺻ ������
	public BoardVO() {}
	
	// �Ű������� �ִ� ������
	public BoardVO(int boardNumber, String userId, String boardTitle, String boardContent, Date boardDateCreated,
			String boardQnAList) {
		super();
		this.boardNumber = boardNumber;
		this.userId = userId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDateCreated = boardDateCreated;
		this.boardQnAList = boardQnAList;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDateCreated() {
		return boardDateCreated;
	}

	public void setBoardDateCreated(Date boardDateCreated) {
		this.boardDateCreated = boardDateCreated;
	}

	public String getBoardQnAList() {
		return boardQnAList;
	}

	public void setBoardQnAList(String boardQnAList) {
		this.boardQnAList = boardQnAList;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNumber=" + boardNumber + ", userId=" + userId + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardDateCreated=" + boardDateCreated + ", boardQnAList="
				+ boardQnAList + "]";
	}
	
} // end boardVO
