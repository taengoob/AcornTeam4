package com.dto;

public class CartDTO {
	
	private String cart_userId;
	private String cart_productId;
	private int cart_Count;
	private String product_name;
	private int product_price;
	private int product_delivery_price;
	private String product_model;
	private String product_maker;
	
	public CartDTO() {}

	public CartDTO(String cart_userId, String cart_productId, int cart_Count, String product_name, int product_price,
			int product_delivery_price, String product_model, String product_maker) {
		super();
		this.cart_userId = cart_userId;
		this.cart_productId = cart_productId;
		this.cart_Count = cart_Count;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_delivery_price = product_delivery_price;
		this.product_model = product_model;
		this.product_maker = product_maker;
	}

	public String getCart_userId() {
		return cart_userId;
	}

	public void setCart_userId(String cart_userId) {
		this.cart_userId = cart_userId;
	}

	public String getCart_productId() {
		return cart_productId;
	}

	public void setCart_productId(String cart_productId) {
		this.cart_productId = cart_productId;
	}

	public int getCart_Count() {
		return cart_Count;
	}

	public void setCart_Count(int cart_Count) {
		this.cart_Count = cart_Count;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_delivery_price() {
		return product_delivery_price;
	}

	public void setProduct_delivery_price(int product_delivery_price) {
		this.product_delivery_price = product_delivery_price;
	}

	public String getProduct_model() {
		return product_model;
	}

	public void setProduct_model(String product_model) {
		this.product_model = product_model;
	}

	public String getProduct_maker() {
		return product_maker;
	}

	public void setProduct_maker(String product_maker) {
		this.product_maker = product_maker;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_userId=" + cart_userId + ", cart_productId=" + cart_productId + ", cart_Count="
				+ cart_Count + ", product_name=" + product_name + ", product_price=" + product_price
				+ ", product_delivery_price=" + product_delivery_price + ", product_model=" + product_model
				+ ", product_maker=" + product_maker + "]";
	}
	
	
	
}
