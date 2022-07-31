package com.dto;

public class CategoryDTO
{
	private String categoryId;
	private String categoryName;
	private String categoryDesc;
	private int categorySeq;
	
	public String getCategoryId()
	{
		return categoryId;
	}
	public void setCategoryId(String categoryId)
	{
		this.categoryId = categoryId;
	}
	public String getCategoryName()
	{
		return categoryName;
	}
	public void setCategoryName(String categoryName)
	{
		this.categoryName = categoryName;
	}
	public String getCategoryDesc()
	{
		return categoryDesc;
	}
	public void setCategoryDesc(String categoryDesc)
	{
		this.categoryDesc = categoryDesc;
	}
	public int getCategorySeq()
	{
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq)
	{
		this.categorySeq = categorySeq;
	}
	
	public CategoryDTO()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryDTO(String categoryId, String categoryName, String categoryDesc)
	{
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryDesc = categoryDesc;
	}
	
	@Override
	public String toString()
	{
		return "CategoryDTO [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryDesc="
				+ categoryDesc + "]";
	}
	
	
}
