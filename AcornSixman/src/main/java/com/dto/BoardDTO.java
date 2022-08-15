package com.dto;

public class BoardDTO {
	
	private String boardContentId;
	private String boardCategory;
	private String boardUserId;
	private String boardTitle;
	private String boardContent;
	private String boardRegDate;
	private String boardUpdateDate;
	private String boardDelDate;
	private int boardHitCount;
	private String boardSubCategory;
	private String boardPreviewImg;
	
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(String boardContentId, String boardCategory, String boardUserId, String boardTitle,
			String boardContent, String boardRegDate, String boardUpdateDate, String boardDelDate, int boardHitCount,
			String boardSubCategory, String boardPreviewImg) {
		super();
		this.boardContentId = boardContentId;
		this.boardCategory = boardCategory;
		this.boardUserId = boardUserId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardRegDate = boardRegDate;
		this.boardUpdateDate = boardUpdateDate;
		this.boardDelDate = boardDelDate;
		this.boardHitCount = boardHitCount;
		this.boardSubCategory = boardSubCategory;
		this.boardPreviewImg = boardPreviewImg;
	}

	public String getBoardContentId() {
		return boardContentId;
	}

	public void setBoardContentId(String boardContentId) {
		this.boardContentId = boardContentId;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getBoardUserId() {
		return boardUserId;
	}

	public void setBoardUserId(String boardUserId) {
		this.boardUserId = boardUserId;
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

	public String getBoardRegDate() {
		return boardRegDate;
	}

	public void setBoardRegDate(String boardRegDate) {
		this.boardRegDate = boardRegDate;
	}

	public String getBoardUpdateDate() {
		return boardUpdateDate;
	}

	public void setBoardUpdateDate(String boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}

	public String getBoardDelDate() {
		return boardDelDate;
	}

	public void setBoardDelDate(String boardDelDate) {
		this.boardDelDate = boardDelDate;
	}

	public int getBoardHitCount() {
		return boardHitCount;
	}

	public void setBoardHitCount(int boardHitCount) {
		this.boardHitCount = boardHitCount;
	}

	public String getBoardSubCategory() {
		return boardSubCategory;
	}

	public void setBoardSubCategory(String boardSubCategory) {
		this.boardSubCategory = boardSubCategory;
	}

	public String getBoardPreviewImg() {
		return boardPreviewImg;
	}

	public void setBoardPreviewImg(String boardPreviewImg) {
		this.boardPreviewImg = boardPreviewImg;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardContentId=" + boardContentId + ", boardCategory=" + boardCategory + ", boardUserId="
				+ boardUserId + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardRegDate="
				+ boardRegDate + ", boardUpdateDate=" + boardUpdateDate + ", boardDelDate=" + boardDelDate
				+ ", boardHitCount=" + boardHitCount + ", boardSubCategory=" + boardSubCategory + ", boardPreviewImg="
				+ boardPreviewImg + "]";
	}
	
	
	
}
