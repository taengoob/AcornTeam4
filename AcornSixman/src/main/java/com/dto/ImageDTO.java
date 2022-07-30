package com.dto;

import java.util.Arrays;
import java.util.Date;

import org.apache.tomcat.util.codec.binary.Base64;

public class ImageDTO
{
	String imageId;
	String imageProductId;
	byte[] imageData;
	Date imageRegDate;
	String imageUrl;
	
	public String getImage_id()
	{
		return imageId;
	}

	public void setImage_id(String imageId)
	{
		this.imageId = imageId;
	}

	public String getImage_product_id()
	{
		return imageProductId;
	}

	public void setImage_product_id(String imageProductId)
	{
		this.imageProductId = imageProductId;
	}

	public byte[] getImage_data()
	{
		return imageData;
	}

	public void setImage_data(byte[] imageData)
	{
		this.imageData = imageData;
		this.imageUrl = "data:image/jpg;base64," + Base64.encodeBase64String(imageData);
	}

	public Date getImage_reg_date()
	{
		return imageRegDate;
	}

	public void setImage_reg_date(Date imageRegDate)
	{
		this.imageRegDate = imageRegDate;
	}

	public String getImage_url()
	{
		if (imageUrl == null)
			this.imageUrl = "data:image/jpg;base64," + Base64.encodeBase64String(imageData);
		return imageUrl;
	}
	
	public ImageDTO()
	{
		
	}

	public ImageDTO(String image_id, String image_product_id, byte[] image_data, Date image_reg_date)
	{
		super();
		this.imageId = image_id;
		this.imageProductId = image_product_id;
		this.imageData = image_data;
		this.imageRegDate = image_reg_date;
		this.imageUrl = "data:image/jpg;base64," + Base64.encodeBase64String(imageData);
	}

	@Override
	public String toString()
	{
		return "ImageDTO [image_id=" + imageId + ", image_product_id=" + imageProductId + ", image_data="
				+ Arrays.toString(imageData) + ", image_reg_date=" + imageRegDate + "]";
	}
}
