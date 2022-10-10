package com.acorn.sixman.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.context.annotation.Primary;

import com.acorn.sixman.dto.ImageDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;
//import com.acorn.sixman.dto.ProductPageDTO;

@Primary
@Mapper
public interface ProductDAO
{
	List<ProductDTO_Temp> selectProductByOption(HashMap<String, String> searchOption);

	ProductDTO_Temp selectProductByProductId(String productId);

	List<ImageDTO> selectImagesByProductId(String productId);

	public int insertProduct(HashMap<String, Object> productData);

	List<ProductDTO_Temp> goodsRetrieve(String category); 
	
	List<ProductDTO_Temp> selectProductBySellerId(String sellerId);

	int totalCount(HashMap<String, String> map);
	
	//ProductPageDTO select(SqlSession session, HashMap<String, String> map, int curPage);
	
	int delete(String ProductId);

	int deleteAll(List<String> list);

	//ProductPageDTO select1(SqlSession session, HashMap<String, String> map, int curPage);

	ProductDTO_Temp productRetrieve(String productId);
}
