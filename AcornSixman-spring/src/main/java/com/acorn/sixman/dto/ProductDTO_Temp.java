package com.acorn.sixman.dto;

import java.util.Date;

import org.apache.tomcat.util.codec.binary.Base64;

public class ProductDTO_Temp
{
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
	private String previewUrl;
	private int orderAmount;
	
	public String getProductId()
	{
		return productId;
	}
	public void setProductId(String productId)
	{
		this.productId = productId;
	}
	public String getProductName()
	{
		return productName;
	}
	public void setProductName(String productName)
	{
		this.productName = productName;
	}
	public int getProductPrice()
	{
		return productPrice;
	}
	public void setProductPrice(int productPrice)
	{
		this.productPrice = productPrice;
	}
	public int getProductDeliveryPrice()
	{
		return productDeliveryPrice;
	}
	public void setProductDeliveryPrice(int productDeliveryPrice)
	{
		this.productDeliveryPrice = productDeliveryPrice;
	}
	public String getProductModel()
	{
		return productModel;
	}
	public void setProductModel(String productModel)
	{
		this.productModel = productModel;
	}
	public String getProductMaker()
	{
		return productMaker;
	}
	public void setProductMaker(String productMaker)
	{
		this.productMaker = productMaker;
	}
	public String getProductMadein()
	{
		return productMadein;
	}
	public void setProductMadein(String productMadein)
	{
		this.productMadein = productMadein;
	}
	public int getProductStock()
	{
		return productStock;
	}
	public void setProductStock(int productStock)
	{
		this.productStock = productStock;
	}
	public String getProductSeller()
	{
		return productSeller;
	}
	public void setProductSeller(String productSeller)
	{
		this.productSeller = productSeller;
	}
	public Date getProductRegDate()
	{
		return productRegDate;
	}
	public void setProductRegDate(Date productRegDate)
	{
		this.productRegDate = productRegDate;
	}
	public byte[] getProductPreview()
	{
		return productPreview;
	}
	public void setProductPreview(byte[] productPreview)
	{
		this.productPreview = productPreview;
		this.previewUrl = "data:image/jpg;base64," + Base64.encodeBase64String(productPreview);
	}
	public String getProductContent()
	{
		return productContent;
	}
	public void setProductContent(String productContent)
	{
		this.productContent = productContent;
	}
	public String getProductCategory()
	{
		return productCategory;
	}
	public void setProductCategory(String productCategory)
	{
		this.productCategory = productCategory;
	}
	public String getPreviewUrl()
	{
		return previewUrl;
	}
	public int getOrderAmount()
	{
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount)
	{
		this.orderAmount = orderAmount;
	}
	
	public ProductDTO_Temp()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProductDTO_Temp(String productId, String productName, int productPrice, int productDeliveryPrice,
			String productModel, String productMaker, String productMadein, int productStock, String productSeller,
			Date productRegDate, byte[] productPreview, String productContent, String productCategory)
	{
		super();
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
	
	@Override
	public String toString()
	{
		return "ProductDTO_Temp [productId=" + productId + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productDeliveryPrice=" + productDeliveryPrice + ", productModel=" + productModel
				+ ", productMaker=" + productMaker + ", productMadein=" + productMadein + ", productStock="
				+ productStock + ", productSeller=" + productSeller + ", productRegDate=" + productRegDate
				+ ", previewUrl=" + previewUrl + ", productContent=" + productContent
				+ ", productCategory=" + productCategory + "]";
	}
}
