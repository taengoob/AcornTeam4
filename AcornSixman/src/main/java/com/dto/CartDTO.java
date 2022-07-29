package com.dto;

import java.util.Arrays;

import org.apache.tomcat.util.codec.binary.Base64;

public class CartDTO {
	
	private String cartId;
	private String cartuserId;
	private int cartCount;
	private String productId;
	private String productName;
	private int productPrice;
	private int productDeliveryPrice;
	private String productModel;
	private String productMaker;
	private byte[] productPreview;
	private String previewUrl;
	private String productCategory;
	
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDTO(String cartId, String cartuserId, int cartCount, String productId, String productName,
			int productPrice, int productDeliveryPrice, String productModel, String productMaker, byte[] productPreview,
			String previewUrl, String productCategory) {
		super();
		this.cartId = cartId;
		this.cartuserId = cartuserId;
		this.cartCount = cartCount;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDeliveryPrice = productDeliveryPrice;
		this.productModel = productModel;
		this.productMaker = productMaker;
		this.productPreview = productPreview;
		this.previewUrl = previewUrl;
		this.productCategory = productCategory;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public String getCartuserId() {
		return cartuserId;
	}

	public void setCartuserId(String cartuserId) {
		this.cartuserId = cartuserId;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
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

	public byte[] getProductPreview() {
		return productPreview;
	}

	public void setProductPreview(byte[] productPreview) {
		this.productPreview = productPreview;
		this.previewUrl = "data:image/jpg;base64," + Base64.encodeBase64String(productPreview);
	}

	public String getPreviewUrl() {
		return previewUrl;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}


	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", cartuserId=" + cartuserId + ", cartCount=" + cartCount + ", productId="
				+ productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDeliveryPrice=" + productDeliveryPrice + ", productModel=" + productModel
				+ ", productMaker=" + productMaker + ", productPreview=" + Arrays.toString(productPreview)
				+ ", previewUrl=" + previewUrl + ", productCategory=" + productCategory + "]";
	}

	

}
