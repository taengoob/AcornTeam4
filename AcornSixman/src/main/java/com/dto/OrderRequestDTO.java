package com.dto;

public class OrderRequestDTO
{
	private String requestId;
	private String orderId;
	private String orderStatus;
	private String requestRegDate;
	private String requestUpdateDate;
	private String requestType;
	private String productName;
	private String userId;
	private int deliveryCount;
	
	public String getRequestId()
	{
		return requestId;
	}
	public void setRequestId(String requestId)
	{
		this.requestId = requestId;
	}
	public String getOrderId()
	{
		return orderId;
	}
	public void setOrderId(String orderId)
	{
		this.orderId = orderId;
	}
	public String getOrderStatus()
	{
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus)
	{
		this.orderStatus = orderStatus;
	}
	public String getRequestRegDate()
	{
		return requestRegDate;
	}
	public void setRequestRegDate(String requestRegDate)
	{
		this.requestRegDate = requestRegDate;
	}
	public String getRequestUpdateDate()
	{
		return requestUpdateDate;
	}
	public void setRequestUpdateDate(String requestUpdateDate)
	{
		this.requestUpdateDate = requestUpdateDate;
	}
	public String getRequestType()
	{
		return requestType;
	}
	public void setRequestType(String requestType)
	{
		this.requestType = requestType;
	}
	public String getProductName()
	{
		return productName;
	}
	public void setProductName(String productName)
	{
		this.productName = productName;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public int getdeliveryCount()
	{
		return deliveryCount;
	}
	public void setdeliveryCount(int deliveryCount)
	{
		this.deliveryCount = deliveryCount;
	}
	
	public OrderRequestDTO()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderRequestDTO(String requestId, String orderId, String orderStatus, String requestRegDate,
			String requestUpdateDate, String requestType, String productName, int deliveryCount)
	{
		super();
		this.requestId = requestId;
		this.orderId = orderId;
		this.orderStatus = orderStatus;
		this.requestRegDate = requestRegDate;
		this.requestUpdateDate = requestUpdateDate;
		this.requestType = requestType;
		this.productName = productName;
		this.deliveryCount = deliveryCount;
	}
	
	@Override
	public String toString()
	{
		return "OrderRequestDTO [requestId=" + requestId + ", orderId=" + orderId + ", orderStatus=" + orderStatus
				+ ", requestRegDate=" + requestRegDate + ", requestUpdateDate=" + requestUpdateDate + ", requestType="
				+ requestType + ", productName=" + productName + "]";
	}
}
