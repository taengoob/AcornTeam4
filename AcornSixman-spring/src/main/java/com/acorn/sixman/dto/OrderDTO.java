package com.acorn.sixman.dto;

import java.util.Date;

public class OrderDTO {
	private String orderId;
	private String orderProductId;
	private String orderUserId;
	private String orderSellerId;
	private String orderStatus;
	private Date orderRegDate;
	private Date orderUpdateDate;
	private String orderRecvPhone;
	private int orderAmount;
	private String orderRecvAddressNumber;
	private int orderPaymentPrice;
	private String orderRecvAddressRoad;
	private int orderProdPrice;
	private int orderDeliveryPrice;
	private String orderRecvName;
	private String displayStatus;
	private String orderPayMethod;
	private String orderPayMethodDesc;

	private ProductDTO_Temp product;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderProductId() {
		return orderProductId;
	}

	public void setOrderProductId(String orderProductId) {
		this.orderProductId = orderProductId;
	}

	public String getOrderUserId() {
		return orderUserId;
	}

	public void setOrderUserId(String orderUserId) {
		this.orderUserId = orderUserId;
	}

	public String getOrderSellerId() {
		return orderSellerId;
	}

	public void setOrderSellerId(String orderSellerId) {
		this.orderSellerId = orderSellerId;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Date getOrderRegDate() {
		return orderRegDate;
	}

	public void setOrderRegDate(Date orderRegDate) {
		this.orderRegDate = orderRegDate;
	}

	public Date getOrderUpdateDate() {
		return orderUpdateDate;
	}

	public void setOrderUpdateDate(Date orderUpdateDate) {
		this.orderUpdateDate = orderUpdateDate;
	}

	public String getOrderRecvPhone() {
		return orderRecvPhone;
	}

	public void setOrderRecvPhone(String orderRecvPhone) {
		this.orderRecvPhone = orderRecvPhone;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderRecvAddressNumber() {
		return orderRecvAddressNumber;
	}

	public void setOrderRecvAddressNumber(String orderRecvAddressNumber) {
		this.orderRecvAddressNumber = orderRecvAddressNumber;
	}

	public int getOrderPaymentPrice() {
		return orderPaymentPrice;
	}

	public void setOrderPaymentPrice(int orderPaymentPrice) {
		this.orderPaymentPrice = orderPaymentPrice;
	}

	public String getOrderRecvAddressRoad() {
		return orderRecvAddressRoad;
	}

	public void setOrderRecvAddressRoad(String orderRecvAddressRoad) {
		this.orderRecvAddressRoad = orderRecvAddressRoad;
	}

	public int getOrderProdPrice() {
		return orderProdPrice;
	}

	public void setOrderProdPrice(int orderProdPrice) {
		this.orderProdPrice = orderProdPrice;
	}

	public int getOrderDeliveryPrice() {
		return orderDeliveryPrice;
	}

	public void setOrderDeliveryPrice(int orderDeliveryPrice) {
		this.orderDeliveryPrice = orderDeliveryPrice;
	}

	public String getOrderRecvName() {
		return orderRecvName;
	}

	public void setOrderRecvName(String orderRecvName) {
		this.orderRecvName = orderRecvName;
	}

	public ProductDTO_Temp getProduct() {
		return product;
	}

	public void setProduct(ProductDTO_Temp product) {
		this.product = product;
	}

	public String getDisplayStatus() {
		return displayStatus;
	}

	public void setDisplayStatus(String displayStatus) {
		this.displayStatus = displayStatus;
	}

	public String getOrderPayMethod() {
		return orderPayMethod;
	}

	public void setOrderPayMethod(String orderPayMethod) {
		this.orderPayMethod = orderPayMethod;
	}

	public String getOrderPayMethodDesc() {
		return orderPayMethodDesc;
	}

	public void setOrderPayMethodDesc(String orderPayMethodDesc) {
		this.orderPayMethodDesc = orderPayMethodDesc;
	}

	public OrderDTO() {
		super();
	}

	public OrderDTO(String orderId, String orderProductId, String orderUserId, String orderSellerId, String orderStatus,
			Date orderRegDate, Date orderUpdateDate, String orderRecvPhone, int orderAmount,
			String orderRecvAddressNumber, int orderPaymentPrice, String orderRecvAddressRoad, int orderProdPrice,
			int orderDeliveryPrice, String orderRecvName, String displayStatus, String orderPayMethod,
			String orderPayMethodDesc) {
		super();
		this.orderId = orderId;
		this.orderProductId = orderProductId;
		this.orderUserId = orderUserId;
		this.orderSellerId = orderSellerId;
		this.orderStatus = orderStatus;
		this.orderRegDate = orderRegDate;
		this.orderUpdateDate = orderUpdateDate;
		this.orderRecvPhone = orderRecvPhone;
		this.orderAmount = orderAmount;
		this.orderRecvAddressNumber = orderRecvAddressNumber;
		this.orderPaymentPrice = orderPaymentPrice;
		this.orderRecvAddressRoad = orderRecvAddressRoad;
		this.orderProdPrice = orderProdPrice;
		this.orderDeliveryPrice = orderDeliveryPrice;
		this.orderRecvName = orderRecvName;
		this.displayStatus = displayStatus;
		this.orderPayMethod = orderPayMethod;
		this.orderPayMethodDesc = orderPayMethodDesc;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderId=" + orderId + ", orderProductId=" + orderProductId + ", orderUserId=" + orderUserId
				+ ", orderSellerId=" + orderSellerId + ", orderStatus=" + orderStatus + ", orderRegDate=" + orderRegDate
				+ ", orderUpdateDate=" + orderUpdateDate + ", orderRecvPhone=" + orderRecvPhone + ", orderAmount="
				+ orderAmount + ", orderRecvAddressNumber=" + orderRecvAddressNumber + ", orderPaymentPrice="
				+ orderPaymentPrice + ", orderRecvAddressRoad=" + orderRecvAddressRoad + ", orderProdPrice="
				+ orderProdPrice + ", orderDeliveryPrice=" + orderDeliveryPrice + ", orderRecvName=" + orderRecvName
				+ ", displayStatus=" + displayStatus + ", orderPayMethod=" + orderPayMethod
				+ "]";
	}
}
