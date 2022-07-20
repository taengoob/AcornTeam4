package com.dto;

import java.util.Arrays;
import java.util.Date;

import org.apache.tomcat.util.codec.binary.Base64;

public class ImageDTO
{
	String image_id;
	String image_product_id;
	byte[] image_data;
	Date image_reg_date;
	String image_url;
	
	public String getImage_id()
	{
		return image_id;
	}

	public void setImage_id(String image_id)
	{
		this.image_id = image_id;
	}

	public String getImage_product_id()
	{
		return image_product_id;
	}

	public void setImage_product_id(String image_product_id)
	{
		this.image_product_id = image_product_id;
	}

	public byte[] getImage_data()
	{
		return image_data;
	}

	public void setImage_data(byte[] image_data)
	{
		this.image_data = image_data;
		this.image_url = "data:image/jpg;base64," + Base64.encodeBase64String(image_data);
	}

	public Date getImage_reg_date()
	{
		return image_reg_date;
	}

	public void setImage_reg_date(Date image_reg_date)
	{
		this.image_reg_date = image_reg_date;
	}

	public String getImage_url()
	{
		return image_url;
	}
	
	public ImageDTO()
	{
		
	}

	public ImageDTO(String image_id, String image_product_id, byte[] image_data, Date image_reg_date)
	{
		super();
		this.image_id = image_id;
		this.image_product_id = image_product_id;
		this.image_data = image_data;
		this.image_reg_date = image_reg_date;
	}

	@Override
	public String toString()
	{
		return "ImageDTO [image_id=" + image_id + ", image_product_id=" + image_product_id + ", image_data="
				+ Arrays.toString(image_data) + ", image_reg_date=" + image_reg_date + "]";
	}
}
