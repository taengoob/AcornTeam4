package com.dto;

public class BoardReplyDTO {
	
	private String boardContentId;
	private String boardReplyId;
	private String boardUserId;
	private String boardReplyContent;
	private String boardReplyRegDate;
	private String boardReplyUpdateDate;
	private String boardReplyDelDate;
	private int boardReplyDepth;
	private int boardReplyGroup;
	
	public BoardReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardReplyDTO(String boardContentId, String boardReplyId, String boardUserId, String boardReplyContent,
			String boardReplyRegDate, String boardReplyUpdateDate, String boardReplyDelDate, int boardReplyDepth,
			int boardReplyGroup) {
		super();
		this.boardContentId = boardContentId;
		this.boardReplyId = boardReplyId;
		this.boardUserId = boardUserId;
		this.boardReplyContent = boardReplyContent;
		this.boardReplyRegDate = boardReplyRegDate;
		this.boardReplyUpdateDate = boardReplyUpdateDate;
		this.boardReplyDelDate = boardReplyDelDate;
		this.boardReplyDepth = boardReplyDepth;
		this.boardReplyGroup = boardReplyGroup;
	}

	public String getBoardContentId() {
		return boardContentId;
	}

	public void setBoardContentId(String boardContentId) {
		this.boardContentId = boardContentId;
	}

	public String getBoardReplyId() {
		return boardReplyId;
	}

	public void setBoardReplyId(String boardReplyId) {
		this.boardReplyId = boardReplyId;
	}

	public String getBoardUserId() {
		return boardUserId;
	}

	public void setBoardUserId(String boardUserId) {
		this.boardUserId = boardUserId;
	}

	public String getBoardReplyContent() {
		return boardReplyContent;
	}

	public void setBoardReplyContent(String boardReplyContent) {
		this.boardReplyContent = boardReplyContent;
	}

	public String getBoardReplyRegDate() {
		return boardReplyRegDate;
	}

	public void setBoardReplyRegDate(String boardReplyRegDate) {
		this.boardReplyRegDate = boardReplyRegDate;
	}

	public String getBoardReplyUpdateDate() {
		return boardReplyUpdateDate;
	}

	public void setBoardReplyUpdateDate(String boardReplyUpdateDate) {
		this.boardReplyUpdateDate = boardReplyUpdateDate;
	}

	public String getBoardReplyDelDate() {
		return boardReplyDelDate;
	}

	public void setBoardReplyDelDate(String boardReplyDelDate) {
		this.boardReplyDelDate = boardReplyDelDate;
	}

	public int getBoardReplyDepth() {
		return boardReplyDepth;
	}

	public void setBoardReplyDepth(int boardReplyDepth) {
		this.boardReplyDepth = boardReplyDepth;
	}

	public int getBoardReplyGroup() {
		return boardReplyGroup;
	}

	public void setBoardReplyGroup(int boardReplyGroup) {
		this.boardReplyGroup = boardReplyGroup;
	}

	@Override
	public String toString() {
		return "BoardReplyDTO [boardContentId=" + boardContentId + ", boardReplyId=" + boardReplyId + ", boardUserId="
				+ boardUserId + ", boardReplyContent=" + boardReplyContent + ", boardReplyRegDate=" + boardReplyRegDate
				+ ", boardReplyUpdateDate=" + boardReplyUpdateDate + ", boardReplyDelDate=" + boardReplyDelDate
				+ ", boardReplyDepth=" + boardReplyDepth + ", boardReplyGroup=" + boardReplyGroup + "]";
	}
	
}
