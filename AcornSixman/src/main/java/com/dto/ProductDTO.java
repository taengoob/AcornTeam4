package com.dto;

public class ProductDTO {
	
	private String product_Id;
	private String product_Name;
	private int product_Price;
	private int product_Delivery;
	private String product_Model;
	private String product_Maker;
	private String product_Madein;
	private int product_stock;
	private String product_Seller;
	private String product_Regdate;
	private String product_Preview;
	
	public ProductDTO() {}

	public ProductDTO(String product_Id, String product_Name, int product_Price, int product_Delivery,
			String product_Model, String product_Maker, String product_Madein, int product_stock, String product_Seller,
			String product_Regdate, String product_Preview) {
		super();
		this.product_Id = product_Id;
		this.product_Name = product_Name;
		this.product_Price = product_Price;
		this.product_Delivery = product_Delivery;
		this.product_Model = product_Model;
		this.product_Maker = product_Maker;
		this.product_Madein = product_Madein;
		this.product_stock = product_stock;
		this.product_Seller = product_Seller;
		this.product_Regdate = product_Regdate;
		this.product_Preview = product_Preview;
	}

	public String getProduct_Id() {
		return product_Id;
	}

	public void setProduct_userId(String product_Id) {
		this.product_Id = product_Id;
	}

	public String getProduct_Name() {
		return product_Name;
	}

	public void setProduct_name(String product_Name) {
		this.product_Name = product_Name;
	}

	public int getProduct_Price() {
		return product_Price;
	}

	public void setProduct_Price(int product_Price) {
		this.product_Price = product_Price;
	}

	public int getProduct_Delivery() {
		return product_Delivery;
	}

	public void setProduct_Delivery(int product_Delivery) {
		this.product_Delivery = product_Delivery;
	}

	public String getProduct_Model() {
		return product_Model;
	}

	public void setProduct_Model(String product_Model) {
		this.product_Model = product_Model;
	}

	public String getProduct_Maker() {
		return product_Maker;
	}

	public void setProduct_Maker(String product_Maker) {
		this.product_Maker = product_Maker;
	}

	public String getProduct_Madein() {
		return product_Madein;
	}

	public void setProduct_Madein(String product_Madein) {
		this.product_Madein = product_Madein;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_Seller() {
		return product_Seller;
	}

	public void setProduct_Seller(String product_Seller) {
		this.product_Seller = product_Seller;
	}

	public String getProduct_Regdate() {
		return product_Regdate;
	}

	public void setProduct_Regdate(String product_Regdate) {
		this.product_Regdate = product_Regdate;
	}

	public String getProduct_Preview() {
		return product_Preview;
	}

	public void setProduct_Preview(String product_Preview) {
		this.product_Preview = product_Preview;
	}

	@Override
	public String toString() {
		return "PoductDTO [product_Id=" + product_Id + ", product_Name=" + product_Name + ", product_Price="
				+ product_Price + ", product_Delivery=" + product_Delivery + ", product_Model=" + product_Model
				+ ", product_Maker=" + product_Maker + ", product_Madein=" + product_Madein + ", product_stock="
				+ product_stock + ", product_Seller=" + product_Seller + ", product_Regdate=" + product_Regdate
				+ ", product_Preview=" + product_Preview + "]";
	}
	
}
