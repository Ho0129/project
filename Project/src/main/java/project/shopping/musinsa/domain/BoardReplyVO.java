package project.shopping.musinsa.domain;

public class BoardReplyVO {

	private int boardNumber;
	private int replyNumber;
	private String userId;
	private String replyContent;
	private String replyDateCreated;
	
	// 기본 생성자
	public BoardReplyVO() {}

	// 매개변수가 있는 생성자
	public BoardReplyVO(int boardNumber, int replyNumber, String userId, String replyContent, String replyDateCreated) {
		super();
		this.boardNumber = boardNumber;
		this.replyNumber = replyNumber;
		this.userId = userId;
		this.replyContent = replyContent;
		this.replyDateCreated = replyDateCreated;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public int getReplyNumber() {
		return replyNumber;
	}

	public void setReplyNumber(int replyNumber) {
		this.replyNumber = replyNumber;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDateCreated() {
		return replyDateCreated;
	}

	public void setReplyDateCreated(String replyDateCreated) {
		this.replyDateCreated = replyDateCreated;
	}

	@Override
	public String toString() {
		return "BoardReplyVO [boardNumber=" + boardNumber + ", replyNumber=" + replyNumber + ", userId=" + userId
				+ ", replyContent=" + replyContent + ", replyDateCreated=" + replyDateCreated + "]";
	}
	
} // end BoardReplyVO
