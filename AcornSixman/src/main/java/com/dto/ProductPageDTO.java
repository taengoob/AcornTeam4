package com.dto;

import java.util.List;

public class ProductPageDTO {
	private List<ProductDTO_Temp> list;
	private int curPage;    //현재 볼 페이지 번호 
	private int perPage=2;  //한페이지에 보여질 목록 수 
	private int totalCount;
	public ProductPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductPageDTO(List<ProductDTO_Temp> list, int curPage, int perPage, int totalCount) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
	}
	public List<ProductDTO_Temp> getList() {
		return list;
	}
	public void setList(List<ProductDTO_Temp> list) {
		this.list = list;
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
	@Override
	public String toString() {
		return "ProductPageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount="
				+ totalCount + "]";
	}
	
}
