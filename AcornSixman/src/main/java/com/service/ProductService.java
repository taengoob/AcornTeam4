package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.CommonDAO;
import com.dao.ProductDAO;
import com.dbconfig.MySqlSessionFactory;
import com.dto.ImageDTO;
import com.dto.ProductDTO_Temp;

public class ProductService
{
	ProductDAO dao = new ProductDAO();

	public List<ProductDTO_Temp> selectProductByOption(HashMap<String, String> searchOption)
	{
		List<ProductDTO_Temp> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			list = dao.selectProductByOption(session, searchOption);
		}
		finally
		{
			session.close();
		}
		return list;
	}

	public ProductDTO_Temp getProductByProductId(String productId)
	{
		ProductDTO_Temp product = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			product = dao.selectProductByProductId(session, productId);
		}
		finally
		{
			session.close();
		}
		return product;
	}

	public List<ImageDTO> getProductImagesByProductId(String productId)
	{
		List<ImageDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			list = dao.selectImagesByProductId(session, productId);
		}
		finally
		{
			session.close();
		}
		return list;
	}

	public int insertProduct(HashMap<String, Object> productData)
	{
		int result = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try
		{
			result = dao.insertProduct(session, productData);
			session.commit();
		}
		finally
		{
			session.close();
		}
		return result;
	}

	public List<ProductDTO_Temp> goodsRetrieve(String category) {
		SqlSession session = MySqlSessionFactory.getSession();
		List<ProductDTO_Temp> list = null;
		try
		{
			list = dao.goodsRetrieve(session, category);
			System.out.println("service>>>"+list);
		}
		finally
		{
			session.close();
		}
		return list;
	}

	public List<ProductDTO_Temp> selectProductBySellerId(String sellerId)
	{
		SqlSession session = MySqlSessionFactory.getSession();
		List<ProductDTO_Temp> list = null;
		try
		{
			list = dao.selectProductBySellerId(session, sellerId);
		}
		finally
		{
			session.close();
		}
		return list;
	}
}
