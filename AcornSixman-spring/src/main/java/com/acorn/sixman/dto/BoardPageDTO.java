package com.acorn.sixman.dto;

public class BoardPageDTO {
	
	private int curPage;
	private int perPage = 24;
	private int totalCount;
	private String searchGroup;
	private String searchValue;
	private String category;
	private int boardStart;
	private int boardEnd;
	private String view;
	private String Move;
	private String ContentId;
	
	public BoardPageDTO() {
		this.curPage = 1;
		this.perPage = 24;
		this.category = "BOARD";
	}

	public BoardPageDTO(int curPage, int perPage, int totalCount, String searchGroup, String searchValue,
			String category, int boardStart, int boardEnd, String view, String move, String contentId) {
		super();
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
		this.searchGroup = searchGroup;
		this.searchValue = searchValue;
		this.category = category;
		this.boardStart = boardStart;
		this.boardEnd = boardEnd;
		this.view = view;
		Move = move;
		ContentId = contentId;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getSearchGroup() {
		return searchGroup;
	}

	public void setSearchGroup(String searchGroup) {
		this.searchGroup = searchGroup;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getBoardStart() {
		return boardStart;
	}

	public void setBoardStart(int boardStart) {
		this.boardStart = boardStart;
	}

	public int getBoardEnd() {
		return boardEnd;
	}

	public void setBoardEnd(int boardEnd) {
		this.boardEnd = boardEnd;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getMove() {
		return Move;
	}

	public void setMove(String move) {
		Move = move;
	}

	public String getContentId() {
		return ContentId;
	}

	public void setContentId(String contentId) {
		ContentId = contentId;
	}

	@Override
	public String toString() {
		return "BoardPageDTO [curPage=" + curPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ ", searchGroup=" + searchGroup + ", searchValue=" + searchValue + ", category=" + category
				+ ", boardStart=" + boardStart + ", boardEnd=" + boardEnd + ", view=" + view + ", Move=" + Move
				+ ", ContentId=" + ContentId + "]";
	}

}
