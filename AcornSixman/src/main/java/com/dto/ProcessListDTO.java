package com.dto;

import java.util.Arrays;
import java.util.Date;

public class ProcessListDTO {
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
	private String orderPayMethod;
	private String productId;
	private String productName;
	private int productPrice;
	private int productDeliveryPrice;
	private String productModel;
	private String productMaker;
	private String productMadein;
	private int productStock;
	private String productSeller;
	private Date productRegDate;
	private byte[] productPreview;
	private String productContent;
	private String productCategory;

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
	public String getOrderPayMethod() {
		return orderPayMethod;
	}
	public void setOrderPayMethod(String orderPayMethod) {
		this.orderPayMethod = orderPayMethod;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductDeliveryPrice() {
		return productDeliveryPrice;
	}
	public void setProductDeliveryPrice(int productDeliveryPrice) {
		this.productDeliveryPrice = productDeliveryPrice;
	}
	public String getProductModel() {
		return productModel;
	}
	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}
	public String getProductMaker() {
		return productMaker;
	}
	public void setProductMaker(String productMaker) {
		this.productMaker = productMaker;
	}
	public String getProductMadein() {
		return productMadein;
	}
	public void setProductMadein(String productMadein) {
		this.productMadein = productMadein;
	}
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public String getProductSeller() {
		return productSeller;
	}
	public void setProductSeller(String productSeller) {
		this.productSeller = productSeller;
	}
	public Date getProductRegDate() {
		return productRegDate;
	}
	public void setProductRegDate(Date productRegDate) {
		this.productRegDate = productRegDate;
	}
	public byte[] getProductPreview() {
		return productPreview;
	}
	public void setProductPreview(byte[] productPreview) {
		this.productPreview = productPreview;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public ProcessListDTO(String orderId, String orderProductId, String orderUserId, String orderSellerId,
			String orderStatus, Date orderRegDate, Date orderUpdateDate, String orderRecvPhone, int orderAmount,
			String orderRecvAddressNumber, int orderPaymentPrice, String orderRecvAddressRoad, int orderProdPrice,
			int orderDeliveryPrice, String orderRecvName, String orderPayMethod, String productId, String productName,
			int productPrice, int productDeliveryPrice, String productModel, String productMaker, String productMadein,
			int productStock, String productSeller, Date productRegDate, byte[] productPreview, String productContent,
			String productCategory) {
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
		this.orderPayMethod = orderPayMethod;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDeliveryPrice = productDeliveryPrice;
		this.productModel = productModel;
		this.productMaker = productMaker;
		this.productMadein = productMadein;
		this.productStock = productStock;
		this.productSeller = productSeller;
		this.productRegDate = productRegDate;
		this.productPreview = productPreview;
		this.productContent = productContent;
		this.productCategory = productCategory;
	}
	public ProcessListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
