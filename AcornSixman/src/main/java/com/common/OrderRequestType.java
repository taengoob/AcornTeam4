package com.common;

public enum OrderRequestType
{
	PAYMENT(0, "Payment")
	,DELIVERY(1, "Delivery");

	int value;
	String desc;

	public int getValue()
	{
		return value;
	}

	public String getDesc()
	{
		return desc;
	}

	private OrderRequestType(int value)
	{
		this.value = value;
		this.desc = "";
	}

	private OrderRequestType(int value, String desc)
	{
		this.value = value;
		this.desc = desc;
	}
}
