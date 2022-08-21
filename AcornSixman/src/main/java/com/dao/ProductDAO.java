package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ImageDTO;
import com.dto.ProductDTO_Temp;

public class ProductDAO
{

	public List<ProductDTO_Temp> selectProductByOption(SqlSession session, HashMap<String, String> searchOption)
	{
		return session.selectList("com.mapper.product.selectProductByOption", searchOption);
	}

	public ProductDTO_Temp selectProductByProductId(SqlSession session, String productId)
	{
		return session.selectOne("com.mapper.product.selectProductByProductId", productId);
	}

	public List<ImageDTO> selectImagesByProductId(SqlSession session, String productId)
	{
		return session.selectList("com.mapper.product.selectImagesByProductId", productId);
	}

	public int insertProduct(SqlSession session, HashMap<String, Object> productData)
	{
		return session.insert("com.mapper.product.insertProduct", productData);
	}

	public List<ProductDTO_Temp> goodsRetrieve(SqlSession session, String category) {
		List<ProductDTO_Temp> list = null;
		list = session.selectList("com.mapper.product.goodsRetrieve",category);
		return list;
	}

	public List<ProductDTO_Temp> selectProductBySellerId(SqlSession session, String sellerId)
	{
		return session.selectList("com.mapper.product.selectProductBySellerId", sellerId);
	}
	public List<ProductDTO_Temp> select(SqlSession session, HashMap<String, String> map) {
		List<ProductDTO_Temp> list =  session.selectList("com.mapper.product.selectProductAll", map);
		return list;
	}
	public int delete(SqlSession session, String ProductId) {
		
		int n = session.delete("com.mapper.product.deleteByProductid", ProductId);
		return n;
	}
public int deleteAll(SqlSession session, List<String> list) {
		
		int n = session.delete("com.mapper.product.deleteByAllProdId", list);
		return n;
	}
	
}
