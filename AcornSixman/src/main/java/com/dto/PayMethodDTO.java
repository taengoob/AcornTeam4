package com.dto;

public class PayMethodDTO
{
	private String payMethodId;
	private String payMethodName;
	private String payMethodDesc;
	private String payMethodSeq;
	public String getPayMethodId()
	{
		return payMethodId;
	}
	public void setPayMethodId(String payMethodId)
	{
		this.payMethodId = payMethodId;
	}
	public String getPayMethodName()
	{
		return payMethodName;
	}
	public void setPayMethodName(String payMethodName)
	{
		this.payMethodName = payMethodName;
	}
	public String getPayMethodDesc()
	{
		return payMethodDesc;
	}
	public void setPayMethodDesc(String payMethodDesc)
	{
		this.payMethodDesc = payMethodDesc;
	}
	public String getPayMethodSeq()
	{
		return payMethodSeq;
	}
	public void setPayMethodSeq(String payMethodSeq)
	{
		this.payMethodSeq = payMethodSeq;
	}
	public PayMethodDTO()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public PayMethodDTO(String payMethodId, String payMethodName, String payMethodDesc, String payMethodSeq)
	{
		super();
		this.payMethodId = payMethodId;
		this.payMethodName = payMethodName;
		this.payMethodDesc = payMethodDesc;
		this.payMethodSeq = payMethodSeq;
	}
	@Override
	public String toString()
	{
		return "PayMethodDTO [payMethodId=" + payMethodId + ", payMethodName=" + payMethodName + ", payMethodDesc="
				+ payMethodDesc + ", payMethodSeq=" + payMethodSeq + "]";
	}
	
}
