package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CartDTO;
import com.dto.ImageDTO;
import com.dto.ProductDTO_Temp;

public class ProductDAO
{

	public List<ProductDTO_Temp> getProductByOption(SqlSession session, HashMap<String, String> searchOption)
	{
		return session.selectList("com.mapper.product.selectProductByOption", searchOption);
	}

	public ProductDTO_Temp getProductByProductId(SqlSession session, String productId)
	{
		return session.selectOne("com.mapper.product.selectProductByProductId", productId);
	}

	public List<ImageDTO> getProductImagesByProductId(SqlSession session, String productId)
	{
		return session.selectList("com.mapper.product.selectImagesByProductId", productId);
	}

	public int insertProduct(SqlSession session, HashMap<String, Object> productData)
	{
		return session.insert("com.mapper.product.insertProduct", productData);
	}
	
}
