package com.acorn.sixman.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.sixman.dao.ProductDAO;
//import com.acorn.sixman.dbconfig.MySqlSessionFactory;
import com.acorn.sixman.dto.ImageDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;
//import com.acorn.sixman.dto.ProductPageDTO;

@Service
public class ProductService implements ProductDAO
{
	@Autowired
	ProductDAO dao;

	public List<ProductDTO_Temp> selectProductByOption(HashMap<String, String> searchOption)
	{
		return dao.selectProductByOption(searchOption);
	}

	public ProductDTO_Temp selectProductByProductId(String productId)
	{
		return dao.selectProductByProductId(productId);
	}

	public List<ImageDTO> selectImagesByProductId(String productId)
	{
		return dao.selectImagesByProductId(productId);
	}

	public int insertProduct(HashMap<String, Object> productData)
	{
		return dao.insertProduct(productData);
	}

	public List<ProductDTO_Temp> goodsRetrieve(String category) {
		return dao.goodsRetrieve(category);
	}
	
	public List<ProductDTO_Temp> selectProductBySellerId(String sellerId)
	{
		return dao.selectProductBySellerId(sellerId);
	}

	/*
	 * public ProductPageDTO select(String searchName, int curPage, String sellerId)
	 * {
	 * 
	 * return dao.select(searchName, curPage, sellerId); }//end select
	 */	
	
	public int delete(String ProductId) 
		{	 
		return dao.delete(ProductId);	
		}//end select
	
	public int deleteAll(List<String> list) {
		return dao.deleteAll(list);
		}//end select

		/*
		 * public ProductPageDTO select1(String search, int curPage, String sellerId) {
		 * return dao.select1(search, sellerId); }//end select
		 */
	
	public ProductDTO_Temp productRetrieve(String productId) {
		return dao.productRetrieve(productId);
	}

	@Override
	public int totalCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	} 
}
